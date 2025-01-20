@interface NTKExplorerStatusView
+ (double)dotBorderWidth;
+ (double)dotDiameter;
+ (double)dotSpacing;
+ (double)noServiceDotHeight;
+ (id)connectedDotColor;
+ (id)noServiceDotColor;
+ (unint64_t)_fixedDotPositionForState:(int64_t)a3;
- (BOOL)showsFullSignalStrength;
- (BOOL)tritiumIsOn;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKMonochromeFilterProvider)filterProvider;
- (NTKExplorerDotColorOptions)dotColorOptions;
- (NTKExplorerDotLayoutConstraints)dotLayoutConstraints;
- (NTKExplorerStatusView)initWithFrame:(CGRect)a3;
- (NTKExplorerStatusView)initWithFrame:(CGRect)a3 dotLayoutConstraints:(id)a4 dotColorOptions:(id)a5;
- (UIColor)connectedDotBackgroundColor;
- (UIColor)connectedDotColor;
- (UIColor)noServiceDotColor;
- (double)dotBorderWidth;
- (double)dotDiameter;
- (double)dotSpacing;
- (double)noServiceDotHeight;
- (id)connectivityDotBackingColor;
- (int64_t)position;
- (int64_t)signalStrengthBars;
- (int64_t)state;
- (void)_applyDotRotationFraction:(double)a3 forDotAtIndex:(unint64_t)a4;
- (void)_applyState:(int64_t)a3 animated:(BOOL)a4;
- (void)_layoutDotLayers;
- (void)_updateDotFillStates;
- (void)setDotColorOptions:(id)a3;
- (void)setDotLayoutConstraints:(id)a3;
- (void)setDotPosition:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setFilterProvider:(id)a3;
- (void)setShowsFullSignalStrength:(BOOL)a3;
- (void)setSignalStrengthBars:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setState:(int64_t)a3 animated:(BOOL)a4;
- (void)setTritiumIsOn:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKExplorerStatusView

- (NTKExplorerStatusView)initWithFrame:(CGRect)a3
{
  return -[NTKExplorerStatusView initWithFrame:dotLayoutConstraints:dotColorOptions:](self, "initWithFrame:dotLayoutConstraints:dotColorOptions:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NTKExplorerStatusView)initWithFrame:(CGRect)a3 dotLayoutConstraints:(id)a4 dotColorOptions:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)NTKExplorerStatusView;
  v14 = -[NTKExplorerStatusView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dotLayoutConstraints, a4);
    objc_storeStrong((id *)&v15->_dotColorOptions, a5);
    int v16 = 4;
    v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    do
    {
      v18 = +[_ExplorerDotLayer layer];
      [v17 addObject:v18];
      v19 = [(NTKExplorerStatusView *)v15 layer];
      [v19 addSublayer:v18];

      --v16;
    }
    while (v16);
    uint64_t v20 = [v17 copy];
    dotLayers = v15->_dotLayers;
    v15->_dotLayers = (NSArray *)v20;

    [(NTKExplorerStatusView *)v15 _layoutDotLayers];
  }

  return v15;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(NTKExplorerStatusView *)self dotDiameter];
  double v5 = v4;
  [(NTKExplorerStatusView *)self dotSpacing];
  double v7 = v6 * 3.0 + v5 * 4.0;
  double v8 = v5;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setSignalStrengthBars:(int64_t)a3
{
  if (self->_signalStrengthBars != a3)
  {
    self->_signalStrengthBars = a3;
    [(NTKExplorerStatusView *)self _updateDotFillStates];
  }
}

- (void)setShowsFullSignalStrength:(BOOL)a3
{
  if (self->_showsFullSignalStrength != a3)
  {
    self->_showsFullSignalStrength = a3;
    [(NTKExplorerStatusView *)self _updateDotFillStates];
  }
}

- (void)_updateDotFillStates
{
  dotLayers = self->_dotLayers;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__NTKExplorerStatusView__updateDotFillStates__block_invoke;
  v3[3] = &unk_1E62C28C8;
  v3[4] = self;
  [(NSArray *)dotLayers enumerateObjectsUsingBlock:v3];
}

void __45__NTKExplorerStatusView__updateDotFillStates__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = v5;
  if (*(unsigned char *)(v6 + 416))
  {
    double v7 = [v5 connectivityDotLayer];
  }
  else
  {
    unint64_t v8 = a3 + 1;
    unint64_t v9 = *(void *)(v6 + 448);
    double v7 = [v5 connectivityDotLayer];
    if (v8 > v9)
    {
      [*(id *)(a1 + 32) dotBorderWidth];
      goto LABEL_6;
    }
  }
  [*(id *)(a1 + 32) dotDiameter];
  double v10 = v11 * 0.5;
LABEL_6:
  [v7 setBorderWidth:v10];
}

- (void)setDotLayoutConstraints:(id)a3
{
  id v5 = a3;
  if (!-[NTKExplorerDotLayoutConstraints isEqual:](self->_dotLayoutConstraints, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_dotLayoutConstraints, a3);
    [(NTKExplorerStatusView *)self _layoutDotLayers];
  }
}

- (void)setDotColorOptions:(id)a3
{
  id v5 = a3;
  if ((-[NTKExplorerDotColorOptions isEqual:](self->_dotColorOptions, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dotColorOptions, a3);
    [(NTKExplorerStatusView *)self _layoutDotLayers];
  }
}

- (void)setState:(int64_t)a3
{
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_state != a3)
  {
    [(NTKExplorerStatusView *)self _applyState:a3 animated:v4];
    self->_state = a3;
  }
}

- (void)_applyState:(int64_t)a3 animated:(BOOL)a4
{
  if ([(id)objc_opt_class() _fixedDotPositionForState:a3]) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  if ([(NSArray *)self->_dotLayers count])
  {
    unint64_t v6 = 0;
    do
      [(NTKExplorerStatusView *)self _applyDotRotationFraction:v6++ forDotAtIndex:v5];
    while (v6 < [(NSArray *)self->_dotLayers count]);
  }
}

+ (unint64_t)_fixedDotPositionForState:(int64_t)a3
{
  return a3 != 1;
}

- (double)dotDiameter
{
  [(NTKExplorerDotLayoutConstraints *)self->_dotLayoutConstraints dotDiameter];
  if (v3 <= 2.22044605e-16) {
    dotLayoutConstraints = objc_opt_class();
  }
  else {
    dotLayoutConstraints = self->_dotLayoutConstraints;
  }
  [dotLayoutConstraints dotDiameter];
  return result;
}

- (double)dotBorderWidth
{
  [(NTKExplorerDotLayoutConstraints *)self->_dotLayoutConstraints dotBorderWidth];
  if (v3 <= 2.22044605e-16) {
    dotLayoutConstraints = objc_opt_class();
  }
  else {
    dotLayoutConstraints = self->_dotLayoutConstraints;
  }
  [dotLayoutConstraints dotBorderWidth];
  return result;
}

- (double)dotSpacing
{
  [(NTKExplorerDotLayoutConstraints *)self->_dotLayoutConstraints dotSpacing];
  if (v3 <= 2.22044605e-16) {
    dotLayoutConstraints = objc_opt_class();
  }
  else {
    dotLayoutConstraints = self->_dotLayoutConstraints;
  }
  [dotLayoutConstraints dotSpacing];
  return result;
}

- (double)noServiceDotHeight
{
  [(NTKExplorerDotLayoutConstraints *)self->_dotLayoutConstraints noServiceDotHeight];
  if (v3 <= 2.22044605e-16) {
    dotLayoutConstraints = objc_opt_class();
  }
  else {
    dotLayoutConstraints = self->_dotLayoutConstraints;
  }
  [dotLayoutConstraints noServiceDotHeight];
  return result;
}

- (UIColor)connectedDotColor
{
  v2 = [(NTKExplorerDotColorOptions *)self->_dotColorOptions connectedDotColor];
  double v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [(id)objc_opt_class() connectedDotColor];
  }
  double v5 = v4;

  return (UIColor *)v5;
}

- (UIColor)connectedDotBackgroundColor
{
  if (self->_tritiumIsOn)
  {
    v2 = [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    double v3 = [(NTKExplorerDotColorOptions *)self->_dotColorOptions connectedDotBackgroundColor];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [MEMORY[0x1E4FB1618] blackColor];
    }
    v2 = v5;
  }
  return (UIColor *)v2;
}

- (UIColor)noServiceDotColor
{
  v2 = [(NTKExplorerDotColorOptions *)self->_dotColorOptions noServiceDotColor];
  double v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [(id)objc_opt_class() noServiceDotColor];
  }
  id v5 = v4;

  return (UIColor *)v5;
}

- (id)connectivityDotBackingColor
{
  return (id)[MEMORY[0x1E4FB1618] clearColor];
}

+ (double)dotDiameter
{
  v2 = +[CLKRenderingContext sharedRenderingContext];
  double v3 = [v2 device];
  double v4 = _LayoutConstants_10(v3);

  return v4;
}

+ (double)dotSpacing
{
  v2 = +[CLKRenderingContext sharedRenderingContext];
  double v3 = [v2 device];
  _LayoutConstants_10(v3);
  double v5 = v4;

  return v5;
}

+ (double)dotBorderWidth
{
  v2 = +[CLKRenderingContext sharedRenderingContext];
  double v3 = [v2 device];
  _LayoutConstants_10(v3);
  double v5 = v4;

  return v5;
}

+ (double)noServiceDotHeight
{
  v2 = +[CLKRenderingContext sharedRenderingContext];
  double v3 = [v2 device];
  _LayoutConstants_10(v3);
  double v5 = v4;

  return v5;
}

+ (id)connectedDotColor
{
  if (connectedDotColor_onceToken != -1) {
    dispatch_once(&connectedDotColor_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)connectedDotColor___color;
  return v2;
}

void __42__NTKExplorerStatusView_connectedDotColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.462745098 green:0.858823529 blue:0.643137255 alpha:1.0];
  v1 = (void *)connectedDotColor___color;
  connectedDotColor___color = v0;
}

+ (id)noServiceDotColor
{
  if (noServiceDotColor_onceToken != -1) {
    dispatch_once(&noServiceDotColor_onceToken, &__block_literal_global_6_0);
  }
  v2 = (void *)noServiceDotColor___color;
  return v2;
}

void __42__NTKExplorerStatusView_noServiceDotColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.682352941 green:0.705882353 blue:0.749019608 alpha:1.0];
  v1 = (void *)noServiceDotColor___color;
  noServiceDotColor___color = v0;
}

- (void)_applyDotRotationFraction:(double)a3 forDotAtIndex:(unint64_t)a4
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  double v7 = [(NSArray *)self->_dotLayers objectAtIndex:a4];
  CLKInterpolateBetweenFloatsUnclipped();
  memset(&v36, 0, sizeof(v36));
  CATransform3DMakeRotation(&v36, v8, 1.0, 0.0, 0.0);
  CATransform3D v35 = v36;
  unint64_t v9 = [v7 connectivityDotBackingLayer];
  CATransform3D v34 = v35;
  [v9 setTransform:&v34];

  CATransform3D v33 = v36;
  double v10 = [v7 connectivityDotLayer];
  CATransform3D v32 = v33;
  [v10 setTransform:&v32];

  CLKInterpolateBetweenFloatsUnclipped();
  CATransform3DMakeRotation(&v31, v11, 1.0, 0.0, 0.0);
  id v12 = [v7 noServicePillLayer];
  CATransform3D v30 = v31;
  [v12 setTransform:&v30];

  id v13 = self->_dotColorOptions;
  v14 = [(NTKExplorerDotColorOptions *)v13 noServiceDotColor];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NTKExplorerStatusView noServiceDotColor];
  }
  v17 = v16;

  v18 = [(NTKExplorerDotColorOptions *)v13 connectedDotColor];

  if (v18)
  {
    id v19 = v18;
  }
  else
  {
    id v19 = +[NTKExplorerStatusView connectedDotColor];
  }
  uint64_t v20 = v19;

  NTKInterpolateBetweenColors();
  id v21 = objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v21 CGColor];
  objc_super v23 = [v7 noServicePillLayer];
  [v23 setBackgroundColor:v22];

  id v24 = v21;
  uint64_t v25 = [v24 CGColor];
  v26 = [v7 connectivityDotLayer];
  [v26 setBorderColor:v25];

  v28 = [v7 noServicePillLayer];
  float v27 = a3;
  *(float *)&double v29 = v27;
  [v28 setOpacity:v29];

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  double v5 = [(NTKExplorerStatusView *)self filterProvider];
  unint64_t v6 = [v5 filtersForView:self style:0 fraction:a3];

  if (v6)
  {
    dotLayers = self->_dotLayers;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__NTKExplorerStatusView_transitionToMonochromeWithFraction___block_invoke;
    v8[3] = &unk_1E62C28C8;
    id v9 = v6;
    [(NSArray *)dotLayers enumerateObjectsUsingBlock:v8];
  }
}

void __60__NTKExplorerStatusView_transitionToMonochromeWithFraction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  double v5 = [v4 noServicePillLayer];
  [v5 setFilters:v3];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [v4 connectivityDotLayer];

  [v7 setFilters:v6];
}

- (void)updateMonochromeColor
{
  uint64_t v3 = [(NTKExplorerStatusView *)self filterProvider];
  id v4 = [v3 filtersForView:self style:0];

  if (v4)
  {
    dotLayers = self->_dotLayers;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__NTKExplorerStatusView_updateMonochromeColor__block_invoke;
    v6[3] = &unk_1E62C28C8;
    id v7 = v4;
    [(NSArray *)dotLayers enumerateObjectsUsingBlock:v6];
  }
}

void __46__NTKExplorerStatusView_updateMonochromeColor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  double v5 = [v4 noServicePillLayer];
  [v5 setFilters:v3];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [v4 connectivityDotLayer];

  [v7 setFilters:v6];
}

- (void)_layoutDotLayers
{
  v33[3] = *MEMORY[0x1E4F143B8];
  [(NTKExplorerStatusView *)self dotDiameter];
  uint64_t v4 = v3;
  [(NTKExplorerStatusView *)self dotSpacing];
  uint64_t v6 = v5;
  [(NTKExplorerStatusView *)self dotDiameter];
  uint64_t v8 = v7;
  [(NTKExplorerStatusView *)self dotDiameter];
  uint64_t v10 = v9;
  v32[0] = @"backgroundColor";
  CGFloat v11 = [MEMORY[0x1E4F1CA98] null];
  v33[0] = v11;
  v32[1] = @"borderColor";
  id v12 = [MEMORY[0x1E4F1CA98] null];
  v33[1] = v12;
  v32[2] = @"borderWidth";
  id v13 = [MEMORY[0x1E4F1CA98] null];
  v33[2] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];

  [(NTKExplorerStatusView *)self noServiceDotHeight];
  uint64_t v16 = v15;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  dotLayers = self->_dotLayers;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __41__NTKExplorerStatusView__layoutDotLayers__block_invoke;
  v19[3] = &unk_1E62C28F0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = v8;
  uint64_t v25 = v10;
  uint64_t v26 = v4;
  uint64_t v27 = v6;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = v8;
  uint64_t v31 = v16;
  id v20 = v14;
  id v21 = self;
  id v18 = v14;
  [(NSArray *)dotLayers enumerateObjectsUsingBlock:v19];
  [MEMORY[0x1E4F39CF8] commit];
  [(NTKExplorerStatusView *)self _updateDotFillStates];
}

void __41__NTKExplorerStatusView__layoutDotLayers__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64);
  double v8 = *(double *)(a1 + 72);
  id v9 = a2;
  objc_msgSend(v9, "setBounds:", v5, v6, v7, v8);
  [v9 setPosition:*(double *)(a1 + 80) * 0.5 + (double)a3 * (*(double *)(a1 + 80) + *(double *)(a1 + 88))];
  id v16 = [v9 noServicePillLayer];
  [v16 setActions:*(void *)(a1 + 32)];
  objc_msgSend(v16, "setBounds:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  [v16 setCornerRadius:*(double *)(a1 + 120) * 0.5];
  id v10 = [*(id *)(a1 + 40) noServiceDotColor];
  objc_msgSend(v16, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

  [v16 setZPosition:*(double *)(a1 + 120) * 0.5];
  CGFloat v11 = [v9 connectivityDotBackingLayer];
  [v11 setActions:*(void *)(a1 + 32)];
  [v11 setCornerRadius:*(double *)(a1 + 64) * 0.5];
  id v12 = [*(id *)(a1 + 40) connectivityDotBackingColor];
  objc_msgSend(v11, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));

  [v11 setZPosition:*(double *)(a1 + 120) + *(double *)(a1 + 72) * 0.5];
  id v13 = [v9 connectivityDotLayer];

  [v13 setActions:*(void *)(a1 + 32)];
  [v13 setCornerRadius:*(double *)(a1 + 64) * 0.5];
  id v14 = [*(id *)(a1 + 40) connectedDotBackgroundColor];
  objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

  id v15 = [*(id *)(a1 + 40) connectedDotColor];
  objc_msgSend(v13, "setBorderColor:", objc_msgSend(v15, "CGColor"));

  [v13 setZPosition:*(double *)(a1 + 120) + *(double *)(a1 + 72) + *(double *)(a1 + 72) * 0.5];
}

- (void)setDotPosition:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  self->_position = a3;
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (NTKExplorerDotLayoutConstraints)dotLayoutConstraints
{
  return self->_dotLayoutConstraints;
}

- (NTKExplorerDotColorOptions)dotColorOptions
{
  return self->_dotColorOptions;
}

- (int64_t)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (BOOL)showsFullSignalStrength
{
  return self->_showsFullSignalStrength;
}

- (BOOL)tritiumIsOn
{
  return self->_tritiumIsOn;
}

- (void)setTritiumIsOn:(BOOL)a3
{
  self->_tritiumIsOn = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotColorOptions, 0);
  objc_storeStrong((id *)&self->_dotLayoutConstraints, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_dotLayers, 0);
}

@end