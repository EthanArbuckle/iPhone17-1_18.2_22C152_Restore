@interface MSDKManifestDataItem
- (MSDKManifestDataItem)initWithIdentifier:(id)a3 andDictionary:(id)a4 forComponent:(id)a5;
- (NSDictionary)data;
@end

@implementation MSDKManifestDataItem

- (MSDKManifestDataItem)initWithIdentifier:(id)a3 andDictionary:(id)a4 forComponent:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MSDKManifestDataItem;
  v10 = [(MSDKManifestItem *)&v13 initWithIdentifier:a3 andDictionary:v9 forComponent:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_data, a4);
  }

  return v11;
}

- (NSDictionary)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end