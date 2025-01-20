@interface ICQInAppMessage
+ (BOOL)supportsSecureCoding;
+ (id)actionFromOffer:(id)a3;
+ (id)airplaneMode;
+ (id)fallbackAction;
+ (id)fallbackOffer;
+ (id)quotaAlmostFull;
+ (id)quotaAlmostFullForOffer:(id)a3;
+ (id)quotaAlmostFullLongForOffer:(id)a3;
+ (id)quotaFull;
+ (id)quotaFullForOffer:(id)a3;
+ (id)quotaFullLongForOffer:(id)a3;
+ (id)serverUnreachable;
+ (id)universalLinkFromOffer:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICQIconSpecification)iconSpecification;
- (ICQInAppAction)dismissAction;
- (ICQInAppMessage)initWithCoder:(id)a3;
- (ICQInAppMessage)initWithContentType:(unint64_t)a3 identifier:(id)a4 reason:(id)a5 title:(id)a6 subTitle:(id)a7 sfSymbolName:(id)a8 accountId:(id)a9 bundleID:(id)a10 actions:(id)a11 dismissAction:(id)a12 iconSpecification:(id)a13;
- (ICQInAppMessage)initWithContentType:(unint64_t)a3 identifier:(id)a4 reason:(id)a5 title:(id)a6 subTitle:(id)a7 sfSymbolName:(id)a8 accountId:(id)a9 bundleID:(id)a10 actions:(id)a11 iconSpecification:(id)a12;
- (NSArray)actions;
- (NSString)accountId;
- (NSString)bundleID;
- (NSString)identifier;
- (NSString)placement;
- (NSString)reason;
- (NSString)sfSymbolName;
- (NSString)subTitle;
- (NSString)title;
- (UIImage)icon;
- (id)description;
- (unint64_t)contentType;
- (void)didDisplayMessage;
- (void)encodeWithCoder:(id)a3;
- (void)fetchIconIfNeededWithCompletion:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setIconSpecification:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation ICQInAppMessage

+ (id)fallbackOffer
{
  id v2 = objc_alloc(MEMORY[0x263F88920]);
  v3 = [MEMORY[0x263EFF910] now];
  v4 = (void *)[v2 initWithServerDictionary:&unk_26E01F1B8 accountAltDSID:@"Test" notificationID:&stru_26DFF2C90 retrievalDate:v3 callbackInterval:0 appLaunchLink:@"com.apple.DocumentsApp" bundleIdentifier:0.0];

  return v4;
}

+ (id)fallbackAction
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F88908]) initWithAction:100];
  [v2 setValue:@"Manage" forKey:@"_text"];
  v3 = [[ICQLinkInAppAction alloc] initWithLink:v2];

  return v3;
}

+ (id)universalLinkFromOffer:(id)a3
{
  id v3 = a3;
  v4 = [v3 universalLink];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [v3 bannerSpecification];
    v8 = [v7 links];
    id v6 = [v8 firstObject];
  }
  [v6 setValue:@"Get More Storage" forKey:@"_text"];

  return v6;
}

+ (id)actionFromOffer:(id)a3
{
  id v4 = a3;
  v5 = [a1 universalLinkFromOffer:v4];
  if (v5)
  {
    id v6 = [[ICQLinkInAppAction alloc] initWithLink:v5 inOffer:v4];
  }
  else
  {
    id v6 = [a1 fallbackAction];
  }
  v7 = v6;

  return v7;
}

+ (id)quotaAlmostFull
{
  id v3 = [a1 fallbackOffer];
  id v4 = [a1 quotaAlmostFullForOffer:v3];

  return v4;
}

+ (id)quotaAlmostFullForOffer:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 actionFromOffer:v4];
  id v6 = [ICQInAppMessage alloc];
  v7 = [MEMORY[0x263EFB210] defaultStore];
  v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  v9 = [v8 identifier];
  v15[0] = v5;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v11 = [v4 messageSpecificationForPlacement:@"InApp"];

  v12 = [v11 iconSpecification];
  v13 = [(ICQInAppMessage *)v6 initWithContentType:0 identifier:@"mockAlmostFull" reason:@"iCloudStorageAlmostFull" title:@"[icqctl] Your iCloud Storage is Almost Full" subTitle:@"Some files might stop syncing" sfSymbolName:@"exclamationmark.triangle" accountId:v9 bundleID:@"com.apple.icqctl" actions:v10 iconSpecification:v12];

  return v13;
}

+ (id)quotaAlmostFullLongForOffer:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 actionFromOffer:v4];
  id v6 = [ICQInAppMessage alloc];
  v7 = [MEMORY[0x263EFB210] defaultStore];
  v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  v9 = [v8 identifier];
  v15[0] = v5;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v11 = [v4 messageSpecificationForPlacement:@"InApp"];

  v12 = [v11 iconSpecification];
  v13 = [(ICQInAppMessage *)v6 initWithContentType:0 identifier:@"mockAlmostFull" reason:@"iCloudStorageAlmostFull" title:@"[icqctl] Your iCloud Storage is Almost Full" subTitle:@"Make sure you have room for your next 20,000 photos with iCloud+" sfSymbolName:@"exclamationmark.triangle" accountId:v9 bundleID:@"com.apple.icqctl" actions:v10 iconSpecification:v12];

  return v13;
}

+ (id)quotaFull
{
  id v3 = [a1 fallbackOffer];
  id v4 = [a1 quotaFullForOffer:v3];

  return v4;
}

+ (id)quotaFullForOffer:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 actionFromOffer:v4];
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[ICQInAppMessage(Examples) quotaFullForOffer:]((uint64_t)v5, v6);
  }

  v7 = [ICQInAppMessage alloc];
  v8 = [MEMORY[0x263EFB210] defaultStore];
  v9 = objc_msgSend(v8, "aa_primaryAppleAccount");
  v10 = [v9 identifier];
  v16[0] = v5;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  v12 = [v4 messageSpecificationForPlacement:@"InApp"];

  v13 = [v12 iconSpecification];
  v14 = [(ICQInAppMessage *)v7 initWithContentType:3 identifier:@"mockFull" reason:@"iCloudStorageFull" title:@"[icqctl] Your iCloud Storage is Full" subTitle:@"Some files aren't syncing" sfSymbolName:@"exclamationmark.triangle" accountId:v10 bundleID:@"com.apple.icqctl" actions:v11 iconSpecification:v13];

  return v14;
}

+ (id)quotaFullLongForOffer:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 actionFromOffer:v4];
  id v6 = [ICQInAppMessage alloc];
  v7 = [MEMORY[0x263EFB210] defaultStore];
  v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  v9 = [v8 identifier];
  v15[0] = v5;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v11 = [v4 messageSpecificationForPlacement:@"InApp"];

  v12 = [v11 iconSpecification];
  v13 = [(ICQInAppMessage *)v6 initWithContentType:3 identifier:@"mockFull" reason:@"iCloudStorageFull" title:@"[icqctl] Your iCloud Storage is Full" subTitle:@"New photos and videos won't be uploaded to iCloud because you don't have enough storage" sfSymbolName:@"exclamationmark.triangle" accountId:v9 bundleID:@"com.apple.icqctl" actions:v10 iconSpecification:v12];

  return v13;
}

+ (id)airplaneMode
{
  v15[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F88908];
  uint64_t v14 = *MEMORY[0x263F88820];
  v15[0] = *MEMORY[0x263F88860];
  id v3 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v4 = [v2 linkWithText:@"Settings" options:0 action:6 parameters:v3];

  v5 = [[ICQLinkInAppAction alloc] initWithLink:v4];
  id v6 = [ICQInAppMessage alloc];
  v7 = [MEMORY[0x263EFB210] defaultStore];
  v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  v9 = [v8 identifier];
  v13 = v5;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  v11 = [(ICQInAppMessage *)v6 initWithContentType:0 identifier:@"mockAirplaneMode" reason:@"AirplaneModeOn" title:@"[icqctl] Syncing with iCloud Paused" subTitle:@"In Airplane Mode" sfSymbolName:0 accountId:v9 bundleID:@"com.apple.icqctl" actions:v10 iconSpecification:0];

  return v11;
}

+ (id)serverUnreachable
{
  id v2 = [ICQInAppMessage alloc];
  id v3 = [MEMORY[0x263EFB210] defaultStore];
  id v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
  v5 = [v4 identifier];
  id v6 = [(ICQInAppMessage *)v2 initWithContentType:4 identifier:@"mockServerUnreachable" reason:@"WiFiConnectivityIssues" title:@"[icqctl] Syncing with iCloud Paused" subTitle:@"No Internet Connection" sfSymbolName:0 accountId:v5 bundleID:@"com.apple.icqctl" actions:MEMORY[0x263EFFA68] iconSpecification:0];

  return v6;
}

- (ICQInAppMessage)initWithContentType:(unint64_t)a3 identifier:(id)a4 reason:(id)a5 title:(id)a6 subTitle:(id)a7 sfSymbolName:(id)a8 accountId:(id)a9 bundleID:(id)a10 actions:(id)a11 iconSpecification:(id)a12
{
  return [(ICQInAppMessage *)self initWithContentType:a3 identifier:a4 reason:a5 title:a6 subTitle:a7 sfSymbolName:a8 accountId:a9 bundleID:a10 actions:a11 dismissAction:0 iconSpecification:a12];
}

- (ICQInAppMessage)initWithContentType:(unint64_t)a3 identifier:(id)a4 reason:(id)a5 title:(id)a6 subTitle:(id)a7 sfSymbolName:(id)a8 accountId:(id)a9 bundleID:(id)a10 actions:(id)a11 dismissAction:(id)a12 iconSpecification:(id)a13
{
  id v34 = a4;
  id obj = a5;
  id v33 = a5;
  id v27 = a6;
  id v32 = a6;
  id v31 = a7;
  id v30 = a8;
  id v29 = a9;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  id v21 = a13;
  v35.receiver = self;
  v35.super_class = (Class)ICQInAppMessage;
  v22 = [(ICQInAppMessage *)&v35 init];
  v23 = v22;
  if (v22)
  {
    v22->_contentType = a3;
    objc_storeStrong((id *)&v22->_identifier, a4);
    objc_storeStrong((id *)&v23->_reason, obj);
    objc_storeStrong((id *)&v23->_title, v27);
    objc_storeStrong((id *)&v23->_subTitle, a7);
    objc_storeStrong((id *)&v23->_sfSymbolName, a8);
    objc_storeStrong((id *)&v23->_accountId, a9);
    objc_storeStrong((id *)&v23->_bundleID, a10);
    objc_storeStrong((id *)&v23->_actions, a11);
    objc_storeStrong((id *)&v23->_dismissAction, a12);
    objc_storeStrong((id *)&v23->_iconSpecification, a13);
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ICQInAppMessage contentType](self, "contentType"), @"contentType");
  v5 = [(ICQInAppMessage *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(ICQInAppMessage *)self reason];
  [v4 encodeObject:v6 forKey:@"reason"];

  v7 = [(ICQInAppMessage *)self title];
  [v4 encodeObject:v7 forKey:@"title"];

  v8 = [(ICQInAppMessage *)self subTitle];
  [v4 encodeObject:v8 forKey:@"subTitle"];

  v9 = [(ICQInAppMessage *)self sfSymbolName];
  [v4 encodeObject:v9 forKey:@"sfSymbolName"];

  v10 = [(ICQInAppMessage *)self accountId];
  [v4 encodeObject:v10 forKey:@"accountId"];

  v11 = [(ICQInAppMessage *)self bundleID];
  [v4 encodeObject:v11 forKey:@"bundleID"];

  v12 = [(ICQInAppMessage *)self actions];
  [v4 encodeObject:v12 forKey:@"actions"];

  v13 = [(ICQInAppMessage *)self dismissAction];
  [v4 encodeObject:v13 forKey:@"dismissAction"];

  id v14 = [(ICQInAppMessage *)self iconSpecification];
  [v4 encodeObject:v14 forKey:@"iconSpecification"];
}

- (ICQInAppMessage)initWithCoder:(id)a3
{
  v21[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"contentType"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
  id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subTitle"];
  id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sfSymbolName"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountId"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  v10 = (void *)MEMORY[0x263EFFA08];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  v16 = [v10 setWithArray:v17];
  v11 = [v4 decodeObjectOfClasses:v16 forKey:@"actions"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dismissAction"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconSpecification"];

  v15 = [(ICQInAppMessage *)self initWithContentType:v5 identifier:v6 reason:v7 title:v20 subTitle:v19 sfSymbolName:v18 accountId:v8 bundleID:v9 actions:v11 dismissAction:v12 iconSpecification:v13];
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    id v6 = [v4 identifier];
    BOOL v7 = [(NSString *)identifier isEqualToString:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(ICQInAppMessage *)self actions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) description];
        [v3 appendString:v9];

        [v3 appendString:@"\n"];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v10 = NSString;
  v11 = [(ICQInAppMessage *)self bundleID];
  v12 = [(ICQInAppMessage *)self title];
  v13 = [(ICQInAppMessage *)self subTitle];
  id v14 = [v10 stringWithFormat:@"In-App Message for bundle ID %@ with title: %@, subTitle: %@, actions:\n%@", v11, v12, v13, v3];

  return v14;
}

- (void)fetchIconIfNeededWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [(ICQInAppMessage *)self icon];

  if (v5)
  {
    v4[2](v4);
  }
  else
  {
    uint64_t v6 = [(ICQInAppMessage *)self iconSpecification];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__ICQInAppMessage_fetchIconIfNeededWithCompletion___block_invoke;
    v7[3] = &unk_2649231B8;
    v7[4] = self;
    v8 = v4;
    +[ICQUIImageLoader fetchIconFromIconSpecification:v6 completion:v7];
  }
}

void __51__ICQInAppMessage_fetchIconIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)didDisplayMessage
{
  id v2 = [(ICQInAppMessage *)self bundleID];
  +[ICQAnalytics logInAppBannerViewWithAppIdentifier:v2];
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (NSString)sfSymbolName
{
  return self->_sfSymbolName;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSString)accountId
{
  return self->_accountId;
}

- (ICQInAppAction)dismissAction
{
  return self->_dismissAction;
}

- (NSString)placement
{
  return self->_placement;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (ICQIconSpecification)iconSpecification
{
  return self->_iconSpecification;
}

- (void)setIconSpecification:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_iconSpecification, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_sfSymbolName, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end