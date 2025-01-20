@interface SearchUIResolvedMediaDestination
+ (id)applicationNameForBundleIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)appBundleIdentifier;
- (NSString)title;
- (SFCommand)command;
- (SFMediaMetadata)mediaMetadata;
- (SearchUIImage)image;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setCommand:(id)a3;
- (void)setImage:(id)a3;
- (void)setMediaMetadata:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SearchUIResolvedMediaDestination

+ (id)applicationNameForBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[SearchUIUtilities bundleIdentifierForApp:11];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    v6 = @"APPLE_MUSIC";
LABEL_5:
    v9 = +[SearchUIUtilities localizedStringForKey:v6];
    goto LABEL_7;
  }
  v7 = +[SearchUIUtilities bundleIdentifierForApp:21];
  int v8 = [v3 isEqualToString:v7];

  if (v8)
  {
    v6 = @"APPLE_PODCASTS";
    goto LABEL_5;
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:0];
  v9 = [v10 localizedName];

LABEL_7:
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SearchUIResolvedMediaDestination *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = v4;
      v6 = [(SearchUIResolvedMediaDestination *)self appBundleIdentifier];
      v7 = [(SearchUIResolvedMediaDestination *)v5 appBundleIdentifier];
      if ([v6 isEqual:v7])
      {
        int v8 = [(SearchUIResolvedMediaDestination *)self mediaMetadata];
        v9 = [(SearchUIResolvedMediaDestination *)v5 mediaMetadata];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = [(SearchUIResolvedMediaDestination *)self appBundleIdentifier];
  uint64_t v4 = [v3 hash];
  int v5 = [(SearchUIResolvedMediaDestination *)self mediaMetadata];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)title
{
  if (!self->_title)
  {
    id v3 = [(SearchUIResolvedMediaDestination *)self appBundleIdentifier];

    if (v3)
    {
      uint64_t v4 = objc_opt_class();
      int v5 = [(SearchUIResolvedMediaDestination *)self appBundleIdentifier];
      unint64_t v6 = [v4 applicationNameForBundleIdentifier:v5];
      title = self->_title;
      self->_title = v6;
    }
  }
  int v8 = self->_title;
  return v8;
}

- (SFCommand)command
{
  if (!self->_command)
  {
    uint64_t v3 = [(SearchUIResolvedMediaDestination *)self appBundleIdentifier];
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      int v5 = [(SearchUIResolvedMediaDestination *)self mediaMetadata];

      if (v5)
      {
        unint64_t v6 = objc_opt_new();
        v7 = [(SearchUIResolvedMediaDestination *)self appBundleIdentifier];
        [v6 setClientSelectedBundleIdentifier:v7];

        int v8 = [(SearchUIResolvedMediaDestination *)self mediaMetadata];
        [v6 setMediaMetadata:v8];

        command = self->_command;
        self->_command = (SFCommand *)v6;
      }
    }
  }
  char v10 = self->_command;
  return v10;
}

- (SearchUIImage)image
{
  if (!self->_image)
  {
    uint64_t v3 = [(SearchUIResolvedMediaDestination *)self appBundleIdentifier];

    if (v3)
    {
      uint64_t v4 = [(SearchUIResolvedMediaDestination *)self appBundleIdentifier];
      int v5 = +[SearchUIAppIconImage appIconForBundleIdentifier:v4 variant:2];
      image = self->_image;
      self->_image = v5;
    }
  }
  v7 = self->_image;
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  int v5 = [(SearchUIResolvedMediaDestination *)self appBundleIdentifier];
  [v4 setAppBundleIdentifier:v5];

  unint64_t v6 = [(SearchUIResolvedMediaDestination *)self mediaMetadata];
  [v4 setMediaMetadata:v6];

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SearchUIResolvedMediaDestination;
  uint64_t v4 = [(SearchUIResolvedMediaDestination *)&v8 description];
  int v5 = [(SearchUIResolvedMediaDestination *)self appBundleIdentifier];
  unint64_t v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (SFMediaMetadata)mediaMetadata
{
  return self->_mediaMetadata;
}

- (void)setMediaMetadata:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setImage:(id)a3
{
}

- (void)setCommand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end