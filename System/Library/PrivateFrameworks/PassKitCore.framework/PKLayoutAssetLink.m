@interface PKLayoutAssetLink
+ (id)assetKey;
+ (id)nameToAssetsMapFromDictionaries:(id)a3;
- (NSDictionary)configuration;
- (NSNumber)adamID;
- (NSString)displayText;
- (NSString)name;
- (NSURL)url;
- (PKLayoutAssetLink)initWithDictionary:(id)a3;
- (PKOSVersionRequirementRange)osVersionRange;
- (void)setAdamID:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDisplayText:(id)a3;
- (void)setName:(id)a3;
- (void)setOsVersionRange:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation PKLayoutAssetLink

+ (id)assetKey
{
  return @"links";
}

+ (id)nameToAssetsMapFromDictionaries:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      v5 = objc_msgSend(v4, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_147);
      v6 = objc_msgSend(v5, "pk_groupDictionaryByApplyingBlock:", &__block_literal_global_29_0);
    }
    else
    {
      v6 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

PKLayoutAssetLink *__53__PKLayoutAssetLink_nameToAssetsMapFromDictionaries___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PKLayoutAssetLink alloc] initWithDictionary:v2];

  return v3;
}

uint64_t __53__PKLayoutAssetLink_nameToAssetsMapFromDictionaries___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (PKLayoutAssetLink)initWithDictionary:(id)a3
{
  v30[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKLayoutAssetLink;
  v5 = [(PKLayoutAssetLink *)&v29 init];
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = [v4 PKStringForKey:@"key"];
  name = v5->_name;
  v5->_name = (NSString *)v6;

  uint64_t v8 = [v4 PKStringForKey:@"displayName"];
  displayText = v5->_displayText;
  v5->_displayText = (NSString *)v8;

  uint64_t v10 = [v4 PKURLForKey:@"url"];
  url = v5->_url;
  v5->_url = (NSURL *)v10;

  uint64_t v12 = PKOSVersionRequirementRangeFromLayoutAssetDictionary(v4);
  osVersionRange = v5->_osVersionRange;
  v5->_osVersionRange = (PKOSVersionRequirementRange *)v12;

  v14 = [v4 objectForKey:@"adamID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v16 = [v14 stringByTrimmingCharactersInSet:v15];

    v17 = [MEMORY[0x1E4F28FE8] scannerWithString:v16];
    uint64_t v28 = 0;
    if ([v17 scanUnsignedLongLong:&v28] && v28)
    {
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
      adamID = v5->_adamID;
      v5->_adamID = (NSNumber *)v18;
    }
    else
    {
      adamID = v5->_adamID;
      v5->_adamID = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    v20 = v14;
    v16 = v5->_adamID;
    v5->_adamID = v20;
  }

LABEL_11:
  v21 = v5->_name;
  if (!v21 || ![(NSString *)v21 length])
  {

    v26 = 0;
    goto LABEL_18;
  }
  v22 = (void *)[v4 mutableCopy];
  v30[0] = @"key";
  v30[1] = @"displayName";
  v30[2] = @"url";
  v30[3] = @"adamID";
  v30[4] = @"osVersionRange";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
  [v22 removeObjectsForKeys:v23];
  if ([v22 count])
  {
    uint64_t v24 = [v22 copy];
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v24;
  }
LABEL_16:
  v26 = v5;
LABEL_18:

  return v26;
}

- (PKOSVersionRequirementRange)osVersionRange
{
  return self->_osVersionRange;
}

- (void)setOsVersionRange:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_osVersionRange, 0);
}

@end