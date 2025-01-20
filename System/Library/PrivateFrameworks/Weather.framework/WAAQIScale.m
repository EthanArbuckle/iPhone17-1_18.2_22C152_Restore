@interface WAAQIScale
+ (id)scaleFromFoundationScale:(id)a3;
- (NSMutableArray)categories;
- (WAAQIGradient)gradient;
- (WAAQIScale)initWithRange:(_NSRange)a3;
- (_NSRange)range;
- (void)addCategory:(id)a3;
- (void)setCategories:(id)a3;
@end

@implementation WAAQIScale

- (WAAQIScale)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v12.receiver = self;
  v12.super_class = (Class)WAAQIScale;
  v5 = [(WAAQIScale *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_range.NSUInteger location = location;
    v5->_range.NSUInteger length = length;
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    categories = v6->_categories;
    v6->_categories = (NSMutableArray *)v7;

    v9 = -[WAAQIGradient initWithRange:]([WAAQIGradient alloc], "initWithRange:", location, length);
    gradient = v6->_gradient;
    v6->_gradient = v9;
  }
  return v6;
}

- (void)addCategory:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_categories, "addObject:");
  }
}

- (NSMutableArray)categories
{
  v2 = (void *)[(NSMutableArray *)self->_categories copy];
  return (NSMutableArray *)v2;
}

+ (id)scaleFromFoundationScale:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = [WAAQIScale alloc];
    uint64_t v5 = [v3 range];
    uint64_t v7 = -[WAAQIScale initWithRange:](v4, "initWithRange:", v5, v6);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v34 = v3;
    obuint64_t j = [v3 categories];
    uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(obj);
          }
          objc_super v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v13 = [WAAQICategory alloc];
          uint64_t v14 = [v12 range];
          uint64_t v16 = v15;
          v17 = (void *)MEMORY[0x263F1C550];
          v18 = [v12 color];
          v19 = objc_msgSend(v17, "wa_colorFromHexString:", v18);
          v20 = -[WAAQICategory initWithRange:color:](v13, "initWithRange:color:", v14, v16, v19);

          [(WAAQIScale *)v7 addCategory:v20];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v9);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v21 = [v34 gradient];
    v22 = [v21 stops];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          v28 = (void *)MEMORY[0x263F1C550];
          v29 = [v27 color];
          v30 = objc_msgSend(v28, "wa_colorFromHexString:", v29);
          [v27 location];
          v31 = +[WAAQIGradientStop gradientStopWithColor:location:](WAAQIGradientStop, "gradientStopWithColor:location:", v30);

          v32 = [(WAAQIScale *)v7 gradient];
          [v32 addGradientStop:v31];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v24);
    }

    id v3 = v34;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCategories:(id)a3
{
}

- (WAAQIGradient)gradient
{
  return self->_gradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

@end