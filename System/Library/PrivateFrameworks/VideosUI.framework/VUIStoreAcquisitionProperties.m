@interface VUIStoreAcquisitionProperties
+ (id)acquisitionPropertiesWithBuyParams:(id)a3 urlbagKey:(id)a4;
+ (id)metricsAugumentedBuyParamsWithBuyParams:(id)a3;
- (BOOL)ignoresForcedPasswordRestriction;
- (NSNumber)dsid;
- (NSString)buyParams;
- (NSString)strongToken;
- (NSString)urlBagKey;
- (NSString)userAgent;
- (VUIStoreAcquisitionProperties)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBuyParams:(id)a3;
- (void)setDsid:(id)a3;
- (void)setIgnoresForcedPasswordRestriction:(BOOL)a3;
- (void)setStrongToken:(id)a3;
- (void)setUrlBagKey:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation VUIStoreAcquisitionProperties

+ (id)metricsAugumentedBuyParamsWithBuyParams:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if ([v3 length])
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v3];
    v6 = [MEMORY[0x1E4F28B50] mainBundle];
    v7 = [v6 bundleIdentifier];

    [v5 appendFormat:@"&mtApp=%@", v7];
    v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    v9 = [v8 identifierForVendor];
    v10 = [v9 UUIDString];
    [v5 appendFormat:@"&vid=%@", v10];

    v4 = (void *)[v5 copy];
  }

  return v4;
}

+ (id)acquisitionPropertiesWithBuyParams:(id)a3 urlbagKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(VUIStoreAcquisitionProperties);
  [(VUIStoreAcquisitionProperties *)v7 setBuyParams:v6];

  [(VUIStoreAcquisitionProperties *)v7 setUrlBagKey:v5];
  return v7;
}

- (VUIStoreAcquisitionProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIStoreAcquisitionProperties;
  result = [(VUIStoreAcquisitionProperties *)&v3 init];
  if (result) {
    result->_ignoresForcedPasswordRestriction = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[VUIStoreAcquisitionProperties acquisitionPropertiesWithBuyParams:self->_buyParams urlbagKey:self->_urlBagKey];
  [v4 setDsid:self->_dsid];
  [v4 setUserAgent:self->_userAgent];
  [v4 setStrongToken:self->_strongToken];
  [v4 setIgnoresForcedPasswordRestriction:self->_ignoresForcedPasswordRestriction];
  return v4;
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
}

- (NSString)urlBagKey
{
  return self->_urlBagKey;
}

- (void)setUrlBagKey:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)strongToken
{
  return self->_strongToken;
}

- (void)setStrongToken:(id)a3
{
}

- (BOOL)ignoresForcedPasswordRestriction
{
  return self->_ignoresForcedPasswordRestriction;
}

- (void)setIgnoresForcedPasswordRestriction:(BOOL)a3
{
  self->_ignoresForcedPasswordRestriction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongToken, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_urlBagKey, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
}

@end