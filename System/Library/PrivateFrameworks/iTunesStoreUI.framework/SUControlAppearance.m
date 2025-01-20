@interface SUControlAppearance
- (UIOffset)titlePositionAdjustmentForBarMetrics:(int64_t)a3;
- (id)_copyKeyForState:(unint64_t)a3 barMetrics:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageForState:(unint64_t)a3 barMetrics:(int64_t)a4;
- (id)textAttributesForState:(unint64_t)a3;
- (int64_t)numberOfImages;
- (void)dealloc;
- (void)enumerateImagesUsingBlock:(id)a3;
- (void)enumerateTextAttributesUsingBlock:(id)a3;
- (void)enumerateTitlePositionsUsingBlock:(id)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5;
- (void)setTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)setTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4;
- (void)styleBarButtonItem:(id)a3;
- (void)styleButton:(id)a3;
@end

@implementation SUControlAppearance

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUControlAppearance;
  [(SUControlAppearance *)&v3 dealloc];
}

- (void)enumerateImagesUsingBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  images = self->_images;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __49__SUControlAppearance_enumerateImagesUsingBlock___block_invoke;
  v21[3] = &unk_264814FE8;
  v21[4] = v5;
  [(NSMutableDictionary *)images enumerateKeysAndObjectsUsingBlock:v21];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * v10) integerValue];
        id v12 = [(SUControlAppearance *)self _copyKeyForState:v11 barMetrics:0];
        uint64_t v13 = [(NSMutableDictionary *)self->_images objectForKey:v12];

        id v14 = [(SUControlAppearance *)self _copyKeyForState:v11 barMetrics:1];
        uint64_t v15 = [(NSMutableDictionary *)self->_images objectForKey:v14];

        (*((void (**)(id, uint64_t, uint64_t, uint64_t))a3 + 2))(a3, v11, v13, v15);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }
}

uint64_t __49__SUControlAppearance_enumerateImagesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (void *)[a2 componentsSeparatedByString:@":"];
  uint64_t result = [v3 count];
  if (result == 2)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 objectAtIndex:0];
    return [v5 addObject:v6];
  }
  return result;
}

- (void)enumerateTextAttributesUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  textAttributes = self->_textAttributes;
  uint64_t v6 = [(NSMutableDictionary *)textAttributes countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(textAttributes);
        }
        (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, [*(id *)(*((void *)&v10 + 1) + 8 * i) integerValue], -[NSMutableDictionary objectForKey:](self->_textAttributes, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i)));
      }
      uint64_t v7 = [(NSMutableDictionary *)textAttributes countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)enumerateTitlePositionsUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  titlePositions = self->_titlePositions;
  uint64_t v6 = [(NSMutableDictionary *)titlePositions countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(titlePositions);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = (void *)[(NSMutableDictionary *)self->_titlePositions objectForKey:v10];
        uint64_t v12 = [v10 integerValue];
        [v11 UIOffsetValue];
        (*((void (**)(id, uint64_t))a3 + 2))(a3, v12);
      }
      uint64_t v7 = [(NSMutableDictionary *)titlePositions countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (id)imageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  id v5 = [(SUControlAppearance *)self _copyKeyForState:a3 barMetrics:a4];
  id v6 = (id)[(NSMutableDictionary *)self->_images objectForKey:v5];

  return v6;
}

- (int64_t)numberOfImages
{
  return [(NSMutableDictionary *)self->_images count];
}

- (void)setImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  id v7 = [(SUControlAppearance *)self _copyKeyForState:a4 barMetrics:a5];
  images = self->_images;
  id v9 = v7;
  if (a3)
  {
    if (!images)
    {
      images = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_images = images;
    }
    [(NSMutableDictionary *)images setObject:a3 forKey:v9];
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](images, "removeObjectForKey:");
  }
}

- (void)setTextAttributes:(id)a3 forState:(unint64_t)a4
{
  uint64_t v6 = [objc_alloc(NSNumber) initWithInteger:a4];
  textAttributes = self->_textAttributes;
  id v9 = (id)v6;
  if (a3)
  {
    if (!textAttributes) {
      self->_textAttributes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    uint64_t v8 = (void *)[a3 copy];
    [(NSMutableDictionary *)self->_textAttributes setObject:v8 forKey:v9];
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](textAttributes, "removeObjectForKey:");
  }
}

- (void)setTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  uint64_t v7 = [objc_alloc(NSNumber) initWithInteger:a4];
  double v8 = *(double *)(MEMORY[0x263F1D4E8] + 8);
  titlePositions = self->_titlePositions;
  BOOL v10 = *MEMORY[0x263F1D4E8] == horizontal && v8 == vertical;
  id v11 = (id)v7;
  if (v10)
  {
    -[NSMutableDictionary removeObjectForKey:](titlePositions, "removeObjectForKey:", v7, *MEMORY[0x263F1D4E8], v8);
  }
  else
  {
    if (!titlePositions)
    {
      titlePositions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_titlePositions = titlePositions;
    }
    -[NSMutableDictionary setObject:forKey:](titlePositions, "setObject:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithUIOffset:", horizontal, vertical), v11);
  }
}

- (void)styleBarButtonItem:(id)a3
{
  uint64_t v5 = [a3 style];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__SUControlAppearance_styleBarButtonItem___block_invoke;
  v8[3] = &unk_264815010;
  v8[4] = a3;
  v8[5] = v5;
  [(SUControlAppearance *)self enumerateImagesUsingBlock:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SUControlAppearance_styleBarButtonItem___block_invoke_2;
  v7[3] = &unk_264814FC0;
  v7[4] = a3;
  [(SUControlAppearance *)self enumerateTextAttributesUsingBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__SUControlAppearance_styleBarButtonItem___block_invoke_3;
  v6[3] = &unk_264815038;
  v6[4] = a3;
  [(SUControlAppearance *)self enumerateTitlePositionsUsingBlock:v6];
}

uint64_t __42__SUControlAppearance_styleBarButtonItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = a1 + 32;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(v9 + 8);
  if (v8)
  {
    [v7 setBackgroundImage:a3 forState:a2 style:v8 barMetrics:0];
    BOOL v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    return [v10 setBackgroundImage:a4 forState:a2 style:v11 barMetrics:1];
  }
  else
  {
    objc_msgSend(v7, "setBackgroundImage:forState:barMetrics:", a3, a2);
    long long v13 = *(void **)(a1 + 32);
    return [v13 setBackgroundImage:a4 forState:a2 barMetrics:1];
  }
}

uint64_t __42__SUControlAppearance_styleBarButtonItem___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setTitleTextAttributes:a3 forState:a2];
}

uint64_t __42__SUControlAppearance_styleBarButtonItem___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTitlePositionAdjustment:forBarMetrics:", a2);
}

- (void)styleButton:(id)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__SUControlAppearance_styleButton___block_invoke;
  v6[3] = &unk_264814F98;
  v6[4] = a3;
  [(SUControlAppearance *)self enumerateImagesUsingBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__SUControlAppearance_styleButton___block_invoke_2;
  v5[3] = &unk_264814FC0;
  v5[4] = a3;
  [(SUControlAppearance *)self enumerateTextAttributesUsingBlock:v5];
}

uint64_t __35__SUControlAppearance_styleButton___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v3 = a3;
  [a3 capInsets];
  if (v9 == *(double *)(MEMORY[0x263F1D1C0] + 8)
    && v6 == *MEMORY[0x263F1D1C0]
    && v8 == *(double *)(MEMORY[0x263F1D1C0] + 24)
    && v7 == *(double *)(MEMORY[0x263F1D1C0] + 16))
  {
    [v3 size];
    float v14 = v13 * 0.5;
    double v15 = floorf(v14);
    objc_super v3 = objc_msgSend(v3, "resizableImageWithCapInsets:", 0.0, v15, 0.0, v13 - v15 + -1.0);
  }
  long long v16 = *(void **)(a1 + 32);

  return [v16 setBackgroundImage:v3 forState:a2];
}

void *__35__SUControlAppearance_styleButton___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = [a3 objectForKey:*MEMORY[0x263F1C240]];
  if (v6) {
    [*(id *)(a1 + 32) setTitleColor:v6 forState:a2];
  }
  uint64_t result = (void *)[a3 objectForKey:*MEMORY[0x263F1C280]];
  double v8 = result;
  if (result) {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "setTitleShadowColor:forState:", objc_msgSend(result, "shadowColor"), a2);
  }
  if (!a2)
  {
    double v9 = (void *)[*(id *)(a1 + 32) titleLabel];
    uint64_t result = (void *)[a3 objectForKey:*MEMORY[0x263F1C238]];
    if (result) {
      uint64_t result = (void *)[v9 setFont:result];
    }
    if (v8)
    {
      [v8 shadowOffset];
      return objc_msgSend(v9, "setShadowOffset:");
    }
  }
  return result;
}

- (id)textAttributesForState:(unint64_t)a3
{
  v4 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  id v5 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_textAttributes, "objectForKey:", v4), "copy");

  return v5;
}

- (UIOffset)titlePositionAdjustmentForBarMetrics:(int64_t)a3
{
  v4 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  id v5 = (void *)[(NSMutableDictionary *)self->_titlePositions objectForKey:v4];
  if (v5)
  {
    [v5 UIOffsetValue];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = *MEMORY[0x263F1D4E8];
    double v9 = *(double *)(MEMORY[0x263F1D4E8] + 8);
  }

  double v10 = v7;
  double v11 = v9;
  result.double vertical = v11;
  result.double horizontal = v10;
  return result;
}

- (id)_copyKeyForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  return (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%lu:%ld", a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(NSMutableDictionary *)self->_images mutableCopyWithZone:a3];
  v5[2] = [(NSMutableDictionary *)self->_textAttributes mutableCopyWithZone:a3];
  v5[3] = [(NSMutableDictionary *)self->_titlePositions mutableCopyWithZone:a3];
  return v5;
}

@end