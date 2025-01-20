@interface SUUISizingEntityValueProvider
- (id)entityUniqueIdentifier;
- (id)imageURLForEntityArtworkProperty:(id)a3 fittingSize:(CGSize)a4 destinationScale:(double)a5;
- (id)initForViewElement:(id)a3;
- (id)valueForEntityProperty:(id)a3;
- (id)valuesForEntityProperties:(id)a3;
- (void)_insertTallestValueForViewElement:(id)a3;
@end

@implementation SUUISizingEntityValueProvider

- (id)initForViewElement:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUISizingEntityValueProvider;
  v5 = [(SUUISizingEntityValueProvider *)&v11 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    tallestValues = v5->_tallestValues;
    v5->_tallestValues = v6;

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__SUUISizingEntityValueProvider_initForViewElement___block_invoke;
    v9[3] = &unk_2654008B8;
    v10 = v5;
    [v4 enumerateChildrenUsingBlock:v9];
  }
  return v5;
}

uint64_t __52__SUUISizingEntityValueProvider_initForViewElement___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _insertTallestValueForViewElement:a2];
}

- (id)entityUniqueIdentifier
{
  return 0;
}

- (id)imageURLForEntityArtworkProperty:(id)a3 fittingSize:(CGSize)a4 destinationScale:(double)a5
{
  return 0;
}

- (id)valueForEntityProperty:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_tallestValues objectForKey:a3];
}

- (id)valuesForEntityProperties:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v12 = -[NSMutableDictionary objectForKey:](self->_tallestValues, "objectForKey:", v11, (void)v14);
        if (v12) {
          [v5 setObject:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_insertTallestValueForViewElement:(id)a3
{
  id v15 = a3;
  id v4 = [v15 attributes];
  v5 = [v4 objectForKey:@"valueProperty"];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v15;
      uint64_t v7 = [v6 style];
      uint64_t v8 = [v7 maxTextLines];
      if (!v7 || v8 <= 0) {
        uint64_t v8 = [v6 numberOfLines];
      }
      long long v14 = self;
      if ((unint64_t)v8 <= 1) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v8;
      }
      if (v9 < 1)
      {
        v12 = &stru_2704F8130;
      }
      else
      {
        uint64_t v10 = 0;
        uint64_t v11 = &stru_2704F8130;
        do
        {
          v12 = [(__CFString *)v11 stringByAppendingString:@"X", v14];

          if (v10 < v9 - 1)
          {
            uint64_t v13 = [(__CFString *)v12 stringByAppendingString:@"\n"];

            v12 = (__CFString *)v13;
          }
          ++v10;
          uint64_t v11 = v12;
        }
        while (v9 != v10);
      }
      -[NSMutableDictionary setObject:forKey:](v14->_tallestValues, "setObject:forKey:", v12, v5, v14);
    }
  }
}

- (void).cxx_destruct
{
}

@end