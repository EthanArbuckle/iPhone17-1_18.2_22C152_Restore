@interface NTKRichComplicationRectangularFullBaseView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKRichComplicationRectangularFullBaseView)init;
- (id)content;
- (void)layoutSubviews;
@end

@implementation NTKRichComplicationRectangularFullBaseView

- (NTKRichComplicationRectangularFullBaseView)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKRichComplicationRectangularFullBaseView;
  v2 = [(NTKRichComplicationRectangularBaseView *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(NTKRichComplicationRectangularFullBaseView *)v2 content];
    content = v3->_content;
    v3->_content = (UIView *)v4;

    [(NTKRichComplicationRectangularFullBaseView *)v3 addSubview:v3->_content];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NTKRichComplicationRectangularFullBaseView;
  [(NTKRichComplicationRectangularFullBaseView *)&v13 layoutSubviews];
  id v3 = [(CDRichComplicationView *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_65);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_65);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_65);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_LayoutConstants___cachedDevice_65, v3);
    _LayoutConstants___previousCLKDeviceVersion_65 = [v3 version];

    _LayoutConstants___constants_0_14 = NTKWhistlerLargeRectangularComplicationSize(v3);
    _LayoutConstants___constants_1_11 = v10;
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _LayoutConstants___previousCLKDeviceVersion_65;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_65);
  double v11 = *(double *)&_LayoutConstants___constants_0_14;
  double v12 = *(double *)&_LayoutConstants___constants_1_11;

  -[UIView setFrame:](self->_content, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v11, v12);
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 11;
}

- (void).cxx_destruct
{
}

- (id)content
{
  return 0;
}

@end