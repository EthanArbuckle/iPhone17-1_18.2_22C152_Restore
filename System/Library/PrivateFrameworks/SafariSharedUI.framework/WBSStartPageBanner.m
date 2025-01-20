@interface WBSStartPageBanner
+ (id)bannerWithImage:(id)a3 title:(id)a4 message:(id)a5 interactive:(BOOL)a6 dismissHandler:(id)a7;
+ (id)bannerWithTitle:(id)a3 attributedMessage:(id)a4 primaryButtonTitle:(id)a5 secondaryButtonTitle:(id)a6 primaryButtonHandler:(id)a7 secondaryButtonHandler:(id)a8 messageTextItemHandler:(id)a9;
+ (id)bannerWithTitle:(id)a3 message:(id)a4 dismissHandler:(id)a5;
+ (id)privacyReportBannerWithNumberOfTrackers:(int64_t)a3 privateBrowsingEnabled:(BOOL)a4 privacyReportData:(id)a5 selectionHandler:(id)a6;
+ (id)privateBrowsingExplanationBannerWithState:(int64_t)a3 explanationItems:(id)a4 dismissHandler:(id)a5;
+ (id)privateBrowsingPersistentModule;
+ (id)privateRelayPromptBannerWithImage:(id)a3 title:(id)a4 message:(id)a5 dismissHandler:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivateBrowsingEnabled;
- (NSArray)privateBrowsingExplanationItems;
- (NSAttributedString)attributedMessage;
- (NSString)message;
- (NSString)primaryButtonTitle;
- (NSString)secondaryButtonTitle;
- (NSString)title;
- (UIImage)image;
- (WBSPrivacyReportData)privacyReportData;
- (WBSStartPageBanner)initWithContentVariant:(int64_t)a3 action:(id)a4;
- (id)action;
- (id)description;
- (id)dismissHandler;
- (id)messageTextItemHandler;
- (id)primaryButtonHandler;
- (id)privateBrowsingExplanationDismissHandler;
- (id)secondaryButtonHandler;
- (int64_t)contentVariant;
- (int64_t)numberOfTrackers;
- (int64_t)privateBrowsingExplanationState;
- (int64_t)userInterfaceStyle;
- (unint64_t)hash;
- (void)setMessageTextItemHandler:(id)a3;
- (void)setPrimaryButtonHandler:(id)a3;
- (void)setPrimaryButtonTitle:(id)a3;
- (void)setPrivateBrowsingExplanationDismissHandler:(id)a3;
- (void)setSecondaryButtonHandler:(id)a3;
- (void)setSecondaryButtonTitle:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation WBSStartPageBanner

- (int64_t)contentVariant
{
  return self->_contentVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_privateBrowsingExplanationDismissHandler, 0);
  objc_storeStrong((id *)&self->_privateBrowsingExplanationItems, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong(&self->_messageTextItemHandler, 0);
  objc_storeStrong(&self->_secondaryButtonHandler, 0);
  objc_storeStrong(&self->_primaryButtonHandler, 0);
  objc_storeStrong((id *)&self->_secondaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_privacyReportData, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_action, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  return [(NSString *)self->_message hash] ^ v3 ^ self->_numberOfTrackers ^ self->_contentVariant;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)numberOfTrackers
{
  return self->_numberOfTrackers;
}

- (NSString)message
{
  return self->_message;
}

- (BOOL)isPrivateBrowsingEnabled
{
  return self->_privateBrowsingEnabled;
}

- (UIImage)image
{
  return self->_image;
}

- (id)action
{
  return self->_action;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSStartPageBanner *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = WBSIsEqual()
        && WBSIsEqual()
        && self->_numberOfTrackers == v5->_numberOfTrackers
        && self->_contentVariant == v5->_contentVariant;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

+ (id)privacyReportBannerWithNumberOfTrackers:(int64_t)a3 privateBrowsingEnabled:(BOOL)a4 privacyReportData:(id)a5 selectionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [objc_alloc((Class)a1) initWithContentVariant:2 action:v11];

  *(unsigned char *)(v12 + 8) = a4;
  v13 = *(void **)(v12 + 80);
  *(void *)(v12 + 72) = a3;
  *(void *)(v12 + 80) = v10;

  return (id)v12;
}

- (WBSStartPageBanner)initWithContentVariant:(int64_t)a3 action:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSStartPageBanner;
  v7 = [(WBSStartPageBanner *)&v13 init];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x1AD115160](v6);
    id action = v7->_action;
    v7->_id action = (id)v8;

    v7->_contentVariant = a3;
    privateBrowsingExplanationItems = v7->_privateBrowsingExplanationItems;
    v7->_privateBrowsingExplanationItems = (NSArray *)MEMORY[0x1E4F1CBF0];

    id v11 = v7;
  }

  return v7;
}

+ (id)bannerWithTitle:(id)a3 message:(id)a4 dismissHandler:(id)a5
{
  return (id)[a1 bannerWithImage:0 title:a3 message:a4 interactive:0 dismissHandler:a5];
}

+ (id)bannerWithImage:(id)a3 title:(id)a4 message:(id)a5 interactive:(BOOL)a6 dismissHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  v16 = (void *)[objc_alloc((Class)a1) initWithContentVariant:v8 action:v13];

  v17 = (void *)v16[5];
  v16[5] = v12;
  id v18 = v12;

  uint64_t v19 = [v14 copy];
  v20 = (void *)v16[7];
  v16[7] = v19;

  uint64_t v21 = [v15 copy];
  v22 = (void *)v16[6];
  v16[6] = v21;

  return v16;
}

+ (id)privateRelayPromptBannerWithImage:(id)a3 title:(id)a4 message:(id)a5 dismissHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = (void *)[objc_alloc((Class)a1) initWithContentVariant:3 action:0];
  id v15 = (void *)v14[5];
  v14[5] = v10;
  id v16 = v10;

  uint64_t v17 = [v12 copy];
  id v18 = (void *)v14[7];
  v14[7] = v17;

  uint64_t v19 = [v13 copy];
  v20 = (void *)v14[6];
  v14[6] = v19;

  uint64_t v21 = MEMORY[0x1AD115160](v11);
  v22 = (void *)v14[16];
  v14[16] = v21;

  return v14;
}

+ (id)privateBrowsingPersistentModule
{
  v2 = (void *)[objc_alloc((Class)a1) initWithContentVariant:4 action:0];
  v2[18] = 1;
  return v2;
}

+ (id)privateBrowsingExplanationBannerWithState:(int64_t)a3 explanationItems:(id)a4 dismissHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)a1) initWithContentVariant:5 action:0];
  uint64_t v11 = [v9 copy];

  id v12 = (void *)v10[17];
  v10[17] = v11;

  v10[18] = a3;
  uint64_t v13 = MEMORY[0x1AD115160](v8);

  id v14 = (void *)v10[19];
  v10[19] = v13;

  return v10;
}

+ (id)bannerWithTitle:(id)a3 attributedMessage:(id)a4 primaryButtonTitle:(id)a5 secondaryButtonTitle:(id)a6 primaryButtonHandler:(id)a7 secondaryButtonHandler:(id)a8 messageTextItemHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  v22 = (void *)[objc_alloc((Class)a1) initWithContentVariant:6 action:0];
  v23 = (void *)v22[6];
  v22[6] = v15;
  id v24 = v15;

  v25 = (void *)v22[8];
  v22[8] = v16;

  [v22 setPrimaryButtonTitle:v21];
  [v22 setSecondaryButtonTitle:v20];

  [v22 setPrimaryButtonHandler:v19];
  [v22 setSecondaryButtonHandler:v18];

  [v22 setMessageTextItemHandler:v17];
  return v22;
}

- (id)description
{
  NSUInteger v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = v3;
  switch(self->_contentVariant)
  {
    case 0:
    case 1:
    case 3:
      long long v12 = *(_OWORD *)&self->_image;
      message = self->_message;
      id v6 = [NSNumber numberWithInteger:self->_userInterfaceStyle];
      objc_msgSend(v4, "appendFormat:", @"image = %@; title = %@; message = %@; userInterfaceStyle = %@>",
        v12,
        message,
        v6);
      goto LABEL_5;
    case 2:
      objc_msgSend(v3, "appendFormat:", @"numberOfTrackers = %zd", self->_numberOfTrackers, v9, v10, v11);
      break;
    case 4:
      [v3 appendString:@">"];
      break;
    case 5:
      privateBrowsingExplanationItems = self->_privateBrowsingExplanationItems;
      id v6 = WBSStringFromPrivateBrowsingExplanationState(self->_privateBrowsingExplanationState);
      objc_msgSend(v4, "appendFormat:", @"explanationItems = %@; state = %@>",
        privateBrowsingExplanationItems,
        v6,
        v10,
        v11);
LABEL_5:

      break;
    case 6:
      [v3 appendFormat:@"title = %@, message = %@, primaryButton = %@, secondaryButton = %@", self->_title, self->_message, self->_primaryButtonTitle, self->_secondaryButtonTitle];
      break;
    default:
      break;
  }
  return v4;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (NSAttributedString)attributedMessage
{
  return self->_attributedMessage;
}

- (WBSPrivacyReportData)privacyReportData
{
  return self->_privacyReportData;
}

- (NSString)primaryButtonTitle
{
  return self->_primaryButtonTitle;
}

- (void)setPrimaryButtonTitle:(id)a3
{
}

- (NSString)secondaryButtonTitle
{
  return self->_secondaryButtonTitle;
}

- (void)setSecondaryButtonTitle:(id)a3
{
}

- (id)primaryButtonHandler
{
  return self->_primaryButtonHandler;
}

- (void)setPrimaryButtonHandler:(id)a3
{
}

- (id)secondaryButtonHandler
{
  return self->_secondaryButtonHandler;
}

- (void)setSecondaryButtonHandler:(id)a3
{
}

- (id)messageTextItemHandler
{
  return self->_messageTextItemHandler;
}

- (void)setMessageTextItemHandler:(id)a3
{
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (NSArray)privateBrowsingExplanationItems
{
  return self->_privateBrowsingExplanationItems;
}

- (int64_t)privateBrowsingExplanationState
{
  return self->_privateBrowsingExplanationState;
}

- (id)privateBrowsingExplanationDismissHandler
{
  return self->_privateBrowsingExplanationDismissHandler;
}

- (void)setPrivateBrowsingExplanationDismissHandler:(id)a3
{
}

@end