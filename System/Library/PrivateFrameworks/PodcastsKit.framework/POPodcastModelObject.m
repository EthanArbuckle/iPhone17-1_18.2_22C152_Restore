@interface POPodcastModelObject
+ (Class)SAMPClass;
+ (id)uriScheme;
- (NSIndexPath)indexPath;
- (NSString)feedUrl;
- (NSString)storeId;
- (NSString)title;
- (NSString)uuid;
- (SAMPCollection)SAMPCollection;
- (id)description;
- (void)setFeedUrl:(id)a3;
- (void)setIndexPath:(id)a3;
- (void)setStoreId:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation POPodcastModelObject

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(POPodcastModelObject *)self title];
  v7 = [(POPodcastModelObject *)self indexPath];
  v8 = [(POPodcastModelObject *)self uuid];
  v9 = [v3 stringWithFormat:@"%@ (%p) title: %@, index path: %@, uuid, %@", v5, self, v6, v7, v8];

  return v9;
}

- (SAMPCollection)SAMPCollection
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init((Class)[(id)objc_opt_class() SAMPClass]);
  v4 = NSString;
  v5 = [(id)objc_opt_class() uriScheme];
  v6 = [(POPodcastModelObject *)self uuid];
  v7 = [v4 stringWithFormat:@"%@://device/%@", v5, v6];

  v8 = [NSURL URLWithString:v7];
  [v3 setIdentifier:v8];

  v9 = [(POPodcastModelObject *)self title];
  [v3 setTitle:v9];

  POLogInitIfNeeded();
  if (POLogContextCommand) {
    v10 = POLogContextCommand;
  }
  else {
    v10 = &_os_log_internal;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_23F08F000, v10, OS_LOG_TYPE_INFO, "Returning SAMPCollection %@", buf, 0xCu);
  }

  return (SAMPCollection *)v3;
}

+ (Class)SAMPClass
{
  return 0;
}

+ (id)uriScheme
{
  return 0;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)feedUrl
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFeedUrl:(id)a3
{
}

- (NSIndexPath)indexPath
{
  return (NSIndexPath *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIndexPath:(id)a3
{
}

- (NSString)storeId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStoreId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeId, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end