@interface WLKLookupBasedInstallable
- (AMSLookupItem)item;
- (NSArray)appAdamIDs;
- (NSArray)appBundleIDs;
- (NSString)name;
- (NSString)title;
- (NSURL)appStoreURL;
- (WLKLookupBasedInstallable)init;
- (WLKLookupBasedInstallable)initWithLookupItem:(id)a3;
- (id)appIconURLForSize:(CGSize)a3;
@end

@implementation WLKLookupBasedInstallable

- (WLKLookupBasedInstallable)init
{
  return 0;
}

- (WLKLookupBasedInstallable)initWithLookupItem:(id)a3
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Item must not be nil."];
  }
  v9.receiver = self;
  v9.super_class = (Class)WLKLookupBasedInstallable;
  v6 = [(WLKLookupBasedInstallable *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

- (NSString)title
{
  v2 = [(WLKLookupBasedInstallable *)self item];
  v3 = [v2 displayName];

  return (NSString *)v3;
}

- (NSString)name
{
  v2 = [(WLKLookupBasedInstallable *)self item];
  v3 = [v2 displayName];

  return (NSString *)v3;
}

- (NSArray)appBundleIDs
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [(WLKLookupBasedInstallable *)self item];
  v3 = [v2 bundleIdentifier];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return (NSArray *)v4;
}

- (NSArray)appAdamIDs
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(WLKLookupBasedInstallable *)self item];
  v3 = [v2 iTunesStoreIdentifier];
  v4 = [v3 stringValue];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return (NSArray *)v5;
}

- (id)appIconURLForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(WLKLookupBasedInstallable *)self item];
  v6 = [v5 itemDictionary];

  v7 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"artwork");
  v8 = objc_msgSend(v7, "wlk_stringForKey:", @"url");
  objc_super v9 = +[WLKArtworkVariant artworkURLFromTemplate:v8, @"png", width, height forSize format];

  return v9;
}

- (NSURL)appStoreURL
{
  v2 = [(WLKLookupBasedInstallable *)self item];
  v3 = [v2 productPageURL];

  return (NSURL *)v3;
}

- (AMSLookupItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
}

@end