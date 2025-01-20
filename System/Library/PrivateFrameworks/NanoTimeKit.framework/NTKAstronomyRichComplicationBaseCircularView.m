@interface NTKAstronomyRichComplicationBaseCircularView
- (NTKAstronomyRichComplicationBaseCircularView)initWithFamily:(int64_t)a3;
- (int64_t)_desaturatedFilterStyle;
- (void)_applyPausedUpdate;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)_setupContentViewForFamily:(int64_t)a3;
- (void)layoutSubviews;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)setEditing:(BOOL)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKAstronomyRichComplicationBaseCircularView

- (NTKAstronomyRichComplicationBaseCircularView)initWithFamily:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKAstronomyRichComplicationBaseCircularView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v7, sel_initWithFamily_);
  v5 = v4;
  if (v4) {
    [(NTKAstronomyRichComplicationBaseCircularView *)v4 _setupContentViewForFamily:a3];
  }
  return v5;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKAstronomyRichComplicationBaseCircularView;
  [(NTKRichComplicationCircularBaseView *)&v12 layoutSubviews];
  v3 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[NTKAstronomyRichComplicationContentView setFrame:](self->_astronomyContentView, "setFrame:", v5, v7, v9, v11);
}

- (void)_applyPausedUpdate
{
  astronomyContentView = self->_astronomyContentView;
  BOOL v3 = [(CDRichComplicationView *)self paused];

  [(NTKAstronomyRichComplicationContentView *)astronomyContentView applyPausedUpdate:v3];
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  astronomyContentView = self->_astronomyContentView;
  id v6 = [a3 metadata];
  [(NTKAstronomyRichComplicationContentView *)astronomyContentView handleTemplateMetadata:v6 reason:a4];
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKAstronomyRichComplicationBaseCircularView;
  -[CDRichComplicationView setEditing:](&v5, sel_setEditing_);
  [(NTKAstronomyRichComplicationContentView *)self->_astronomyContentView setEditing:v3];
}

- (int64_t)_desaturatedFilterStyle
{
  v2 = [(CDRichComplicationView *)self device];
  int v3 = NTKShowGossamerUI(v2);

  if (v3) {
    return 5;
  }
  else {
    return 1;
  }
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5 = [(CDRichComplicationView *)self filterProvider];
  objc_msgSend(v5, "filtersForView:style:fraction:", self, -[NTKAstronomyRichComplicationBaseCircularView _desaturatedFilterStyle](self, "_desaturatedFilterStyle"), a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    id v6 = [(NTKAstronomyRichComplicationContentView *)self->_astronomyContentView layer];
    [v6 setFilters:v7];
  }
}

- (void)updateMonochromeColor
{
  int v3 = [(CDRichComplicationView *)self filterProvider];
  objc_msgSend(v3, "filtersForView:style:", self, -[NTKAstronomyRichComplicationBaseCircularView _desaturatedFilterStyle](self, "_desaturatedFilterStyle"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    double v4 = [(NTKAstronomyRichComplicationContentView *)self->_astronomyContentView layer];
    [v4 setFilters:v5];
  }
}

- (void)_setupContentViewForFamily:(int64_t)a3
{
  uint64_t v5 = [(CDRichComplicationView *)self device];
  id v6 = (void *)v5;
  if (a3 == 12) {
    double v7 = NTKGraphicExtraLargeComplicationContentDiameter(v5);
  }
  else {
    double v7 = NTKWhistlerSubdialComplicationContentDiameter(v5);
  }
  double v8 = v7;

  double v9 = [NTKAstronomyRichComplicationContentView alloc];
  double v10 = [(CDRichComplicationView *)self device];
  double v11 = [(NTKAstronomyRichComplicationContentView *)v9 initForDevice:v10 family:a3 diameter:v8];
  astronomyContentView = self->_astronomyContentView;
  self->_astronomyContentView = v11;

  v13 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v13 addSubview:self->_astronomyContentView];

  [(NTKAstronomyRichComplicationBaseCircularView *)self setNeedsLayout];
}

- (void).cxx_destruct
{
}

@end