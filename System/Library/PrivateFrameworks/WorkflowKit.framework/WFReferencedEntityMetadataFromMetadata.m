@interface WFReferencedEntityMetadataFromMetadata
@end

@implementation WFReferencedEntityMetadataFromMetadata

void ____WFReferencedEntityMetadataFromMetadata_block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = [a2 identifier];
  id v13 = [v3 objectForKey:v4];

  v5 = v13;
  if (v13)
  {
    v6 = [v13 identifier];
    v7 = [*(id *)(a1 + 40) identifier];
    if ([v6 isEqualToString:v7])
    {
    }
    else
    {
      v8 = *(void **)(a1 + 48);
      v9 = [v13 identifier];
      v10 = [v8 objectForKey:v9];

      v5 = v13;
      if (v10) {
        goto LABEL_7;
      }
      v11 = *(void **)(a1 + 48);
      v12 = [v13 identifier];
      [v11 setObject:v13 forKey:v12];

      __WFReferencedEntityMetadataFromMetadata(v13, *(void *)(a1 + 40), *(void *)(a1 + 32), *(void *)(a1 + 48));
    }
    v5 = v13;
  }
LABEL_7:
}

id ____WFReferencedEntityMetadataFromMetadata_block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 valueType];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 memberValueType];

    v2 = (void *)v3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v2;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end