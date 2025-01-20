@interface SUArrayImageModifier
- (BOOL)isEqual:(id)a3;
- (BOOL)scalesImage;
- (CGRect)imageFrameForImage:(id)a3 currentFrame:(CGRect)a4 finalSize:(CGSize)a5;
- (CGSize)finalSizeForSize:(CGSize)a3 originalSize:(CGSize)a4;
- (NSArray)modifiers;
- (void)dealloc;
- (void)drawAfterImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5;
- (void)drawBeforeImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5;
- (void)setModifiers:(id)a3;
@end

@implementation SUArrayImageModifier

- (void)dealloc
{
  self->_modifiers = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUArrayImageModifier;
  [(SUArrayImageModifier *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = [(SUArrayImageModifier *)self modifiers];
  v6 = (void *)[a3 modifiers];
  uint64_t v7 = [(NSArray *)v5 count];
  uint64_t v8 = [v6 count];
  BOOL result = v7 == v8;
  if (v7 >= 1 && v7 == v8)
  {
    uint64_t v10 = 1;
    do
    {
      BOOL result = objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", v10 - 1), "isEqual:", objc_msgSend(v6, "objectAtIndex:", v10 - 1));
      if (v10 >= v7) {
        break;
      }
      ++v10;
    }
    while (result);
  }
  return result;
}

- (void)drawAfterImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.size.height;
  double v8 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  modifiers = self->_modifiers;
  uint64_t v13 = [(NSArray *)modifiers countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(modifiers);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "drawAfterImageForContext:imageFrame:finalSize:", a3, x, y, v8, v7, width, height);
      }
      uint64_t v14 = [(NSArray *)modifiers countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)drawBeforeImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.size.height;
  double v8 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  modifiers = self->_modifiers;
  uint64_t v13 = [(NSArray *)modifiers countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(modifiers);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "drawBeforeImageForContext:imageFrame:finalSize:", a3, x, y, v8, v7, width, height);
      }
      uint64_t v14 = [(NSArray *)modifiers countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (CGSize)finalSizeForSize:(CGSize)a3 originalSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  modifiers = self->_modifiers;
  uint64_t v9 = [(NSArray *)modifiers countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(modifiers);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "finalSizeForSize:originalSize:", v7, v6, width, height);
        double v7 = v13;
        double v6 = v14;
      }
      uint64_t v10 = [(NSArray *)modifiers countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  double v15 = v7;
  double v16 = v6;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGRect)imageFrameForImage:(id)a3 currentFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.size.height;
  double v8 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  modifiers = self->_modifiers;
  uint64_t v13 = [(NSArray *)modifiers countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(modifiers);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "imageFrameForImage:currentFrame:finalSize:", a3, x, y, v8, v7, width, height);
        double x = v17;
        double y = v18;
        double v8 = v19;
        double v7 = v20;
      }
      uint64_t v14 = [(NSArray *)modifiers countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }
  double v21 = x;
  double v22 = y;
  double v23 = v8;
  double v24 = v7;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (BOOL)scalesImage
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  modifiers = self->_modifiers;
  uint64_t v3 = [(NSArray *)modifiers countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(modifiers);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * v6) scalesImage])
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSArray *)modifiers countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (NSArray)modifiers
{
  return self->_modifiers;
}

- (void)setModifiers:(id)a3
{
}

@end