@interface PXEDRGainView
+ (id)_EDRFilterName;
- (PXEDRGainView)initWithFrame:(CGRect)a3;
- (double)edrGain;
- (void)_updateFilter;
- (void)setEdrGain:(double)a3;
@end

@implementation PXEDRGainView

- (double)edrGain
{
  return self->_edrGain;
}

- (void)_updateFilter
{
  [(PXEDRGainView *)self edrGain];
  double v5 = v4;
  v6 = [(PXEDRGainView *)self layer];
  v7 = [(id)objc_opt_class() _EDRFilterName];
  v8 = [v6 filters];

  if (v8)
  {
    v9 = [v6 filters];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __30__PXEDRGainView__updateFilter__block_invoke;
    v26[3] = &unk_26545B7A0;
    SEL v28 = a2;
    v26[4] = self;
    id v27 = v7;
    uint64_t v10 = [v9 indexOfObjectPassingTest:v26];

    if (v5 > 0.0)
    {
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_16:
        v22 = [v6 filters];
        v23 = [v22 objectAtIndexedSubscript:v10];

        v24 = [NSNumber numberWithDouble:v5];
        [v23 setValue:v24 forKey:*MEMORY[0x263F15BF8]];

        id v25 = [MEMORY[0x263F825C8] whiteColor];
        objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v25, "CGColor"));

        goto LABEL_17;
      }
LABEL_6:
      v11 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BB8]];
      [v11 setValue:&unk_2707AEE58 forKey:*MEMORY[0x263F15CA0]];
      [v11 setValue:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F15BE8]];
      v12 = [(id)objc_opt_class() _EDRFilterName];
      [v11 setName:v12];

      v13 = [v6 filters];
      v14 = (void *)[v13 mutableCopy];
      v15 = v14;
      if (v14) {
        id v16 = v14;
      }
      else {
        id v16 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
      }
      v20 = v16;

      [v20 addObject:v11];
      uint64_t v10 = [v20 count] - 1;
      [v6 setFilters:v20];
      v21 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D10]];
      [v6 setCompositingFilter:v21];

      goto LABEL_16;
    }
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = [v6 filters];
      v18 = (void *)[v17 mutableCopy];

      [v18 removeObjectAtIndex:v10];
      if ([v18 count]) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }
      [v6 setFilters:v19];
    }
  }
  else if (v5 > 0.0)
  {
    goto LABEL_6;
  }
  [v6 setCompositingFilter:0];
  [v6 setBackgroundColor:0];
LABEL_17:
}

uint64_t __30__PXEDRGainView__updateFilter__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

  return v4;
}

- (void)setEdrGain:(double)a3
{
  if (self->_edrGain != a3)
  {
    self->_edrGain = a3;
    [(PXEDRGainView *)self _updateFilter];
  }
}

- (PXEDRGainView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXEDRGainView;
  v3 = -[PXEDRGainView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3) {
    [(PXEDRGainView *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

+ (id)_EDRFilterName
{
  return @"PXEDRGainView.filter";
}

@end