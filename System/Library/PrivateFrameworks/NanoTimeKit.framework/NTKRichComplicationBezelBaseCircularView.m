@interface NTKRichComplicationBezelBaseCircularView
+ (void)updateCustomDataAnimationFromEarlierView:(id)a3 laterView:(id)a4 isForward:(BOOL)a5 animationType:(unint64_t)a6 animationDuration:(double)a7 animationFraction:(float)a8 bezelTextUpdateHandler:(id)a9;
- (CDRichComplicationView)circularView;
- (CGPoint)circularViewCenter;
- (Class)_circularViewClassFromFromTemplate:(id)a3;
- (NSString)description;
- (NTKRichComplicationBezelBaseCircularView)init;
- (double)bezelLabelCircularRadius;
- (id)_bezelTextProviderFromTemplate:(id)a3;
- (id)_circularTemplateFromTemplate:(id)a3;
- (void)_applyPausedUpdate;
- (void)_createBezelLabel;
- (void)_editingDidEnd;
- (void)_enumerateLabelsWithBlock:(id)a3;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)_layoutBezelLabel;
- (void)_layoutCircularView;
- (void)_setEditingTransitionFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5 type:(int64_t)a6;
- (void)_setWhistlerAnalogEditingTransitonFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5;
- (void)_transitThemeFromTheme:(int64_t)a3 toTheme:(int64_t)a4 fraction:(double)a5;
- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4;
- (void)_updateNewDataAnimationFinalAlpha:(double)a3 finalBezelLabelScale:(double)a4 finalCircularViewScale:(double)a5 animationApplierBlock:(id)a6 animationFraction:(float)a7;
- (void)complicationDisplay:(id)a3 renderStatsWithTime:(double)a4 cost:(double)a5;
- (void)layoutSubviews;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)setBezelLabelCircularRadius:(double)a3;
- (void)setBezelTextColor:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationBezelBaseCircularView

- (NTKRichComplicationBezelBaseCircularView)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  v2 = [(NTKRichComplicationBezelView *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(NTKRichComplicationBezelBaseCircularView *)v2 _createBezelLabel];
    v3->_newDataAnimationCircularScale = 1.0;
    v3->_newDataAnimationBezelLabelScale = 1.0;
    v3->_allowNofityingDelegateWithBezelTextUpdate = 1;
    v3->_allowUpdatingBezelTextProperties = 1;
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  [(NTKRichComplicationBezelBaseCircularView *)&v4 layoutSubviews];
  [(NTKRichComplicationBezelBaseCircularView *)self _layoutCircularView];
  [(NTKRichComplicationBezelBaseCircularView *)self _layoutBezelLabel];
  if ([(CLKUICurvedColoringLabel *)self->_bezelTextLabel isHidden])
  {
    [(CDRichComplicationTemplateView *)self->_circularView frame];
    uint64_t v3 = 0;
  }
  else
  {
    [(NTKRichComplicationBezelBaseCircularView *)self bounds];
    uint64_t v3 = 2;
  }
  -[NTKRichComplicationBezelView _updateHitTestShape:frame:](self, "_updateHitTestShape:frame:", v3);
}

- (void)setBezelTextColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  id v4 = a3;
  [(NTKRichComplicationBezelView *)&v5 setBezelTextColor:v4];
  -[CLKUICurvedColoringLabel setColor:](self->_bezelTextLabel, "setColor:", v4, v5.receiver, v5.super_class);
}

- (void)setBezelLabelCircularRadius:(double)a3
{
  self->_bezelLabelCircularRadius = a3;
  -[CLKUICurvedColoringLabel setCircleRadius:](self->_bezelTextLabel, "setCircleRadius:");
  [(NTKRichComplicationBezelBaseCircularView *)self setNeedsLayout];
}

- (CGPoint)circularViewCenter
{
  [(NTKRichComplicationBezelBaseCircularView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  v7 = [(CDRichComplicationView *)self device];
  _LayoutConstants_17(v7, (uint64_t)v10);

  double v8 = v4 * 0.5;
  double v9 = v6 * 0.5 - *(double *)v10;
  result.y = v9;
  result.x = v8;
  return result;
}

- (NSString)description
{
  double v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  double v4 = [(NTKRichComplicationBezelBaseCircularView *)&v8 description];
  double v5 = [(CLKUICurvedColoringLabel *)self->_bezelTextLabel text];
  double v6 = [v3 stringWithFormat:@"%@ [%@ %@]", v4, v5, self->_circularView];

  return (NSString *)v6;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v16 = a3;
  double v6 = -[NTKRichComplicationBezelBaseCircularView _circularViewClassFromFromTemplate:](self, "_circularViewClassFromFromTemplate:");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [(CDRichComplicationTemplateView *)self->_circularView removeFromSuperview];
    [(CDRichComplicationTemplateView *)self->_circularView setDisplayObserver:0];
    v7 = (CDRichComplicationTemplateView *)objc_alloc_init(v6);
    circularView = self->_circularView;
    self->_circularView = v7;

    [(CDRichComplicationTemplateView *)self->_circularView setFilterProvider:self];
    [(CDRichComplicationTemplateView *)self->_circularView setDisplayObserver:self];
    double v9 = [(CDRichComplicationView *)self timeTravelDate];
    if (v9) {
      [(CDRichComplicationTemplateView *)self->_circularView setTimeTravelDate:v9 animated:0];
    }
    [(CDRichComplicationTemplateView *)self->_circularView setPaused:[(CDRichComplicationView *)self paused]];
    [(NTKRichComplicationBezelBaseCircularView *)self addSubview:self->_circularView];
  }
  [(CDRichComplicationTemplateView *)self->_circularView transitThemeFromTheme:self->_fromTheme toTheme:self->_toTheme fraction:self->_themeFraction];
  v10 = [(NTKRichComplicationBezelBaseCircularView *)self _circularTemplateFromTemplate:v16];
  [(CDRichComplicationTemplateView *)self->_circularView setComplicationTemplate:v10 reason:a4];
  uint64_t v11 = self->_circularView;
  if (self->_inMonochromeModeFraction == 1.0) {
    [(CDRichComplicationTemplateView *)v11 updateMonochromeColor];
  }
  else {
    -[CDRichComplicationTemplateView transitionToMonochromeWithFraction:](v11, "transitionToMonochromeWithFraction:");
  }
  v12 = [(NTKRichComplicationBezelBaseCircularView *)self _bezelTextProviderFromTemplate:v16];
  bezelTextLabel = self->_bezelTextLabel;
  if (v12)
  {
    [(CLKUICurvedColoringLabel *)bezelTextLabel setHidden:0];
    v14 = self->_bezelTextLabel;
    v15 = v12;
  }
  else
  {
    [(CLKUICurvedColoringLabel *)bezelTextLabel setHidden:1];
    v14 = self->_bezelTextLabel;
    v15 = 0;
  }
  [(CLKUICurvedColoringLabel *)v14 setTextProvider:v15];
  [(NTKRichComplicationBezelBaseCircularView *)self setNeedsLayout];
}

- (void)_applyPausedUpdate
{
  circularView = self->_circularView;
  BOOL v3 = [(CDRichComplicationView *)self paused];
  [(CDRichComplicationTemplateView *)circularView setPaused:v3];
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
}

- (void)_setEditingTransitionFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5 type:(int64_t)a6
{
  if (!a6) {
    [(NTKRichComplicationBezelBaseCircularView *)self _setWhistlerAnalogEditingTransitonFraction:a4 direction:a5 position:a3];
  }
}

- (void)_editingDidEnd
{
  self->_bezelTextLabelRotationInDegree = 0.0;
  self->_circularViewRotationInDegree = 0.0;
  [(CDRichComplicationTemplateView *)self->_circularView _editingDidEnd];
}

- (void)_layoutBezelLabel
{
  BOOL v3 = [(CLKUICurvedColoringLabel *)self->_bezelTextLabel textProvider];

  if (v3)
  {
    double v17 = 0.0;
    double v18 = 0.0;
    long long v16 = *MEMORY[0x1E4F1DAD8];
    bezelTextLabel = self->_bezelTextLabel;
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v15[0] = *MEMORY[0x1E4F1DAB8];
    v15[1] = v5;
    v15[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(CLKUICurvedColoringLabel *)bezelTextLabel setTransform:v15];
    [(CLKUICurvedColoringLabel *)self->_bezelTextLabel sizeToFit];
    [(CLKUICurvedColoringLabel *)self->_bezelTextLabel getTextCenter:&v16 startAngle:&v18 endAngle:&v17];
    double v6 = MEMORY[0x1C1874A70]([(NTKRichComplicationBezelBaseCircularView *)self bounds]);
    -[NTKRichComplicationBezelView _setLayoutTransformToView:origin:rotationInDegree:centerScale:](self, "_setLayoutTransformToView:origin:rotationInDegree:centerScale:", self->_bezelTextLabel, v6 - *(double *)&v16, v7 - *((double *)&v16 + 1), self->_bezelTextLabelRotationInDegree, self->_newDataAnimationBezelLabelScale);
    double v8 = fabs(v18);
    double v9 = fabs(v17);
    if (v8 >= v9) {
      double v10 = v8;
    }
    else {
      double v10 = v9;
    }
    if (v8 >= v9) {
      double v8 = v9;
    }
    double v11 = v10 - v8;
  }
  else
  {
    double v11 = 0.0;
  }
  if (self->_allowUpdatingBezelTextProperties) {
    [(NTKRichComplicationBezelView *)self setBezelTextWidthInRadius:v11];
  }
  if (self->_allowNofityingDelegateWithBezelTextUpdate)
  {
    v12 = [(NTKRichComplicationBezelView *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = [(NTKRichComplicationBezelView *)self delegate];
      [v14 didUpdateBezelTextForRichComplicationBezelView:self];
    }
  }
}

- (void)_layoutCircularView
{
  BOOL v3 = [(CDRichComplicationView *)self device];
  double v4 = NTKWhistlerSubdialComplicationDiameter(v3);

  circularView = self->_circularView;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v14[0] = *MEMORY[0x1E4F1DAB8];
  v14[1] = v6;
  v14[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(CDRichComplicationTemplateView *)circularView setTransform:v14];
  -[CDRichComplicationTemplateView setFrame:](self->_circularView, "setFrame:", 0.0, 0.0, v4, v4);
  [(NTKRichComplicationBezelBaseCircularView *)self circularViewCenter];
  -[NTKRichComplicationBezelView _setLayoutTransformToView:origin:rotationInDegree:centerScale:](self, "_setLayoutTransformToView:origin:rotationInDegree:centerScale:", self->_circularView, v7 - v4 * 0.5, v8 - v4 * 0.5, self->_circularViewRotationInDegree, 1.0);
  double v9 = self->_circularView;
  if (v9)
  {
    [(CDRichComplicationTemplateView *)v9 transform];
    double v10 = self->_circularView;
  }
  else
  {
    double v10 = 0;
    memset(&v12, 0, sizeof(v12));
  }
  CGAffineTransformScale(&v13, &v12, self->_newDataAnimationCircularScale, self->_newDataAnimationCircularScale);
  CGAffineTransform v11 = v13;
  [(CDRichComplicationTemplateView *)v10 setTransform:&v11];
}

- (void)_transitThemeFromTheme:(int64_t)a3 toTheme:(int64_t)a4 fraction:(double)a5
{
  self->_fromTheme = a3;
  self->_toTheme = a4;
  self->_themeFraction = a5;
  -[CDRichComplicationTemplateView transitThemeFromTheme:toTheme:fraction:](self->_circularView, "transitThemeFromTheme:toTheme:fraction:");
}

- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4
{
  CLKInterpolateBetweenFloatsClipped();
  self->_newDataAnimationBezelLabelScale = v5;
  CLKInterpolateBetweenFloatsClipped();
  self->_newDataAnimationCircularScale = v6;
  [(NTKRichComplicationBezelBaseCircularView *)self _layoutCircularView];
  [(NTKRichComplicationBezelBaseCircularView *)self _layoutBezelLabel];
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  id v6 = a3;
  [(CDRichComplicationTemplateView *)&v7 setTimeTravelDate:v6 animated:v4];
  -[CDRichComplicationTemplateView setTimeTravelDate:animated:](self->_circularView, "setTimeTravelDate:animated:", v6, v4, v7.receiver, v7.super_class);
}

- (void)setForegroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  id v4 = a3;
  [(CDRichComplicationView *)&v5 setForegroundColor:v4];
  -[CDRichComplicationTemplateView setForegroundColor:](self->_circularView, "setForegroundColor:", v4, v5.receiver, v5.super_class);
}

- (id)_bezelTextProviderFromTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 textProvider];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_circularTemplateFromTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 circularTemplate];
  }
  else
  {
    id v4 = v3;
  }
  objc_super v5 = v4;

  return v5;
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  id v4 = (void (**)(id, CLKUICurvedColoringLabel *))a3;
  [(CDRichComplicationView *)&v5 _enumerateLabelsWithBlock:v4];
  v4[2](v4, self->_bezelTextLabel);
  -[CDRichComplicationTemplateView _enumerateLabelsWithBlock:](self->_circularView, "_enumerateLabelsWithBlock:", v4, v5.receiver, v5.super_class);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  self->_inMonochromeModeFraction = a3;
  objc_super v5 = [(CDRichComplicationView *)self filterProvider];
  id v7 = [v5 filtersForView:self style:1 fraction:a3];

  if (v7)
  {
    id v6 = [(CLKUICurvedColoringLabel *)self->_bezelTextLabel layer];
    [v6 setFilters:v7];
  }
  [(CDRichComplicationTemplateView *)self->_circularView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  self->_inMonochromeModeFraction = 1.0;
  id v3 = [(CDRichComplicationView *)self filterProvider];
  id v5 = [v3 filtersForView:self style:1];

  if (v5)
  {
    id v4 = [(CLKUICurvedColoringLabel *)self->_bezelTextLabel layer];
    [v4 setFilters:v5];
  }
  [(CDRichComplicationTemplateView *)self->_circularView updateMonochromeColor];
}

- (void)complicationDisplay:(id)a3 renderStatsWithTime:(double)a4 cost:(double)a5
{
  id v8 = [(CDRichComplicationView *)self displayObserver];
  [v8 complicationDisplay:self renderStatsWithTime:a4 cost:a5];
}

- (void)_createBezelLabel
{
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_17(v3, (uint64_t)&v17);

  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:*((double *)&v17 + 1) design:*MEMORY[0x1E4FB09D0]];
  id v6 = [v5 CLKFontWithAlternativePunctuation];

  [v4 setFont:v6];
  [v4 setUsesLegibility:0];
  [v4 setUppercase:1];
  [v4 setAlpha:1.0];
  [v4 setHidden:1];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__NTKRichComplicationBezelBaseCircularView__createBezelLabel__block_invoke;
  _OWORD v14[3] = &unk_1E62C0040;
  objc_copyWeak(&v15, &location);
  [v4 setNowProvider:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__NTKRichComplicationBezelBaseCircularView__createBezelLabel__block_invoke_2;
  v12[3] = &unk_1E62C0068;
  objc_copyWeak(&v13, &location);
  [v4 setNeedsResizeHandler:v12];
  [v4 setInterior:0];
  [v4 setCenterAngle:*(double *)&v18];
  id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v8 = [v7 objectForKey:*MEMORY[0x1E4F1C438]];

  int v9 = [v8 isEqualToString:@"ar"];
  uint64_t v10 = 24;
  if (v9) {
    uint64_t v10 = 32;
  }
  [v4 setTracking:*(double *)((char *)&v17 + v10)];
  [v4 setMaxAngularWidth:*((double *)&v19 + 1)];
  [(NTKRichComplicationBezelBaseCircularView *)self addSubview:v4];
  bezelTextLabel = self->_bezelTextLabel;
  self->_bezelTextLabel = (CLKUICurvedColoringLabel *)v4;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

id __61__NTKRichComplicationBezelBaseCircularView__createBezelLabel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = (id)MEMORY[0x1E4F19A20];
  }
  id v3 = [WeakRetained complicationDate];

  return v3;
}

void __61__NTKRichComplicationBezelBaseCircularView__createBezelLabel__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
  v1 = [WeakRetained displayObserver];
  [v1 complicationDisplayNeedsResize:WeakRetained];
}

- (void)_setWhistlerAnalogEditingTransitonFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5
{
  if ((unint64_t)a5 <= 1) {
    CLKCompressFraction();
  }
  id v7 = [(CDRichComplicationView *)self device];
  _LayoutConstants_17(v7, (uint64_t)&v10);

  CLKInterpolateBetweenFloatsClipped();
  if (a5 == 1) {
    double v8 = -v8;
  }
  self->_bezelTextLabelRotationInDegree = v8;
  CLKInterpolateBetweenFloatsClipped();
  if (a5 == 1) {
    double v9 = -v9;
  }
  self->_circularViewRotationInDegree = v9;
  [(NTKRichComplicationBezelBaseCircularView *)self setNeedsLayout];
}

- (void)_updateNewDataAnimationFinalAlpha:(double)a3 finalBezelLabelScale:(double)a4 finalCircularViewScale:(double)a5 animationApplierBlock:(id)a6 animationFraction:(float)a7
{
  id v15 = a6;
  [(NTKRichComplicationBezelBaseCircularView *)self alpha];
  double v9 = a7;
  CLKInterpolateBetweenFloatsClipped();
  double v11 = v10;
  -[NTKRichComplicationBezelBaseCircularView setAlpha:](self, "setAlpha:");
  [(NTKRichComplicationBezelView *)self setBezelTextAlpha:v11];
  CLKInterpolateBetweenFloatsClipped();
  self->_newDataAnimationCircularScale = v12;
  CLKInterpolateBetweenFloatsClipped();
  self->_newDataAnimationBezelLabelScale = v13;
  [(NTKRichComplicationBezelBaseCircularView *)self setNeedsLayout];
  [(NTKRichComplicationBezelBaseCircularView *)self layoutIfNeeded];
  v14 = v15;
  if (v15)
  {
    (*((void (**)(id, double))v15 + 2))(v15, v9);
    v14 = v15;
  }
}

+ (void)updateCustomDataAnimationFromEarlierView:(id)a3 laterView:(id)a4 isForward:(BOOL)a5 animationType:(unint64_t)a6 animationDuration:(double)a7 animationFraction:(float)a8 bezelTextUpdateHandler:(id)a9
{
  BOOL v12 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a9;
  if (v12) {
    long long v17 = v14;
  }
  else {
    long long v17 = v15;
  }
  if (v12) {
    long long v18 = v15;
  }
  else {
    long long v18 = v14;
  }
  long long v19 = v17;
  id v20 = v18;
  [v19 setAlpha:1.0];
  [v20 setAlpha:0.0];
  if (a6)
  {
    if (a6 != 1) {
      goto LABEL_12;
    }
    double v21 = 1.0;
    double v22 = 1.0;
  }
  else
  {
    double v22 = 0.95;
    double v21 = 0.9;
  }
  v19[85] = 0x3FF0000000000000;
  v19[86] = 0x3FF0000000000000;
  *((double *)v20 + 85) = v21;
  *((double *)v20 + 86) = v22;
LABEL_12:
  *((unsigned char *)v20 + 697) = 0;
  [v14 setNeedsLayout];
  [v14 layoutIfNeeded];
  [v15 setNeedsLayout];
  [v15 layoutIfNeeded];
  [v20 bezelTextWidthInRadius];
  double v24 = v23;
  [v19 bezelTextWidthInRadius];
  double v26 = v25;
  if (v24 <= v25)
  {
    *((unsigned char *)v20 + 696) = 0;
    [v19 bezelTextWidthInRadius];
    objc_msgSend(v20, "setBezelTextWidthInRadius:");
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __178__NTKRichComplicationBezelBaseCircularView_updateCustomDataAnimationFromEarlierView_laterView_isForward_animationType_animationDuration_animationFraction_bezelTextUpdateHandler___block_invoke;
  aBlock[3] = &unk_1E62C4610;
  id v42 = v16;
  v27 = v19;
  id v40 = v27;
  id v28 = v20;
  id v41 = v28;
  id v29 = v16;
  v30 = _Block_copy(aBlock);
  CLKCompressFraction();
  float v32 = v31;
  CLKCompressFraction();
  float v35 = v34;
  if (v24 > v26) {
    v36 = v30;
  }
  else {
    v36 = 0;
  }
  if (v24 > v26) {
    v37 = 0;
  }
  else {
    v37 = v30;
  }
  *(float *)&double v33 = v32;
  [v27 _updateNewDataAnimationFinalAlpha:v36 finalBezelLabelScale:0.0 finalCircularViewScale:*((double *)v28 + 86) animationApplierBlock:*((double *)v28 + 85) animationFraction:v33];
  *((unsigned char *)v28 + 696) = v32 >= 1.0;
  *(float *)&double v38 = v35;
  [v28 _updateNewDataAnimationFinalAlpha:v37 finalBezelLabelScale:1.0 finalCircularViewScale:1.0 animationApplierBlock:1.0 animationFraction:v38];
  if (a8 >= 1.0)
  {
    *((unsigned char *)v28 + 696) = 1;
    *((unsigned char *)v28 + 697) = 1;
  }
}

uint64_t __178__NTKRichComplicationBezelBaseCircularView_updateCustomDataAnimationFromEarlierView_laterView_isForward_animationType_animationDuration_animationFraction_bezelTextUpdateHandler___block_invoke(uint64_t a1, double a2)
{
  uint64_t v4 = *(void *)(a1 + 48);
  [*(id *)(a1 + 32) bezelTextWidthInRadius];
  unint64_t v6 = v5;
  [*(id *)(a1 + 40) bezelTextWidthInRadius];
  v7.n128_u64[0] = v9.n128_u64[0];
  double v8 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128))(v4 + 16);
  v9.n128_u64[0] = v6;
  v10.n128_f64[0] = a2;
  return v8(v4, v9, v7, v10);
}

- (double)bezelLabelCircularRadius
{
  return self->_bezelLabelCircularRadius;
}

- (CDRichComplicationView)circularView
{
  return &self->_circularView->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bezelTextLabel, 0);
  objc_storeStrong((id *)&self->_circularView, 0);
}

- (Class)_circularViewClassFromFromTemplate:(id)a3
{
  return 0;
}

@end