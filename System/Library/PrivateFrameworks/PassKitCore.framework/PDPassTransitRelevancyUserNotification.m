@interface PDPassTransitRelevancyUserNotification
- (BOOL)isValid;
- (PDPassTransitRelevancyUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 accountUser:(id)a7;
- (id)notificationContentWithDataSource:(id)a3;
- (id)thumbnailImageForSizeContraints:(id)a3 dataSource:(id)a4;
- (unint64_t)notificationType;
@end

@implementation PDPassTransitRelevancyUserNotification

- (PDPassTransitRelevancyUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 familyMember:(id)a6 accountUser:(id)a7
{
  v10.receiver = self;
  v10.super_class = (Class)PDPassTransitRelevancyUserNotification;
  v7 = [(PDPassTransitTransactionUserNotification *)&v10 initWithPaymentTransaction:a3 forPassUniqueIdentifier:a4 paymentApplication:a5 familyMember:a6 accountUser:a7 installmentCriteria:0];
  v8 = v7;
  if (v7) {
    [(PDUserNotification *)v7 setPreventAutomaticDismissal:1];
  }
  return v8;
}

- (unint64_t)notificationType
{
  return 6;
}

- (BOOL)isValid
{
  v2 = [(PDPassPaymentTransactionUserNotification *)self paymentTransaction];
  if ([v2 transactionType] == (id)2 && objc_msgSend(v2, "hasAssociatedPaymentApplication")) {
    unsigned __int8 v3 = [v2 enRoute];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PDPassTransitRelevancyUserNotification;
  id v4 = a3;
  v5 = [(PDPassTransitTransactionUserNotification *)&v13 notificationContentWithDataSource:v4];
  objc_msgSend(v5, "setShouldHideDate:", 1, v13.receiver, v13.super_class);
  [v5 setDate:0];
  v6 = [(PDUserNotification *)self passUniqueIdentifier];
  v7 = [v4 fileURLForAsset:1 passUniqueIdentifier:v6];

  if (v7)
  {
    v8 = +[NSUUID UUID];
    v9 = [v8 UUIDString];
    objc_super v10 = +[UNNotificationAttachment attachmentWithIdentifier:v9 URL:v7 options:0 error:0];

    v14 = v10;
    v11 = +[NSArray arrayWithObjects:&v14 count:1];
    [v5 setAttachments:v11];
  }
  return v5;
}

- (id)thumbnailImageForSizeContraints:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PDUserNotification *)self passUniqueIdentifier];
  v9 = [v6 passWithUniqueIdentifier:v8];

  objc_super v10 = [v9 frontFaceImage];
  [v9 style];
  PKPassFaceNotificationThumbnailPaddingInsets();
  v11 = objc_msgSend(v10, "croppedImageWithInsets:");
  v12 = [v11 resizedImageWithConstraints:v7];

  objc_super v13 = [v12 imageData];

  return v13;
}

@end