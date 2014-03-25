{*
 * DonationPaypal
 *
 * @author LBAB <contact@lbab.fr>
 * @copyright Copyright (c) 2014 LBAB.
 * @license GNU/GPL version 3
 * @version 1.0.0
 * @link www.lbab.fr
 *}

<!-- Donation Paypal -->

<section id='donationpaypal_footer' class="donationpaypal footer-block col-xs-12 col-sm-2">
	<h4>{$title}</h4>
	
	<div class="block_content toggle-footer">
	
		<!-- Display information message -->
		{if !empty($display_message)}
		<div class="form-group">
			<p>{$display_message}</p>
		</div>
		{/if}
			
		<form action="https://www.paypal.com/cgi-bin/webscr" method="post">

			<!-- Identify your business so that you can collect the payments. -->
			<input type="hidden" name="business" value="{$business_id}">
			<input type="hidden" name="return" value="{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"> <!-- OK optionnal -->
			<input type="hidden" name="rm" value="2" ><!-- OK optionnal -->
			<input type="hidden" name="cancel_return" value="{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}" ><!-- OK optionnal -->
			<input type="hidden" name="charset" value="UTF-8"><!-- OK optionnal -->

			<!--OK Specify a Donate button. -->
			<input type="hidden" name="cmd" value="_donations">
			
			{if isset($company_name)}
			<!--OK An identifier of the source Optionnel -->
			<input type="hidden" name="bn" value="{$company_name}_Donate_WPS_{$iso_code}">
			{/if}

			<!-- Specify details about the contribution -->
			<input type="hidden" name="currency_code" value="{$currency->iso_code}"> <!-- OK optionnal -->
			<input type="hidden" name="lc" value="{$language_code}">
			<div class="form-group lbab-amount">
				<input type="text" name="amount" maxlength="16"><span>{$currency->sign}</span>
			</div> <!-- OK optionnal -->
			{if !empty($item_name)}
			<input type="hidden" name="item_name" value="{$item_name}"><!-- OK optionnal -->
			{/if}
			
			<!--  DESIGN -->
			<!--  <input type="hidden" name="image_url" value="{$base_dir}img/logo.jpg"> -->
			<input type="hidden" name="page_style" value="{$page_style}"><!-- OK optionnal -->

			<!-- OTHER -->
			{*
				{if $no_note == 1}
				<input type="hidden" name="no_note" value={$no_note}><!-- OK optionnal -->
				{/if}
				<input type="hidden" name="cn" value="{$cn}"><!-- OK optionnal -->
			*}
			<input type="hidden" name="cbt" value="{$cbt}"><!-- OK optionnal -->
			
			{if $logged}
				<!-- USER -->
				<input type="hidden" name="email" value="{$customer->email|escape:'htmlall':'UTF-8'}"><!-- OK optionnal -->
				<input type="hidden" name="first_name" value="{$customer->firstname}"><!-- OK optionnal -->
				<input type="hidden" name="last_name" value="{$customer->lastname}"><!-- OK optionnal -->
				<input type="hidden" name="country" value="{$iso_code}"><!-- OK optionnal -->
				
				{if isset($address)}
					<input type="hidden" name="address1" value="{$address->address1}"><!-- OK optionnal -->
					<input type="hidden" name="city" value="{$address->city}"><!-- OK optionnal -->
					
					{if isset($address->address2)}
					<input type="hidden" name="address2" value="{$address->address2}"><!-- OK optionnal -->
					{/if}
					{if isset($address->postcode)}
					<input type="hidden" name="zip" value="{$address->postcode}"><!-- OK optionnal -->
					{/if}
				{/if}
			
			{/if}
			
			<!-- Display the payment button. -->
			<div class="form-group lbab-donation-btn">
			<input type="submit" name="submit" value="{l s='Donate Now' mod='donationpaypal'}">
			</div>
		</form>
		
	</div>
	<div class="clearfix"></div>
</section>

<!-- /Donation Paypal -->


<!-- voir pour eventuellement ajouté le champ custom avec choix de date, info sur qui...
voir pour image_url 
cpp_header_image
cpp_headerback_color
cpp_headerborder_color
cpp_payflow_color
return-->