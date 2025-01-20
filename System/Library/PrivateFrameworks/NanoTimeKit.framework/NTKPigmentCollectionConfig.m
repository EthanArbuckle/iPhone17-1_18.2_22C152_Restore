@interface NTKPigmentCollectionConfig
+ (BOOL)supportsSecureCoding;
+ (id)collectionConfigFromProtoBuffer:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)defaultGalleryColorNames;
- (NSArray)exclusions;
- (NSDictionary)migration;
- (NSNumber)excludesDuotone;
- (NSNumber)isAddable;
- (NSNumber)sensitivity;
- (NSNumber)sku;
- (NSNumber)sortedByHue;
- (NSNumber)supportsSlider;
- (NSString)collectionOverride;
- (NSString)defaultColorOptionName;
- (NSString)defaultConfigAttributeName;
- (NSString)fallbackDefaultColorOptionName;
- (NSString)featureFlag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)protoBuffer;
- (void)applyCollectionOverrideNameOnItems:(id)a3;
- (void)overridePropertiesFromConfig:(id)a3;
- (void)removeExcludedItemsFromList:(id)a3;
- (void)setCollectionOverride:(id)a3;
- (void)setDefaultColorOptionName:(id)a3;
- (void)setDefaultConfigAttributeName:(id)a3;
- (void)setDefaultGalleryColorNames:(id)a3;
- (void)setExcludesDuotone:(id)a3;
- (void)setExclusions:(id)a3;
- (void)setFallbackDefaultColorOptionName:(id)a3;
- (void)setFeatureFlag:(id)a3;
- (void)setIsAddable:(id)a3;
- (void)setMigration:(id)a3;
- (void)setSensitivity:(id)a3;
- (void)setSku:(id)a3;
- (void)setSortedByHue:(id)a3;
- (void)setSupportsSlider:(id)a3;
@end

@implementation NTKPigmentCollectionConfig

- (void)overridePropertiesFromConfig:(id)a3
{
  id v32 = a3;
  v4 = [v32 defaultColorOptionName];

  if (v4)
  {
    v5 = [v32 defaultColorOptionName];
    [(NTKPigmentCollectionConfig *)self setDefaultColorOptionName:v5];
  }
  v6 = [v32 sensitivity];

  if (v6)
  {
    v7 = [v32 sensitivity];
    [(NTKPigmentCollectionConfig *)self setSensitivity:v7];
  }
  v8 = [v32 isAddable];

  if (v8)
  {
    v9 = [v32 isAddable];
    [(NTKPigmentCollectionConfig *)self setIsAddable:v9];
  }
  v10 = [v32 supportsSlider];

  if (v10)
  {
    v11 = [v32 supportsSlider];
    [(NTKPigmentCollectionConfig *)self setSupportsSlider:v11];
  }
  uint64_t v12 = [(NTKPigmentCollectionConfig *)self migration];
  if (v12
    && (v13 = (void *)v12,
        [v32 migration],
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
    v15 = [(NTKPigmentCollectionConfig *)self migration];
    v16 = (void *)[v15 mutableCopy];

    v17 = [v32 migration];
    [v16 addEntriesFromDictionary:v17];
  }
  else
  {
    v18 = [v32 migration];

    v19 = v32;
    if (!v18) {
      goto LABEL_15;
    }
    v16 = [v32 migration];
  }
  [(NTKPigmentCollectionConfig *)self setMigration:v16];

  v19 = v32;
LABEL_15:
  v20 = [v19 exclusions];

  if (v20)
  {
    v21 = [(NTKPigmentCollectionConfig *)self exclusions];
    v22 = [v32 exclusions];
    v23 = [v21 arrayByAddingObjectsFromArray:v22];
    [(NTKPigmentCollectionConfig *)self setExclusions:v23];
  }
  v24 = [v32 excludesDuotone];

  if (v24)
  {
    v25 = [v32 excludesDuotone];
    [(NTKPigmentCollectionConfig *)self setExcludesDuotone:v25];
  }
  [v32 collectionOverride];

  v26 = [v32 defaultGalleryColorNames];

  if (v26)
  {
    v27 = [v32 defaultGalleryColorNames];
    [(NTKPigmentCollectionConfig *)self setDefaultGalleryColorNames:v27];
  }
  uint64_t v28 = [v32 defaultColorOptionName];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [v32 defaultConfigAttributeName];

    if (v30)
    {
      v31 = [v32 defaultConfigAttributeName];
      [(NTKPigmentCollectionConfig *)self setDefaultConfigAttributeName:v31];
    }
  }
}

- (void)removeExcludedItemsFromList:(id)a3
{
  id v4 = a3;
  v5 = [(NTKPigmentCollectionConfig *)self exclusions];
  if ([v5 count])
  {
    uint64_t v6 = [v4 count];

    if (!v6) {
      goto LABEL_8;
    }
LABEL_6:
    v9 = (void *)MEMORY[0x1E4F1CA80];
    v10 = [(NTKPigmentCollectionConfig *)self exclusions];
    v11 = [v9 setWithArray:v10];

    uint64_t v12 = [(NTKPigmentCollectionConfig *)self exclusions];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__NTKPigmentCollectionConfig_removeExcludedItemsFromList___block_invoke;
    v19[3] = &unk_1E62C0188;
    id v13 = v11;
    id v20 = v13;
    [v12 enumerateObjectsUsingBlock:v19];

    v14 = (void *)[v4 copy];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__NTKPigmentCollectionConfig_removeExcludedItemsFromList___block_invoke_2;
    v16[3] = &unk_1E62C2A80;
    v16[4] = self;
    id v17 = v4;
    id v18 = v13;
    id v15 = v13;
    [v14 enumerateObjectsUsingBlock:v16];

    goto LABEL_8;
  }
  v7 = [(NTKPigmentCollectionConfig *)self excludesDuotone];
  if (([v7 BOOLValue] & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v8 = [v4 count];

  if (v8) {
    goto LABEL_6;
  }
LABEL_8:
}

void __58__NTKPigmentCollectionConfig_removeExcludedItemsFromList___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 containsString:@":"])
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [v5 stringByReplacingOccurrencesOfString:@":" withString:@"."];
    [v3 addObject:v4];
  }
}

void __58__NTKPigmentCollectionConfig_removeExcludedItemsFromList___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  if ([v11 isMultitoneOption])
  {
    v3 = [*(id *)(a1 + 32) excludesDuotone];
    char v4 = [v3 BOOLValue];

    if (v4) {
      goto LABEL_7;
    }
  }
  if ([v11 isMultitoneOption])
  {
    id v5 = *(void **)(a1 + 48);
    uint64_t v6 = [v11 multitoneNamesWithoutCollection];
    LOBYTE(v5) = [v5 containsObject:v6];

    if (v5) {
      goto LABEL_7;
    }
  }
  v7 = *(void **)(a1 + 48);
  uint64_t v8 = [v11 effectiveOptionName];
  LOBYTE(v7) = [v7 containsObject:v8];

  if ((v7 & 1) != 0
    || (v9 = *(void **)(a1 + 48),
        [v11 fullname],
        v10 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = [v9 containsObject:v10],
        v10,
        v9))
  {
LABEL_7:
    [*(id *)(a1 + 40) removeObject:v11];
  }
}

- (void)applyCollectionOverrideNameOnItems:(id)a3
{
  id v14 = a3;
  char v4 = [(NTKPigmentCollectionConfig *)self collectionOverride];
  id v5 = v14;
  if (v4)
  {
    uint64_t v6 = [v14 count];

    id v5 = v14;
    if (v6)
    {
      v7 = (void *)[v14 copy];
      if ([v7 count])
      {
        unint64_t v8 = 0;
        do
        {
          v9 = [v7 objectAtIndexedSubscript:v8];
          v10 = [v9 collectionName];
          id v11 = [v9 effectiveCollectionName];
          if ([v10 isEqualToString:v11])
          {
            uint64_t v12 = [(NTKPigmentCollectionConfig *)self collectionOverride];
            id v13 = (void *)[v9 copyWithCollectionOverride:v12];

            [v14 removeObject:v9];
            if ([v14 count] - 1 <= v8) {
              [v14 addObject:v13];
            }
            else {
              [v14 insertObject:v13 atIndex:v8];
            }
          }
          ++v8;
        }
        while ([v7 count] > v8);
      }

      id v5 = v14;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSString *)self->_defaultColorOptionName copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_fallbackDefaultColorOptionName copy];
  unint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_defaultConfigAttributeName copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [(NSArray *)self->_defaultGalleryColorNames copy];
  uint64_t v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [(NSNumber *)self->_sensitivity copy];
  id v14 = (void *)v4[5];
  v4[5] = v13;

  uint64_t v15 = [(NSNumber *)self->_isAddable copy];
  v16 = (void *)v4[6];
  v4[6] = v15;

  uint64_t v17 = [(NSNumber *)self->_excludesDuotone copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSDictionary *)self->_migration copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSString *)self->_featureFlag copy];
  v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSNumber *)self->_supportsSlider copy];
  v24 = (void *)v4[7];
  v4[7] = v23;

  uint64_t v25 = [(NSNumber *)self->_sortedByHue copy];
  v26 = (void *)v4[11];
  v4[11] = v25;

  uint64_t v27 = [(NSArray *)self->_exclusions copy];
  uint64_t v28 = (void *)v4[12];
  v4[12] = v27;

  uint64_t v29 = [(NSString *)self->_collectionOverride copy];
  v30 = (void *)v4[13];
  v4[13] = v29;

  uint64_t v31 = [(NSNumber *)self->_sku copy];
  id v32 = (void *)v4[14];
  v4[14] = v31;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (void **)a3;
  if (v4)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    char v32 = NTKEqualObjects(self->_defaultColorOptionName, v4[1]);
    uint64_t v5 = v30;
    if (*((unsigned char *)v30 + 24))
    {
      int v6 = NTKEqualObjects(self->_fallbackDefaultColorOptionName, v4[2]);
      uint64_t v5 = v30;
      *((unsigned char *)v30 + 24) = v6;
      if (v6)
      {
        int v7 = NTKEqualObjects(self->_defaultConfigAttributeName, v4[3]);
        uint64_t v5 = v30;
        *((unsigned char *)v30 + 24) = v7;
        if (v7)
        {
          int v8 = NTKEqualObjects(self->_sensitivity, v4[5]);
          uint64_t v5 = v30;
          *((unsigned char *)v30 + 24) = v8;
          if (v8)
          {
            int v9 = NTKEqualObjects(self->_isAddable, v4[6]);
            uint64_t v5 = v30;
            *((unsigned char *)v30 + 24) = v9;
            if (v9)
            {
              int v10 = NTKEqualObjects(self->_supportsSlider, v4[7]);
              uint64_t v5 = v30;
              *((unsigned char *)v30 + 24) = v10;
              if (v10)
              {
                int v11 = NTKEqualObjects(self->_featureFlag, v4[10]);
                uint64_t v5 = v30;
                *((unsigned char *)v30 + 24) = v11;
                if (v11)
                {
                  int v12 = NTKEqualObjects(self->_sortedByHue, v4[11]);
                  uint64_t v5 = v30;
                  *((unsigned char *)v30 + 24) = v12;
                  if (v12)
                  {
                    int v13 = NTKEqualObjects(self->_collectionOverride, v4[13]);
                    uint64_t v5 = v30;
                    *((unsigned char *)v30 + 24) = v13;
                    if (v13)
                    {
                      BOOL v14 = self->_excludesDuotone == v4[8];
                      *((unsigned char *)v5 + 24) = v14;
                      if (v14)
                      {
                        NSUInteger v15 = [(NSArray *)self->_exclusions count];
                        uint64_t v16 = [v4[12] count];
                        uint64_t v5 = v30;
                        *((unsigned char *)v30 + 24) = v15 == v16;
                        if (v15 == v16)
                        {
                          NSUInteger v17 = [(NSDictionary *)self->_migration count];
                          uint64_t v18 = [v4[9] count];
                          *((unsigned char *)v30 + 24) = v17 == v18;
                          if (v17 != v18) {
                            goto LABEL_35;
                          }
                          unint64_t v19 = 0;
                          while ([(NSArray *)self->_exclusions count] > v19)
                          {
                            id v20 = [(NSArray *)self->_exclusions objectAtIndexedSubscript:v19];
                            uint64_t v21 = [v4[12] objectAtIndexedSubscript:v19];
                            char v22 = [v20 isEqualToString:v21];
                            *((unsigned char *)v30 + 24) = v22;

                            BOOL v23 = 0;
                            ++v19;
                            if (!*((unsigned char *)v30 + 24)) {
                              goto LABEL_31;
                            }
                          }
                          if (*((unsigned char *)v30 + 24))
                          {
                            migration = self->_migration;
                            v26[0] = MEMORY[0x1E4F143A8];
                            v26[1] = 3221225472;
                            v26[2] = __38__NTKPigmentCollectionConfig_isEqual___block_invoke;
                            v26[3] = &unk_1E62C9568;
                            uint64_t v27 = v4;
                            uint64_t v28 = &v29;
                            [(NSDictionary *)migration enumerateKeysAndObjectsUsingBlock:v26];

                            BOOL v23 = *((unsigned char *)v30 + 24) != 0;
                          }
                          else
                          {
LABEL_35:
                            BOOL v23 = 0;
                          }
                          goto LABEL_31;
                        }
LABEL_30:
                        BOOL v23 = 0;
                        *((unsigned char *)v5 + 24) = 0;
LABEL_31:
                        _Block_object_dispose(&v29, 8);
                        goto LABEL_32;
                      }
LABEL_29:
                      *((unsigned char *)v5 + 24) = 0;
                      goto LABEL_30;
                    }
LABEL_28:
                    *((unsigned char *)v5 + 24) = 0;
                    goto LABEL_29;
                  }
LABEL_27:
                  *((unsigned char *)v5 + 24) = 0;
                  goto LABEL_28;
                }
LABEL_26:
                *((unsigned char *)v5 + 24) = 0;
                goto LABEL_27;
              }
LABEL_25:
              *((unsigned char *)v5 + 24) = 0;
              goto LABEL_26;
            }
LABEL_24:
            *((unsigned char *)v5 + 24) = 0;
            goto LABEL_25;
          }
LABEL_23:
          *((unsigned char *)v5 + 24) = 0;
          goto LABEL_24;
        }
LABEL_22:
        *((unsigned char *)v5 + 24) = 0;
        goto LABEL_23;
      }
    }
    else
    {
      *((unsigned char *)v30 + 24) = 0;
    }
    *((unsigned char *)v5 + 24) = 0;
    goto LABEL_22;
  }
  BOOL v23 = 0;
LABEL_32:

  return v23;
}

void __38__NTKPigmentCollectionConfig_isEqual___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  int v7 = *(void **)(*(void *)(a1 + 32) + 72);
  id v8 = a3;
  id v9 = [v7 objectForKeyedSubscript:a2];
  LOBYTE(a2) = NTKEqualObjects(v8, v9);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

- (id)description
{
  v2 = NSString;
  collectionOverride = self->_collectionOverride;
  defaultColorOptionName = self->_defaultColorOptionName;
  uint64_t v5 = [(NSArray *)self->_defaultGalleryColorNames ntk_flatDescription];
  int v6 = [v2 stringWithFormat:@"config [collectionOverride: %@, defaultColorOptionName:%@, defaultGalleryColorNames:%@]", collectionOverride, defaultColorOptionName, v5];

  return v6;
}

+ (id)collectionConfigFromProtoBuffer:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    char v4 = objc_alloc_init(NTKPigmentCollectionConfig);
    uint64_t v5 = [v3 defaultColorOptionName];
    [(NTKPigmentCollectionConfig *)v4 setDefaultColorOptionName:v5];

    int v6 = [v3 fallbackDefaultColorOptionName];
    [(NTKPigmentCollectionConfig *)v4 setFallbackDefaultColorOptionName:v6];

    int v7 = [v3 defaultConfigAttributeName];
    [(NTKPigmentCollectionConfig *)v4 setDefaultConfigAttributeName:v7];

    if ([v3 hasSensitivity])
    {
      id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "sensitivity"));
      [(NTKPigmentCollectionConfig *)v4 setSensitivity:v8];
    }
    if ([v3 hasIsAddable])
    {
      id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isAddable"));
      [(NTKPigmentCollectionConfig *)v4 setIsAddable:v9];
    }
    if ([v3 hasSupportsSlider])
    {
      int v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "supportsSlider"));
      [(NTKPigmentCollectionConfig *)v4 setSupportsSlider:v10];
    }
    int v11 = [v3 featureFlag];
    [(NTKPigmentCollectionConfig *)v4 setFeatureFlag:v11];

    if ([v3 hasSortedByHue])
    {
      int v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "sortedByHue"));
      [(NTKPigmentCollectionConfig *)v4 setSortedByHue:v12];
    }
    if ([v3 hasExcludesDuotone])
    {
      int v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "excludesDuotone"));
      [(NTKPigmentCollectionConfig *)v4 setExcludesDuotone:v13];
    }
    BOOL v14 = [v3 collectionOverride];
    [(NTKPigmentCollectionConfig *)v4 setCollectionOverride:v14];

    NSUInteger v15 = [v3 exclusions];
    [(NTKPigmentCollectionConfig *)v4 setExclusions:v15];

    uint64_t v16 = [v3 migrations];

    if (v16)
    {
      NSUInteger v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "migrationsCount"));
      uint64_t v18 = [v3 migrations];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __62__NTKPigmentCollectionConfig_collectionConfigFromProtoBuffer___block_invoke;
      v22[3] = &unk_1E62C9590;
      id v23 = v17;
      id v19 = v17;
      [v18 enumerateObjectsUsingBlock:v22];

      [(NTKPigmentCollectionConfig *)v4 setMigration:v19];
    }
    id v20 = [v3 defaultGalleryColorNames];
    [(NTKPigmentCollectionConfig *)v4 setDefaultGalleryColorNames:v20];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

void __62__NTKPigmentCollectionConfig_collectionConfigFromProtoBuffer___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 from];
  if (v3)
  {
    char v4 = (void *)v3;
    uint64_t v5 = [v9 to];

    if (v5)
    {
      int v6 = [v9 to];
      int v7 = *(void **)(a1 + 32);
      id v8 = [v9 from];
      [v7 setObject:v6 forKeyedSubscript:v8];
    }
  }
}

- (id)protoBuffer
{
  uint64_t v3 = objc_alloc_init(NTKProtoPigmentCollectionConfig);
  char v4 = (void *)[(NSString *)self->_defaultColorOptionName copy];
  [(NTKProtoPigmentCollectionConfig *)v3 setDefaultColorOptionName:v4];

  uint64_t v5 = (void *)[(NSString *)self->_fallbackDefaultColorOptionName copy];
  [(NTKProtoPigmentCollectionConfig *)v3 setFallbackDefaultColorOptionName:v5];

  int v6 = (void *)[(NSString *)self->_defaultConfigAttributeName copy];
  [(NTKProtoPigmentCollectionConfig *)v3 setDefaultConfigAttributeName:v6];

  sensitivity = self->_sensitivity;
  if (sensitivity) {
    [(NTKProtoPigmentCollectionConfig *)v3 setSensitivity:[(NSNumber *)sensitivity BOOLValue]];
  }
  isAddable = self->_isAddable;
  if (isAddable) {
    [(NTKProtoPigmentCollectionConfig *)v3 setIsAddable:[(NSNumber *)isAddable BOOLValue]];
  }
  supportsSlider = self->_supportsSlider;
  if (supportsSlider) {
    [(NTKProtoPigmentCollectionConfig *)v3 setSupportsSlider:[(NSNumber *)supportsSlider BOOLValue]];
  }
  [(NTKProtoPigmentCollectionConfig *)v3 setFeatureFlag:self->_featureFlag];
  sortedByHue = self->_sortedByHue;
  if (sortedByHue) {
    [(NTKProtoPigmentCollectionConfig *)v3 setSortedByHue:[(NSNumber *)sortedByHue BOOLValue]];
  }
  excludesDuotone = self->_excludesDuotone;
  if (excludesDuotone) {
    [(NTKProtoPigmentCollectionConfig *)v3 setExcludesDuotone:[(NSNumber *)excludesDuotone BOOLValue]];
  }
  int v12 = (void *)[(NSArray *)self->_defaultGalleryColorNames copy];
  [(NTKProtoPigmentCollectionConfig *)v3 setDefaultGalleryColorNames:v12];

  int v13 = (void *)[(NSArray *)self->_exclusions copy];
  [(NTKProtoPigmentCollectionConfig *)v3 setExclusions:v13];

  BOOL v14 = (void *)[(NSString *)self->_collectionOverride copy];
  [(NTKProtoPigmentCollectionConfig *)v3 setCollectionOverride:v14];

  migration = self->_migration;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __41__NTKPigmentCollectionConfig_protoBuffer__block_invoke;
  v18[3] = &unk_1E62C95B8;
  uint64_t v16 = v3;
  id v19 = v16;
  [(NSDictionary *)migration enumerateKeysAndObjectsUsingBlock:v18];

  return v16;
}

void __41__NTKPigmentCollectionConfig_protoBuffer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v9 = objc_alloc_init(NTKProtoMigration);
  int v7 = (void *)[v6 copy];

  [(NTKProtoMigration *)v9 setFrom:v7];
  id v8 = (void *)[v5 copy];

  [(NTKProtoMigration *)v9 setTo:v8];
  [*(id *)(a1 + 32) addMigration:v9];
}

- (NSString)defaultColorOptionName
{
  return self->_defaultColorOptionName;
}

- (void)setDefaultColorOptionName:(id)a3
{
}

- (NSString)fallbackDefaultColorOptionName
{
  return self->_fallbackDefaultColorOptionName;
}

- (void)setFallbackDefaultColorOptionName:(id)a3
{
}

- (NSString)defaultConfigAttributeName
{
  return self->_defaultConfigAttributeName;
}

- (void)setDefaultConfigAttributeName:(id)a3
{
}

- (NSArray)defaultGalleryColorNames
{
  return self->_defaultGalleryColorNames;
}

- (void)setDefaultGalleryColorNames:(id)a3
{
}

- (NSNumber)sensitivity
{
  return self->_sensitivity;
}

- (void)setSensitivity:(id)a3
{
}

- (NSNumber)isAddable
{
  return self->_isAddable;
}

- (void)setIsAddable:(id)a3
{
}

- (NSNumber)supportsSlider
{
  return self->_supportsSlider;
}

- (void)setSupportsSlider:(id)a3
{
}

- (NSNumber)excludesDuotone
{
  return self->_excludesDuotone;
}

- (void)setExcludesDuotone:(id)a3
{
}

- (NSDictionary)migration
{
  return self->_migration;
}

- (void)setMigration:(id)a3
{
}

- (NSString)featureFlag
{
  return self->_featureFlag;
}

- (void)setFeatureFlag:(id)a3
{
}

- (NSNumber)sortedByHue
{
  return self->_sortedByHue;
}

- (void)setSortedByHue:(id)a3
{
}

- (NSArray)exclusions
{
  return self->_exclusions;
}

- (void)setExclusions:(id)a3
{
}

- (NSString)collectionOverride
{
  return self->_collectionOverride;
}

- (void)setCollectionOverride:(id)a3
{
}

- (NSNumber)sku
{
  return self->_sku;
}

- (void)setSku:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sku, 0);
  objc_storeStrong((id *)&self->_collectionOverride, 0);
  objc_storeStrong((id *)&self->_exclusions, 0);
  objc_storeStrong((id *)&self->_sortedByHue, 0);
  objc_storeStrong((id *)&self->_featureFlag, 0);
  objc_storeStrong((id *)&self->_migration, 0);
  objc_storeStrong((id *)&self->_excludesDuotone, 0);
  objc_storeStrong((id *)&self->_supportsSlider, 0);
  objc_storeStrong((id *)&self->_isAddable, 0);
  objc_storeStrong((id *)&self->_sensitivity, 0);
  objc_storeStrong((id *)&self->_defaultGalleryColorNames, 0);
  objc_storeStrong((id *)&self->_defaultConfigAttributeName, 0);
  objc_storeStrong((id *)&self->_fallbackDefaultColorOptionName, 0);

  objc_storeStrong((id *)&self->_defaultColorOptionName, 0);
}

@end