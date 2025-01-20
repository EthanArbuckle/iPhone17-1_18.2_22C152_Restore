@interface WKWallpaperAdjustmentTraits
- (BOOL)isEqual:(id)a3;
- (WKWallpaperAdjustmentTraitOffset)offset;
- (WKWallpaperAdjustmentTraits)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionBuilderBlock;
- (id)propertyListRepresentation;
- (id)wk_descriptionBuilder;
- (unint64_t)hash;
@end

@implementation WKWallpaperAdjustmentTraits

- (WKWallpaperAdjustmentTraits)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WKWallpaperAdjustmentTraits;
  v5 = [(WKWallpaperAdjustmentTraits *)&v12 init];
  if (v5)
  {
    objc_opt_class();
    v6 = [v4 objectForKeyedSubscript:@"adjustmentTraitOffset"];
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    v9 = [[WKWallpaperAdjustmentTraitOffset alloc] initWithAttributeDictionary:v8];
    offset = v5->_offset;
    v5->_offset = v9;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WKWallpaperAdjustmentTraits *)self propertyListRepresentation];
  v6 = (void *)[v4 initWithDictionary:v5];

  return v6;
}

- (id)propertyListRepresentation
{
  v2 = [(WKWallpaperAdjustmentTraits *)self offset];
  v3 = [v2 propertyListRepresentation];

  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v3, @"adjustmentTraitOffset");
  if ([v4 count]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

id __42__WKWallpaperAdjustmentTraits_na_identity__block_invoke()
{
  if (WKWallpaperAdjustmentTraitOffsetKey_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&WKWallpaperAdjustmentTraitOffsetKey_block_invoke_na_once_token_0, &__block_literal_global_15);
  }
  v0 = (void *)WKWallpaperAdjustmentTraitOffsetKey_block_invoke_na_once_object_0;
  return v0;
}

uint64_t __42__WKWallpaperAdjustmentTraits_na_identity__block_invoke_2()
{
  WKWallpaperAdjustmentTraitOffsetKey_block_invoke_na_once_object_0 = __42__WKWallpaperAdjustmentTraits_na_identity__block_invoke_3();
  return MEMORY[0x1F41817F8]();
}

id __42__WKWallpaperAdjustmentTraits_na_identity__block_invoke_3()
{
  v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_22];
  v2 = [v0 build];

  return v2;
}

uint64_t __42__WKWallpaperAdjustmentTraits_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 offset];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (id)wk_descriptionBuilder
{
  v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  objc_initWeak(&location, self);
  unint64_t v4 = [v3 activeMultilinePrefix];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__WKWallpaperAdjustmentTraits_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6376718;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  id v8 = v5;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __52__WKWallpaperAdjustmentTraits_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained descriptionBuilderBlock];
  v2[2](v2, *(void *)(a1 + 32));
}

- (id)description
{
  v2 = [(WKWallpaperAdjustmentTraits *)self wk_descriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)descriptionBuilderBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__WKWallpaperAdjustmentTraits_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6376740;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __54__WKWallpaperAdjustmentTraits_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  unint64_t v4 = [WeakRetained offset];
  id v5 = [v4 description];
  [v3 appendString:v5 withName:@"offset"];
}

- (WKWallpaperAdjustmentTraitOffset)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
}

@end