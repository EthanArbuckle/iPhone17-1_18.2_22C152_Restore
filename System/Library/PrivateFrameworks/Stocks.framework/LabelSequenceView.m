@interface LabelSequenceView
- (CGSize)requiredSize;
- (LabelSequenceView)init;
- (NSArray)stringDrawingInfoValues;
- (void)drawRect:(CGRect)a3;
- (void)setStringDrawingInfoValues:(id)a3;
@end

@implementation LabelSequenceView

- (LabelSequenceView)init
{
  v6.receiver = self;
  v6.super_class = (Class)LabelSequenceView;
  v2 = -[LabelSequenceView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v3 = v2;
  if (v2)
  {
    v4 = [(LabelSequenceView *)v2 layer];
    [v4 setNeedsDisplayOnBoundsChange:0];
  }
  return v3;
}

- (CGSize)requiredSize
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  double v3 = *MEMORY[0x263F001B0];
  double v2 = *(double *)(MEMORY[0x263F001B0] + 8);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = self->_stringDrawingInfoValues;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "size", (void)v16);
        double v11 = v10;
        [v9 size];
        if (v12 > v2)
        {
          [v9 size];
          double v2 = v13;
        }
        double v3 = v3 + v11 + 15.0;
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  double v14 = v3 + -15.0;
  double v15 = v2;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263F1C358], "defaultParagraphStyle", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v5 = (void *)[v4 mutableCopy];

  v28 = v5;
  [v5 setLineBreakMode:5];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = self->_stringDrawingInfoValues;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    double v8 = *MEMORY[0x263F001A8];
    uint64_t v9 = *(void *)v30;
    uint64_t v10 = *MEMORY[0x263F1C238];
    uint64_t v11 = *MEMORY[0x263F1C268];
    uint64_t v12 = *MEMORY[0x263F1C240];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v14 size];
        double v16 = v15;
        double v18 = v17;
        double v19 = RoundToPixel(22.5);
        v20 = [v14 font];
        [v20 ascender];
        double v22 = RoundToPixel(v19 - v21);

        v23 = [v14 string];
        v33[0] = v10;
        v24 = [v14 font];
        v34[0] = v24;
        v34[1] = v28;
        v33[1] = v11;
        v33[2] = v12;
        v25 = [v14 color];
        v34[2] = v25;
        v26 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
        objc_msgSend(v23, "drawInRect:withAttributes:", v26, v8, v22, v16, v18);

        double v8 = v8 + v16 + 15.0;
      }
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }
}

- (NSArray)stringDrawingInfoValues
{
  return self->_stringDrawingInfoValues;
}

- (void)setStringDrawingInfoValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end