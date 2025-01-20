@interface REFeatureMap
+ (id)defaultFeatureName;
- (BOOL)hasValueForFeature:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)loggingValues;
- (NSSet)allFeatures;
- (NSSet)featureNames;
- (REFeatureMap)initWithFeatureMap:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)featureValueForFeature:(id)a3;
- (id)featureValueForName:(id)a3;
- (unint64_t)_count;
- (unint64_t)hash;
- (unint64_t)valueForFeature:(id)a3;
- (void)dealloc;
- (void)enumerateBoolFeaturesUsingBlock:(id)a3;
- (void)enumerateDoubleFeaturesUsingBlock:(id)a3;
- (void)enumerateEmptyFeaturesUsingBlock:(id)a3;
- (void)enumerateFeatureValuesUsingBlock:(id)a3;
- (void)enumerateFeaturesUsingBlock:(id)a3;
- (void)enumerateInt64FeaturesUsingBlock:(id)a3;
- (void)enumerateInt64FeaturesUsingIndexedBlock:(id)a3 emptyFeatureBlock:(id)a4;
- (void)enumerateStringFeaturesUsingBlock:(id)a3;
- (void)removeAllValues;
- (void)removeValueForFeature:(id)a3;
- (void)setFeatureValue:(id)a3 forFeature:(id)a4;
- (void)setValue:(unint64_t)a3 forFeature:(id)a4;
@end

@implementation REFeatureMap

- (REFeatureMap)initWithFeatureMap:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REFeatureMap;
  v6 = [(REFeatureMap *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_hash = 0;
    objc_storeStrong((id *)&v6->_indices, a3);
    v7->_values = (unint64_t *)malloc_type_calloc([(REFeatureMap *)v7 _count], 8uLL, 0x100004000313F17uLL);
  }

  return v7;
}

- (unint64_t)_count
{
  return [(NSDictionary *)self->_indices count];
}

- (void)dealloc
{
  if ([(REFeatureMap *)self _count])
  {
    unint64_t v3 = 0;
    do
    {
      v4 = (const void *)self->_values[v3];
      if (v4)
      {
        REReleaseFeatureValueTaggedPointer(v4);
        self->_values[v3] = 0;
      }
      ++v3;
    }
    while ([(REFeatureMap *)self _count] > v3);
  }
  free(self->_values);
  self->_values = 0;
  v5.receiver = self;
  v5.super_class = (Class)REFeatureMap;
  [(REFeatureMap *)&v5 dealloc];
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REFeatureMap *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      unint64_t v6 = [(REFeatureMap *)self _count];
      if (self->_indices == v5->_indices
        && (unint64_t v7 = v6, v8 = [(REFeatureMap *)self _count], v8 == [(REFeatureMap *)v5 _count]))
      {
        if (v7)
        {
          BOOL v9 = 0;
          for (i = 0; i != v7; BOOL v9 = i >= v7)
          {
            unint64_t v11 = self->_values[i];
            if (v11 != v5->_values[i])
            {
              REFeatureValueForTaggedPointer(v11);
              id v12 = (id)objc_claimAutoreleasedReturnValue();
              REFeatureValueForTaggedPointer(v5->_values[i]);
              id v13 = (id)objc_claimAutoreleasedReturnValue();
              if (v12 == v13)
              {
              }
              else
              {
                v14 = v13;
                char v15 = [v12 isEqual:v13];

                if ((v15 & 1) == 0) {
                  break;
                }
              }
            }
            ++i;
          }
        }
        else
        {
          BOOL v9 = 1;
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 8) = self->_hash;
  *(void *)(v4 + 16) = malloc_type_calloc([(REFeatureMap *)self _count], 8uLL, 0x100004000313F17uLL);
  unint64_t v5 = [(REFeatureMap *)self _count];
  if (v5)
  {
    unint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      unint64_t v8 = REFeatureValueForTaggedPointer(self->_values[i]);
      *(void *)(*(void *)(v4 + 16) + 8 * i) = RECreateFeatureValueTaggedPointer(v8);
    }
  }
  objc_storeStrong((id *)(v4 + 24), self->_indices);
  return (id)v4;
}

- (void)setValue:(unint64_t)a3 forFeature:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(NSDictionary *)self->_indices objectForKeyedSubscript:v6];
  if (!v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__REFeatureMap_setValue_forFeature___block_invoke;
    block[3] = &unk_2644BC660;
    id v17 = v6;
    if (setValue_forFeature__onceToken != -1) {
      dispatch_once(&setValue_forFeature__onceToken, block);
    }
    id v12 = v17;
    goto LABEL_11;
  }
  if (a3)
  {
    unint64_t v8 = REFeatureValueTypeForTaggedPointer(a3);
    if ((REValidFeatureValueTypeForFeatureType(v8, [v6 featureType]) & 1) == 0)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __36__REFeatureMap_setValue_forFeature___block_invoke_2;
      v13[3] = &unk_2644BC828;
      id v14 = v6;
      unint64_t v15 = a3;
      if (setValue_forFeature__onceToken_20 != -1) {
        dispatch_once(&setValue_forFeature__onceToken_20, v13);
      }
      id v12 = v14;
LABEL_11:

      goto LABEL_12;
    }
  }
  RERetainFeatureValueTaggedPointer((CFTypeRef)a3);
  uint64_t v9 = [v7 unsignedIntegerValue];
  uint64_t v10 = REFeatureValueHashForTaggedPointer(self->_values[v9]);
  values = self->_values;
  self->_hash ^= v10;
  REReleaseFeatureValueTaggedPointer((CFTypeRef)values[v9]);
  self->_values[v9] = a3;
  self->_hash ^= REFeatureValueHashForTaggedPointer(a3);
LABEL_12:
}

void __36__REFeatureMap_setValue_forFeature___block_invoke(uint64_t a1)
{
  v1 = (void *)*MEMORY[0x263EFF4A0];
  id v8 = [*(id *)(a1 + 32) name];
  RERaiseInternalException(v1, @"Relevance Engine is not configured to support feature: %@", v2, v3, v4, v5, v6, v7, (uint64_t)v8);
}

void __36__REFeatureMap_setValue_forFeature___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)*MEMORY[0x263EFF4A0];
  id v10 = [*(id *)(a1 + 32) name];
  uint64_t v9 = REDescriptionForTaggedPointer(*(void *)(a1 + 40));
  RERaiseInternalException(v2, @"Feature %@ does not support value %@", v3, v4, v5, v6, v7, v8, (uint64_t)v10);
}

- (void)setFeatureValue:(id)a3 forFeature:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (const void *)RECreateFeatureValueTaggedPointer(a3);
  [(REFeatureMap *)self setValue:v7 forFeature:v6];

  REReleaseFeatureValueTaggedPointer(v7);
}

- (void)removeValueForFeature:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_indices objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 unsignedIntegerValue];
    uint64_t v8 = REFeatureValueHashForTaggedPointer(self->_values[v7]);
    values = self->_values;
    self->_hash ^= v8;
    REReleaseFeatureValueTaggedPointer((CFTypeRef)values[v7]);
    self->_values[v7] = 0;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__REFeatureMap_removeValueForFeature___block_invoke;
    block[3] = &unk_2644BC660;
    id v11 = v4;
    if (removeValueForFeature__onceToken != -1) {
      dispatch_once(&removeValueForFeature__onceToken, block);
    }
  }
}

void __38__REFeatureMap_removeValueForFeature___block_invoke(uint64_t a1)
{
  v1 = (void *)*MEMORY[0x263EFF4A0];
  id v8 = [*(id *)(a1 + 32) name];
  RERaiseInternalException(v1, @"Relevance Engine is not configured to support feature: %@", v2, v3, v4, v5, v6, v7, (uint64_t)v8);
}

- (void)removeAllValues
{
  self->_hash = 0;
  if ([(REFeatureMap *)self _count])
  {
    unint64_t v3 = 0;
    do
    {
      REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_values[v3]);
      self->_values[v3++] = 0;
    }
    while (v3 < [(REFeatureMap *)self _count]);
  }
}

- (id)featureValueForFeature:(id)a3
{
  unint64_t v3 = [(REFeatureMap *)self valueForFeature:a3];
  return REFeatureValueForTaggedPointer(v3);
}

- (unint64_t)valueForFeature:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_indices objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    values = self->_values;
    unint64_t v8 = values[[v5 unsignedIntegerValue]];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__REFeatureMap_valueForFeature___block_invoke;
    block[3] = &unk_2644BC660;
    id v11 = v4;
    if (valueForFeature__onceToken != -1) {
      dispatch_once(&valueForFeature__onceToken, block);
    }

    unint64_t v8 = 0;
  }

  return v8;
}

void __32__REFeatureMap_valueForFeature___block_invoke(uint64_t a1)
{
  v1 = (void *)*MEMORY[0x263EFF4A0];
  id v8 = [*(id *)(a1 + 32) name];
  RERaiseInternalException(v1, @"Relevance Engine is not configured to support feature: %@", v2, v3, v4, v5, v6, v7, (uint64_t)v8);
}

- (BOOL)hasValueForFeature:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_indices objectForKeyedSubscript:v4];

  if (v5) {
    BOOL v6 = [(REFeatureMap *)self valueForFeature:v4] != 0;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)enumerateFeaturesUsingBlock:(id)a3
{
  id v4 = a3;
  indices = self->_indices;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__REFeatureMap_enumerateFeaturesUsingBlock___block_invoke;
  v7[3] = &unk_2644BC850;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)indices enumerateKeysAndObjectsUsingBlock:v7];
}

void __44__REFeatureMap_enumerateFeaturesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  (*(void (**)(void, id, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 8 * [a3 unsignedIntegerValue]));
}

- (void)enumerateBoolFeaturesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__REFeatureMap_enumerateBoolFeaturesUsingBlock___block_invoke;
  v6[3] = &unk_2644BC878;
  id v7 = v4;
  id v5 = v4;
  [(REFeatureMap *)self enumerateFeaturesUsingBlock:v6];
}

uint64_t __48__REFeatureMap_enumerateBoolFeaturesUsingBlock___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v10 = v5;
    id v5 = (id)REFeatureValueTypeForTaggedPointer(a3);
    id v6 = v10;
    if (!v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = REBooleanValueForTaggedPointer(a3);
      id v5 = (id)(*(uint64_t (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v10, v8);
      id v6 = v10;
    }
  }
  return MEMORY[0x270F9A758](v5, v6);
}

- (void)enumerateInt64FeaturesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__REFeatureMap_enumerateInt64FeaturesUsingBlock___block_invoke;
  v6[3] = &unk_2644BC878;
  id v7 = v4;
  id v5 = v4;
  [(REFeatureMap *)self enumerateFeaturesUsingBlock:v6];
}

void __49__REFeatureMap_enumerateInt64FeaturesUsingBlock___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v9 = v5;
    BOOL v6 = REFeatureValueTypeForTaggedPointer(a3) == 1;
    id v5 = v9;
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = REIntegerValueForTaggedPointer(a3);
      (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v9, v8);
      id v5 = v9;
    }
  }
}

- (void)enumerateDoubleFeaturesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__REFeatureMap_enumerateDoubleFeaturesUsingBlock___block_invoke;
  v6[3] = &unk_2644BC878;
  id v7 = v4;
  id v5 = v4;
  [(REFeatureMap *)self enumerateFeaturesUsingBlock:v6];
}

void __50__REFeatureMap_enumerateDoubleFeaturesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    id v10 = v5;
    BOOL v6 = REFeatureValueTypeForTaggedPointer((unint64_t)a3) == 2;
    id v5 = v10;
    if (v6)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      double v9 = REDoubleValueForTaggedPointer(a3, v7);
      (*(void (**)(uint64_t, id, double))(v8 + 16))(v8, v10, v9);
      id v5 = v10;
    }
  }
}

- (void)enumerateStringFeaturesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__REFeatureMap_enumerateStringFeaturesUsingBlock___block_invoke;
  v6[3] = &unk_2644BC878;
  id v7 = v4;
  id v5 = v4;
  [(REFeatureMap *)self enumerateFeaturesUsingBlock:v6];
}

void __50__REFeatureMap_enumerateStringFeaturesUsingBlock___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v9 = v5;
    BOOL v6 = REFeatureValueTypeForTaggedPointer(a3) == 3;
    id v5 = v9;
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = REStringValueForTaggedPointer(a3);
      (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);

      id v5 = v9;
    }
  }
}

- (void)enumerateEmptyFeaturesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__REFeatureMap_enumerateEmptyFeaturesUsingBlock___block_invoke;
  v6[3] = &unk_2644BC878;
  id v7 = v4;
  id v5 = v4;
  [(REFeatureMap *)self enumerateFeaturesUsingBlock:v6];
}

uint64_t __49__REFeatureMap_enumerateEmptyFeaturesUsingBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)enumerateFeatureValuesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__REFeatureMap_enumerateFeatureValuesUsingBlock___block_invoke;
  v6[3] = &unk_2644BC878;
  id v7 = v4;
  id v5 = v4;
  [(REFeatureMap *)self enumerateFeaturesUsingBlock:v6];
}

void __49__REFeatureMap_enumerateFeatureValuesUsingBlock___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  REFeatureValueForTaggedPointer(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSSet)allFeatures
{
  uint64_t v2 = [[_REFeatureMapFeatureSet alloc] initWithFeatureMap:self->_indices];
  return (NSSet *)v2;
}

- (NSArray)loggingValues
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[REFeatureMap featureCount](self, "featureCount"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__REFeatureMap_loggingValues__block_invoke;
  v7[3] = &unk_2644BC8A0;
  id v8 = v3;
  id v4 = v3;
  [(REFeatureMap *)self enumerateFeatureValuesUsingBlock:v7];
  id v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

void __29__REFeatureMap_loggingValues__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = NSString;
  id v6 = [a2 name];
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = @"(null)";
  }
  if (v10)
  {
    id v8 = REValueDescriptionStringFromFeatureValue(v10);
    id v9 = [v5 stringWithFormat:@"%@ → %@", v7, v8];
  }
  else
  {
    id v9 = [v5 stringWithFormat:@"%@ → %@", v7, @"(null)"];
  }

  [*(id *)(a1 + 32) addObject:v9];
}

- (void).cxx_destruct
{
}

+ (id)defaultFeatureName
{
  return @"RootFeature";
}

- (NSSet)featureNames
{
  if (featureNames_onceToken != -1) {
    dispatch_once(&featureNames_onceToken, &__block_literal_global_3);
  }
  uint64_t v2 = (void *)featureNames_DefaultFeatureNames;
  return (NSSet *)v2;
}

uint64_t __47__REFeatureMap_REFeatureProvider__featureNames__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithObject:@"RootFeature"];
  uint64_t v1 = featureNames_DefaultFeatureNames;
  featureNames_DefaultFeatureNames = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)featureValueForName:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  if ([a3 isEqualToString:@"RootFeature"])
  {
    id v4 = objc_alloc(MEMORY[0x263F00DA8]);
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[REFeatureMap featureCount](self, "featureCount"));
    v18[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    id v17 = 0;
    id v7 = (void *)[v4 initWithShape:v6 dataType:131104 error:&v17];
    id v8 = v17;

    if (v7)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __55__REFeatureMap_REFeatureProvider__featureValueForName___block_invoke;
      v15[3] = &unk_2644BC8D0;
      v16 = v7;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __55__REFeatureMap_REFeatureProvider__featureValueForName___block_invoke_2;
      v13[3] = &unk_2644BC8F8;
      id v9 = v16;
      id v14 = v9;
      [(REFeatureMap *)self enumerateInt64FeaturesUsingIndexedBlock:v15 emptyFeatureBlock:v13];
      id v10 = [MEMORY[0x263F00D50] featureValueWithMultiArray:v9];

      id v11 = v16;
    }
    else
    {
      id v11 = RELogForDomain(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[REFeatureMap(REFeatureProvider) featureValueForName:]((uint64_t)v8, v11);
      }
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

void __55__REFeatureMap_REFeatureProvider__featureValueForName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = [NSNumber numberWithUnsignedLongLong:a4];
  [*(id *)(a1 + 32) setObject:v6 atIndexedSubscript:a3];
}

void __55__REFeatureMap_REFeatureProvider__featureValueForName___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = NSNumber;
  id v7 = +[REFeatureValue nullValueForFeature:a2];
  id v6 = objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(v7, "int64Value"));
  [*(id *)(a1 + 32) setObject:v6 atIndexedSubscript:a3];
}

- (void)enumerateInt64FeaturesUsingIndexedBlock:(id)a3 emptyFeatureBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    indices = self->_indices;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __93__REFeatureMap_REFeatureProvider__enumerateInt64FeaturesUsingIndexedBlock_emptyFeatureBlock___block_invoke;
    v9[3] = &unk_2644BC920;
    v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [(NSDictionary *)indices enumerateKeysAndObjectsUsingBlock:v9];
  }
}

void __93__REFeatureMap_REFeatureProvider__enumerateInt64FeaturesUsingIndexedBlock_emptyFeatureBlock___block_invoke(void *a1, void *a2, void *a3)
{
  id v11 = a2;
  uint64_t v5 = [a3 unsignedIntegerValue];
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1[4] + 16);
  unint64_t v8 = *(void *)(v7 + 8 * v5);
  if (v8 && REFeatureValueTypeForTaggedPointer(*(void *)(v7 + 8 * v5)) == 1)
  {
    uint64_t v9 = a1[5];
    uint64_t v10 = REIntegerValueForTaggedPointer(v8);
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v9 + 16))(v9, v11, v6, v10);
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

@end