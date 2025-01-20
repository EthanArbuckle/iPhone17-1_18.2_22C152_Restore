@interface SKUIRedeem
+ (BOOL)supportsSecureCoding;
- (BOOL)hideItemView;
- (NSArray)downloads;
- (NSArray)items;
- (NSArray)links;
- (NSDictionary)thankYouDictionary;
- (NSString)balance;
- (NSString)credit;
- (NSString)creditDisplay;
- (NSString)inAppPurchase;
- (NSString)message;
- (NSString)title;
- (NSURL)customizedThankyouURL;
- (NSURL)redirectURL;
- (SKUIArtworkProviding)headerArtworkProvider;
- (SKUIRedeem)init;
- (SKUIRedeem)initWithCoder:(id)a3;
- (UIImage)headerImage;
- (double)ITunesPassLearnMoreAlertInterval;
- (void)encodeWithCoder:(id)a3;
- (void)init;
- (void)setBalance:(id)a3;
- (void)setCredit:(id)a3;
- (void)setCreditDisplay:(id)a3;
- (void)setCustomizedThankyouURL:(id)a3;
- (void)setDownloads:(id)a3;
- (void)setHeaderArtworkProvider:(id)a3;
- (void)setHeaderImage:(id)a3;
- (void)setHideItemView:(BOOL)a3;
- (void)setITunesPassLearnMoreAlertInterval:(double)a3;
- (void)setInAppPurchase:(id)a3;
- (void)setItems:(id)a3;
- (void)setLinks:(id)a3;
- (void)setMessage:(id)a3;
- (void)setRedirectURL:(id)a3;
- (void)setThankYouDictionary:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SKUIRedeem

- (SKUIRedeem)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeem init]();
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIRedeem;
  v3 = [(SKUIRedeem *)&v6 init];
  v4 = v3;
  if (v3) {
    [(SKUIRedeem *)v3 setITunesPassLearnMoreAlertInterval:-1.0];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKUIRedeem)initWithCoder:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeem initWithCoder:]();
  }
  v35.receiver = self;
  v35.super_class = (Class)SKUIRedeem;
  v5 = [(SKUIRedeem *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"items"];
    items = v5->_items;
    v5->_items = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloads"];
    downloads = v5->_downloads;
    v5->_downloads = (NSArray *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inAppPurchase"];
    inAppPurchase = v5->_inAppPurchase;
    v5->_inAppPurchase = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credit"];
    credit = v5->_credit;
    v5->_credit = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creditDisplay"];
    creditDisplay = v5->_creditDisplay;
    v5->_creditDisplay = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balance"];
    balance = v5->_balance;
    v5->_balance = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thankYouDictionary"];
    thankYouDictionary = v5->_thankYouDictionary;
    v5->_thankYouDictionary = (NSDictionary *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"redirectURL"];
    redirectURL = v5->_redirectURL;
    v5->_redirectURL = (NSURL *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customizedThankyouURL"];
    customizedThankyouURL = v5->_customizedThankyouURL;
    v5->_customizedThankyouURL = (NSURL *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"headerImage"];
    headerImage = v5->_headerImage;
    v5->_headerImage = (UIImage *)v24;

    uint64_t v26 = [v4 decodeObjectForKey:@"headerArtworkProvider"];
    headerArtworkProvider = v5->_headerArtworkProvider;
    v5->_headerArtworkProvider = (SKUIArtworkProviding *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"links"];
    links = v5->_links;
    v5->_links = (NSArray *)v32;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  items = self->_items;
  id v5 = a3;
  [v5 encodeObject:items forKey:@"items"];
  [v5 encodeObject:self->_downloads forKey:@"downloads"];
  [v5 encodeObject:self->_inAppPurchase forKey:@"inAppPurchase"];
  [v5 encodeObject:self->_credit forKey:@"credit"];
  [v5 encodeObject:self->_creditDisplay forKey:@"creditDisplay"];
  [v5 encodeObject:self->_balance forKey:@"balance"];
  [v5 encodeObject:self->_thankYouDictionary forKey:@"thankYouDictionary"];
  [v5 encodeObject:self->_redirectURL forKey:@"redirectURL"];
  [v5 encodeObject:self->_customizedThankyouURL forKey:@"customizedThankyouURL"];
  [v5 encodeObject:self->_headerImage forKey:@"headerImage"];
  [v5 encodeObject:self->_headerArtworkProvider forKey:@"headerArtworkProvider"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_message forKey:@"message"];
  [v5 encodeObject:self->_links forKey:@"links"];
  [v5 encodeBool:self->_hideItemView forKey:@"hideItemView"];
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSArray)downloads
{
  return self->_downloads;
}

- (void)setDownloads:(id)a3
{
}

- (NSString)inAppPurchase
{
  return self->_inAppPurchase;
}

- (void)setInAppPurchase:(id)a3
{
}

- (NSString)credit
{
  return self->_credit;
}

- (void)setCredit:(id)a3
{
}

- (NSString)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (NSString)creditDisplay
{
  return self->_creditDisplay;
}

- (void)setCreditDisplay:(id)a3
{
}

- (NSDictionary)thankYouDictionary
{
  return self->_thankYouDictionary;
}

- (void)setThankYouDictionary:(id)a3
{
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (void)setRedirectURL:(id)a3
{
}

- (NSURL)customizedThankyouURL
{
  return self->_customizedThankyouURL;
}

- (void)setCustomizedThankyouURL:(id)a3
{
}

- (UIImage)headerImage
{
  return self->_headerImage;
}

- (void)setHeaderImage:(id)a3
{
}

- (SKUIArtworkProviding)headerArtworkProvider
{
  return self->_headerArtworkProvider;
}

- (void)setHeaderArtworkProvider:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
}

- (BOOL)hideItemView
{
  return self->_hideItemView;
}

- (void)setHideItemView:(BOOL)a3
{
  self->_hideItemView = a3;
}

- (double)ITunesPassLearnMoreAlertInterval
{
  return self->_ITunesPassLearnMoreAlertInterval;
}

- (void)setITunesPassLearnMoreAlertInterval:(double)a3
{
  self->_ITunesPassLearnMoreAlertInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_headerArtworkProvider, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_customizedThankyouURL, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_thankYouDictionary, 0);
  objc_storeStrong((id *)&self->_creditDisplay, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_credit, 0);
  objc_storeStrong((id *)&self->_inAppPurchase, 0);
  objc_storeStrong((id *)&self->_downloads, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeem init]";
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeem initWithCoder:]";
}

@end