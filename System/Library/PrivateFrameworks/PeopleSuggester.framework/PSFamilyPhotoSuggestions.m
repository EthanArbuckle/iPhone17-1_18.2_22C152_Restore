@interface PSFamilyPhotoSuggestions
@end

@implementation PSFamilyPhotoSuggestions

void __67___PSFamilyPhotoSuggestions_photosRelationshipKnowledgeSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67___PSFamilyPhotoSuggestions_photosRelationshipKnowledgeSuggestions__block_invoke_2;
  v8[3] = &unk_1E5AE11F0;
  v6 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void __67___PSFamilyPhotoSuggestions_photosRelationshipKnowledgeSuggestions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = a2;
  v6 = objc_opt_class();
  uint64_t v7 = [v5 unsignedIntegerValue];

  if ([v6 _allowRelationship:v7])
  {
    [v9 floatValue];
    if (v8 >= 0.2) {
      [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    }
  }
}

@end