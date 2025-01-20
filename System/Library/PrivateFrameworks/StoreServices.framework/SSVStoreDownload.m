@interface SSVStoreDownload
- (NSDictionary)properties;
- (NSString)preferredAssetFlavor;
- (SSVStoreDownload)initWithDictionary:(id)a3;
- (void)setPreferredAssetFlavor:(id)a3;
@end

@implementation SSVStoreDownload

- (SSVStoreDownload)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVStoreDownload;
  v5 = [(SSVStoreDownload *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v6;
  }
  return v5;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (NSString)preferredAssetFlavor
{
  return self->_preferredAssetFlavor;
}

- (void)setPreferredAssetFlavor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredAssetFlavor, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end