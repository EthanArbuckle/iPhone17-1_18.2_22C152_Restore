@interface FCPurchaseReceiptProvider
- (id)purchaseReceiptWithBundleID:(id)a3;
@end

@implementation FCPurchaseReceiptProvider

- (id)purchaseReceiptWithBundleID:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", a3);
  v4 = [v3 appStoreReceiptURL];
  v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4];
  v6 = [v5 base64EncodedStringWithOptions:0];

  return v6;
}

@end