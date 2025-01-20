@interface CNVCardParsedDictionaryResultBuilder
+ (id)factory;
- (BOOL)canSetValueForProperty:(id)a3;
- (BOOL)setImageData:(id)a3;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValues:(id)a3 labels:(id)a4 isPrimaries:(id)a5 forProperty:(id)a6;
- (CNVCardParsedDictionaryResultBuilder)init;
- (id)build;
- (id)validCountryCodes;
- (id)valueForProperty:(id)a3;
- (void)setUnknownProperties:(id)a3;
@end

@implementation CNVCardParsedDictionaryResultBuilder

+ (id)factory
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__CNVCardParsedDictionaryResultBuilder_factory__block_invoke;
  v4[3] = &__block_descriptor_40_e35____CNVCardParsedResultBuilder__8__0l;
  v4[4] = a1;
  v2 = +[CNVCardParsedResultBuilderFactory factoryWithBlock:v4];
  return v2;
}

id __47__CNVCardParsedDictionaryResultBuilder_factory__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  return v1;
}

- (CNVCardParsedDictionaryResultBuilder)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNVCardParsedDictionaryResultBuilder;
  v2 = [(CNVCardParsedDictionaryResultBuilder *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dictionaryRep = v2->_dictionaryRep;
    v2->_dictionaryRep = v3;

    v5 = v2;
  }

  return v2;
}

- (id)build
{
  v2 = (void *)[(NSMutableDictionary *)self->_dictionaryRep copy];
  return v2;
}

- (BOOL)canSetValueForProperty:(id)a3
{
  return 1;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  if (a3) {
    [(NSMutableDictionary *)self->_dictionaryRep setObject:a3 forKey:a4];
  }
  return a3 != 0;
}

- (BOOL)setValues:(id)a3 labels:(id)a4 isPrimaries:(id)a5 forProperty:(id)a6
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count])
  {
    v21 = self;
    v14 = [MEMORY[0x1E4F1CA48] array];
    if ([v10 count])
    {
      unint64_t v15 = 0;
      do
      {
        v16 = [v10 objectAtIndex:v15];
        v17 = [v11 objectAtIndex:v15];
        v18 = [v12 objectAtIndex:v15];
        v22[0] = @"value";
        v22[1] = @"label";
        v23[0] = v16;
        v23[1] = v17;
        v22[2] = @"isPrimary";
        v23[2] = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
        [v14 addObject:v19];

        ++v15;
      }
      while (v15 < [v10 count]);
    }
    [(NSMutableDictionary *)v21->_dictionaryRep setObject:v14 forKey:v13];
  }
  return 1;
}

- (id)valueForProperty:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_dictionaryRep objectForKey:a3];
}

- (BOOL)setImageData:(id)a3
{
  return 1;
}

- (void)setUnknownProperties:(id)a3
{
  dictionaryRep = self->_dictionaryRep;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithArray:a3];
  [(NSMutableDictionary *)dictionaryRep setObject:v4 forKey:@"_unknownProperties"];
}

- (id)validCountryCodes
{
  return 0;
}

- (void).cxx_destruct
{
}

@end