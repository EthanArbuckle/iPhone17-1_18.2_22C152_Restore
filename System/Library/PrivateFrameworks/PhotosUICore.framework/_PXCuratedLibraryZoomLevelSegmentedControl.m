@interface _PXCuratedLibraryZoomLevelSegmentedControl
+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4;
+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4;
- (BOOL)lastTouchRemainedOnSelectedSegment;
- (_PXCuratedLibraryZoomLevelSegmentedControl)initWithFrame:(CGRect)a3;
- (void)_highlightSegment:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _PXCuratedLibraryZoomLevelSegmentedControl

+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4
{
  return 4.0;
}

+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4
{
  return 18.0;
}

- (_PXCuratedLibraryZoomLevelSegmentedControl)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_PXCuratedLibraryZoomLevelSegmentedControl;
  v3 = -[_PXCuratedLibraryZoomLevelSegmentedControl initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_PXCuratedLibraryZoomLevelSegmentedControl *)v3 setApportionsSegmentWidthsByContent:1];
    [(_PXCuratedLibraryZoomLevelSegmentedControl *)v4 setTransparentBackground:1];
    v5 = (void *)MEMORY[0x1E4FB1EA0];
    v6 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
    v7 = [v5 _effectForBlurEffect:v6 vibrancyStyle:110];
    [(_PXCuratedLibraryZoomLevelSegmentedControl *)v4 _setSelectedSegmentVibrancyEffect:v7];

    v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:0.45];
    [(_PXCuratedLibraryZoomLevelSegmentedControl *)v4 setSelectedSegmentTintColor:v8];

    [(_PXCuratedLibraryZoomLevelSegmentedControl *)v4 _setAlwaysEmitValueChanged:1];
    [(_PXCuratedLibraryZoomLevelSegmentedControl *)v4 setClipsToBounds:0];
  }
  return v4;
}

- (BOOL)lastTouchRemainedOnSelectedSegment
{
  return self->_lastTouchRemainedOnSelectedSegment;
}

- (void)_highlightSegment:(int64_t)a3
{
  if ((a3 & 0x8000000000000000) == 0
    && [(_PXCuratedLibraryZoomLevelSegmentedControl *)self selectedSegmentIndex] != a3)
  {
    self->_lastTouchRemainedOnSelectedSegment = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_PXCuratedLibraryZoomLevelSegmentedControl;
  [(_PXCuratedLibraryZoomLevelSegmentedControl *)&v5 _highlightSegment:a3];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  self->_lastTouchRemainedOnSelectedSegment = 0;
  v4.receiver = self;
  v4.super_class = (Class)_PXCuratedLibraryZoomLevelSegmentedControl;
  [(_PXCuratedLibraryZoomLevelSegmentedControl *)&v4 touchesCancelled:a3 withEvent:a4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_PXCuratedLibraryZoomLevelSegmentedControl *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16 = [v7 anyObject];
  [v16 locationInView:self];
  v21.x = v17;
  v21.y = v18;
  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  BOOL v19 = CGRectContainsPoint(v22, v21);

  if (!v19) {
    self->_lastTouchRemainedOnSelectedSegment = 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)_PXCuratedLibraryZoomLevelSegmentedControl;
  [(_PXCuratedLibraryZoomLevelSegmentedControl *)&v20 touchesEnded:v7 withEvent:v6];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_lastTouchRemainedOnSelectedSegment = 1;
  v4.receiver = self;
  v4.super_class = (Class)_PXCuratedLibraryZoomLevelSegmentedControl;
  [(_PXCuratedLibraryZoomLevelSegmentedControl *)&v4 touchesBegan:a3 withEvent:a4];
}

@end