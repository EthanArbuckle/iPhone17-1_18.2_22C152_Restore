@interface SKUIStoreIdentifier
- (BOOL)isEqual:(id)a3;
- (NSNumber)itemIdentifier;
- (NSString)bundleIdentifier;
- (NSString)podcastFeedURLIdentifier;
- (SKUIStoreIdentifier)initWithLongLong:(int64_t)a3;
- (SKUIStoreIdentifier)initWithNumber:(id)a3;
- (SKUIStoreIdentifier)initWithPodcastFeedURL:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)numberValue;
- (id)stringValue;
- (int64_t)longLongValue;
- (unint64_t)hash;
- (void)setBundleIdentifier:(id)a3;
- (void)setPodcastFeedURLIdentifier:(id)a3;
@end

@implementation SKUIStoreIdentifier

- (SKUIStoreIdentifier)initWithLongLong:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIStoreIdentifier initWithLongLong:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIStoreIdentifier;
  v5 = [(SKUIStoreIdentifier *)&v10 init];
  v6 = v5;
  if (a3 && v5)
  {
    uint64_t v7 = [NSNumber numberWithLongLong:a3];
    itemIdentifier = v6->_itemIdentifier;
    v6->_itemIdentifier = (NSNumber *)v7;
  }
  return v6;
}

- (SKUIStoreIdentifier)initWithNumber:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIStoreIdentifier initWithNumber:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIStoreIdentifier;
  v5 = [(SKUIStoreIdentifier *)&v9 init];
  if (v5 && [v4 longLongValue])
  {
    uint64_t v6 = [v4 copy];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSNumber *)v6;
  }
  return v5;
}

- (SKUIStoreIdentifier)initWithPodcastFeedURL:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStoreIdentifier initWithPodcastFeedURL:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIStoreIdentifier;
  uint64_t v6 = [(SKUIStoreIdentifier *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_podcastFeedURLIdentifier, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[SKUIStoreIdentifier allocWithZone:a3] init];
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_itemIdentifier, self->_itemIdentifier);
    objc_storeStrong(p_isa + 2, self->_podcastFeedURLIdentifier);
    objc_storeStrong(p_isa + 3, self->_bundleIdentifier);
  }
  return p_isa;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SKUIStoreIdentifier;
  id v4 = [(SKUIStoreIdentifier *)&v8 description];
  id v5 = [(SKUIStoreIdentifier *)self numberValue];
  uint64_t v6 = [v3 stringWithFormat:@"%@: [%@, %@]", v4, v5, self->_podcastFeedURLIdentifier];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(SKUIStoreIdentifier *)self numberValue];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_podcastFeedURLIdentifier hash] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SKUIStoreIdentifier *)a3;
  if (self == v4) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    LOBYTE(bundleIdentifier) = 0;
    goto LABEL_13;
  }
  itemIdentifier = self->_itemIdentifier;
  if (itemIdentifier)
  {
    uint64_t v6 = v4->_itemIdentifier;
    if (itemIdentifier != v6)
    {
      if (v6)
      {
        BOOL v7 = -[NSNumber isEqualToNumber:](itemIdentifier, "isEqualToNumber:");
LABEL_11:
        LOBYTE(bundleIdentifier) = v7;
        goto LABEL_13;
      }
      goto LABEL_7;
    }
LABEL_12:
    LOBYTE(bundleIdentifier) = 1;
    goto LABEL_13;
  }
  podcastFeedURLIdentifier = self->_podcastFeedURLIdentifier;
  if (podcastFeedURLIdentifier)
  {
    if (podcastFeedURLIdentifier != v4->_podcastFeedURLIdentifier)
    {
      BOOL v7 = -[NSString isEqualToString:](podcastFeedURLIdentifier, "isEqualToString:");
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    v11 = [(SKUIStoreIdentifier *)v4 bundleIdentifier];
    LOBYTE(bundleIdentifier) = [(NSString *)bundleIdentifier isEqualToString:v11];
  }
LABEL_13:

  return (char)bundleIdentifier;
}

- (int64_t)longLongValue
{
  int64_t result = (int64_t)self->_itemIdentifier;
  if (result) {
    return [(id)result longLongValue];
  }
  return result;
}

- (id)numberValue
{
  return self->_itemIdentifier;
}

- (id)stringValue
{
  if (self->_itemIdentifier && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = [(NSNumber *)self->_itemIdentifier stringValue];
  }
  else
  {
    podcastFeedURLIdentifier = self->_podcastFeedURLIdentifier;
    if (podcastFeedURLIdentifier) {
      v3 = podcastFeedURLIdentifier;
    }
    else {
      v3 = 0;
    }
  }

  return v3;
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)podcastFeedURLIdentifier
{
  return self->_podcastFeedURLIdentifier;
}

- (void)setPodcastFeedURLIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_podcastFeedURLIdentifier, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (void)initWithLongLong:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStoreIdentifier initWithLongLong:]";
}

- (void)initWithNumber:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStoreIdentifier initWithNumber:]";
}

- (void)initWithPodcastFeedURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStoreIdentifier initWithPodcastFeedURL:]";
}

@end