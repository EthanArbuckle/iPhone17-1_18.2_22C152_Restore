@interface UIFont
@end

@implementation UIFont

uint64_t __56__UIFont_PKPeerPaymentAdditions__pk_loadFDICSignageFont__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_opt_class(), "pk_loadFontWithFileName:extension:", @"SourceSans3-Italic", @"ttf");
  pk_loadFDICSignageFont_uint64_t result = result;
  return result;
}

uint64_t __60__UIFont_PKPeerPaymentAdditions__pk_loadPeerPaymentCashFont__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_opt_class(), "pk_loadFontWithFileName:extension:", @"SFCash-Plain", @"otf");
  pk_loadPeerPaymentCashFont_uint64_t result = result;
  return result;
}

uint64_t __69__UIFont_PKPeerPaymentAdditions__pk_loadTextCondensedRegularCashFont__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_opt_class(), "pk_loadFontWithFileName:extension:", @"SF-Cash-Text-Condensed-Regular", @"otf");
  pk_loadTextCondensedRegularCashFont_uint64_t result = result;
  return result;
}

uint64_t __70__UIFont_PKPeerPaymentAdditions__pk_loadTextCondensedSemiboldCashFont__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_opt_class(), "pk_loadFontWithFileName:extension:", @"SF-Cash-Text-Condensed-Semibold", @"otf");
  pk_loadTextCondensedSemiboldCashFont_uint64_t result = result;
  return result;
}

uint64_t __68__UIFont_PKPeerPaymentAdditions__pk_loadTextCondensedMediumCashFont__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_opt_class(), "pk_loadFontWithFileName:extension:", @"SF-Cash-Text-Condensed-Medium", @"otf");
  pk_loadTextCondensedMediumCashFont_uint64_t result = result;
  return result;
}

@end