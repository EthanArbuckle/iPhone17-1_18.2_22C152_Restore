@interface SUUIViewElementHorizontalLayout
- (double)elementSpacing;
- (double)layoutWidth;
- (id)layoutViewElements:(id)a3 usingSizingBlock:(id)a4;
- (int64_t)maximumElementsPerLine;
- (int64_t)maximumLines;
- (void)setElementSpacing:(double)a3;
- (void)setLayoutWidth:(double)a3;
- (void)setMaximumElementsPerLine:(int64_t)a3;
- (void)setMaximumLines:(int64_t)a3;
@end

@implementation SUUIViewElementHorizontalLayout

- (id)layoutViewElements:(id)a3 usingSizingBlock:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (double (**)(id, void *))a4;
  v23 = [MEMORY[0x263EFF980] array];
  double layoutWidth = self->_layoutWidth;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    id v22 = v10;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v16 = v7[2](v7, v15);
        if ([v15 elementType] == 127)
        {
          [v9 addObject:v15];
        }
        else if (v16 > 0.00000011920929)
        {
          if (v16 <= layoutWidth
            || (int64_t maximumLines = self->_maximumLines, maximumLines >= 1)
            && maximumLines >= (unint64_t)[v23 count])
          {
            double layoutWidth = layoutWidth - (v16 + self->_elementSpacing);
            objc_msgSend(v9, "addObject:", v15, v22);
          }
          else if (objc_msgSend(v9, "count", v22))
          {
            [v23 addObject:v9];
            id v18 = objc_alloc_init(MEMORY[0x263EFF980]);

            double layoutWidth = self->_layoutWidth - v16 - self->_elementSpacing;
            [v18 addObject:v15];
            if (layoutWidth >= 0.00000011920929)
            {
              id v9 = v18;
            }
            else
            {
              double layoutWidth = self->_layoutWidth;
              [v23 addObject:v18];
              id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
            }
            id v10 = v22;
          }
          else
          {
            [v9 addObject:v15];
            [v23 addObject:v9];
            id v19 = objc_alloc_init(MEMORY[0x263EFF980]);

            id v9 = v19;
          }
          if (self->_maximumElementsPerLine >= 1 && [v9 count] == self->_maximumElementsPerLine)
          {
            double layoutWidth = self->_layoutWidth;
            [v23 addObject:v9];
            id v20 = objc_alloc_init(MEMORY[0x263EFF980]);

            id v9 = v20;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  if ([v9 count]) {
    [v23 addObject:v9];
  }

  return v23;
}

- (double)elementSpacing
{
  return self->_elementSpacing;
}

- (void)setElementSpacing:(double)a3
{
  self->_elementSpacing = a3;
}

- (double)layoutWidth
{
  return self->_layoutWidth;
}

- (void)setLayoutWidth:(double)a3
{
  self->_double layoutWidth = a3;
}

- (int64_t)maximumElementsPerLine
{
  return self->_maximumElementsPerLine;
}

- (void)setMaximumElementsPerLine:(int64_t)a3
{
  self->_maximumElementsPerLine = a3;
}

- (int64_t)maximumLines
{
  return self->_maximumLines;
}

- (void)setMaximumLines:(int64_t)a3
{
  self->_int64_t maximumLines = a3;
}

@end