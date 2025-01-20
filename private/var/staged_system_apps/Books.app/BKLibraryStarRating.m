@interface BKLibraryStarRating
- (BKLibraryStarRating)initWithFrame:(CGRect)a3;
- (BKLibraryStarRatingDelegate)delegate;
- (BOOL)accessibilityActivate;
- (BOOL)allowHalfStars;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isAccessibilityElement;
- (BOOL)isRTL;
- (NSMutableArray)stars;
- (UIColor)emptyColor;
- (UIColor)fillColor;
- (UIColor)frameColor;
- (UIImage)fullStar;
- (UIImage)halfStar;
- (UIImage)outlineStar;
- (double)numberOfStars;
- (double)rating;
- (double)roundRatingForStars:(double)a3;
- (id)accessibilityLabel;
- (id)starForIndex:(int64_t)a3;
- (id)templateStar:(unint64_t)a3;
- (unint64_t)accessibilityTraits;
- (unint64_t)starKindForIndex:(int64_t)a3;
- (unint64_t)starSize;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)clearStars;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)setAllowHalfStars:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEmptyColor:(id)a3;
- (void)setFillColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFrameColor:(id)a3;
- (void)setFullStar:(id)a3;
- (void)setHalfStar:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setNumberOfStars:(double)a3;
- (void)setOutlineStar:(id)a3;
- (void)setRating:(double)a3;
- (void)setRatingWithTouch:(id)a3;
- (void)setStarSize:(unint64_t)a3;
- (void)setStars:(id)a3;
- (void)setupStarShapes;
- (void)tintStarViews;
- (void)updateStars;
@end

@implementation BKLibraryStarRating

- (BKLibraryStarRating)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BKLibraryStarRating;
  v3 = -[BKLibraryStarRating initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIColor blackColor];
    fillColor = v3->_fillColor;
    v3->_fillColor = (UIColor *)v4;

    uint64_t v6 = +[UIColor blackColor];
    frameColor = v3->_frameColor;
    v3->_frameColor = (UIColor *)v6;

    uint64_t v8 = +[UIColor grayColor];
    emptyColor = v3->_emptyColor;
    v3->_emptyColor = (UIColor *)v8;

    v3->_numberOfStars = 5.0;
    v3->_starSize = 0;
    v3->_allowHalfStars = 1;
  }
  return v3;
}

- (id)templateStar:(unint64_t)a3
{
  unint64_t v5 = [(BKLibraryStarRating *)self starSize];
  uint64_t v6 = +[BSUITemplate manager];
  v7 = [v6 imageResourceCache];
  uint64_t v8 = [(BKLibraryStarRating *)self _screen];
  [v8 scale];
  v9 = +[TUIRatingsBox starRatingImage:size:fromCache:withScale:](TUIRatingsBox, "starRatingImage:size:fromCache:withScale:", a3, v5, v7);

  v10 = [v9 imageWithRenderingMode:2];

  return v10;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(BKLibraryStarRating *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v24.receiver = self;
  v24.super_class = (Class)BKLibraryStarRating;
  -[BKLibraryStarRating setFrame:](&v24, "setFrame:", x, y, width, height);
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  double v12 = CGRectGetWidth(v25);
  if (v12 > 0.0)
  {
    if (v12 <= -3.40282347e38)
    {
      uint64_t v15 = 0x7FC00000FF7FFFFFLL;
    }
    else
    {
      BOOL v13 = v12 < 3.40282347e38;
      float v14 = v12;
      if (v13) {
        uint64_t v15 = LODWORD(v14) | 0x7FC0000000000000;
      }
      else {
        uint64_t v15 = 0x7FC000007F7FFFFFLL;
      }
    }
    id v16 = +[TUIRatingsBox sizeFromWidth:](TUIRatingsBox, "sizeFromWidth:", v15, 0x1700007FC00000);
    if (v16 != (id)[(BKLibraryStarRating *)self starSize]
      || ([(BKLibraryStarRating *)self fullStar],
          v17 = objc_claimAutoreleasedReturnValue(),
          v17,
          !v17))
    {
      [(BKLibraryStarRating *)self setStarSize:v16];
      v18 = [(BKLibraryStarRating *)self templateStar:0];
      [(BKLibraryStarRating *)self setOutlineStar:v18];

      v19 = [(BKLibraryStarRating *)self templateStar:1];
      [(BKLibraryStarRating *)self setHalfStar:v19];

      if ([(BKLibraryStarRating *)self isRTL])
      {
        id v20 = [(BKLibraryStarRating *)self halfStar];
        v21 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v20 CGImage], 4, 1.0);

        v22 = [v21 imageWithRenderingMode:2];

        [(BKLibraryStarRating *)self setHalfStar:v22];
      }
      v23 = [(BKLibraryStarRating *)self templateStar:2];
      [(BKLibraryStarRating *)self setFullStar:v23];
    }
    if (v9 != width || v11 != height)
    {
      v26.origin.double x = x;
      v26.origin.double y = y;
      v26.size.double width = width;
      v26.size.double height = height;
      if (CGRectGetHeight(v26) != 0.0) {
        [(BKLibraryStarRating *)self updateStars];
      }
    }
  }
}

- (void)setIsRTL:(BOOL)a3
{
  if (self->_isRTL != a3)
  {
    self->_isRTL = a3;
    [(BKLibraryStarRating *)self setupStarShapes];
  }
}

- (unint64_t)starKindForIndex:(int64_t)a3
{
  [(BKLibraryStarRating *)self rating];
  if (v5 <= 0.0) {
    return 0;
  }
  double v6 = v5;
  unsigned int v7 = [(BKLibraryStarRating *)self isRTL];
  double v8 = 1.0 - v6;
  if (!v7) {
    double v8 = v6;
  }
  [(BKLibraryStarRating *)self roundRatingForStars:v8];
  double v10 = v9;
  [(BKLibraryStarRating *)self numberOfStars];
  double v12 = v10 * v11;
  double v13 = ceil(v12);
  double v14 = floor(v12);
  if ([(BKLibraryStarRating *)self isRTL])
  {
    double v15 = (double)a3;
    if (v13 <= (double)a3) {
      return 2;
    }
    unint64_t v16 = 0;
    if (v14 > v15) {
      return v16;
    }
LABEL_13:
    double v19 = fmod(v12, v14);
    if (v14 == 0.0) {
      double v19 = v12;
    }
    if (v19 <= 0.7)
    {
      if (v19 <= 0.2) {
        return v16;
      }
      if ([(BKLibraryStarRating *)self allowHalfStars])
      {
        if ([(BKLibraryStarRating *)self allowHalfStars]) {
          return 1;
        }
        return v16;
      }
    }
    return 2;
  }
  double v17 = (double)(a3 + 1);
  unint64_t v16 = 2 * (v14 >= v17);
  if (v14 < v17 && v13 >= v17) {
    goto LABEL_13;
  }
  return v16;
}

- (id)starForIndex:(int64_t)a3
{
  unint64_t v4 = [(BKLibraryStarRating *)self starKindForIndex:a3];
  if (v4 == 2)
  {
    double v5 = [(BKLibraryStarRating *)self fullStar];
  }
  else if (v4 == 1)
  {
    double v5 = [(BKLibraryStarRating *)self halfStar];
  }
  else if (v4)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = [(BKLibraryStarRating *)self outlineStar];
  }

  return v5;
}

- (void)setFrameColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_frameColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_frameColor, a3);
    [(BKLibraryStarRating *)self tintStarViews];
  }
}

- (void)setFillColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_fillColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    [(BKLibraryStarRating *)self tintStarViews];
  }
}

- (void)setEmptyColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_emptyColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_emptyColor, a3);
    [(BKLibraryStarRating *)self tintStarViews];
  }
}

- (void)clearStars
{
  v3 = [(BKLibraryStarRating *)self stars];
  [v3 enumerateObjectsUsingBlock:&stru_100A456C8];

  [(BKLibraryStarRating *)self setStars:0];
}

- (void)updateStars
{
  v3 = [(BKLibraryStarRating *)self stars];
  double v4 = (double)(unint64_t)[v3 count];
  [(BKLibraryStarRating *)self numberOfStars];
  double v6 = v5;

  if (v6 != v4) {
    [(BKLibraryStarRating *)self setupStarShapes];
  }

  [(BKLibraryStarRating *)self tintStarViews];
}

- (void)tintStarViews
{
  [(BKLibraryStarRating *)self numberOfStars];
  if (v3 > 0.0)
  {
    uint64_t v4 = 1;
    do
    {
      double v5 = [(BKLibraryStarRating *)self starForIndex:v4 - 1];
      if (v5)
      {
        double v6 = [(BKLibraryStarRating *)self stars];
        unsigned int v7 = [v6 objectAtIndexedSubscript:v4 - 1];

        [v7 setImage:v5];
        [(BKLibraryStarRating *)self rating];
        if (v8 == 0.0)
        {
          uint64_t v9 = [(BKLibraryStarRating *)self emptyColor];
        }
        else
        {
          if ([(BKLibraryStarRating *)self starKindForIndex:v4 - 1]) {
            [(BKLibraryStarRating *)self fillColor];
          }
          else {
          uint64_t v9 = [(BKLibraryStarRating *)self frameColor];
          }
        }
        double v10 = (void *)v9;
        [v7 setTintColor:v9];

        [v7 setNeedsLayout];
      }

      double v11 = (double)v4;
      [(BKLibraryStarRating *)self numberOfStars];
      ++v4;
    }
    while (v12 > v11);
  }
}

- (void)setupStarShapes
{
  double v3 = [(BKLibraryStarRating *)self stars];
  double v4 = (double)(unint64_t)[v3 count];
  [(BKLibraryStarRating *)self numberOfStars];
  double v6 = v5;

  if (v6 != v4)
  {
    [(BKLibraryStarRating *)self clearStars];
    [(BKLibraryStarRating *)self numberOfStars];
    double v8 = +[NSMutableArray arrayWithCapacity:(unint64_t)v7];
    [(BKLibraryStarRating *)self setStars:v8];

    [(BKLibraryStarRating *)self numberOfStars];
    if (v9 > 0.0)
    {
      uint64_t v10 = 0;
      double v11 = 0.0;
      do
      {
        double v12 = [(BKLibraryStarRating *)self starForIndex:v10];
        if (v12)
        {
          id v13 = [objc_alloc((Class)UIImageView) initWithImage:v12];
          +[TUIRatingsBox spacingForSize:[(BKLibraryStarRating *)self starSize]];
          double v15 = v11 + v14 + 20.0;
          [v13 setFrame:v11, 0.0, 20.0, 20.0];
          [v13 setContentMode:1];
          unint64_t v16 = [(BKLibraryStarRating *)self stars];
          [v16 addObject:v13];

          [(BKLibraryStarRating *)self addSubview:v13];
          double v11 = v15;
        }

        ++v10;
        [(BKLibraryStarRating *)self numberOfStars];
      }
      while (v17 > (double)v10);
    }
    v18 = [(BKLibraryStarRating *)self stars];
    id v19 = [v18 count];

    if (!v19) {
      [(BKLibraryStarRating *)self setStars:0];
    }
  }
  [(BKLibraryStarRating *)self frame];
  double Width = CGRectGetWidth(v47);
  if (Width > 0.0)
  {
    double v21 = Width;
    v22 = [(BKLibraryStarRating *)self stars];
    double v23 = (double)(unint64_t)[v22 count];
    [(BKLibraryStarRating *)self numberOfStars];
    double v25 = v24;

    if (v25 == v23)
    {
      CGRect v26 = [(BKLibraryStarRating *)self stars];
      id v45 = [v26 firstObject];

      [v45 frame];
      double v27 = CGRectGetWidth(v48);
      [(BKLibraryStarRating *)self frame];
      double Height = CGRectGetHeight(v49);
      double v29 = Height;
      if (v27 >= Height) {
        double v27 = Height;
      }
      +[TUIRatingsBox spacingForSize:[(BKLibraryStarRating *)self starSize]];
      double v31 = v30;
      [(BKLibraryStarRating *)self numberOfStars];
      double v32 = v31;
      if (v33 > 1.0)
      {
        [(BKLibraryStarRating *)self numberOfStars];
        double v35 = v21 - v27 * v34;
        [(BKLibraryStarRating *)self numberOfStars];
        double v32 = v35 / (v36 + -1.0);
      }
      [(BKLibraryStarRating *)self numberOfStars];
      if (v37 > 0.0)
      {
        uint64_t v38 = 0;
        if (v31 >= v32) {
          double v39 = v32;
        }
        else {
          double v39 = v31;
        }
        double v40 = v27 + v39;
        double v41 = 0.0;
        do
        {
          v42 = [(BKLibraryStarRating *)self stars];
          v43 = [v42 objectAtIndexedSubscript:v38];

          [v43 setFrame:v41, 0.0, v27, v29];
          ++v38;
          [(BKLibraryStarRating *)self numberOfStars];
          double v41 = v40 + v41;
        }
        while (v44 > (double)v38);
      }
    }
  }
}

- (double)roundRatingForStars:(double)a3
{
  if ([(BKLibraryStarRating *)self allowHalfStars]) {
    double v5 = 2.0;
  }
  else {
    double v5 = 1.0;
  }
  [(BKLibraryStarRating *)self numberOfStars];
  double v7 = +[NSNumber numberWithInteger:llround(v5 * (v6 * a3))];
  [v7 doubleValue];
  double v9 = v8 / v5;

  [(BKLibraryStarRating *)self numberOfStars];
  return v9 / v10;
}

- (void)setRating:(double)a3
{
  [(BKLibraryStarRating *)self roundRatingForStars:a3];
  double v5 = v4;
  if (self->_rating != v4)
  {
    self->_rating = v4;
    [(BKLibraryStarRating *)self updateStars];
  }
  if (!qword_100B4A2A0)
  {
    id v6 = objc_alloc_init((Class)NSNumberFormatter);
    double v7 = (void *)qword_100B4A2A0;
    qword_100B4A2A0 = (uint64_t)v6;

    [(id)qword_100B4A2A0 setMinimumFractionDigits:0];
    [(id)qword_100B4A2A0 setMaximumFractionDigits:1];
  }
  [(BKLibraryStarRating *)self numberOfStars];
  double v9 = v5 * v8;
  double v10 = (void *)qword_100B4A2A0;
  double v11 = +[NSNumber numberWithDouble:v9];
  id v15 = [v10 stringFromNumber:v11];

  double v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"%1$.1f %2$@ star(s)" value:&stru_100A70340 table:0];

  double v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, *(void *)&v9, v15);
  [(BKLibraryStarRating *)self setAccessibilityValue:v14];
}

- (void)setRatingWithTouch:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  CGFloat v7 = v6;
  [(BKLibraryStarRating *)self bounds];
  double Width = CGRectGetWidth(v19);
  [(BKLibraryStarRating *)self bounds];
  v18.double x = v5;
  v18.double y = v7;
  if (CGRectContainsPoint(v20, v18))
  {
    [(BKLibraryStarRating *)self numberOfStars];
    double v10 = 1.0 / v9;
    double v11 = v5 / Width;
    unsigned int v12 = [(BKLibraryStarRating *)self isRTL];
    double v13 = 1.0 - v11;
    if (!v12) {
      double v13 = v11;
    }
    if (v10 >= v13) {
      double v13 = v10;
    }
    if (v13 > 1.0 - v10) {
      double v13 = 1.0;
    }
    [(BKLibraryStarRating *)self roundRatingForStars:v13];
    double v15 = v14;
    [(BKLibraryStarRating *)self rating];
    if (v16 != v15)
    {
      [(BKLibraryStarRating *)self setRating:v15];
    }
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  [(BKLibraryStarRating *)self bounds];
  if (CGRectGetWidth(v9) <= 0.0 || ([(BKLibraryStarRating *)self numberOfStars], v6 <= 0.0))
  {
    BOOL v7 = 0;
  }
  else
  {
    [(BKLibraryStarRating *)self setRatingWithTouch:v5];
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[BKLibraryStarRating setRatingWithTouch:](self, "setRatingWithTouch:", a3, a4);
  id v5 = [(BKLibraryStarRating *)self delegate];
  [(BKLibraryStarRating *)self rating];
  [v5 starRatingDidChange:self rating:];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = (void *)qword_100B4A2A8;
  if (!qword_100B4A2A8)
  {
    double v3 = +[NSBundle mainBundle];
    uint64_t v4 = [v3 localizedStringForKey:@"Rating" value:&stru_100A70340 table:0];
    id v5 = (void *)qword_100B4A2A8;
    qword_100B4A2A8 = v4;

    v2 = (void *)qword_100B4A2A8;
  }

  return v2;
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v2 = UIAccessibilityTraitNone;
  unsigned int v3 = [(BKLibraryStarRating *)self isEnabled];
  UIAccessibilityTraits v4 = UIAccessibilityTraitAdjustable;
  if (!v3) {
    UIAccessibilityTraits v4 = 0;
  }
  return v4 | v2;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (void)accessibilityIncrement
{
  [(BKLibraryStarRating *)self numberOfStars];
  if (v3 > 0.0)
  {
    [(BKLibraryStarRating *)self numberOfStars];
    double v5 = 1.0 / v4;
    [(BKLibraryStarRating *)self rating];
    -[BKLibraryStarRating roundRatingForStars:](self, "roundRatingForStars:");
    double v7 = v5 + v6;
    if (v7 > 1.0) {
      double v7 = 1.0;
    }
    [(BKLibraryStarRating *)self setRating:v7];
    id v8 = [(BKLibraryStarRating *)self delegate];
    [(BKLibraryStarRating *)self rating];
    [v8 starRatingDidChange:self];
  }
}

- (void)accessibilityDecrement
{
  [(BKLibraryStarRating *)self numberOfStars];
  if (v3 > 0.0)
  {
    [(BKLibraryStarRating *)self numberOfStars];
    double v5 = 1.0 / v4;
    [(BKLibraryStarRating *)self rating];
    -[BKLibraryStarRating roundRatingForStars:](self, "roundRatingForStars:");
    double v7 = v6 - v5;
    if (v5 >= v7) {
      double v7 = v5;
    }
    [(BKLibraryStarRating *)self setRating:v7];
    id v8 = [(BKLibraryStarRating *)self delegate];
    [(BKLibraryStarRating *)self rating];
    [v8 starRatingDidChange:self];
  }
}

- (BKLibraryStarRatingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKLibraryStarRatingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)frameColor
{
  return self->_frameColor;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)emptyColor
{
  return self->_emptyColor;
}

- (BOOL)allowHalfStars
{
  return self->_allowHalfStars;
}

- (void)setAllowHalfStars:(BOOL)a3
{
  self->_allowHalfStars = a3;
}

- (double)rating
{
  return self->_rating;
}

- (double)numberOfStars
{
  return self->_numberOfStars;
}

- (void)setNumberOfStars:(double)a3
{
  self->_numberOfStars = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (UIImage)outlineStar
{
  return self->_outlineStar;
}

- (void)setOutlineStar:(id)a3
{
}

- (UIImage)halfStar
{
  return self->_halfStar;
}

- (void)setHalfStar:(id)a3
{
}

- (UIImage)fullStar
{
  return self->_fullStar;
}

- (void)setFullStar:(id)a3
{
}

- (unint64_t)starSize
{
  return self->_starSize;
}

- (void)setStarSize:(unint64_t)a3
{
  self->_starSize = a3;
}

- (NSMutableArray)stars
{
  return self->_stars;
}

- (void)setStars:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stars, 0);
  objc_storeStrong((id *)&self->_fullStar, 0);
  objc_storeStrong((id *)&self->_halfStar, 0);
  objc_storeStrong((id *)&self->_outlineStar, 0);
  objc_storeStrong((id *)&self->_emptyColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_frameColor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end