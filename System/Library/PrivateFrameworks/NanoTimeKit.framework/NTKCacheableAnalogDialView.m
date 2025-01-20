@interface NTKCacheableAnalogDialView
- (NSArray)tickGroups;
- (NTKCacheableAnalogDialView)initWithDialDiameter:(double)a3 device:(id)a4;
- (NTKCacheableAnalogDialView)initWithDialDiameter:(double)a3 device:(id)a4 cache:(id)a5 key:(id)a6;
- (double)dialDiameter;
- (id)_cacheIdentifierForTickCount:(unint64_t)a3 modulus:(unint64_t)a4 size:(CGSize)a5 rounded:(BOOL)a6;
- (void)addTextWithCount:(unint64_t)a3 configurationBlock:(id)a4;
- (void)addTicksWithCount:(unint64_t)a3 moduloGroups:(id)a4 sizes:(id)a5 roundedCorners:(id)a6;
- (void)applyTextColor:(id)a3;
- (void)applyTickColor:(id)a3 toGroupIndex:(unint64_t)a4;
- (void)applyTickColor:(id)a3 toModulo:(unint64_t)a4;
- (void)enumerateTextLayersWithBlock:(id)a3;
- (void)layoutSubviews;
@end

@implementation NTKCacheableAnalogDialView

- (NTKCacheableAnalogDialView)initWithDialDiameter:(double)a3 device:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKCacheableAnalogDialView;
  v7 = -[NTKCacheableAnalogDialView initWithFrame:](&v15, sel_initWithFrame_, 0.0, 0.0, a3, a3);
  v8 = v7;
  if (v7)
  {
    v7->_dialDiameter = a3;
    cache = v7->_cache;
    v7->_cache = 0;

    v10 = [(NTKCacheableAnalogDialView *)v8 layer];
    [v10 setShouldRasterize:1];

    [v6 screenScale];
    double v12 = v11;
    v13 = [(NTKCacheableAnalogDialView *)v8 layer];
    [v13 setRasterizationScale:v12];
  }
  return v8;
}

- (NTKCacheableAnalogDialView)initWithDialDiameter:(double)a3 device:(id)a4 cache:(id)a5 key:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(NTKCacheableAnalogDialView *)self initWithDialDiameter:v10 device:a3];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_cache, a5);
    objc_storeStrong((id *)&v14->_cacheKey, a6);
    objc_super v15 = [(NTKCacheableAnalogDialView *)v14 layer];
    [v15 setShouldRasterize:1];

    [v10 screenScale];
    double v17 = v16;
    v18 = [(NTKCacheableAnalogDialView *)v14 layer];
    [v18 setRasterizationScale:v17];
  }
  return v14;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCacheableAnalogDialView;
  [(NTKCacheableAnalogDialView *)&v3 layoutSubviews];
  [(NTKCacheableAnalogDialView *)self insertSubview:self->_tickContainer atIndex:0];
  [(NTKCacheableAnalogDialView *)self insertSubview:self->_textContainer aboveSubview:self->_tickContainer];
}

- (void)addTicksWithCount:(unint64_t)a3 moduloGroups:(id)a4 sizes:(id)a5 roundedCorners:(id)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v63 = a5;
  id v61 = a6;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v12 = self->_tickGroups;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v68 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v67 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v14);
  }

  [(UIView *)self->_tickContainer removeFromSuperview];
  id v17 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(NTKCacheableAnalogDialView *)self bounds];
  v18 = (UIView *)objc_msgSend(v17, "initWithFrame:");
  tickContainer = self->_tickContainer;
  self->_tickContainer = v18;

  [(NTKCacheableAnalogDialView *)self addSubview:self->_tickContainer];
  objc_storeStrong((id *)&self->_moduloGroups, a4);
  v20 = objc_opt_new();
  if ([v11 count])
  {
    unint64_t v21 = 0;
    do
    {
      v22 = [NSNumber numberWithUnsignedInteger:v21];
      v23 = [v11 objectAtIndexedSubscript:v21];
      [v20 setObject:v22 forKeyedSubscript:v23];

      ++v21;
    }
    while (v21 < [v11 count]);
  }
  objc_storeStrong((id *)&self->_moduloToGroup, v20);
  double dialDiameter = self->_dialDiameter;
  v62 = (NSArray *)objc_opt_new();
  v25 = v61;
  if ([v11 count])
  {
    uint64_t v26 = 0;
    double v27 = dialDiameter * 0.5;
    double v29 = -(dialDiameter * 0.5);
    v60 = self;
    while (1)
    {
      v30 = [v11 objectAtIndexedSubscript:v26];
      unint64_t v31 = [v30 unsignedIntegerValue];

      v32 = [v63 objectAtIndexedSubscript:v26];
      [v32 CGSizeValue];
      double v34 = v33;
      double v36 = v35;

      if (v25)
      {
        v37 = [v25 objectAtIndexedSubscript:v26];
        uint64_t v38 = [v37 BOOLValue];
      }
      else
      {
        uint64_t v38 = 0;
      }
      if (!self->_cache) {
        break;
      }
      v64 = -[NTKCacheableAnalogDialView _cacheIdentifierForTickCount:modulus:size:rounded:](self, "_cacheIdentifierForTickCount:modulus:size:rounded:", a3, v31, v38, v34, v36);
      v39 = -[BSUIMappedImageCache imageForKey:](self->_cache, "imageForKey:");
      if (!v39) {
        goto LABEL_20;
      }
LABEL_37:
      id v53 = objc_alloc(MEMORY[0x1E4FB1838]);
      v54 = [v39 imageWithRenderingMode:2];
      v55 = (void *)[v53 initWithImage:v54];

      [(NTKCacheableAnalogDialView *)self bounds];
      objc_msgSend(v55, "setFrame:");
      v56 = [MEMORY[0x1E4FB1618] whiteColor];
      [v55 setTintColor:v56];

      v57 = _disabledLayerActions_0();
      v58 = [v55 layer];
      [v58 setActions:v57];

      [(NSArray *)v62 addObject:v55];
      [(UIView *)self->_tickContainer addSubview:v55];

      if (++v26 >= (unint64_t)[v11 count]) {
        goto LABEL_38;
      }
    }
    v64 = 0;
LABEL_20:
    v40 = [MEMORY[0x1E4F39BE8] layer];
    objc_msgSend(v40, "setBounds:", 0.0, 0.0, self->_dialDiameter, self->_dialDiameter);
    [v40 setContentsScale:2.0];
    [v40 setMasksToBounds:1];
    [v40 setCornerRadius:self->_dialDiameter * 0.5];
    if (a3)
    {
      unint64_t v41 = 0;
      if (v34 >= v36) {
        double v42 = v36;
      }
      else {
        double v42 = v34;
      }
      double v43 = v42 * 0.5;
      if (v38) {
        double v44 = v43;
      }
      else {
        double v44 = 0.0;
      }
      do
      {
        if (!(v41 % v31))
        {
          if (v26)
          {
            uint64_t v45 = 0;
            while (1)
            {
              v46 = [v11 objectAtIndexedSubscript:v45];
              unint64_t v47 = v41 % [v46 unsignedIntegerValue];

              if (!v47) {
                break;
              }
              if (v26 == ++v45) {
                goto LABEL_32;
              }
            }
          }
          else
          {
LABEL_32:
            double v28 = 6.28318531 / (double)a3;
            v48 = [MEMORY[0x1E4F39BE8] layer];
            objc_msgSend(v48, "setFrame:", 0.0, 0.0, v34, v36);
            objc_msgSend(v48, "setAnchorPoint:", 0.5, 0.0);
            [v48 setCornerRadius:v44];
            __double2 v49 = __sincos_stret(v28 * (double)v41);
            objc_msgSend(v48, "setPosition:", v27 + v27 * v49.__sinval, v27 + v29 * v49.__cosval);
            id v50 = [MEMORY[0x1E4FB1618] whiteColor];
            objc_msgSend(v48, "setBackgroundColor:", objc_msgSend(v50, "CGColor"));

            CGAffineTransformMakeRotation(&v66, v28 * (double)v41);
            CGAffineTransform v65 = v66;
            [v48 setAffineTransform:&v65];
            [v40 addSublayer:v48];
          }
        }
        ++v41;
      }
      while (v41 != a3);
    }
    [v40 bounds];
    v73.width = v51;
    v73.height = v52;
    UIGraphicsBeginImageContextWithOptions(v73, 0, 0.0);
    [v40 renderInContext:UIGraphicsGetCurrentContext()];
    v39 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self = v60;
    if (v64) {
      -[BSUIMappedImageCache setImage:forKey:](v60->_cache, "setImage:forKey:", v39);
    }

    v25 = v61;
    goto LABEL_37;
  }
LABEL_38:
  tickGroups = self->_tickGroups;
  self->_tickGroups = v62;
}

- (void)applyTickColor:(id)a3 toModulo:(unint64_t)a4
{
  moduloToGroup = self->_moduloToGroup;
  v7 = NSNumber;
  id v11 = a3;
  v8 = [v7 numberWithUnsignedInteger:a4];
  v9 = [(NSDictionary *)moduloToGroup objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 unsignedIntegerValue];

  [(NTKCacheableAnalogDialView *)self applyTickColor:v11 toGroupIndex:v10];
}

- (void)applyTickColor:(id)a3 toGroupIndex:(unint64_t)a4
{
  tickGroups = self->_tickGroups;
  id v6 = a3;
  id v7 = [(NSArray *)tickGroups objectAtIndexedSubscript:a4];
  [v7 setTintColor:v6];
}

- (id)_cacheIdentifierForTickCount:(unint64_t)a3 modulus:(unint64_t)a4 size:(CGSize)a5 rounded:(BOOL)a6
{
  float width = a5.width;
  float height = a5.height;
  return (id)[NSString stringWithFormat:@"ticks-(%@)-%f-%i-%i-%f-%f-%i", self->_cacheKey, *(void *)&self->_dialDiameter, a3, a4, width, height, a6];
}

- (void)addTextWithCount:(unint64_t)a3 configurationBlock:(id)a4
{
  v23 = (double (**)(id, void *, unint64_t))a4;
  [(UIView *)self->_textContainer removeFromSuperview];
  id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(NTKCacheableAnalogDialView *)self bounds];
  id v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
  textContainer = self->_textContainer;
  self->_textContainer = v7;

  v9 = (NSArray *)objc_opt_new();
  if (a3)
  {
    unint64_t v10 = 0;
    double v11 = self->_dialDiameter * 0.5;
    uint64_t v12 = *MEMORY[0x1E4F39D38];
    do
    {
      uint64_t v13 = [MEMORY[0x1E4F39CE8] layer];
      uint64_t v14 = _disabledLayerActions_0();
      [v13 setActions:v14];

      id v15 = [MEMORY[0x1E4FB1618] whiteColor];
      objc_msgSend(v13, "setForegroundColor:", objc_msgSend(v15, "CGColor"));

      [v13 setContentsScale:2.0];
      objc_msgSend(v13, "setAnchorPoint:", 0.5, 0.5);
      double v16 = self->_dialDiameter * 0.5 - v23[2](v23, v13, v10);
      [v13 setAlignmentMode:v12];
      __double2 v17 = __sincos_stret((double)v10 * 6.28318531 / (double)a3);
      objc_msgSend(v13, "setPosition:", v11 + v16 * v17.__sinval, v11 - v16 * v17.__cosval);
      [(NSArray *)v9 addObject:v13];
      v18 = [(UIView *)self->_textContainer layer];
      [v18 addSublayer:v13];

      ++v10;
    }
    while (a3 != v10);
  }
  textLayers = self->_textLayers;
  self->_textLayers = v9;
  v20 = v9;

  unint64_t v21 = _disabledLayerActions_0();
  v22 = [(UIView *)self->_textContainer layer];
  [v22 setActions:v21];

  [(NTKCacheableAnalogDialView *)self addSubview:self->_textContainer];
}

- (void)applyTextColor:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__NTKCacheableAnalogDialView_applyTextColor___block_invoke;
  v6[3] = &unk_1E62C45C0;
  id v7 = v4;
  id v5 = v4;
  [(NTKCacheableAnalogDialView *)self enumerateTextLayersWithBlock:v6];
}

void __45__NTKCacheableAnalogDialView_applyTextColor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(id *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setForegroundColor:", objc_msgSend(v3, "CGColor"));
}

- (void)enumerateTextLayersWithBlock:(id)a3
{
}

- (NSArray)tickGroups
{
  return (NSArray *)objc_getProperty(self, a2, 464, 1);
}

- (double)dialDiameter
{
  return self->_dialDiameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickGroups, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_tickContainer, 0);
  objc_storeStrong((id *)&self->_textLayers, 0);
  objc_storeStrong((id *)&self->_moduloToGroup, 0);
  objc_storeStrong((id *)&self->_moduloGroups, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end