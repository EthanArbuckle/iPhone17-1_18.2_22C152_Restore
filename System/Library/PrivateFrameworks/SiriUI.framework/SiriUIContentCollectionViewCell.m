@interface SiriUIContentCollectionViewCell
+ (BOOL)chevronBlendEffectEnabled;
+ (UIEdgeInsets)defaultInsets;
+ (double)chevronTrailingMargin;
+ (id)reuseIdentifier;
- (BOOL)hasChevron;
- (SiriUIContentCollectionViewCell)initWithFrame:(CGRect)a3;
- (SiriUIKeyline)keyline;
- (UIColor)keylineCustomBackgroundColor;
- (UIEdgeInsets)customViewEdgeInsets;
- (UIEdgeInsets)textAndAccessoryInsets;
- (UILabel)textLabel;
- (UIOffset)accessoryOffset;
- (UIOffset)chevronOffset;
- (UIOffset)textOffset;
- (UIView)accessoryView;
- (UIView)customView;
- (double)chevronTrailingMargin;
- (int64_t)keylineType;
- (int64_t)verticalAlignment;
- (void)_updateSubviewConstraints;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessoryOffset:(UIOffset)a3;
- (void)setAccessoryView:(id)a3;
- (void)setChevronOffset:(UIOffset)a3;
- (void)setCustomView:(id)a3;
- (void)setCustomViewEdgeInsets:(UIEdgeInsets)a3;
- (void)setHasChevron:(BOOL)a3;
- (void)setKeylineCustomBackgroundColor:(id)a3;
- (void)setKeylineType:(int64_t)a3;
- (void)setNeedsUpdateSubviewConstraints;
- (void)setTextAndAccessoryInsets:(UIEdgeInsets)a3;
- (void)setTextLabel:(id)a3;
- (void)setTextOffset:(UIOffset)a3;
- (void)setVerticalAlignment:(int64_t)a3;
- (void)updateConstraints;
@end

@implementation SiriUIContentCollectionViewCell

- (SiriUIContentCollectionViewCell)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)SiriUIContentCollectionViewCell;
  v3 = -[SiriUIClearBackgroundCell initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v5 setAutoresizingMask:18];
    v6 = objc_msgSend(MEMORY[0x263F1C550], "siriui_highlightColor");
    [v5 setBackgroundColor:v6];

    [(SiriUIContentCollectionViewCell *)v3 setSelectedBackgroundView:v5];
    v3->_keylineType = 1;
    uint64_t v7 = +[SiriUIKeyline keylineWithKeylineType:1];
    keyline = v3->_keyline;
    v3->_keyline = (SiriUIKeyline *)v7;

    [(SiriUIKeyline *)v3->_keyline setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(SiriUIContentCollectionViewCell *)v3 contentView];
    [v9 addSubview:v3->_keyline];

    v10 = objc_msgSend(MEMORY[0x263F1C6B0], "siriui_semiTransparentChevronImageAndAllowNaturalLayout:", 1);
    int v11 = [(id)objc_opt_class() chevronBlendEffectEnabled];
    id v12 = objc_alloc(MEMORY[0x263F1C6D0]);
    v13 = v10;
    if (v11)
    {
      v13 = [v10 imageWithRenderingMode:2];
    }
    uint64_t v14 = [v12 initWithImage:v13];
    chevronView = v3->_chevronView;
    v3->_chevronView = (UIImageView *)v14;

    if (v11) {
    [(UIImageView *)v3->_chevronView setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
    }
    LODWORD(v16) = 1148846080;
    [(UIImageView *)v3->_chevronView setContentHuggingPriority:0 forAxis:v16];
    [(UIImageView *)v3->_chevronView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_chevronView setHidden:1];
    v17 = [(SiriUIContentCollectionViewCell *)v3 contentView];
    [v17 addSubview:v3->_chevronView];

    if (v11)
    {
      v18 = v3->_chevronView;
      v19 = objc_msgSend(MEMORY[0x263F1C550], "siriui_blendEffectColor");
      [(UIImageView *)v18 setTintColor:v19];

      [(UIImageView *)v3->_chevronView siriui_setBlendEffectEnabled:1];
    }
    [(id)objc_opt_class() defaultInsets];
    v3->_textAndAccessoryInsets.top = v20;
    v3->_textAndAccessoryInsets.left = v21;
    v3->_textAndAccessoryInsets.bottom = v22;
    v3->_textAndAccessoryInsets.right = v23;
    v3->_verticalAlignment = 0;
    uint64_t v24 = [MEMORY[0x263EFF980] array];
    subviewConstraints = v3->_subviewConstraints;
    v3->_subviewConstraints = (NSMutableArray *)v24;
  }
  return v3;
}

- (void)setKeylineType:(int64_t)a3
{
  if (self->_keylineType != a3)
  {
    self->_keylineType = a3;
    -[SiriUIKeyline setKeylineType:](self->_keyline, "setKeylineType:");
    [(SiriUIContentCollectionViewCell *)self setNeedsUpdateSubviewConstraints];
  }
}

- (void)setKeylineCustomBackgroundColor:(id)a3
{
}

- (UIColor)keylineCustomBackgroundColor
{
  return [(SiriUIKeyline *)self->_keyline customBackgroundColor];
}

- (void)_updateSubviewConstraints
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_subviewConstraints count])
  {
    [(SiriUIContentCollectionViewCell *)self removeConstraints:self->_subviewConstraints];
    [(NSMutableArray *)self->_subviewConstraints removeAllObjects];
  }
  if (self->_textLabel && self->_accessoryView)
  {
    subviewConstraints = self->_subviewConstraints;
    id v4 = objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", 1.0, -15.0);
    [(NSMutableArray *)subviewConstraints addObject:v4];
  }
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    v6 = accessoryView;
  }
  else
  {
    v6 = self->_textLabel;
    if (!v6) {
      goto LABEL_15;
    }
  }
  double horizontal = 0.0;
  if (v6 == (UILabel *)self->_accessoryView) {
    double horizontal = self->_accessoryOffset.horizontal;
  }
  double v8 = horizontal + self->_textAndAccessoryInsets.right;
  v9 = self->_subviewConstraints;
  v10 = (void *)MEMORY[0x263F08938];
  if (self->_hasChevron)
  {
    int v11 = [MEMORY[0x263F08938] constraintWithItem:v6 attribute:6 relatedBy:0 toItem:self->_chevronView attribute:5 multiplier:1.0 constant:-v8];
    [(NSMutableArray *)v9 addObject:v11];
  }
  else
  {
    int v11 = [(SiriUIContentCollectionViewCell *)self contentView];
    id v12 = [v10 constraintWithItem:v6 attribute:6 relatedBy:0 toItem:v11 attribute:6 multiplier:1.0 constant:-v8];
    [(NSMutableArray *)v9 addObject:v12];
  }
LABEL_15:
  textLabel = self->_textLabel;
  if (textLabel)
  {
    uint64_t v14 = self->_subviewConstraints;
    v15 = (void *)MEMORY[0x263F08938];
    double v16 = [(SiriUIContentCollectionViewCell *)self contentView];
    v17 = [v15 constraintWithItem:textLabel attribute:5 relatedBy:0 toItem:v16 attribute:5 multiplier:1.0 constant:self->_textAndAccessoryInsets.left + self->_textOffset.horizontal];
    [(NSMutableArray *)v14 addObject:v17];
  }
  v18 = [MEMORY[0x263EFF980] array];
  v19 = v18;
  if (self->_chevronView) {
    objc_msgSend(v18, "addObject:");
  }
  if (self->_textLabel) {
    objc_msgSend(v19, "addObject:");
  }
  v50 = v6;
  if (self->_accessoryView) {
    objc_msgSend(v19, "addObject:");
  }
  keyline = self->_keyline;
  if (keyline)
  {
    CGFloat v21 = self->_subviewConstraints;
    CGFloat v22 = (void *)MEMORY[0x263F08938];
    CGFloat v23 = [(SiriUIContentCollectionViewCell *)self contentView];
    uint64_t v24 = [v22 constraintWithItem:keyline attribute:4 relatedBy:0 toItem:v23 attribute:4 multiplier:1.0 constant:0.0];
    [(NSMutableArray *)v21 addObject:v24];

    v25 = self->_subviewConstraints;
    v26 = (void *)MEMORY[0x263F08938];
    objc_super v27 = _NSDictionaryOfVariableBindings(&cfstr_Keyline_0.isa, self->_keyline, 0, v6);
    v28 = [v26 constraintsWithVisualFormat:@"|[_keyline]|" options:0 metrics:0 views:v27];
    [(NSMutableArray *)v25 addObjectsFromArray:v28];
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v19;
  uint64_t v29 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v53 != v31) {
          objc_enumerationMutation(obj);
        }
        v33 = *(UIImageView **)(*((void *)&v52 + 1) + 8 * i);
        if (v33 == (UIImageView *)self->_accessoryView)
        {
          v35 = &OBJC_IVAR___SiriUIContentCollectionViewCell__accessoryOffset;
        }
        else if (v33 == (UIImageView *)self->_textLabel)
        {
          v35 = &OBJC_IVAR___SiriUIContentCollectionViewCell__textOffset;
        }
        else
        {
          double v34 = 0.0;
          if (v33 != self->_chevronView) {
            goto LABEL_37;
          }
          v35 = &OBJC_IVAR___SiriUIContentCollectionViewCell__chevronOffset;
        }
        double v34 = *(double *)((char *)&self->super.super.super.super.super._responderFlags + *v35);
LABEL_37:
        int64_t verticalAlignment = self->_verticalAlignment;
        if (verticalAlignment)
        {
          if (verticalAlignment != 1) {
            continue;
          }
          v37 = self->_subviewConstraints;
          v38 = (void *)MEMORY[0x263F08938];
          v39 = [(SiriUIContentCollectionViewCell *)self contentView];
          double top = v34 + self->_textAndAccessoryInsets.top;
          double v41 = 1.0;
          v42 = v38;
          v43 = v33;
          uint64_t v44 = 3;
          v45 = v39;
          uint64_t v46 = 3;
        }
        else
        {
          v37 = self->_subviewConstraints;
          v47 = (void *)MEMORY[0x263F08938];
          v39 = [(SiriUIContentCollectionViewCell *)self contentView];
          double top = self->_textAndAccessoryInsets.top;
          double v41 = 1.0;
          v42 = v47;
          v43 = v33;
          uint64_t v44 = 10;
          v45 = v39;
          uint64_t v46 = 10;
        }
        v48 = [v42 constraintWithItem:v43 attribute:v44 relatedBy:0 toItem:v45 attribute:v46 multiplier:v41 constant:top];
        [(NSMutableArray *)v37 addObject:v48];
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v30);
  }

  v49 = [(SiriUIContentCollectionViewCell *)self contentView];
  [v49 addConstraints:self->_subviewConstraints];
}

- (void)updateConstraints
{
  v9.receiver = self;
  v9.super_class = (Class)SiriUIContentCollectionViewCell;
  [(SiriUIContentCollectionViewCell *)&v9 updateConstraints];
  if (!self->_hasSetupStaticSubviewConstraints)
  {
    if (self->_chevronView)
    {
      v3 = [(SiriUIContentCollectionViewCell *)self contentView];
      id v4 = (void *)MEMORY[0x263F08938];
      chevronView = self->_chevronView;
      v6 = [(SiriUIContentCollectionViewCell *)self contentView];
      [(id)objc_opt_class() defaultInsets];
      double v8 = [v4 constraintWithItem:chevronView attribute:6 relatedBy:0 toItem:v6 attribute:6 multiplier:1.0 constant:-v7];
      [v3 addConstraint:v8];
    }
    self->_hasSetupStaticSubviewConstraints = 1;
  }
  if (!self->_hasSetUpSubviewConstraints)
  {
    [(SiriUIContentCollectionViewCell *)self _updateSubviewConstraints];
    self->_hasSetUpSubviewConstraints = 1;
  }
}

- (void)layoutSubviews
{
  [(UIView *)self recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
  v34.receiver = self;
  v34.super_class = (Class)SiriUIContentCollectionViewCell;
  [(SiriUIContentCollectionViewCell *)&v34 layoutSubviews];
  [(SiriUIContentCollectionViewCell *)self bounds];
  CGFloat v4 = v3;
  double v30 = v5;
  double v31 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v32 = v7;
  double v33 = v9;
  CGFloat v10 = v9;
  CGFloat v11 = *MEMORY[0x263F00148];
  CGFloat v12 = *(double *)(MEMORY[0x263F00148] + 8);
  -[SiriUIKeyline sizeThatFits:](self->_keyline, "sizeThatFits:", v7, v9);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  double Height = CGRectGetHeight(v35);
  v36.origin.x = v11;
  v36.origin.y = v12;
  v36.size.width = v14;
  v36.size.height = v16;
  CGFloat v18 = Height - CGRectGetHeight(v36);
  [(SiriUIContentCollectionViewCell *)self bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  v37.origin.x = v11;
  v37.origin.y = v18;
  v37.size.width = v14;
  v37.size.height = v16;
  double v27 = v22 - CGRectGetHeight(v37);
  v38.origin.x = v11;
  v38.origin.y = v18;
  v38.size.width = v14;
  v38.size.height = v16;
  double v28 = v26 + CGRectGetHeight(v38);
  uint64_t v29 = [(SiriUIContentCollectionViewCell *)self selectedBackgroundView];
  objc_msgSend(v29, "setFrame:", v20, v27, v24, v28);

  -[UIView setFrame:](self->_customView, "setFrame:", v31 + self->_customViewEdgeInsets.left, v30 + self->_customViewEdgeInsets.top, v32 - (self->_customViewEdgeInsets.left + self->_customViewEdgeInsets.right), v33 - (self->_customViewEdgeInsets.top + self->_customViewEdgeInsets.bottom));
}

- (void)setCustomView:(id)a3
{
  double v5 = (UIView *)a3;
  customView = self->_customView;
  CGFloat v8 = v5;
  if (customView != v5)
  {
    [(UIView *)customView removeFromSuperview];
    objc_storeStrong((id *)&self->_customView, a3);
    double v7 = [(SiriUIContentCollectionViewCell *)self contentView];
    [v7 addSubview:v8];

    [(SiriUIContentCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setAccessoryView:(id)a3
{
  double v5 = (UIView *)a3;
  p_accessoryView = &self->_accessoryView;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    v17 = v5;
    [(UIView *)accessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_accessoryView, a3);
    if (*p_accessoryView)
    {
      CGFloat v8 = [(SiriUIContentCollectionViewCell *)self contentView];
      [v8 addSubview:*p_accessoryView];

      [(UIView *)*p_accessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
      double v9 = *p_accessoryView;
      CGFloat v10 = (void *)MEMORY[0x263F08938];
      [(UIView *)*p_accessoryView frame];
      CGFloat v12 = [v10 constraintWithItem:v9 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v11];
      [(UIView *)v9 addConstraint:v12];

      double v13 = *p_accessoryView;
      CGFloat v14 = (void *)MEMORY[0x263F08938];
      [(UIView *)v13 frame];
      CGFloat v16 = [v14 constraintWithItem:v13 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v15];
      [(UIView *)v13 addConstraint:v16];
    }
    accessoryView = (UIView *)[(SiriUIContentCollectionViewCell *)self setNeedsUpdateSubviewConstraints];
    double v5 = v17;
  }
  MEMORY[0x270F9A758](accessoryView, v5);
}

- (void)setVerticalAlignment:(int64_t)a3
{
  if (self->_verticalAlignment != a3)
  {
    self->_int64_t verticalAlignment = a3;
    [(SiriUIContentCollectionViewCell *)self setNeedsUpdateSubviewConstraints];
  }
}

- (void)setTextLabel:(id)a3
{
  double v5 = (UILabel *)a3;
  p_textLabel = &self->_textLabel;
  textLabel = self->_textLabel;
  if (textLabel != v5)
  {
    double v9 = v5;
    [(UILabel *)textLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_textLabel, a3);
    if (*p_textLabel)
    {
      [(UILabel *)*p_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      CGFloat v8 = [(SiriUIContentCollectionViewCell *)self contentView];
      [v8 addSubview:*p_textLabel];
    }
    textLabel = (UILabel *)[(SiriUIContentCollectionViewCell *)self setNeedsUpdateSubviewConstraints];
    double v5 = v9;
  }
  MEMORY[0x270F9A758](textLabel, v5);
}

- (void)setTextOffset:(UIOffset)a3
{
  if (a3.horizontal != self->_textOffset.horizontal || a3.vertical != self->_textOffset.vertical)
  {
    self->_textOffset = a3;
    [(SiriUIContentCollectionViewCell *)self setNeedsUpdateSubviewConstraints];
  }
}

- (void)setAccessoryOffset:(UIOffset)a3
{
  if (a3.horizontal != self->_accessoryOffset.horizontal || a3.vertical != self->_accessoryOffset.vertical)
  {
    self->_accessoryOffset = a3;
    [(SiriUIContentCollectionViewCell *)self setNeedsUpdateSubviewConstraints];
  }
}

- (void)setHasChevron:(BOOL)a3
{
  if (self->_hasChevron != a3)
  {
    self->_hasChevron = a3;
    [(SiriUIContentCollectionViewCell *)self setNeedsUpdateSubviewConstraints];
    chevronView = self->_chevronView;
    BOOL v5 = !self->_hasChevron;
    [(UIImageView *)chevronView setHidden:v5];
  }
}

+ (UIEdgeInsets)defaultInsets
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 scale];
  double v4 = ceil(16.0);
  if (v3 >= 2.0) {
    double v5 = 16.0;
  }
  else {
    double v5 = v4;
  }
  if (v3 >= 2.0) {
    double v6 = 16.0;
  }
  else {
    double v6 = v4;
  }

  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v5;
  double v10 = v6;
  result.right = v10;
  result.bottom = v8;
  result.left = v9;
  result.double top = v7;
  return result;
}

+ (double)chevronTrailingMargin
{
  [a1 defaultInsets];
  return v2 + 16.0;
}

+ (BOOL)chevronBlendEffectEnabled
{
  return 0;
}

- (double)chevronTrailingMargin
{
  if (!self->_hasChevron) {
    return 0.0;
  }
  double v2 = objc_opt_class();
  [v2 chevronTrailingMargin];
  return result;
}

- (void)setNeedsUpdateSubviewConstraints
{
  self->_hasSetUpSubviewConstraints = 0;
  [(SiriUIContentCollectionViewCell *)self setNeedsUpdateConstraints];
}

+ (id)reuseIdentifier
{
  double v2 = (objc_class *)objc_opt_class();
  double v3 = NSStringFromClass(v2);
  double v4 = [v3 stringByAppendingString:@"ReuseIdentifier"];

  return v4;
}

- (void)prepareForReuse
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)SiriUIContentCollectionViewCell;
  [(SiriUIContentCollectionViewCell *)&v21 prepareForReuse];
  self->_int64_t verticalAlignment = 0;
  [(id)objc_opt_class() defaultInsets];
  self->_textAndAccessoryInsets.double top = v3;
  self->_textAndAccessoryInsets.left = v4;
  self->_textAndAccessoryInsets.bottom = v5;
  self->_textAndAccessoryInsets.right = v6;
  UIOffset v7 = (UIOffset)*MEMORY[0x263F1D4E8];
  self->_textOffset = (UIOffset)*MEMORY[0x263F1D4E8];
  self->_accessoryOffset = v7;
  [(UIView *)self->_accessoryView removeFromSuperview];
  accessoryView = self->_accessoryView;
  self->_accessoryView = 0;

  [(SiriUIContentCollectionViewCell *)self removeConstraints:self->_subviewConstraints];
  [(SiriUIContentCollectionViewCell *)self setNeedsUpdateSubviewConstraints];
  [(UILabel *)self->_textLabel removeFromSuperview];
  textLabel = self->_textLabel;
  self->_textLabel = 0;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v10 = [(SiriUIContentCollectionViewCell *)self contentView];
  double v11 = [v10 subviews];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        CGFloat v16 = *(SiriUIKeyline **)(*((void *)&v17 + 1) + 8 * v15);
        if (v16 != self->_keyline && v16 != (SiriUIKeyline *)self->_chevronView) {
          [(SiriUIKeyline *)v16 removeFromSuperview];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v13);
  }
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (UIEdgeInsets)textAndAccessoryInsets
{
  double top = self->_textAndAccessoryInsets.top;
  double left = self->_textAndAccessoryInsets.left;
  double bottom = self->_textAndAccessoryInsets.bottom;
  double right = self->_textAndAccessoryInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextAndAccessoryInsets:(UIEdgeInsets)a3
{
  self->_textAndAccessoryInsets = a3;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UIView)customView
{
  return self->_customView;
}

- (UIEdgeInsets)customViewEdgeInsets
{
  double top = self->_customViewEdgeInsets.top;
  double left = self->_customViewEdgeInsets.left;
  double bottom = self->_customViewEdgeInsets.bottom;
  double right = self->_customViewEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCustomViewEdgeInsets:(UIEdgeInsets)a3
{
  self->_customViewEdgeInsets = a3;
}

- (UIOffset)textOffset
{
  double horizontal = self->_textOffset.horizontal;
  double vertical = self->_textOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (UIOffset)accessoryOffset
{
  double horizontal = self->_accessoryOffset.horizontal;
  double vertical = self->_accessoryOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (UIOffset)chevronOffset
{
  double horizontal = self->_chevronOffset.horizontal;
  double vertical = self->_chevronOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setChevronOffset:(UIOffset)a3
{
  self->_chevronOffset = a3;
}

- (SiriUIKeyline)keyline
{
  return self->_keyline;
}

- (int64_t)keylineType
{
  return self->_keylineType;
}

- (BOOL)hasChevron
{
  return self->_hasChevron;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_subviewConstraints, 0);
  objc_storeStrong((id *)&self->rightChevronWidthConstraint, 0);
  objc_storeStrong((id *)&self->leftChevronWidthConstraint, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_keyline, 0);
}

@end