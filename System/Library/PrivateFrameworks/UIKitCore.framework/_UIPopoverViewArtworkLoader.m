@interface _UIPopoverViewArtworkLoader
+ (id)backgroundSelectorForBackgroundStyle:(int64_t)a3;
- (BOOL)modern;
- (CGRect)contentRectForRect:(CGRect)a3 inImageOfSize:(CGSize)a4;
- (CGRect)contentsCenterForRect:(CGRect)a3 inImageOfSize:(CGSize)a4;
- (_UIPopoverViewArtworkLoader)initWithBackgroundStyle:(int64_t)a3;
- (double)arrowBase;
- (double)arrowHeight;
- (double)arrowTopGradientEnd;
- (double)bottomEndCapHeight;
- (double)capCornerRadius;
- (double)clampArrowBase;
- (double)noArrowTopGradientEnd;
- (double)shortArtArrowTopGradientEnd;
- (double)shortArtNoArrowTopGradientEnd;
- (double)shortArtRightArrowBase;
- (double)sideArrowStart;
- (double)topArrowStart;
- (id)_bottomArrowLeftEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_bottomArrowPinnedViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_bottomArrowRightEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_bottomArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_rightArrowBottomEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_rightArrowPinnedBottomViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_rightArrowPinnedTopViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_rightArrowTopEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_rightArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_shortBottomArrowLeftEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_shortBottomArrowPinnedViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_shortBottomArrowRightEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_shortBottomArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_shortRightArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_shortTopArrowLeftEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_shortTopArrowPinnedViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_shortTopArrowRightEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_shortTopArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_templateImageForDirection:(id)a3 shortArtwork:(BOOL)a4 traitCollection:(id)a5 rimShadow:(BOOL)a6;
- (id)_topArrowLeftEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_topArrowPinnedViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_topArrowRightEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)_topArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4;
- (id)bottomArrowLeftEndCapView;
- (id)bottomArrowPinnedView;
- (id)bottomArrowRightEndCapView;
- (id)bottomArrowView;
- (id)rightArrowBottomEndCapView;
- (id)rightArrowPinnedBottomView;
- (id)rightArrowPinnedTopView;
- (id)rightArrowTopEndCapView;
- (id)rightArrowView;
- (id)shortBottomArrowLeftEndCapView;
- (id)shortBottomArrowPinnedView;
- (id)shortBottomArrowRightEndCapView;
- (id)shortBottomArrowView;
- (id)shortRightArrowView;
- (id)shortTopArrowLeftEndCapView;
- (id)shortTopArrowPinnedView;
- (id)shortTopArrowRightEndCapView;
- (id)shortTopArrowView;
- (id)templateImageForDirection:(id)a3 shortArtwork:(BOOL)a4 traitCollection:(id)a5;
- (id)topArrowLeftEndCapView;
- (id)topArrowPinnedView;
- (id)topArrowRightEndCapView;
- (id)topArrowView;
- (id)viewWithContentsImage:(id)a3 rect:(CGRect)a4 center:(CGRect)a5 antialiasingMask:(unsigned int)a6 directionSelector:(id)a7;
@end

@implementation _UIPopoverViewArtworkLoader

- (_UIPopoverViewArtworkLoader)initWithBackgroundStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIPopoverViewArtworkLoader;
  v4 = [(_UIPopoverViewArtworkLoader *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_backgroundStyle = a3;
    uint64_t v6 = [(id)objc_opt_class() backgroundSelectorForBackgroundStyle:a3];
    backgroundSelector = v5->_backgroundSelector;
    v5->_backgroundSelector = (NSString *)v6;
  }
  return v5;
}

+ (id)backgroundSelectorForBackgroundStyle:(int64_t)a3
{
  id result = @"Clear";
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      id result = @"Cream";
      break;
    case 3:
      id result = @"Black";
      break;
    case 4:
      id result = @"Share";
      break;
    case 5:
      id result = @"ShareBlack";
      break;
    case 6:
    case 7:
      goto LABEL_4;
    case 8:
      id result = @"Gray";
      break;
    default:
      if (a3 == 100) {
LABEL_4:
      }
        id result = @"BlurMask";
      else {
        id result = @"Blue";
      }
      break;
  }
  return result;
}

- (BOOL)modern
{
  int64_t backgroundStyle = self->_backgroundStyle;
  unint64_t v3 = backgroundStyle - 6;
  BOOL v4 = backgroundStyle == 100;
  return v3 < 2 || v4;
}

- (id)templateImageForDirection:(id)a3 shortArtwork:(BOOL)a4 traitCollection:(id)a5
{
  return [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:a3 shortArtwork:a4 traitCollection:a5 rimShadow:0];
}

- (id)_templateImageForDirection:(id)a3 shortArtwork:(BOOL)a4 traitCollection:(id)a5 rimShadow:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [NSString alloc];
  if (a6)
  {
    if (a4) {
      v13 = (void *)[v12 initWithFormat:@"_UIPopoverViewShortRimShadowArrow%@.png", v10, v17];
    }
    else {
      v13 = (void *)[v12 initWithFormat:@"_UIPopoverViewRimShadowArrow%@.png", v10, v17];
    }
  }
  else if (a4)
  {
    v13 = (void *)[v12 initWithFormat:@"_UIPopoverViewShort%@BackgroundArrow%@.png", self->_backgroundSelector, v10];
  }
  else
  {
    v13 = (void *)[v12 initWithFormat:@"_UIPopoverView%@BackgroundArrow%@.png", self->_backgroundSelector, v10];
  }
  v14 = v13;
  v15 = _UIImageWithNameAndTraitCollection(v13, v11);

  return v15;
}

- (CGRect)contentRectForRect:(CGRect)a3 inImageOfSize:(CGSize)a4
{
  double v4 = a3.origin.x / a4.width;
  double v5 = a3.origin.y / a4.height;
  double v6 = a3.size.width / a4.width;
  double v7 = a3.size.height / a4.height;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)contentsCenterForRect:(CGRect)a3 inImageOfSize:(CGSize)a4
{
  CGFloat v4 = a3.size.width + -1.0;
  double v5 = a3.size.height + -1.0;
  double v6 = (a3.origin.x + 0.5) / a4.width;
  double v7 = a3.origin.y + 0.5;
  double v8 = v4 / a4.width;
  if (v4 == 0.0) {
    double v9 = 0.00000011920929;
  }
  else {
    double v9 = v8;
  }
  if (v5 == 0.0) {
    double v10 = 0.00000011920929;
  }
  else {
    double v10 = v5 / a4.height;
  }
  double v11 = v7 / a4.height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v11;
  result.origin.x = v6;
  return result;
}

- (id)viewWithContentsImage:(id)a3 rect:(CGRect)a4 center:(CGRect)a5 antialiasingMask:(unsigned int)a6 directionSelector:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = a4.size.height;
  double v12 = a4.size.width;
  double v13 = a4.origin.y;
  double v14 = a4.origin.x;
  id v16 = a7;
  id v17 = a3;
  v18 = [_UIPopoverViewBackgroundComponentView alloc];
  [v17 size];
  double v20 = v19;
  [v17 size];
  v22 = -[UIView initWithFrame:](v18, "initWithFrame:", 0.0, 0.0, v20, v21);
  [(UIView *)v22 setOpaque:0];
  v23 = [(UIView *)v22 layer];
  id v24 = v17;
  objc_msgSend(v23, "setContents:", objc_msgSend(v24, "CGImage"));

  v25 = [(UIView *)v22 layer];
  objc_msgSend(v25, "setContentsRect:", v14, v13, v12, v11);

  v26 = [(UIView *)v22 layer];
  objc_msgSend(v26, "setContentsCenter:", x, y, width, height);

  v27 = [(UIView *)v22 layer];
  [v24 scale];
  double v29 = v28;

  [v27 setContentsScale:v29];
  v30 = [(UIView *)v22 layer];
  [v30 setEdgeAntialiasingMask:v7];

  [(_UIPopoverViewBackgroundComponentView *)v22 setDirectionSelector:v16];
  return v22;
}

- (double)arrowHeight
{
  BOOL v2 = [(_UIPopoverViewArtworkLoader *)self modern];
  double result = 18.0;
  if (v2) {
    return 13.0;
  }
  return result;
}

- (double)arrowBase
{
  return 37.0;
}

- (double)topArrowStart
{
  BOOL v2 = [(_UIPopoverViewArtworkLoader *)self modern];
  double result = 10.0;
  if (v2) {
    return 25.0;
  }
  return result;
}

- (double)sideArrowStart
{
  BOOL v2 = [(_UIPopoverViewArtworkLoader *)self modern];
  double result = 24.0;
  if (v2) {
    return 25.0;
  }
  return result;
}

- (double)clampArrowBase
{
  BOOL v2 = [(_UIPopoverViewArtworkLoader *)self modern];
  double result = 44.0;
  if (v2) {
    return 32.0;
  }
  return result;
}

- (double)arrowTopGradientEnd
{
  BOOL v2 = [(_UIPopoverViewArtworkLoader *)self modern];
  double result = 42.0;
  if (v2) {
    return 25.0;
  }
  return result;
}

- (double)noArrowTopGradientEnd
{
  BOOL v2 = [(_UIPopoverViewArtworkLoader *)self modern];
  double result = 24.0;
  if (v2) {
    return 25.0;
  }
  return result;
}

- (double)capCornerRadius
{
  BOOL v2 = [(_UIPopoverViewArtworkLoader *)self modern];
  double result = 8.0;
  if (v2) {
    return 16.0;
  }
  return result;
}

- (double)bottomEndCapHeight
{
  BOOL v2 = [(_UIPopoverViewArtworkLoader *)self modern];
  double result = 10.0;
  if (v2) {
    return 16.0;
  }
  return result;
}

- (double)shortArtNoArrowTopGradientEnd
{
  BOOL v2 = [(_UIPopoverViewArtworkLoader *)self modern];
  double result = 28.0;
  if (v2) {
    return 25.0;
  }
  return result;
}

- (double)shortArtArrowTopGradientEnd
{
  BOOL v2 = [(_UIPopoverViewArtworkLoader *)self modern];
  double result = 46.0;
  if (v2) {
    return 25.0;
  }
  return result;
}

- (double)shortArtRightArrowBase
{
  BOOL v2 = [(_UIPopoverViewArtworkLoader *)self modern];
  double result = 33.0;
  if (!v2) {
    return 22.0;
  }
  return result;
}

- (id)topArrowView
{
  return [(_UIPopoverViewArtworkLoader *)self _topArrowViewForTraitCollection:0 withRimShadow:0];
}

- (id)_topArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Up" shortArtwork:0 traitCollection:a3 rimShadow:a4];
  [(_UIPopoverViewArtworkLoader *)self topArrowStart];
  double v7 = v6;
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v9 = v8;
  [v5 size];
  double v11 = v10;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v7, 0.0, v9, v11, v12, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(_UIPopoverViewArtworkLoader *)self arrowTopGradientEnd];
  double v23 = v22;
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v25 = v24;
  [v5 size];
  double v27 = v26;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v29 = v28;
  [(_UIPopoverViewArtworkLoader *)self arrowTopGradientEnd];
  double v31 = v27 - (v29 + v30);
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v33 = v32;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v23, v25, v31, v33, v34);
  v39 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 3, @"Up", v15, v17, v19, v21, v35, v36, v37, v38 rect center antialiasingMask directionSelector];
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v41 = v40;
  [v5 size];
  objc_msgSend(v39, "setFrame:", 0.0, 0.0, v41, v42);

  return v39;
}

- (id)topArrowPinnedView
{
  return [(_UIPopoverViewArtworkLoader *)self _topArrowPinnedViewForTraitCollection:0 withRimShadow:0];
}

- (id)_topArrowPinnedViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"UpRight" shortArtwork:0 traitCollection:a3 rimShadow:a4];
  [v5 size];
  double v7 = v6;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v9 = v7 - v8;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v11 = v10;
  [v5 size];
  double v13 = v12;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v9, 0.0, v11, v13, v14, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(_UIPopoverViewArtworkLoader *)self arrowTopGradientEnd];
  double v25 = v24;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v27 = v26;
  [v5 size];
  double v29 = v28;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v31 = v30;
  [(_UIPopoverViewArtworkLoader *)self arrowTopGradientEnd];
  double v33 = v29 - (v31 + v32);
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v35 = v34;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v25, v27, v33, v35, v36);
  double v41 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 1, @"UpRight", v17, v19, v21, v23, v37, v38, v39, v40 rect center antialiasingMask directionSelector];
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v43 = v42;
  [v5 size];
  objc_msgSend(v41, "setFrame:", 0.0, 0.0, v43, v44);

  return v41;
}

- (id)topArrowLeftEndCapView
{
  return [(_UIPopoverViewArtworkLoader *)self _topArrowLeftEndCapViewForTraitCollection:0 withRimShadow:0];
}

- (id)_topArrowLeftEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Up" shortArtwork:0 traitCollection:a3 rimShadow:a4];
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v7 = v6;
  [v5 size];
  double v9 = v8;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v7, v9, v10, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v21 = v20;
  [(_UIPopoverViewArtworkLoader *)self arrowTopGradientEnd];
  double v23 = v22;
  [v5 size];
  double v25 = v24;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v27 = v26;
  [(_UIPopoverViewArtworkLoader *)self arrowTopGradientEnd];
  double v29 = v25 - (v27 + v28);
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v31 = v30;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v21, v23, 1.0, v29, v31, v32);
  double v37 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 2, @"Up", v13, v15, v17, v19, v33, v34, v35, v36 rect center antialiasingMask directionSelector];
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v39 = v38;
  [v5 size];
  objc_msgSend(v37, "setFrame:", 0.0, 0.0, v39, v40);

  return v37;
}

- (id)topArrowRightEndCapView
{
  return [(_UIPopoverViewArtworkLoader *)self _topArrowRightEndCapViewForTraitCollection:0 withRimShadow:0];
}

- (id)_topArrowRightEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(_UIPopoverViewArtworkLoader *)self modern])
  {
    double v7 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Up" shortArtwork:0 traitCollection:v6 rimShadow:v4];

    [v7 size];
    double v9 = v8;
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v11 = v9 - v10;
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v13 = v12;
    [v7 size];
    double v15 = v14;
    [v7 size];
    -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v11, 0.0, v13, v15, v16, v17);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    [(_UIPopoverViewArtworkLoader *)self arrowTopGradientEnd];
    double v27 = v26;
    [v7 size];
    double v29 = v28;
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v31 = v30;
    [(_UIPopoverViewArtworkLoader *)self arrowTopGradientEnd];
    double v33 = v29 - (v31 + v32);
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v35 = v34;
    [v7 size];
    -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v27, 1.0, v33, v35, v36);
    double v41 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v7, 1, @"Up", v19, v21, v23, v25, v37, v38, v39, v40 rect center antialiasingMask directionSelector];
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v43 = v42;
    [v7 size];
    objc_msgSend(v41, "setFrame:", 0.0, 0.0, v43, v44);
  }
  else
  {
    double v41 = [(_UIPopoverViewArtworkLoader *)self _topArrowLeftEndCapViewForTraitCollection:v6 withRimShadow:v4];

    CATransform3DMakeScale(&v47, -1.0, 1.0, 1.0);
    CATransform3DGetAffineTransform(&v48, &v47);
    CGAffineTransform v46 = v48;
    [v41 setTransform:&v46];
  }
  return v41;
}

- (id)rightArrowView
{
  return [(_UIPopoverViewArtworkLoader *)self _rightArrowViewForTraitCollection:0 withRimShadow:0];
}

- (id)_rightArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Side" shortArtwork:0 traitCollection:a3 rimShadow:a4];
  [(_UIPopoverViewArtworkLoader *)self sideArrowStart];
  double v7 = v6;
  [v5 size];
  double v9 = v8;
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v11 = v10;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, v7, v9, v11, v12, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v23 = v22;
  [v5 size];
  double v25 = v24;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v27 = v26;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v29 = v27 + v28;
  [(_UIPopoverViewArtworkLoader *)self arrowHeight];
  double v31 = v25 - (v29 + v30);
  [v5 size];
  double v33 = v32;
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v23, 1.0, v31, 1.0, v33, v34);
  double v39 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 10, @"Side", v15, v17, v19, v21, v35, v36, v37, v38 rect center antialiasingMask directionSelector];
  [v5 size];
  double v41 = v40;
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  objc_msgSend(v39, "setFrame:", 0.0, 0.0, v41, v42);

  return v39;
}

- (id)rightArrowPinnedTopView
{
  return [(_UIPopoverViewArtworkLoader *)self _rightArrowPinnedTopViewForTraitCollection:0 withRimShadow:0];
}

- (id)_rightArrowPinnedTopViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"SideTop" shortArtwork:0 traitCollection:a3 rimShadow:a4];
  [v5 size];
  double v7 = v6;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v9 = v8;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v7, v9, v10, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v21 = v20;
  [v5 size];
  double v23 = v22;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v25 = v24;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v27 = v25 + v26;
  [(_UIPopoverViewArtworkLoader *)self arrowHeight];
  double v29 = v23 - (v27 + v28);
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v31 = v30;
  [v5 size];
  double v33 = v32;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v21, 0.0, v29, v31, v33, v34);
  double v39 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 4, @"SideTop", v13, v15, v17, v19, v35, v36, v37, v38 rect center antialiasingMask directionSelector];
  [v5 size];
  double v41 = v40;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  objc_msgSend(v39, "setFrame:", 0.0, 0.0, v41, v42);

  return v39;
}

- (id)rightArrowPinnedBottomView
{
  return [(_UIPopoverViewArtworkLoader *)self _rightArrowPinnedBottomViewForTraitCollection:0 withRimShadow:0];
}

- (id)_rightArrowPinnedBottomViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"SideBottom" shortArtwork:0 traitCollection:a3 rimShadow:a4];
  [v5 size];
  double v7 = v6;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v9 = v7 - v8;
  [v5 size];
  double v11 = v10;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v13 = v12;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, v9, v11, v13, v14, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v25 = v24;
  [v5 size];
  double v27 = v26;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v29 = v28;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v31 = v29 + v30;
  [(_UIPopoverViewArtworkLoader *)self arrowHeight];
  double v33 = v27 - (v31 + v32);
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v35 = v34;
  [v5 size];
  double v37 = v36;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v25, 0.0, v33, v35, v37, v38);
  double v43 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 8, @"SideBottom", v17, v19, v21, v23, v39, v40, v41, v42 rect center antialiasingMask directionSelector];
  [v5 size];
  double v45 = v44;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  objc_msgSend(v43, "setFrame:", 0.0, 0.0, v45, v46);

  return v43;
}

- (id)rightArrowTopEndCapView
{
  return [(_UIPopoverViewArtworkLoader *)self _rightArrowTopEndCapViewForTraitCollection:0 withRimShadow:0];
}

- (id)_rightArrowTopEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Side" shortArtwork:0 traitCollection:a3 rimShadow:a4];
  BOOL v6 = [(_UIPopoverViewArtworkLoader *)self modern];
  [v5 size];
  double v8 = v7;
  if (v6)
  {
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v10 = v9;
    [v5 size];
    -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v8, v10, v11, v12);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v22 = v21;
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v24 = v23;
    [v5 size];
    double v26 = v25;
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v28 = v27;
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v30 = v28 + v29;
    [(_UIPopoverViewArtworkLoader *)self arrowHeight];
    double v32 = v26 - (v30 + v31);
    [v5 size];
    double v34 = v33;
    [(_UIPopoverViewArtworkLoader *)self noArrowTopGradientEnd];
    double v36 = v35;
  }
  else
  {
    [v5 size];
    double v24 = 24.0;
    -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v8, 24.0, v37, v38);
    double v14 = v39;
    double v16 = v40;
    double v18 = v41;
    double v20 = v42;
    [v5 size];
    double v32 = v43 + -34.0;
    [v5 size];
    double v34 = v44;
    double v22 = 8.0;
    double v36 = 24.0;
  }
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v22, v24, v32, 1.0, v34, v36);
  v49 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 4, @"Side", v14, v16, v18, v20, v45, v46, v47, v48 rect center antialiasingMask directionSelector];
  [v5 size];
  double v51 = v50;
  [(_UIPopoverViewArtworkLoader *)self sideArrowStart];
  double v53 = v52;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  objc_msgSend(v49, "setFrame:", 0.0, 0.0, v51, v53 - v54);

  return v49;
}

- (id)rightArrowBottomEndCapView
{
  return [(_UIPopoverViewArtworkLoader *)self _rightArrowBottomEndCapViewForTraitCollection:0 withRimShadow:0];
}

- (id)_rightArrowBottomEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Side" shortArtwork:0 traitCollection:a3 rimShadow:a4];
  [v5 size];
  double v7 = v6;
  [(_UIPopoverViewArtworkLoader *)self bottomEndCapHeight];
  double v9 = v7 - v8;
  [v5 size];
  double v11 = v10;
  [(_UIPopoverViewArtworkLoader *)self bottomEndCapHeight];
  double v13 = v12;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, v9, v11, v13, v14, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v25 = v24;
  [v5 size];
  double v27 = v26;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v29 = v28;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v31 = v29 + v30;
  [(_UIPopoverViewArtworkLoader *)self arrowHeight];
  double v33 = v27 - (v31 + v32);
  [v5 size];
  double v35 = v34;
  [(_UIPopoverViewArtworkLoader *)self sideArrowStart];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v25, 0.0, v33, 1.0, v35, v36);
  double v41 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 8, @"Side", v17, v19, v21, v23, v37, v38, v39, v40 rect center antialiasingMask directionSelector];
  [v5 size];
  double v43 = v42;
  [v5 size];
  double v45 = v44;
  [(_UIPopoverViewArtworkLoader *)self sideArrowStart];
  double v47 = v46;
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  objc_msgSend(v41, "setFrame:", 0.0, 0.0, v43, v45 - (v47 + v48));

  return v41;
}

- (id)bottomArrowView
{
  return [(_UIPopoverViewArtworkLoader *)self _bottomArrowViewForTraitCollection:0 withRimShadow:0];
}

- (id)_bottomArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Down" shortArtwork:0 traitCollection:a3 rimShadow:a4];
  [(_UIPopoverViewArtworkLoader *)self topArrowStart];
  double v7 = v6;
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v9 = v8;
  [v5 size];
  double v11 = v10;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v7, 0.0, v9, v11, v12, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(_UIPopoverViewArtworkLoader *)self noArrowTopGradientEnd];
  double v23 = v22;
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v25 = v24;
  [v5 size];
  double v27 = v26;
  [(_UIPopoverViewArtworkLoader *)self arrowHeight];
  double v29 = v28;
  [(_UIPopoverViewArtworkLoader *)self noArrowTopGradientEnd];
  double v31 = v29 + v30;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v33 = v27 - (v31 + v32);
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v35 = v34;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v23, v25, v33, v35, v36);
  double v41 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 12, @"Down", v15, v17, v19, v21, v37, v38, v39, v40 rect center antialiasingMask directionSelector];
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v43 = v42;
  [v5 size];
  objc_msgSend(v41, "setFrame:", 0.0, 0.0, v43, v44);

  return v41;
}

- (id)bottomArrowPinnedView
{
  return [(_UIPopoverViewArtworkLoader *)self _bottomArrowPinnedViewForTraitCollection:0 withRimShadow:0];
}

- (id)_bottomArrowPinnedViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"DownRight" shortArtwork:0 traitCollection:a3 rimShadow:a4];
  [v5 size];
  double v7 = v6;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v9 = v7 - v8;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v11 = v10;
  [v5 size];
  double v13 = v12;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v9, 0.0, v11, v13, v14, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(_UIPopoverViewArtworkLoader *)self noArrowTopGradientEnd];
  double v25 = v24;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v27 = v26;
  [v5 size];
  double v29 = v28;
  [(_UIPopoverViewArtworkLoader *)self noArrowTopGradientEnd];
  double v31 = v30;
  [(_UIPopoverViewArtworkLoader *)self arrowHeight];
  double v33 = v31 + v32;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v35 = v29 - (v33 + v34);
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v37 = v36;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v25, v27, v35, v37, v38);
  double v43 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 1, @"DownRight", v17, v19, v21, v23, v39, v40, v41, v42 rect center antialiasingMask directionSelector];
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v45 = v44;
  [v5 size];
  objc_msgSend(v43, "setFrame:", 0.0, 0.0, v45, v46);

  return v43;
}

- (id)bottomArrowLeftEndCapView
{
  return [(_UIPopoverViewArtworkLoader *)self _bottomArrowLeftEndCapViewForTraitCollection:0 withRimShadow:0];
}

- (id)_bottomArrowLeftEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Down" shortArtwork:0 traitCollection:a3 rimShadow:a4];
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v7 = v6;
  [v5 size];
  double v9 = v8;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v7, v9, v10, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v21 = v20;
  [(_UIPopoverViewArtworkLoader *)self noArrowTopGradientEnd];
  double v23 = v22;
  [v5 size];
  double v25 = v24;
  [(_UIPopoverViewArtworkLoader *)self arrowHeight];
  double v27 = v26;
  [(_UIPopoverViewArtworkLoader *)self noArrowTopGradientEnd];
  double v29 = v27 + v28;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v31 = v25 - (v29 + v30);
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v33 = v32;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v21, v23, 1.0, v31, v33, v34);
  double v39 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 1, @"Down", v13, v15, v17, v19, v35, v36, v37, v38 rect center antialiasingMask directionSelector];
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v41 = v40;
  [v5 size];
  objc_msgSend(v39, "setFrame:", 0.0, 0.0, v41, v42);

  return v39;
}

- (id)bottomArrowRightEndCapView
{
  return [(_UIPopoverViewArtworkLoader *)self _bottomArrowRightEndCapViewForTraitCollection:0 withRimShadow:0];
}

- (id)_bottomArrowRightEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(_UIPopoverViewArtworkLoader *)self modern])
  {
    double v7 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Down" shortArtwork:0 traitCollection:v6 rimShadow:v4];

    [v7 size];
    double v9 = v8;
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v11 = v9 - v10;
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v13 = v12;
    [v7 size];
    double v15 = v14;
    [v7 size];
    -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v11, 0.0, v13, v15, v16, v17);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    [(_UIPopoverViewArtworkLoader *)self noArrowTopGradientEnd];
    double v27 = v26;
    [v7 size];
    double v29 = v28;
    [(_UIPopoverViewArtworkLoader *)self arrowHeight];
    double v31 = v30;
    [(_UIPopoverViewArtworkLoader *)self noArrowTopGradientEnd];
    double v33 = v31 + v32;
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v35 = v29 - (v33 + v34);
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v37 = v36;
    [v7 size];
    -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v27, 1.0, v35, v37, v38);
    double v43 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v7, 2, @"Down", v19, v21, v23, v25, v39, v40, v41, v42 rect center antialiasingMask directionSelector];
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v45 = v44;
    [v7 size];
    objc_msgSend(v43, "setFrame:", 0.0, 0.0, v45, v46);
  }
  else
  {
    double v43 = [(_UIPopoverViewArtworkLoader *)self _bottomArrowLeftEndCapViewForTraitCollection:v6 withRimShadow:v4];

    CATransform3DMakeScale(&v49, -1.0, 1.0, 1.0);
    CATransform3DGetAffineTransform(&v50, &v49);
    CGAffineTransform v48 = v50;
    [v43 setTransform:&v48];
  }
  return v43;
}

- (id)shortTopArrowView
{
  return [(_UIPopoverViewArtworkLoader *)self _shortTopArrowViewForTraitCollection:0 withRimShadow:0];
}

- (id)_shortTopArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Up" shortArtwork:1 traitCollection:a3 rimShadow:a4];
  [(_UIPopoverViewArtworkLoader *)self topArrowStart];
  double v7 = v6;
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v9 = v8;
  [v5 size];
  double v11 = v10;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v7, 0.0, v9, v11, v12, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(_UIPopoverViewArtworkLoader *)self shortArtArrowTopGradientEnd];
  double v23 = v22;
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v25 = v24;
  [v5 size];
  double v27 = v26;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v29 = v28;
  [(_UIPopoverViewArtworkLoader *)self shortArtArrowTopGradientEnd];
  double v31 = v27 - (v29 + v30);
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v33 = v32;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v23, v25, v31, v33, v34);
  double v39 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 3, @"Up", v15, v17, v19, v21, v35, v36, v37, v38 rect center antialiasingMask directionSelector];
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v41 = v40;
  [v5 size];
  objc_msgSend(v39, "setFrame:", 0.0, 0.0, v41, v42);

  return v39;
}

- (id)shortTopArrowPinnedView
{
  return [(_UIPopoverViewArtworkLoader *)self _shortTopArrowPinnedViewForTraitCollection:0 withRimShadow:0];
}

- (id)_shortTopArrowPinnedViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"UpRight" shortArtwork:1 traitCollection:a3 rimShadow:a4];
  [v5 size];
  double v7 = v6;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v9 = v7 - v8;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v11 = v10;
  [v5 size];
  double v13 = v12;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v9, 0.0, v11, v13, v14, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(_UIPopoverViewArtworkLoader *)self shortArtArrowTopGradientEnd];
  double v25 = v24;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v27 = v26;
  [v5 size];
  double v29 = v28;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v31 = v30;
  [(_UIPopoverViewArtworkLoader *)self shortArtArrowTopGradientEnd];
  double v33 = v29 - (v31 + v32);
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v35 = v34;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v25, v27, v33, v35, v36);
  double v41 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 1, @"UpRight", v17, v19, v21, v23, v37, v38, v39, v40 rect center antialiasingMask directionSelector];
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v43 = v42;
  [v5 size];
  objc_msgSend(v41, "setFrame:", 0.0, 0.0, v43, v44);

  return v41;
}

- (id)shortTopArrowLeftEndCapView
{
  return [(_UIPopoverViewArtworkLoader *)self _shortTopArrowLeftEndCapViewForTraitCollection:0 withRimShadow:0];
}

- (id)_shortTopArrowLeftEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Up" shortArtwork:1 traitCollection:a3 rimShadow:a4];
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v7 = v6;
  [v5 size];
  double v9 = v8;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v7, v9, v10, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v21 = v20 + -1.0;
  [(_UIPopoverViewArtworkLoader *)self shortArtArrowTopGradientEnd];
  double v23 = v22;
  [v5 size];
  double v25 = v24;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v27 = v26;
  [(_UIPopoverViewArtworkLoader *)self shortArtArrowTopGradientEnd];
  double v29 = v25 - (v27 + v28);
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v31 = v30;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v21, v23, 1.0, v29, v31, v32);
  double v37 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 2, @"Up", v13, v15, v17, v19, v33, v34, v35, v36 rect center antialiasingMask directionSelector];
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v39 = v38;
  [v5 size];
  objc_msgSend(v37, "setFrame:", 0.0, 0.0, v39, v40);

  return v37;
}

- (id)shortTopArrowRightEndCapView
{
  return [(_UIPopoverViewArtworkLoader *)self _shortTopArrowRightEndCapViewForTraitCollection:0 withRimShadow:0];
}

- (id)_shortTopArrowRightEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  BOOL v4 = [(_UIPopoverViewArtworkLoader *)self _shortTopArrowLeftEndCapViewForTraitCollection:a3 withRimShadow:a4];
  CATransform3DMakeScale(&v7, -1.0, 1.0, 1.0);
  CATransform3DGetAffineTransform(&v8, &v7);
  CGAffineTransform v6 = v8;
  [v4 setTransform:&v6];
  return v4;
}

- (id)shortRightArrowView
{
  return [(_UIPopoverViewArtworkLoader *)self _shortRightArrowViewForTraitCollection:0 withRimShadow:0];
}

- (id)_shortRightArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Side" shortArtwork:1 traitCollection:a3 rimShadow:a4];
  [v5 size];
  double v7 = v6;
  [v5 size];
  double v9 = v8;
  [v5 size];
  double v10 = 0.0;
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v7, v9, v11, v12);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  BOOL v21 = [(_UIPopoverViewArtworkLoader *)self modern];
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v23 = v22;
  [v5 size];
  double v25 = v24;
  if (v21)
  {
    double v26 = v23 / v24;
    [v5 size];
    double v28 = v27;
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v30 = v28 - v29;
    [(_UIPopoverViewArtworkLoader *)self shortArtRightArrowBase];
    double v32 = v30 - v31;
    [v5 size];
    double v33 = 1.0;
    double v35 = v32 / v34;
  }
  else
  {
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v37 = v36;
    [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
    double v39 = v37 + v38;
    [(_UIPopoverViewArtworkLoader *)self shortArtRightArrowBase];
    double v41 = v25 - (v39 + v40);
    [v5 size];
    double v43 = v42;
    [v5 size];
    -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v23, 0.0, v41, v43, v44, v45);
    double v26 = v46;
    double v10 = v47;
    double v35 = v48;
    double v33 = v49;
  }
  CGAffineTransform v50 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 0, @"Side", v14, v16, v18, v20, v26, v10, v35, v33 rect center antialiasingMask directionSelector];
  [v5 size];
  double v52 = v51;
  [v5 size];
  objc_msgSend(v50, "setFrame:", 0.0, 0.0, v52, v53);

  return v50;
}

- (id)shortBottomArrowView
{
  return [(_UIPopoverViewArtworkLoader *)self _shortBottomArrowViewForTraitCollection:0 withRimShadow:0];
}

- (id)_shortBottomArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Down" shortArtwork:1 traitCollection:a3 rimShadow:a4];
  [(_UIPopoverViewArtworkLoader *)self topArrowStart];
  double v7 = v6;
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v9 = v8;
  [v5 size];
  double v11 = v10;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v7, 0.0, v9, v11, v12, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(_UIPopoverViewArtworkLoader *)self shortArtNoArrowTopGradientEnd];
  double v23 = v22;
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v25 = v24;
  [v5 size];
  double v27 = v26;
  [(_UIPopoverViewArtworkLoader *)self arrowHeight];
  double v29 = v28;
  [(_UIPopoverViewArtworkLoader *)self shortArtNoArrowTopGradientEnd];
  double v31 = v29 + v30;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v33 = v27 - (v31 + v32);
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v35 = v34;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v23, v25, v33, v35, v36);
  double v41 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 3, @"Down", v15, v17, v19, v21, v37, v38, v39, v40 rect center antialiasingMask directionSelector];
  [(_UIPopoverViewArtworkLoader *)self arrowBase];
  double v43 = v42;
  [v5 size];
  objc_msgSend(v41, "setFrame:", 0.0, 0.0, v43, v44);

  return v41;
}

- (id)shortBottomArrowPinnedView
{
  return [(_UIPopoverViewArtworkLoader *)self _shortBottomArrowPinnedViewForTraitCollection:0 withRimShadow:0];
}

- (id)_shortBottomArrowPinnedViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"DownRight" shortArtwork:1 traitCollection:a3 rimShadow:a4];
  [v5 size];
  double v7 = v6;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v9 = v7 - v8;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v11 = v10;
  [v5 size];
  double v13 = v12;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v9, 0.0, v11, v13, v14, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(_UIPopoverViewArtworkLoader *)self shortArtNoArrowTopGradientEnd];
  double v25 = v24;
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v27 = v26;
  [v5 size];
  double v29 = v28;
  [(_UIPopoverViewArtworkLoader *)self shortArtNoArrowTopGradientEnd];
  double v31 = v30;
  [(_UIPopoverViewArtworkLoader *)self arrowHeight];
  double v33 = v31 + v32;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v35 = v29 - (v33 + v34);
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v37 = v36;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v25, v27, v35, v37, v38);
  double v43 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 1, @"DownRight", v17, v19, v21, v23, v39, v40, v41, v42 rect center antialiasingMask directionSelector];
  [(_UIPopoverViewArtworkLoader *)self clampArrowBase];
  double v45 = v44;
  [v5 size];
  objc_msgSend(v43, "setFrame:", 0.0, 0.0, v45, v46);

  return v43;
}

- (id)shortBottomArrowLeftEndCapView
{
  return [(_UIPopoverViewArtworkLoader *)self _shortBottomArrowLeftEndCapViewForTraitCollection:0 withRimShadow:0];
}

- (id)_shortBottomArrowLeftEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  double v5 = [(_UIPopoverViewArtworkLoader *)self _templateImageForDirection:@"Down" shortArtwork:1 traitCollection:a3 rimShadow:a4];
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v7 = v6;
  [v5 size];
  double v9 = v8;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v7, v9, v10, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v21 = v20;
  [(_UIPopoverViewArtworkLoader *)self shortArtNoArrowTopGradientEnd];
  double v23 = v22;
  [v5 size];
  double v25 = v24;
  [(_UIPopoverViewArtworkLoader *)self arrowHeight];
  double v27 = v26;
  [(_UIPopoverViewArtworkLoader *)self shortArtNoArrowTopGradientEnd];
  double v29 = v27 + v28;
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v31 = v25 - (v29 + v30);
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v33 = v32;
  [v5 size];
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v21, v23, 1.0, v31, v33, v34);
  double v39 = [(_UIPopoverViewArtworkLoader *)self viewWithContentsImage:v5, 2, @"Down", v13, v15, v17, v19, v35, v36, v37, v38 rect center antialiasingMask directionSelector];
  [(_UIPopoverViewArtworkLoader *)self capCornerRadius];
  double v41 = v40;
  [v5 size];
  objc_msgSend(v39, "setFrame:", 0.0, 0.0, v41, v42);

  return v39;
}

- (id)shortBottomArrowRightEndCapView
{
  return [(_UIPopoverViewArtworkLoader *)self _shortBottomArrowRightEndCapViewForTraitCollection:0 withRimShadow:0];
}

- (id)_shortBottomArrowRightEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  BOOL v4 = [(_UIPopoverViewArtworkLoader *)self _shortBottomArrowLeftEndCapViewForTraitCollection:a3 withRimShadow:a4];
  CATransform3DMakeScale(&v7, -1.0, 1.0, 1.0);
  CATransform3DGetAffineTransform(&v8, &v7);
  CGAffineTransform v6 = v8;
  [v4 setTransform:&v6];
  return v4;
}

- (void).cxx_destruct
{
}

@end