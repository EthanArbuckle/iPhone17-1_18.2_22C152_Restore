@interface WBSPrivateBrowsingExplanationItem
+ (id)itemsForConfiguration:(id)a3;
+ (id)lockedPrivateBrowsingPromptForConfiguration:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLimitedToPrivateBrowsing;
- (NSString)message;
- (NSString)title;
- (UIImage)image;
- (id)_initWithImage:(id)a3 title:(id)a4 message:(id)a5 limitedToPrivateBrowsing:(BOOL)a6;
- (id)_initWithSymbolName:(id)a3 title:(id)a4 message:(id)a5 limitedToPrivateBrowsing:(BOOL)a6;
- (unint64_t)hash;
@end

@implementation WBSPrivateBrowsingExplanationItem

+ (id)itemsForConfiguration:(id)a3
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v33 = (void *)MEMORY[0x1E4F1CA48];
  v35 = v3;
  v4 = [WBSPrivateBrowsingExplanationItem alloc];
  uint64_t v5 = [v3 biometryType];
  v6 = @"lock.fill";
  if (v5 == 1) {
    v6 = @"touchid";
  }
  if (v5 == 2) {
    v6 = @"faceid";
  }
  v7 = v6;
  v8 = _WBSLocalizedString();
  v9 = _WBSLocalizedString();
  id v10 = [(WBSPrivateBrowsingExplanationItem *)v4 _initWithSymbolName:v7 title:v8 message:v9 limitedToPrivateBrowsing:1];

  v36[0] = v10;
  v11 = [WBSPrivateBrowsingExplanationItem alloc];
  v12 = _WBSLocalizedString();
  v13 = _WBSLocalizedString();
  id v14 = [(WBSPrivateBrowsingExplanationItem *)v11 _initWithSymbolName:@"clock" title:v12 message:v13 limitedToPrivateBrowsing:1];
  v36[1] = v14;
  v15 = [WBSPrivateBrowsingExplanationItem alloc];
  v16 = _WBSLocalizedString();
  v17 = _WBSLocalizedString();
  id v18 = [(WBSPrivateBrowsingExplanationItem *)v15 _initWithSymbolName:@"puzzlepiece.extension" title:v16 message:v17 limitedToPrivateBrowsing:0];
  v36[2] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  uint64_t v34 = [v33 arrayWithArray:v19];

  v20 = [v35 privateBrowsingSearchEngine];
  v21 = [v20 shortName];
  LODWORD(v8) = [v21 isEqualToString:@"Google"];

  if (v8)
  {
    v22 = [WBSPrivateBrowsingExplanationItem alloc];
    v23 = _WBSLocalizedString();
    v24 = _WBSLocalizedString();
    id v25 = [(WBSPrivateBrowsingExplanationItem *)v22 _initWithSymbolName:@"sparkle.magnifyingglass" title:v23 message:v24 limitedToPrivateBrowsing:1];

    v26 = (void *)v34;
    v27 = (void *)v34;
LABEL_14:
    objc_msgSend(v27, "addObject:", v25, v34);
    goto LABEL_15;
  }
  id v28 = [v35 privacyProxyAvailabilityManager];
  if (([v28 isPrivacyProxyPaidTierUnavailableInUserCountry] & 1) == 0
    && [v28 isUserAccountInSubscriberTierForPrivacyProxy]
    && [v28 isPrivacyProxyOnInICloudSettings])
  {
    v29 = [WBSPrivateBrowsingExplanationItem alloc];
    v30 = _WBSLocalizedString();
    v31 = _WBSLocalizedString();
    id v25 = [(WBSPrivateBrowsingExplanationItem *)v29 _initWithSymbolName:@"network.badge.shield.half.filled" title:v30 message:v31 limitedToPrivateBrowsing:0];
  }
  else
  {
    id v25 = 0;
  }

  if (v25)
  {
    v26 = (void *)v34;
    v27 = (void *)v34;
    goto LABEL_14;
  }
  v26 = (void *)v34;
LABEL_15:

  return v26;
}

+ (id)lockedPrivateBrowsingPromptForConfiguration:(id)a3
{
  id v3 = a3;
  if ([v3 biometryType] == 2)
  {
    v4 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v5 = @"hand.raised.badge.faceid.fill";
LABEL_5:
    uint64_t v7 = [v4 imageNamed:v5];
    goto LABEL_7;
  }
  uint64_t v6 = [v3 biometryType];
  v4 = (void *)MEMORY[0x1E4F42A80];
  if (v6 == 1)
  {
    uint64_t v5 = @"hand.raised.badge.touchid.fill";
    goto LABEL_5;
  }
  uint64_t v7 = [MEMORY[0x1E4F42A80] systemImageNamed:@"hand.raised.fill"];
LABEL_7:
  v8 = (void *)v7;
  v9 = _WBSLocalizedString();
  id v10 = NSString;
  v11 = _WBSLocalizedString();
  v12 = WBSLocalizedDeviceName();
  v13 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v12);

  uint64_t v14 = [v3 biometryType];
  if (v14)
  {
    uint64_t v15 = v14;
    v16 = NSString;
    v17 = _WBSLocalizedString();
    if (v15 == 1 || v15 == 2)
    {
      _WBSLocalizedString();
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = &stru_1F031A860;
    }
    id v18 = objc_msgSend(v16, "localizedStringWithFormat:", v17, v19);
  }
  else
  {
    id v18 = _WBSLocalizedString();
  }
  v20 = _WBSLocalizedString();
  v21 = [NSString stringWithFormat:@"%@\n\n%@\n\n%@", v13, v18, v20];
  id v22 = [[WBSPrivateBrowsingExplanationItem alloc] _initWithImage:v8 title:v9 message:v21 limitedToPrivateBrowsing:1];

  return v22;
}

- (id)_initWithSymbolName:(id)a3 title:(id)a4 message:(id)a5 limitedToPrivateBrowsing:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = (void *)MEMORY[0x1E4F42A80];
  id v11 = a5;
  id v12 = a4;
  v13 = [v10 _systemImageNamed:a3];
  id v14 = [(WBSPrivateBrowsingExplanationItem *)self _initWithImage:v13 title:v12 message:v11 limitedToPrivateBrowsing:v6];

  return v14;
}

- (id)_initWithImage:(id)a3 title:(id)a4 message:(id)a5 limitedToPrivateBrowsing:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WBSPrivateBrowsingExplanationItem;
  id v14 = [(WBSPrivateBrowsingExplanationItem *)&v22 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_image, a3);
    uint64_t v16 = [v12 copy];
    title = v15->_title;
    v15->_title = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    message = v15->_message;
    v15->_message = (NSString *)v18;

    v15->_limitedToPrivateBrowsing = a6;
    v20 = v15;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSPrivateBrowsingExplanationItem *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v6 = WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && self->_limitedToPrivateBrowsing == v5[8];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(UIImage *)self->_image hash];
  NSUInteger v4 = [(NSString *)self->_message hash] ^ v3;
  return v4 ^ [(NSString *)self->_title hash];
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isLimitedToPrivateBrowsing
{
  return self->_limitedToPrivateBrowsing;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end