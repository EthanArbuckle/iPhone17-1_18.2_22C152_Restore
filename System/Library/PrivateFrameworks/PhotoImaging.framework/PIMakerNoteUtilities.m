@interface PIMakerNoteUtilities
+ (void)addAssetIdentifier:(id)a3 toMetadataArray:(id)a4;
+ (void)addAssetIdentifier:(id)a3 toMetadataDictionary:(id)a4;
+ (void)removeAssetIdentifierFromMetadataArray:(id)a3;
@end

@implementation PIMakerNoteUtilities

+ (void)removeAssetIdentifierFromMetadataArray:(id)a3
{
  id v4 = a3;
  uint64_t v3 = [v4 indexOfObjectPassingTest:&__block_literal_global_6079];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL) {
    [v4 removeObjectAtIndex:v3];
  }
}

uint64_t __63__PIMakerNoteUtilities_removeAssetIdentifierFromMetadataArray___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqual:*MEMORY[0x1E4F15D58]];

  return v3;
}

+ (void)addAssetIdentifier:(id)a3 toMetadataArray:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [a1 removeAssetIdentifierFromMetadataArray:v6];
  id v8 = [MEMORY[0x1E4F165A0] metadataItem];
  [v8 setIdentifier:*MEMORY[0x1E4F15D58]];
  [v8 setValue:v7];

  [v6 addObject:v8];
}

+ (void)addAssetIdentifier:(id)a3 toMetadataDictionary:(id)a4
{
  id v9 = a3;
  uint64_t v5 = *MEMORY[0x1E4F2FC20];
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:v5];
  id v8 = (id)[v7 mutableCopy];

  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F15530]];
  [v6 setObject:v8 forKeyedSubscript:v5];
}

@end