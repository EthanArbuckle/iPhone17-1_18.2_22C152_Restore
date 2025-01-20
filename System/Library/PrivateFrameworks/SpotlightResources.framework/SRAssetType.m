@interface SRAssetType
- (NSDictionary)contentTypeMap;
- (NSDictionary)deliveryTypeMap;
- (NSSet)deliveryTypes;
- (NSString)assetType;
- (NSString)xpcName;
- (id)contentTypes;
- (int64_t)compatibilityVersion;
- (void)setAssetType:(id)a3;
- (void)setCompatibilityVersion:(int64_t)a3;
- (void)setContentTypeMap:(id)a3;
- (void)setDeliveryTypeMap:(id)a3;
- (void)setDeliveryTypes:(id)a3;
- (void)setXpcName:(id)a3;
@end

@implementation SRAssetType

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTypeMap, 0);
  objc_storeStrong((id *)&self->_deliveryTypeMap, 0);
  objc_storeStrong((id *)&self->_deliveryTypes, 0);
  objc_storeStrong((id *)&self->_xpcName, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

- (NSDictionary)contentTypeMap
{
  return self->_contentTypeMap;
}

- (void)setXpcName:(id)a3
{
}

- (void)setDeliveryTypes:(id)a3
{
}

- (void)setDeliveryTypeMap:(id)a3
{
}

- (void)setContentTypeMap:(id)a3
{
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->_compatibilityVersion = a3;
}

- (void)setAssetType:(id)a3
{
}

- (id)contentTypes
{
  id v3 = objc_alloc(MEMORY[0x263EFFA08]);
  v4 = [(SRAssetType *)self deliveryTypeMap];
  v5 = [v4 allKeys];
  v6 = (void *)[v3 initWithArray:v5];

  return v6;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)xpcName
{
  return self->_xpcName;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (NSSet)deliveryTypes
{
  return self->_deliveryTypes;
}

- (NSDictionary)deliveryTypeMap
{
  return self->_deliveryTypeMap;
}

@end