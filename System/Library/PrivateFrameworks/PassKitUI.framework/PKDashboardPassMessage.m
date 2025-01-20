@interface PKDashboardPassMessage
+ (id)messageFromDialogRequest:(id)a3 withAction:(id)a4;
- (AMSDialogRequest)dialogRequest;
- (BOOL)canReportToAnalytics;
- (BOOL)imageOnTrailingEdge;
- (BOOL)imageRequestExtraLarge;
- (BOOL)isDestructiveAction;
- (BOOL)showDisclosure;
- (BOOL)showSpinner;
- (BOOL)strokeImage;
- (CNContact)avatarContact;
- (NSDictionary)additionalEventAnalyticsOnButtonPress;
- (NSString)analyticsIdentifier;
- (NSString)analyticsReporterSubject;
- (NSString)buttonTitle;
- (NSString)identifier;
- (NSString)message;
- (NSString)secondaryMessage;
- (NSString)secondaryTitle;
- (NSString)title;
- (PKDashboardPassMessage)init;
- (UIColor)imageBackgroundColor;
- (UIColor)imageTintColor;
- (UIImage)image;
- (UIImage)messageImage;
- (id)actionOnButtonPress;
- (id)actionOnDismiss;
- (id)actionOnMessagePress;
- (id)actionOnViewed;
- (int64_t)imageContentMode;
- (unint64_t)type;
- (void)setActionOnButtonPress:(id)a3;
- (void)setActionOnDismiss:(id)a3;
- (void)setActionOnMessagePress:(id)a3;
- (void)setActionOnViewed:(id)a3;
- (void)setAdditionalEventAnalyticsOnButtonPress:(id)a3;
- (void)setAnalyticsIdentifier:(id)a3;
- (void)setAnalyticsReporterSubject:(id)a3;
- (void)setAvatarContact:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setDialogRequest:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageBackgroundColor:(id)a3;
- (void)setImageContentMode:(int64_t)a3;
- (void)setImageOnTrailingEdge:(BOOL)a3;
- (void)setImageRequestExtraLarge:(BOOL)a3;
- (void)setImageTintColor:(id)a3;
- (void)setIsDestructiveAction:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setMessageImage:(id)a3;
- (void)setReportToAnalytics:(BOOL)a3;
- (void)setSecondaryMessage:(id)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setShowDisclosure:(BOOL)a3;
- (void)setShowSpinner:(BOOL)a3;
- (void)setStrokeImage:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKDashboardPassMessage

+ (id)messageFromDialogRequest:(id)a3 withAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 buttonActions];
  v8 = objc_msgSend(v7, "pk_firstObjectPassingTest:", &__block_literal_global_11);

  v9 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v9 setType:2];
  v10 = [v5 identifier];
  if (v10)
  {
    [(PKDashboardPassMessage *)v9 setIdentifier:v10];
  }
  else
  {
    v11 = [MEMORY[0x1E4F29128] UUID];
    v12 = [v11 UUIDString];
    [(PKDashboardPassMessage *)v9 setIdentifier:v12];
  }
  [(PKDashboardPassMessage *)v9 setDialogRequest:v5];
  v13 = [v8 deepLink];
  if (v13)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__PKDashboardPassMessage_messageFromDialogRequest_withAction___block_invoke_2;
    v15[3] = &unk_1E59CAD68;
    id v17 = v6;
    id v16 = v13;
    [(PKDashboardPassMessage *)v9 setActionOnButtonPress:v15];
  }

  return v9;
}

BOOL __62__PKDashboardPassMessage_messageFromDialogRequest_withAction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 style] == 2)
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = [v2 deepLink];
    BOOL v3 = v4 != 0;
  }
  return v3;
}

uint64_t __62__PKDashboardPassMessage_messageFromDialogRequest_withAction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (PKDashboardPassMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardPassMessage;
  result = [(PKDashboardPassMessage *)&v3 init];
  if (result) {
    result->_imageContentMode = 1;
  }
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setSecondaryTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (UIImage)messageImage
{
  return self->_messageImage;
}

- (void)setMessageImage:(id)a3
{
}

- (NSString)secondaryMessage
{
  return self->_secondaryMessage;
}

- (void)setSecondaryMessage:(id)a3
{
}

- (id)actionOnMessagePress
{
  return self->_actionOnMessagePress;
}

- (void)setActionOnMessagePress:(id)a3
{
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
}

- (id)actionOnButtonPress
{
  return self->_actionOnButtonPress;
}

- (void)setActionOnButtonPress:(id)a3
{
}

- (BOOL)isDestructiveAction
{
  return self->_isDestructiveAction;
}

- (void)setIsDestructiveAction:(BOOL)a3
{
  self->_isDestructiveAction = a3;
}

- (id)actionOnViewed
{
  return self->_actionOnViewed;
}

- (void)setActionOnViewed:(id)a3
{
}

- (id)actionOnDismiss
{
  return self->_actionOnDismiss;
}

- (void)setActionOnDismiss:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
}

- (UIColor)imageBackgroundColor
{
  return self->_imageBackgroundColor;
}

- (void)setImageBackgroundColor:(id)a3
{
}

- (int64_t)imageContentMode
{
  return self->_imageContentMode;
}

- (void)setImageContentMode:(int64_t)a3
{
  self->_imageContentMode = a3;
}

- (BOOL)strokeImage
{
  return self->_strokeImage;
}

- (void)setStrokeImage:(BOOL)a3
{
  self->_strokeImage = a3;
}

- (BOOL)imageOnTrailingEdge
{
  return self->_imageOnTrailingEdge;
}

- (void)setImageOnTrailingEdge:(BOOL)a3
{
  self->_imageOnTrailingEdge = a3;
}

- (BOOL)imageRequestExtraLarge
{
  return self->_imageRequestExtraLarge;
}

- (void)setImageRequestExtraLarge:(BOOL)a3
{
  self->_imageRequestExtraLarge = a3;
}

- (CNContact)avatarContact
{
  return self->_avatarContact;
}

- (void)setAvatarContact:(id)a3
{
}

- (BOOL)showDisclosure
{
  return self->_showDisclosure;
}

- (void)setShowDisclosure:(BOOL)a3
{
  self->_showDisclosure = a3;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (NSString)analyticsReporterSubject
{
  return self->_analyticsReporterSubject;
}

- (void)setAnalyticsReporterSubject:(id)a3
{
  self->_analyticsReporterSubject = (NSString *)a3;
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void)setAnalyticsIdentifier:(id)a3
{
}

- (BOOL)canReportToAnalytics
{
  return self->_reportToAnalytics;
}

- (void)setReportToAnalytics:(BOOL)a3
{
  self->_reportToAnalytics = a3;
}

- (NSDictionary)additionalEventAnalyticsOnButtonPress
{
  return self->_additionalEventAnalyticsOnButtonPress;
}

- (void)setAdditionalEventAnalyticsOnButtonPress:(id)a3
{
}

- (AMSDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (void)setDialogRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogRequest, 0);
  objc_storeStrong((id *)&self->_additionalEventAnalyticsOnButtonPress, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_avatarContact, 0);
  objc_storeStrong((id *)&self->_imageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_actionOnDismiss, 0);
  objc_storeStrong(&self->_actionOnViewed, 0);
  objc_storeStrong(&self->_actionOnButtonPress, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong(&self->_actionOnMessagePress, 0);
  objc_storeStrong((id *)&self->_secondaryMessage, 0);
  objc_storeStrong((id *)&self->_messageImage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end