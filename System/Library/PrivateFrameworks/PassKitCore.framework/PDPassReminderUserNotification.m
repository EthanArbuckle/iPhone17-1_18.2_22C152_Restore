@interface PDPassReminderUserNotification
+ (BOOL)supportsSecureCoding;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (id)thumbnailImageForSizeContraints:(id)a3 dataSource:(id)a4;
@end

@implementation PDPassReminderUserNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)thumbnailImageForSizeContraints:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PDUserNotification *)self passUniqueIdentifier];
  v9 = [v6 passWithUniqueIdentifier:v8];

  v10 = [v9 frontFaceImage];
  [v9 style];
  PKPassFaceNotificationThumbnailPaddingInsets();
  v11 = objc_msgSend(v10, "croppedImageWithInsets:");
  v12 = [v11 resizedImageWithConstraints:v7];

  v13 = [v12 imageData];

  return v13;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDPassReminderUserNotification;
  v4 = [(PDUserNotification *)&v8 notificationContentWithDataSource:a3];
  v5 = [(PDPassReminderUserNotification *)self _titleString];
  [v4 setSubtitle:v5];

  id v6 = [(PDPassReminderUserNotification *)self _messageString];
  [v4 setBody:v6];

  return v4;
}

- (id)_titleString
{
  return 0;
}

- (id)_messageString
{
  return 0;
}

@end