@interface _MCDReusableCell
+ (id)cellForTableView:(id)a3 indexPath:(id)a4;
+ (id)reuseIdentifier;
- (CGSize)sizeForArtwork;
- (CGSize)sizeThatFits:(CGSize)result;
- (UIColor)placeholderHighlightedTintColor;
- (UIColor)placeholderTintColor;
- (UIImageView)artworkImageView;
- (_MCDReusableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)horizontalMargin;
- (unint64_t)artworkRadiusKind;
- (void)_updateArtworkImageViewTintColor;
- (void)layoutBadges:(id)a3;
- (void)setArtworkRadiusKind:(unint64_t)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setPlaceholderHighlightedTintColor:(id)a3;
- (void)setPlaceholderTintColor:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation _MCDReusableCell

- (_MCDReusableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_MCDReusableCell;
  v4 = [(_MCDReusableCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(_MCDReusableCell *)v4 setAccessibilityIdentifier:@"CPListItem"];
    v6 = [(_MCDReusableCell *)v5 textLabel];
    [v6 setAccessibilityIdentifier:@"CPListItemTitle"];
  }
  return v5;
}

+ (id)cellForTableView:(id)a3 indexPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() reuseIdentifier];
  objc_super v8 = [v6 dequeueReusableCellWithIdentifier:v7 forIndexPath:v5];

  return v8;
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (CGSize)sizeForArtwork
{
  double v2 = 36.0;
  double v3 = 36.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIImageView)artworkImageView
{
  return (UIImageView *)[(_MCDReusableCell *)self viewWithTag:1000];
}

- (void)setPlaceholderTintColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_placeholderTintColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_placeholderTintColor, a3);
    [(_MCDReusableCell *)self _updateArtworkImageViewTintColor];
    id v5 = v6;
  }
}

- (void)setPlaceholderHighlightedTintColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_placeholderHighlightedTintColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_placeholderHighlightedTintColor, a3);
    [(_MCDReusableCell *)self _updateArtworkImageViewTintColor];
    id v5 = v6;
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_MCDReusableCell;
  [(_MCDReusableCell *)&v5 setHighlighted:a3 animated:a4];
  [(_MCDReusableCell *)self _updateArtworkImageViewTintColor];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_MCDReusableCell;
  [(_MCDReusableCell *)&v5 setSelected:a3 animated:a4];
  [(_MCDReusableCell *)self _updateArtworkImageViewTintColor];
}

- (void)_updateArtworkImageViewTintColor
{
  id v5 = [(_MCDReusableCell *)self artworkImageView];
  if (([(_MCDReusableCell *)self isHighlighted] & 1) != 0
    || ([(_MCDReusableCell *)self isSelected] & 1) != 0)
  {
    uint64_t v3 = [(_MCDReusableCell *)self placeholderHighlightedTintColor];
  }
  else
  {
    uint64_t v3 = [(_MCDReusableCell *)self placeholderTintColor];
  }
  v4 = (void *)v3;
  [v5 setTintColor:v3];
}

- (void)setArtworkRadiusKind:(unint64_t)a3
{
  if (self->_artworkRadiusKind != a3)
  {
    self->_artworkRadiusKind = a3;
    [(_MCDReusableCell *)self setNeedsLayout];
  }
}

- (double)horizontalMargin
{
  return 8.0;
}

- (void)layoutBadges:(id)a3
{
  id v4 = a3;
  [(_MCDReusableCell *)self horizontalMargin];
  double v6 = v5;
  if ([v4 count]) {
    double v6 = v6 + (double)(unint64_t)(2 * (void)[v4 count] + 2);
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v93 objects:v98 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v94;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v94 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        [v12 setHidden:0];
        [v12 bounds];
        double v6 = v6 + v13;
      }
      id v9 = [v7 countByEnumeratingWithState:&v93 objects:v98 count:16];
    }
    while (v9);
  }

  id v14 = [(_MCDReusableCell *)self effectiveUserInterfaceLayoutDirection];
  v15 = [(_MCDReusableCell *)self textLabel];
  [v15 frame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  v24 = [(_MCDReusableCell *)self contentView];
  [v24 bounds];
  double v29 = sub_1000B4DA0((uint64_t)v14, v17, v19, v21, v23, v25, v26, v27, v28);
  CGFloat v31 = v30;
  uint64_t v88 = v32;

  id v33 = [(_MCDReusableCell *)self effectiveUserInterfaceLayoutDirection];
  v34 = [(_MCDReusableCell *)self contentView];
  [v34 frame];
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  v43 = [(_MCDReusableCell *)self contentView];
  [v43 bounds];
  CGFloat v48 = sub_1000B4DA0((uint64_t)v33, v36, v38, v40, v42, v44, v45, v46, v47);
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  CGFloat v54 = v53;

  v99.origin.x = v48;
  v99.origin.y = v50;
  v99.size.width = v52;
  v99.size.height = v54;
  double v55 = CGRectGetMaxX(v99) - v29;
  v56 = [(_MCDReusableCell *)self textLabel];
  [v56 sizeThatFits:CGSizeZero.width, CGSizeZero.height];
  double v58 = v57;

  if (v6 + v58 >= v55) {
    double v59 = v55 - v6;
  }
  else {
    double v59 = v58;
  }
  v60 = [(_MCDReusableCell *)self contentView];
  double v61 = sub_1000B4E80(v60, v29, v31, v59, v89);
  double v63 = v62;
  double v65 = v64;
  double v67 = v66;
  v68 = [(_MCDReusableCell *)self textLabel];
  [v68 setFrame:v61, v63, v65, v67];

  *(double *)rect = v29;
  v100.origin.x = v29;
  CGFloat v69 = v31;
  v100.origin.y = v31;
  CGFloat v70 = v59;
  v100.size.width = v59;
  v100.size.height = v89;
  double MaxX = CGRectGetMaxX(v100);
  memset(&rect[1], 0, 32);
  long long v91 = 0u;
  long long v92 = 0u;
  id v72 = v7;
  id v73 = [v72 countByEnumeratingWithState:&rect[1] objects:v97 count:16];
  if (v73)
  {
    id v74 = v73;
    double v75 = MaxX + 4.0;
    uint64_t v76 = *(void *)rect[3];
    do
    {
      for (j = 0; j != v74; j = (char *)j + 1)
      {
        if (*(void *)rect[3] != v76) {
          objc_enumerationMutation(v72);
        }
        v78 = *(void **)(rect[2] + 8 * (void)j);
        [v78 frame];
        CGFloat v80 = v79;
        CGFloat v82 = v81;
        CGFloat v84 = v83;
        *(void *)&v101.origin.x = rect[0];
        v101.origin.y = v69;
        v101.size.width = v70;
        v101.size.height = v89;
        double MidY = CGRectGetMidY(v101);
        v102.origin.x = v75;
        v102.origin.y = v80;
        v102.size.width = v82;
        v102.size.height = v84;
        CGFloat v86 = MidY + CGRectGetHeight(v102) * -0.5;
        v87 = [(_MCDReusableCell *)self contentView];
        [v78 setFrame:sub_1000B4E80(v87, v75, v86, v82, v84)];

        v103.origin.x = v75;
        v103.origin.y = v86;
        v103.size.width = v82;
        v103.size.height = v84;
        double v75 = CGRectGetMaxX(v103) + 2.0;
      }
      id v74 = [v72 countByEnumeratingWithState:&rect[1] objects:v97 count:16];
    }
    while (v74);
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 44.0;
  result.height = v3;
  return result;
}

- (UIColor)placeholderTintColor
{
  return self->_placeholderTintColor;
}

- (UIColor)placeholderHighlightedTintColor
{
  return self->_placeholderHighlightedTintColor;
}

- (unint64_t)artworkRadiusKind
{
  return self->_artworkRadiusKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderHighlightedTintColor, 0);

  objc_storeStrong((id *)&self->_placeholderTintColor, 0);
}

@end