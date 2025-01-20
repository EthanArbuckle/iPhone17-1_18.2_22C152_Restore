@interface ICQLinkInAppAction
+ (BOOL)supportsSecureCoding;
- (ICQLink)link;
- (ICQLinkInAppAction)initWithCoder:(id)a3;
- (ICQLinkInAppAction)initWithLink:(id)a3;
- (ICQLinkInAppAction)initWithLink:(id)a3 inOffer:(id)a4;
- (ICQOffer)offer;
- (ICQUpgradeFlowManager)flowManager;
- (NSString)description;
- (NSURL)linkURL;
- (id)_linkURLWithContext:(id)a3;
- (void)_launchFlowManagerWithContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)performActionWithContext:(id)a3;
- (void)setFlowManager:(id)a3;
- (void)setLink:(id)a3;
- (void)setLinkURL:(id)a3;
- (void)setOffer:(id)a3;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
@end

@implementation ICQLinkInAppAction

- (ICQLinkInAppAction)initWithLink:(id)a3
{
  return [(ICQLinkInAppAction *)self initWithLink:a3 inOffer:0];
}

- (ICQLinkInAppAction)initWithLink:(id)a3 inOffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 text];
  [v7 action];
  v10 = _ICQStringForAction();
  v15.receiver = self;
  v15.super_class = (Class)ICQLinkInAppAction;
  v11 = -[ICQInAppAction initWithTitle:type:icqActionType:](&v15, sel_initWithTitle_type_icqActionType_, v9, v10, [v7 action]);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_link, a3);
    objc_storeStrong((id *)&v11->_offer, a4);
    uint64_t v12 = [v7 serverUIURL];
    linkURL = v11->_linkURL;
    v11->_linkURL = (NSURL *)v12;
  }
  return v11;
}

- (void)performActionWithContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(ICQLinkInAppAction *)self link];
    [v6 action];
    id v7 = _ICQStringForAction();
    int v19 = 138543362;
    v20 = v7;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "In-app message: perform action %{public}@", (uint8_t *)&v19, 0xCu);
  }
  id v8 = [(ICQLinkInAppAction *)self link];
  uint64_t v9 = [v8 action];

  if ((unint64_t)(v9 - 102) <= 0x13)
  {
    if (((1 << (v9 - 102)) & 0xCF479) != 0)
    {
LABEL_5:
      [(ICQLinkInAppAction *)self _launchFlowManagerWithContext:v4];
      goto LABEL_6;
    }
    if (v9 == 118)
    {
      v14 = [(ICQLinkInAppAction *)self offer];
      [v14 updateOfferWithAction:118];

      [(ICQLinkInAppAction *)self _launchFlowManagerWithContext:v4];
      goto LABEL_5;
    }
  }
  if (v9 == 3) {
    goto LABEL_5;
  }
  if (v9 == 1)
  {
    objc_super v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "In-app message: performing dismiss action", (uint8_t *)&v19, 2u);
    }
  }
  else
  {
    objc_super v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(ICQLinkInAppAction *)self link];
      [v16 action];
      v17 = _ICQStringForAction();
      int v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "In-app message: performing default action %{public}@", (uint8_t *)&v19, 0xCu);
    }
  }

  v18 = [(ICQLinkInAppAction *)self link];
  [v18 performAction];

LABEL_6:
  v10 = [(ICQLinkInAppAction *)self offer];
  v11 = [v10 bundleIdentifier];
  uint64_t v12 = [(ICQLinkInAppAction *)self link];
  [v12 action];
  v13 = _ICQStringForAction();
  +[ICQAnalytics logInAppBannerInteractionWithAppIdentifier:v11 icqActionName:v13];
}

- (void)_launchFlowManagerWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(ICQLinkInAppAction *)self flowManager];

  if (v5)
  {
    v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICQLinkInAppAction _launchFlowManagerWithContext:]((uint64_t)self, v6);
    }
  }
  else
  {
    v6 = [(ICQLinkInAppAction *)self _linkURLWithContext:v4];
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "In-app message: present flow manager", v18, 2u);
    }

    id v8 = [ICQUpgradeFlowManager alloc];
    uint64_t v9 = [(ICQLinkInAppAction *)self offer];
    v10 = [(ICQUpgradeFlowManager *)v8 initWithOffer:v9];
    [(ICQLinkInAppAction *)self setFlowManager:v10];

    v11 = [(ICQLinkInAppAction *)self flowManager];
    [v11 setDelegate:self];

    uint64_t v12 = [(ICQLinkInAppAction *)self flowManager];
    [v12 setFlowOptions:0];

    v13 = [(ICQLinkInAppAction *)self link];

    if (v13)
    {
      v14 = [(ICQLinkInAppAction *)self link];
      [v14 setServerUIURL:v6];

      objc_super v15 = [(ICQLinkInAppAction *)self flowManager];
      v16 = [(ICQLinkInAppAction *)self link];
      [v15 beginRemoteUpgradeFlowWithICQLink:v16];
    }
    else
    {
      v17 = _ICQGetLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ICQLinkInAppAction _launchFlowManagerWithContext:]((uint64_t)self, v17);
      }

      objc_super v15 = [(ICQLinkInAppAction *)self flowManager];
      [v15 _beginRemoteFlowWithURL:v6];
    }
  }
}

- (id)_linkURLWithContext:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ICQLinkInAppAction *)self linkURL];
  v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = v4;
    __int16 v31 = 2114;
    uint64_t v32 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "In-app message: adding context %{public}@ to link %{public}@", buf, 0x16u);
  }

  v23 = (void *)v5;
  id v7 = [MEMORY[0x263F08BA0] componentsWithURL:v5 resolvingAgainstBaseURL:0];
  id v8 = [v7 queryItems];
  id v9 = (id)[v8 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x263F08BD0];
        v17 = [v10 objectForKeyedSubscript:v15];
        v18 = [v16 queryItemWithName:v15 value:v17];
        [v9 addObject:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  [v7 setQueryItems:v9];
  int v19 = _ICQGetLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [v7 URL];
    *(_DWORD *)buf = 138543362;
    id v30 = v20;
    _os_log_impl(&dword_22C821000, v19, OS_LOG_TYPE_DEFAULT, "In-app message: returning link url %{public}@", buf, 0xCu);
  }
  uint64_t v21 = [v7 URL];

  return v21;
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did cancel", (uint8_t *)&v7, 0xCu);
  }
  v6 = [(ICQLinkInAppAction *)self flowManager];
  [v6 setDelegate:0];

  [(ICQLinkInAppAction *)self setFlowManager:0];
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did complete", (uint8_t *)&v7, 0xCu);
  }
  v6 = [(ICQLinkInAppAction *)self flowManager];
  [v6 setDelegate:0];

  [(ICQLinkInAppAction *)self setFlowManager:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICQLinkInAppAction;
  id v4 = a3;
  [(ICQInAppAction *)&v7 encodeWithCoder:v4];
  id v5 = [(ICQLinkInAppAction *)self link];
  [v4 encodeObject:v5 forKey:@"link"];

  v6 = [(ICQLinkInAppAction *)self offer];
  [v4 encodeObject:v6 forKey:@"offer"];
}

- (ICQLinkInAppAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offer"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"link"];

  objc_super v7 = [(ICQLinkInAppAction *)self initWithLink:v6 inOffer:v5];
  return v7;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(ICQInAppAction *)self title];
  id v5 = [(ICQInAppAction *)self type];
  v6 = [(ICQLinkInAppAction *)self link];
  objc_super v7 = [v3 stringWithFormat:@"actionTitle: %@, actionType: %@, link: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (ICQLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
}

- (ICQUpgradeFlowManager)flowManager
{
  return self->_flowManager;
}

- (void)setFlowManager:(id)a3
{
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_flowManager, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_storeStrong((id *)&self->_link, 0);
}

- (void)_launchFlowManagerWithContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Unable to find an ICQLink in %@", (uint8_t *)&v2, 0xCu);
}

- (void)_launchFlowManagerWithContext:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "%{public}@ Already presenting flow manager. Will not present a new one until the previous instance is removed", (uint8_t *)&v4, 0xCu);
}

@end