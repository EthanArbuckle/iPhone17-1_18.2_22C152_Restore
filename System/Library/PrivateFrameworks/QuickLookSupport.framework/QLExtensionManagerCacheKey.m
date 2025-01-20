@interface QLExtensionManagerCacheKey
- (BOOL)allowParentTypes;
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsFirstPartyExtension;
- (NSDictionary)attributes;
- (NSString)extensionPath;
- (QLExtensionManagerCacheKey)initWithAttributes:(id)a3 allowParentTypes:(BOOL)a4 wantsFirstPartyExtension:(BOOL)a5 extensionPath:(id)a6;
- (unint64_t)hash;
@end

@implementation QLExtensionManagerCacheKey

- (QLExtensionManagerCacheKey)initWithAttributes:(id)a3 allowParentTypes:(BOOL)a4 wantsFirstPartyExtension:(BOOL)a5 extensionPath:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)QLExtensionManagerCacheKey;
  v13 = [(QLExtensionManagerCacheKey *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_attributes, a3);
    v14->_allowParentTypes = a4;
    v14->_wantsFirstPartyExtension = a5;
    objc_storeStrong((id *)&v14->_extensionPath, a6);
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = ((unint64_t)self->_allowParentTypes << 9) | ([(NSDictionary *)self->_attributes hash] << 10) | ((unint64_t)self->_wantsFirstPartyExtension << 8);
  return v3 & 0xFFFFFFFFFFFFFF00 | [(NSString *)self->_extensionPath hash];
}

- (BOOL)isEqual:(id)a3
{
  v5 = (QLExtensionManagerCacheKey *)a3;
  if (self == v5)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = [(QLExtensionManagerCacheKey *)v6 attributes];
      if (![v7 isEqual:self->_attributes])
      {
        BOOL v10 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v8 = [(QLExtensionManagerCacheKey *)v6 extensionPath];
      extensionPath = self->_extensionPath;
      if (v8 == extensionPath
        || ([(QLExtensionManagerCacheKey *)v6 extensionPath],
            unint64_t v3 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:self->_extensionPath]))
      {
        BOOL v10 = self->_allowParentTypes == [(QLExtensionManagerCacheKey *)v6 allowParentTypes]
           && self->_wantsFirstPartyExtension == [(QLExtensionManagerCacheKey *)v6 wantsFirstPartyExtension];
        if (v8 == extensionPath) {
          goto LABEL_15;
        }
      }
      else
      {
        BOOL v10 = 0;
      }

LABEL_15:
      goto LABEL_16;
    }
    BOOL v10 = 0;
  }
LABEL_17:

  return v10;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)allowParentTypes
{
  return self->_allowParentTypes;
}

- (BOOL)wantsFirstPartyExtension
{
  return self->_wantsFirstPartyExtension;
}

- (NSString)extensionPath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPath, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end