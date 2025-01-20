@interface PREditingColorVariationStore
+ (id)posterColorForColor:(id)a3 withAppliedVariation:(double)a4;
+ (unint64_t)version;
+ (void)performMigrationsIfNeededForStorage:(id)a3 version:(unint64_t)a4;
- (NSMutableDictionary)persistentVariationStorage;
- (NSMutableDictionary)variationStorage;
- (PREditingColorVariationStore)init;
- (PREditingColorVariationStore)initWithVariationStorage:(id)a3 version:(unint64_t)a4;
- (id)baseColorForVariedColor:(id)a3 forContextIdentifier:(id)a4 variation:(double *)a5 forDataLayerPicker:(BOOL)a6;
- (id)dictionaryRepresentation;
- (id)persistedVariationForContextIdentifier:(id)a3;
- (id)variationForPickerColor:(id)a3 forContextIdentifier:(id)a4;
- (void)resetAllValues;
- (void)setPersistentVariationStorage:(id)a3;
- (void)setVariation:(double)a3 forPickerColor:(id)a4 forContextIdentifier:(id)a5;
- (void)setVariationStorage:(id)a3;
@end

@implementation PREditingColorVariationStore

+ (unint64_t)version
{
  return 3;
}

+ (void)performMigrationsIfNeededForStorage:(id)a3 version:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v7 = v5;
    id v5 = (id)[(id)objc_opt_class() version];
    id v6 = v7;
    if (a4 <= 2 && (unint64_t)v5 > a4)
    {
      id v5 = (id)[v7 removeAllObjects];
      id v6 = v7;
    }
  }
  MEMORY[0x1F41817F8](v5, v6);
}

+ (id)posterColorForColor:(id)a3 withAppliedVariation:(double)a4
{
  id v5 = a3;
  id v6 = [[PRPosterColor alloc] initWithColor:v5 preferredStyle:0];

  double v7 = a4 * -0.25;
  v8 = [(PRPosterColor *)v6 hslValues];
  [v8 luminance];
  double v10 = v9;

  double v11 = fmax(v10 + v7, 0.0);
  if (v11 > 1.0) {
    double v11 = 1.0;
  }
  id v12 = [(PRPosterColor *)v6 copyWithLuminance:v11];

  return v12;
}

- (PREditingColorVariationStore)initWithVariationStorage:(id)a3 version:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PREditingColorVariationStore;
  double v7 = [(PREditingColorVariationStore *)&v14 init];
  if (v7)
  {
    v8 = (NSMutableDictionary *)[v6 mutableCopy];
    [(id)objc_opt_class() performMigrationsIfNeededForStorage:v8 version:a4];
    if (!v8)
    {
      v8 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    variationStorage = v7->_variationStorage;
    v7->_variationStorage = v8;
    double v10 = v8;

    uint64_t v11 = [(NSMutableDictionary *)v10 mutableCopy];
    persistentVariationStorage = v7->_persistentVariationStorage;
    v7->_persistentVariationStorage = (NSMutableDictionary *)v11;
  }
  return v7;
}

- (PREditingColorVariationStore)init
{
  uint64_t v3 = [(id)objc_opt_class() version];
  return [(PREditingColorVariationStore *)self initWithVariationStorage:0 version:v3];
}

- (id)baseColorForVariedColor:(id)a3 forContextIdentifier:(id)a4 variation:(double *)a5 forDataLayerPicker:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(NSMutableDictionary *)self->_variationStorage objectForKeyedSubscript:v11];
  if (v12)
  {
    uint64_t v29 = 0;
    v30 = (double *)&v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    id v28 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __106__PREditingColorVariationStore_baseColorForVariedColor_forContextIdentifier_variation_forDataLayerPicker___block_invoke;
    v17[3] = &unk_1E54DABB8;
    BOOL v22 = a6;
    id v18 = v10;
    v19 = self;
    v20 = &v23;
    v21 = &v29;
    [v12 enumerateKeysAndObjectsUsingBlock:v17];
    v13 = v24;
    objc_super v14 = (void *)v24[5];
    if (a5 && v14)
    {
      *a5 = v30[3];
      objc_super v14 = (void *)v13[5];
    }
    id v15 = v14;

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __106__PREditingColorVariationStore_baseColorForVariedColor_forContextIdentifier_variation_forDataLayerPicker___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  [a3 doubleValue];
  double v9 = v8;
  if (*(unsigned char *)(a1 + 64))
  {
    id v10 = [*(id *)(a1 + 32) colorWithAlphaComponent:1.0];
    v16 = [[PRPosterColor alloc] initWithColor:v10];
  }
  else
  {
    v16 = [(id)objc_opt_class() posterColorForColor:*(void *)(a1 + 32) withAppliedVariation:-v8];
  }
  id v11 = [(PRPosterColor *)v16 identifier];
  int v12 = [v7 isEqualToString:v11];

  if (v12)
  {
    uint64_t v13 = [(PRPosterColor *)v16 color];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v9;
    *a4 = 1;
  }
}

- (id)variationForPickerColor:(id)a3 forContextIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 baseColor];
  double v8 = [(NSMutableDictionary *)self->_variationStorage objectForKeyedSubscript:v6];

  if (v8)
  {
    double v9 = [v7 identifier];
    id v10 = [v8 objectForKeyedSubscript:v9];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      uint64_t v13 = [v7 colorValues];
      uint64_t v14 = [v13 identifier];

      id v12 = [v8 objectForKeyedSubscript:v14];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)setVariation:(double)a3 forPickerColor:(id)a4 forContextIdentifier:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = [a4 baseColor];
  id v10 = [(NSMutableDictionary *)self->_variationStorage objectForKeyedSubscript:v8];
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 mutableCopy];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v13 = (void *)v12;
  uint64_t v14 = [v9 identifier];
  id v15 = [NSNumber numberWithDouble:a3];
  [v13 setObject:v15 forKeyedSubscript:v14];

  v16 = (void *)[v13 copy];
  [(NSMutableDictionary *)self->_variationStorage setObject:v16 forKeyedSubscript:v8];

  v19 = v14;
  v17 = [NSNumber numberWithDouble:a3];
  v20[0] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  [(NSMutableDictionary *)self->_persistentVariationStorage setObject:v18 forKeyedSubscript:v8];
}

- (id)persistedVariationForContextIdentifier:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_persistentVariationStorage objectForKeyedSubscript:a3];
  v4 = v3;
  if (v3 && (unint64_t)[v3 count] <= 1)
  {
    id v6 = [v4 allValues];
    id v5 = [v6 firstObject];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v2 = (void *)[(NSMutableDictionary *)self->_persistentVariationStorage copy];
  return v2;
}

- (void)resetAllValues
{
  [(NSMutableDictionary *)self->_variationStorage removeAllObjects];
  persistentVariationStorage = self->_persistentVariationStorage;
  [(NSMutableDictionary *)persistentVariationStorage removeAllObjects];
}

- (NSMutableDictionary)variationStorage
{
  return self->_variationStorage;
}

- (void)setVariationStorage:(id)a3
{
}

- (NSMutableDictionary)persistentVariationStorage
{
  return self->_persistentVariationStorage;
}

- (void)setPersistentVariationStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentVariationStorage, 0);
  objc_storeStrong((id *)&self->_variationStorage, 0);
}

@end