@interface MOSuggestionAssetsBundle
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAssetType:(id)a3;
- (MOSuggestionAssetsBundle)init;
- (MOSuggestionAssetsBundle)initWithCoder:(id)a3;
- (NSMutableDictionary)assetLibrary;
- (NSMutableSet)availableTypes;
- (id)assetsForType:(id)a3;
- (void)addAssets:(id)a3 forType:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetLibrary:(id)a3;
@end

@implementation MOSuggestionAssetsBundle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  assetLibrary = self->_assetLibrary;
  id v5 = a3;
  [v5 encodeObject:assetLibrary forKey:@"coderKeyMOSuggestionAssetsBundleAssetLibrary"];
  [v5 encodeObject:self->_availableTypes forKey:@"coderKeyMOSuggestionAssetsBundleAvailableTypes"];
}

- (MOSuggestionAssetsBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MOSuggestionAssetsBundle;
  id v5 = [(MOSuggestionAssetsBundle *)&v19 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"coderKeyMOSuggestionAssetsBundleAssetLibrary"];
    assetLibrary = v5->_assetLibrary;
    v5->_assetLibrary = (NSMutableDictionary *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"coderKeyMOSuggestionAssetsBundleAvailableTypes"];
    availableTypes = v5->_availableTypes;
    v5->_availableTypes = (NSMutableSet *)v16;
  }
  return v5;
}

- (id)assetsForType:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_assetLibrary objectForKeyedSubscript:a3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)hasAssetType:(id)a3
{
  return [(NSMutableSet *)self->_availableTypes containsObject:a3];
}

- (MOSuggestionAssetsBundle)init
{
  v8.receiver = self;
  v8.super_class = (Class)MOSuggestionAssetsBundle;
  v2 = [(MOSuggestionAssetsBundle *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assetLibrary = v2->_assetLibrary;
    v2->_assetLibrary = v3;

    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    availableTypes = v2->_availableTypes;
    v2->_availableTypes = v5;
  }
  return v2;
}

- (void)addAssets:(id)a3 forType:(id)a4
{
  assetLibrary = self->_assetLibrary;
  id v7 = a4;
  [(NSMutableDictionary *)assetLibrary setObject:a3 forKeyedSubscript:v7];
  [(NSMutableSet *)self->_availableTypes addObject:v7];
}

- (NSMutableSet)availableTypes
{
  return self->_availableTypes;
}

- (NSMutableDictionary)assetLibrary
{
  return self->_assetLibrary;
}

- (void)setAssetLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLibrary, 0);
  objc_storeStrong((id *)&self->_availableTypes, 0);
}

@end