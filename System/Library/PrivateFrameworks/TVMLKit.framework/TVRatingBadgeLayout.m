@interface TVRatingBadgeLayout
+ (id)layoutWithLayout:(id)a3 element:(id)a4;
- (NSString)ratingStyle;
- (NSString)ratingStyleAXLarge;
- (NSString)ratingStyleAXSmall;
- (UIColor)fillColor;
- (double)interitemSpacing;
- (double)interitemSpacingAXLarge;
- (double)interitemSpacingAXSmall;
- (void)setFillColor:(id)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setInteritemSpacingAXLarge:(double)a3;
- (void)setInteritemSpacingAXSmall:(double)a3;
- (void)setRatingStyle:(id)a3;
- (void)setRatingStyleAXLarge:(id)a3;
- (void)setRatingStyleAXSmall:(id)a3;
@end

@implementation TVRatingBadgeLayout

+ (id)layoutWithLayout:(id)a3 element:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = v8;
  if (!v8) {
    v9 = objc_opt_new();
  }
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___TVRatingBadgeLayout;
  id v10 = objc_msgSendSuper2(&v21, sel_layoutWithLayout_element_, v9, v7);
  v11 = [v7 style];
  v12 = [v9 tintColor];

  if (!v12)
  {
    v13 = [MEMORY[0x263F1C550] whiteColor];
    [v9 setTintColor:v13];
  }
  v14 = objc_msgSend(v11, "tv_tintColor2");
  v15 = [v14 color];

  if (v15) {
    [v9 setFillColor:v15];
  }
  v16 = [v9 fillColor];

  if (!v16)
  {
    v17 = [MEMORY[0x263F1C550] blackColor];
    [v9 setFillColor:v17];
  }
  v18 = objc_msgSend(v11, "tv_ratingStyle");
  if (v18)
  {
    [v9 setRatingStyle:v18];
    [v9 setRatingStyleAXSmall:v18];
    [v9 setRatingStyleAXLarge:v18];
  }
  v19 = objc_msgSend(v11, "tv_valueForStyle:", @"tv-interitem-spacing");

  if (v19)
  {
    objc_msgSend(v11, "tv_interitemSpacing");
    objc_msgSend(v9, "setInteritemSpacing:");
    [v9 interitemSpacing];
    objc_msgSend(v9, "setInteritemSpacingAXSmall:");
    [v9 interitemSpacing];
    objc_msgSend(v9, "setInteritemSpacingAXLarge:");
  }

  return v9;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
}

- (NSString)ratingStyle
{
  return self->_ratingStyle;
}

- (void)setRatingStyle:(id)a3
{
}

- (NSString)ratingStyleAXSmall
{
  return self->_ratingStyleAXSmall;
}

- (void)setRatingStyleAXSmall:(id)a3
{
}

- (NSString)ratingStyleAXLarge
{
  return self->_ratingStyleAXLarge;
}

- (void)setRatingStyleAXLarge:(id)a3
{
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (double)interitemSpacingAXSmall
{
  return self->_interitemSpacingAXSmall;
}

- (void)setInteritemSpacingAXSmall:(double)a3
{
  self->_interitemSpacingAXSmall = a3;
}

- (double)interitemSpacingAXLarge
{
  return self->_interitemSpacingAXLarge;
}

- (void)setInteritemSpacingAXLarge:(double)a3
{
  self->_interitemSpacingAXLarge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingStyleAXLarge, 0);
  objc_storeStrong((id *)&self->_ratingStyleAXSmall, 0);
  objc_storeStrong((id *)&self->_ratingStyle, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end