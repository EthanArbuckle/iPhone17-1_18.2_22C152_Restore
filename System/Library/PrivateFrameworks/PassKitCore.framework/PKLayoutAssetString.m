@interface PKLayoutAssetString
+ (id)assetKey;
+ (id)nameToAssetsMapFromDictionaries:(id)a3;
- (NSDictionary)configuration;
- (NSString)displayText;
- (NSString)markdownText;
- (NSString)name;
- (PKLayoutAssetString)initWithDictionary:(id)a3;
- (PKOSVersionRequirementRange)osVersionRange;
- (void)setConfiguration:(id)a3;
- (void)setDisplayText:(id)a3;
- (void)setMarkdownText:(id)a3;
- (void)setName:(id)a3;
- (void)setOsVersionRange:(id)a3;
@end

@implementation PKLayoutAssetString

+ (id)assetKey
{
  return @"strings";
}

+ (id)nameToAssetsMapFromDictionaries:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      v5 = objc_msgSend(v4, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_25);
      v6 = objc_msgSend(v5, "pk_groupDictionaryByApplyingBlock:", &__block_literal_global_26);
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

PKLayoutAssetString *__55__PKLayoutAssetString_nameToAssetsMapFromDictionaries___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PKLayoutAssetString alloc] initWithDictionary:v2];

  return v3;
}

uint64_t __55__PKLayoutAssetString_nameToAssetsMapFromDictionaries___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (PKLayoutAssetString)initWithDictionary:(id)a3
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKLayoutAssetString;
  v5 = [(PKLayoutAssetString *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"key"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"value"];
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"markdownValue"];
    markdownText = v5->_markdownText;
    v5->_markdownText = (NSString *)v10;

    uint64_t v12 = PKOSVersionRequirementRangeFromLayoutAssetDictionary(v4);
    osVersionRange = v5->_osVersionRange;
    v5->_osVersionRange = (PKOSVersionRequirementRange *)v12;

    v14 = v5->_name;
    if (!v14 || ![(NSString *)v14 length] || !v5->_displayText && !v5->_markdownText)
    {
      v19 = 0;
      goto LABEL_11;
    }
    v15 = (void *)[v4 mutableCopy];
    v22[0] = @"key";
    v22[1] = @"value";
    v22[2] = @"markdownValue";
    v22[3] = @"osVersionRange";
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    [v15 removeObjectsForKeys:v16];
    if ([v15 count])
    {
      uint64_t v17 = [v15 copy];
      configuration = v5->_configuration;
      v5->_configuration = (NSDictionary *)v17;
    }
  }
  v19 = v5;
LABEL_11:

  return v19;
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

- (NSString)markdownText
{
  return self->_markdownText;
}

- (void)setMarkdownText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markdownText, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_osVersionRange, 0);
}

@end