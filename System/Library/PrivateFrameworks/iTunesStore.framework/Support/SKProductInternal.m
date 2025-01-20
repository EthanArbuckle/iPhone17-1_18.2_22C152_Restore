@interface SKProductInternal
@end

@implementation SKProductInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discounts, 0);
  objc_storeStrong((id *)&self->_subscriptionPeriod, 0);
  objc_storeStrong((id *)&self->_subscriptionGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_priceLocale, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_introductoryPrice, 0);
  objc_storeStrong((id *)&self->_downloadContentLengths, 0);

  objc_storeStrong((id *)&self->_contentVersion, 0);
}

@end