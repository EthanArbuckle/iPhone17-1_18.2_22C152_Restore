@interface BKLibraryCollectionsListCell
- (BKLibraryCollectionsListCellAccessibilityDelegate)accessibilityDelegate;
- (BKLibraryCollectionsListMetrics)metrics;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)dimmed;
- (BOOL)isAccessibilityElement;
- (BOOL)isButton;
- (BOOL)isHiddenDefaultCollection;
- (BOOL)isShownDefaultCollectionInEditMode;
- (NSArray)textEntryFieldConstraints;
- (UIImageView)chevron;
- (UIImageView)imageView;
- (UILabel)detailTextLabel;
- (UILabel)textLabel;
- (UITextField)textEntryField;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityHint;
- (id)accessibilityValue;
- (id)editControl;
- (unint64_t)accessibilityTraits;
- (void)dealloc;
- (void)p_buildSubviews;
- (void)p_updateCellFromMetrics:(id)a3;
- (void)p_updateTextEntryFromMetrics:(id)a3;
- (void)prepareForReuse;
- (void)removeTextEntryField;
- (void)setAccessibilityDelegate:(id)a3;
- (void)setChevron:(id)a3;
- (void)setDetailTextLabel:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setTextEntryField:(id)a3;
- (void)setTextEntryFieldConstraints:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setupTextEntryField:(id)a3;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation BKLibraryCollectionsListCell

- (void)dealloc
{
  [(UITextField *)self->_textEntryField setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryCollectionsListCell;
  [(BKLibraryCollectionsListCell *)&v3 dealloc];
}

- (void)p_buildSubviews
{
  if (!self->_imageView)
  {
    id v33 = [(BKLibraryCollectionsListCell *)self contentView];
    id v3 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v7 = [v3 initWithFrame:CGRectMake(0, 0, width, height)];
    [(UIImageView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [(UILabel *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v9) = 1131413504;
    [(UILabel *)v8 setContentHuggingPriority:0 forAxis:v9];
    LODWORD(v10) = 1132068864;
    [(UILabel *)v8 setContentCompressionResistancePriority:0 forAxis:v10];
    [(UILabel *)v8 setNumberOfLines:3];
    [(UILabel *)v8 setLineBreakMode:5];
    [(UILabel *)v8 setTextAlignment:4];
    [(UILabel *)v8 setAdjustsFontSizeToFitWidth:0];
    v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [(UILabel *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v11 setTextAlignment:2];
    v12 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    [(UIImageView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    imageView = self->_imageView;
    self->_imageView = v7;
    v14 = v7;

    textLabel = self->_textLabel;
    self->_textLabel = v8;
    v16 = v8;

    detailTextLabel = self->_detailTextLabel;
    self->_detailTextLabel = v11;
    v18 = v11;

    chevron = self->_chevron;
    self->_chevron = v12;
    v20 = v12;

    v21 = [(BKLibraryCollectionsListCell *)self metrics];
    [(BKLibraryCollectionsListCell *)self p_updateCellFromMetrics:v21];

    [v33 addSubview:v14];
    [v33 addSubview:v16];
    [v33 addSubview:v18];
    [v33 addSubview:v20];
    v22 = _NSDictionaryOfVariableBindings(@"contentsImageViewHorizontalInset, contentsVerticalInset, contentsChevronHorizontalInset", &off_100A836B0, &off_100A836C0, &off_100A836B0, 0);
    v23 = _NSDictionaryOfVariableBindings(@"imageView, textLabel, detailTextLabel, chevron", v14, v16, v18, v20, 0);
    v24 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-(contentsImageViewHorizontalInset)-[imageView]-[textLabel]-[detailTextLabel]-[chevron]-(contentsChevronHorizontalInset)-|", 0, v22, v23);
    [v33 addConstraints:v24];

    v25 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=contentsVerticalInset)-[imageView]-(>=contentsVerticalInset)-|", 0, v22, v23);
    [v33 addConstraints:v25];

    v26 = +[NSLayoutConstraint constraintWithItem:v14 attribute:10 relatedBy:0 toItem:v33 attribute:10 multiplier:1.0 constant:0.0];
    [v33 addConstraint:v26];

    v27 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=contentsVerticalInset)-[textLabel]-(>=contentsVerticalInset)-|", 0, v22, v23);
    [v33 addConstraints:v27];

    v28 = +[NSLayoutConstraint constraintWithItem:v16 attribute:10 relatedBy:0 toItem:v33 attribute:10 multiplier:1.0 constant:0.0];
    [v33 addConstraint:v28];

    v29 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=contentsVerticalInset)-[detailTextLabel]-(>=contentsVerticalInset)-|", 0, v22, v23);
    [v33 addConstraints:v29];

    v30 = +[NSLayoutConstraint constraintWithItem:v18 attribute:10 relatedBy:0 toItem:v33 attribute:10 multiplier:1.0 constant:0.0];
    [v33 addConstraint:v30];

    v31 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=contentsVerticalInset)-[chevron]-(>=contentsVerticalInset)-|", 0, v22, v23);
    [v33 addConstraints:v31];

    v32 = +[NSLayoutConstraint constraintWithItem:v20 attribute:10 relatedBy:0 toItem:v33 attribute:10 multiplier:1.0 constant:0.0];

    [v33 addConstraint:v32];
  }
}

- (UIImageView)imageView
{
  [(BKLibraryCollectionsListCell *)self p_buildSubviews];
  imageView = self->_imageView;

  return imageView;
}

- (UILabel)textLabel
{
  [(BKLibraryCollectionsListCell *)self p_buildSubviews];
  textLabel = self->_textLabel;

  return textLabel;
}

- (UILabel)detailTextLabel
{
  [(BKLibraryCollectionsListCell *)self p_buildSubviews];
  detailTextLabel = self->_detailTextLabel;

  return detailTextLabel;
}

- (UIImageView)chevron
{
  [(BKLibraryCollectionsListCell *)self p_buildSubviews];
  chevron = self->_chevron;

  return chevron;
}

- (void)prepareForReuse
{
  [(BKLibraryCollectionsListCell *)self removeTextEntryField];
  [(BKLibraryCollectionsListCell *)self setMetrics:0];
  [(BKLibraryCollectionsListCell *)self setEditing:0];
  [(BKLibraryCollectionsListCell *)self setSelectedBackgroundView:0];
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryCollectionsListCell;
  [(BKLibraryCollectionsListCell *)&v4 prepareForReuse];
}

- (void)removeTextEntryField
{
  id v5 = [(BKLibraryCollectionsListCell *)self textEntryField];
  if (v5)
  {
    id v3 = [(BKLibraryCollectionsListCell *)self contentView];
    objc_super v4 = [(BKLibraryCollectionsListCell *)self textEntryFieldConstraints];
    [v3 removeConstraints:v4];

    [(BKLibraryCollectionsListCell *)self setTextEntryFieldConstraints:0];
    [v5 removeFromSuperview];
    [v5 setDelegate:0];
    [(BKLibraryCollectionsListCell *)self setTextEntryField:0];
  }
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    id v4 = [(BKLibraryCollectionsListCell *)self metrics];
    [(BKLibraryCollectionsListCell *)self p_updateCellFromMetrics:v4];
  }
}

- (void)willTransitionToState:(unint64_t)a3
{
  char v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryCollectionsListCell;
  -[BKLibraryCollectionsListCell willTransitionToState:](&v6, "willTransitionToState:");
  id v5 = [(BKLibraryCollectionsListCell *)self chevron];
  [v5 setHidden:(v3 & 3) != 0];
}

- (void)setupTextEntryField:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryCollectionsListCell *)self textEntryField];
  if (!v5)
  {
    id v5 = [objc_alloc((Class)UITextField) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(BKLibraryCollectionsListCell *)self setTextEntryField:v5];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v6) = 1131413504;
    [v5 setContentHuggingPriority:0 forAxis:v6];
    LODWORD(v7) = 1132068864;
    [v5 setContentCompressionResistancePriority:0 forAxis:v7];
    [v5 setKeyboardType:0];
    [v5 setReturnKeyType:9];
    [v5 setAutocapitalizationType:1];
    [v5 setAdjustsFontSizeToFitWidth:0];
    [v5 setTextAlignment:4];
    [v5 setContentVerticalAlignment:0];
    [v5 setOpaque:0];
    v8 = +[UIColor clearColor];
    [v5 setBackgroundColor:v8];

    double v9 = [(BKLibraryCollectionsListCell *)self contentView];
    double v10 = [(BKLibraryCollectionsListCell *)self textLabel];
    v11 = [(BKLibraryCollectionsListCell *)self metrics];
    [(BKLibraryCollectionsListCell *)self p_updateTextEntryFromMetrics:v11];

    [v9 addSubview:v5];
    v12 = +[NSLayoutConstraint constraintWithItem:v5 attribute:3 relatedBy:0 toItem:v10 attribute:3 multiplier:1.0 constant:0.0];
    v17[0] = v12;
    v13 = +[NSLayoutConstraint constraintWithItem:v5 attribute:4 relatedBy:0 toItem:v10 attribute:4 multiplier:1.0 constant:0.0];
    v17[1] = v13;
    v14 = +[NSLayoutConstraint constraintWithItem:v5 attribute:5 relatedBy:0 toItem:v10 attribute:5 multiplier:1.0 constant:0.0];
    v17[2] = v14;
    v15 = +[NSLayoutConstraint constraintWithItem:v5 attribute:6 relatedBy:0 toItem:v10 attribute:6 multiplier:1.0 constant:0.0];
    v17[3] = v15;
    v16 = +[NSArray arrayWithObjects:v17 count:4];

    [v9 addConstraints:v16];
    [(BKLibraryCollectionsListCell *)self setTextEntryFieldConstraints:v16];
  }
  [v5 setDelegate:v4];
}

- (void)p_updateCellFromMetrics:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v30 = v4;
    id v5 = [v4 tableBackgroundColor];
    [(BKLibraryCollectionsListCell *)self setBackgroundColor:v5];

    double v6 = [v30 tableCellSelectedBackgroundColor];

    if (v6)
    {
      id v7 = objc_alloc_init((Class)UIView);
      v8 = [v30 tableCellSelectedBackgroundColor];
      [v7 setBackgroundColor:v8];

      [(BKLibraryCollectionsListCell *)self setSelectedBackgroundView:v7];
    }
    if (self->_textLabel || self->_detailTextLabel)
    {
      if ([(BKLibraryCollectionsListCell *)self dimmed])
      {
        double v9 = [v30 tableCellDimmedTextFontAttributes];
        double v10 = [v9 font];

        v11 = [v30 tableCellDimmedTextFontAttributes];
        v12 = [v11 foregroundColor];

        v13 = [v30 tableCellDetailDimmedTextFontAttributes];
        v14 = [v13 font];

        v15 = [v30 tableCellDetailDimmedTextFontAttributes];
        v16 = [v15 foregroundColor];

        [v30 collectionIconDimmedAlpha];
      }
      else
      {
        v18 = [v30 tableCellNormalTextFontAttributes];
        double v10 = [v18 font];

        v19 = [v30 tableCellNormalTextFontAttributes];
        v12 = [v19 foregroundColor];

        v20 = [v30 tableCellDetailNormalTextFontAttributes];
        v14 = [v20 font];

        v21 = [v30 tableCellDetailNormalTextFontAttributes];
        v16 = [v21 foregroundColor];

        double v17 = 1.0;
      }
      [(UIImageView *)self->_imageView setAlpha:v17];
      [(UILabel *)self->_textLabel setFont:v10];
      [(UILabel *)self->_textLabel setTextColor:v12];
      [(UILabel *)self->_detailTextLabel setFont:v14];
      [(UILabel *)self->_detailTextLabel setTextColor:v16];
    }
    v22 = [v30 chevronFontAttributes];
    v23 = [v22 font];
    v24 = +[UIImageSymbolConfiguration configurationWithFont:v23 scale:1];

    v25 = [v30 chevronName];
    v26 = +[UIImage systemImageNamed:v25];
    v27 = [v26 imageWithConfiguration:v24];

    [(UIImageView *)self->_chevron setImage:v27];
    v28 = [v30 chevronFontAttributes];
    v29 = [v28 foregroundColor];
    [(UIImageView *)self->_chevron setTintColor:v29];

    id v4 = v30;
  }
}

- (void)p_updateTextEntryFromMetrics:(id)a3
{
  if (a3)
  {
    if (self->_textEntryField)
    {
      id v4 = a3;
      id v5 = [v4 tableCellNormalTextFontAttributes];
      double v6 = [v5 font];
      [(UITextField *)self->_textEntryField setFont:v6];

      id v7 = [v4 tableCellNormalTextFontAttributes];
      v8 = [v7 foregroundColor];
      [(UITextField *)self->_textEntryField setTextColor:v8];

      unsigned int v9 = [v4 darkAppearance];
      if ([(UITextField *)self->_textEntryField keyboardAppearance] != (id)v9)
      {
        [(UITextField *)self->_textEntryField setKeyboardAppearance:v9];
        textEntryField = self->_textEntryField;
        [(UITextField *)textEntryField reloadInputViews];
      }
    }
  }
}

- (void)setMetrics:(id)a3
{
  id v5 = (BKLibraryCollectionsListMetrics *)a3;
  if (self->_metrics != v5)
  {
    objc_storeStrong((id *)&self->_metrics, a3);
    [(BKLibraryCollectionsListCell *)self p_updateCellFromMetrics:v5];
    [(BKLibraryCollectionsListCell *)self p_updateTextEntryFromMetrics:v5];
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([(BKLibraryCollectionsListCell *)self isHiddenDefaultCollection])
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"Hidden" value:&stru_100A70340 table:0];
    [v3 addObject:v5];
  }
  if ([v3 count])
  {
    double v6 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)accessibilityHint
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([(BKLibraryCollectionsListCell *)self isEditing]
    && ([(BKLibraryCollectionsListCell *)self accessibilityDelegate],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 bkaxIsCustomCollectionCell:self],
        v4,
        v5))
  {
    double v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Double tap to rename";
  }
  else if ([(BKLibraryCollectionsListCell *)self isHiddenDefaultCollection])
  {
    double v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Double tap to show";
  }
  else
  {
    if (![(BKLibraryCollectionsListCell *)self isShownDefaultCollectionInEditMode]) {
      goto LABEL_9;
    }
    double v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Double tap to hide";
  }
  unsigned int v9 = [v6 localizedStringForKey:v8 value:&stru_100A70340 table:0];
  [v3 addObject:v9];

LABEL_9:
  double v10 = [(BKLibraryCollectionsListCell *)self accessibilityDelegate];
  unsigned int v11 = [v10 bkaxIsCustomCollectionCell:self];

  if (v11)
  {
    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"Double tap and hold, then drag to rearrange", &stru_100A70340, 0 value table];
    [v3 addObject:v13];
  }
  if ([v3 count])
  {
    v14 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryCollectionsListCell;
  unint64_t v3 = [(BKLibraryCollectionsListCell *)&v6 accessibilityTraits];
  if ([(BKLibraryCollectionsListCell *)self dimmed]
    && ([(BKLibraryCollectionsListCell *)self isEditing] & 1) == 0)
  {
    UIAccessibilityTraits v4 = UIAccessibilityTraitNotEnabled | v3;
  }
  else
  {
    UIAccessibilityTraits v4 = v3 & ~UIAccessibilityTraitNotEnabled;
  }
  if ([(BKLibraryCollectionsListCell *)self isButton]) {
    return UIAccessibilityTraitButton | v4;
  }
  else {
    return v4 & ~UIAccessibilityTraitButton;
  }
}

- (id)accessibilityDragSourceDescriptors
{
  if ([(BKLibraryCollectionsListCell *)self showsReorderControl])
  {
    v5.receiver = self;
    v5.super_class = (Class)BKLibraryCollectionsListCell;
    unint64_t v3 = [(BKLibraryCollectionsListCell *)&v5 accessibilityDragSourceDescriptors];
  }
  else
  {
    unint64_t v3 = &__NSArray0__struct;
  }

  return v3;
}

- (id)accessibilityDropPointDescriptors
{
  if (![(BKLibraryCollectionsListCell *)self showsReorderControl])
  {
    id v10 = &__NSArray0__struct;
    goto LABEL_11;
  }
  id v3 = objc_alloc((Class)NSMutableArray);
  v12.receiver = self;
  v12.super_class = (Class)BKLibraryCollectionsListCell;
  UIAccessibilityTraits v4 = [(BKLibraryCollectionsListCell *)&v12 accessibilityDropPointDescriptors];
  id v5 = [v3 initWithArray:v4];

  if ([v5 count] == (id)3)
  {
    [v5 sortUsingComparator:&stru_100A49FD8];
    objc_super v6 = [(BKLibraryCollectionsListCell *)self accessibilityDelegate];
    unsigned int v7 = [v6 bkaxIsLastCollection:self];

    id v8 = [v5 count];
    if (v7)
    {
      if (v8)
      {
        unsigned int v9 = [v5 objectAtIndexedSubscript:0];
        v13 = v9;
        id v10 = +[NSArray arrayWithObjects:&v13 count:1];
      }
      else
      {
        id v10 = &__NSArray0__struct;
      }
      goto LABEL_10;
    }
    if ((unint64_t)v8 >= 2) {
      [v5 removeObjectAtIndex:1];
    }
  }
  id v10 = v5;
LABEL_10:

LABEL_11:

  return v10;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  if ([(BKLibraryCollectionsListCell *)self isShownDefaultCollectionInEditMode]
    || [(BKLibraryCollectionsListCell *)self isHiddenDefaultCollection])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    unsigned int v3 = [(BKLibraryCollectionsListCell *)self isEditing];
    if (v3)
    {
      UIAccessibilityTraits v4 = [(BKLibraryCollectionsListCell *)self accessibilityDelegate];
      unsigned __int8 v5 = [v4 bkaxIsCustomCollectionCell:self];

      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (BOOL)accessibilityActivate
{
  if ([(BKLibraryCollectionsListCell *)self isShownDefaultCollectionInEditMode])
  {
    unsigned int v3 = [(BKLibraryCollectionsListCell *)self accessibilityDelegate];
    [v3 bkaxPerformHide:self];
  }
  else if ([(BKLibraryCollectionsListCell *)self isHiddenDefaultCollection])
  {
    unsigned int v3 = [(BKLibraryCollectionsListCell *)self accessibilityDelegate];
    [v3 bkaxPerformShow:self];
  }
  else
  {
    if (![(BKLibraryCollectionsListCell *)self isEditing]) {
      return 0;
    }
    UIAccessibilityTraits v4 = [(BKLibraryCollectionsListCell *)self accessibilityDelegate];
    unsigned int v5 = [v4 bkaxIsCustomCollectionCell:self];

    if (!v5) {
      return 0;
    }
    unsigned int v3 = [(BKLibraryCollectionsListCell *)self accessibilityDelegate];
    [v3 bkaxPerformRename:self];
  }

  objc_super v6 = [(BKLibraryCollectionsListCell *)self accessibilityDelegate];
  BOOL v7 = v6 != 0;

  return v7;
}

- (id)editControl
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(BKLibraryCollectionsListCell *)self subviews];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        NSClassFromString(@"UITableViewCellEditControl");
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)isButton
{
  v2 = self;
  id v3 = [(BKLibraryCollectionsListCell *)self accessibilityDelegate];
  LOBYTE(v2) = [v3 bkaxIsButton:v2];

  return (char)v2;
}

- (BOOL)isHiddenDefaultCollection
{
  unsigned int v3 = [(BKLibraryCollectionsListCell *)self dimmed];
  if (v3)
  {
    LOBYTE(v3) = [(BKLibraryCollectionsListCell *)self isEditing];
  }
  return v3;
}

- (BOOL)isShownDefaultCollectionInEditMode
{
  if ([(BKLibraryCollectionsListCell *)self dimmed])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    unsigned int v3 = [(BKLibraryCollectionsListCell *)self isEditing];
    if (v3) {
      LOBYTE(v3) = [(BKLibraryCollectionsListCell *)self showsReorderControl] ^ 1;
    }
  }
  return v3;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = self;
  unsigned int v3 = [(BKLibraryCollectionsListCell *)self accessibilityDelegate];
  LOBYTE(v2) = [v3 bkaxDidPerformEscape:v2];

  return (char)v2;
}

- (void)setImageView:(id)a3
{
}

- (void)setTextLabel:(id)a3
{
}

- (void)setDetailTextLabel:(id)a3
{
}

- (void)setChevron:(id)a3
{
}

- (BKLibraryCollectionsListMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)dimmed
{
  return self->_dimmed;
}

- (UITextField)textEntryField
{
  return self->_textEntryField;
}

- (void)setTextEntryField:(id)a3
{
}

- (NSArray)textEntryFieldConstraints
{
  return self->_textEntryFieldConstraints;
}

- (void)setTextEntryFieldConstraints:(id)a3
{
}

- (BKLibraryCollectionsListCellAccessibilityDelegate)accessibilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessibilityDelegate);

  return (BKLibraryCollectionsListCellAccessibilityDelegate *)WeakRetained;
}

- (void)setAccessibilityDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessibilityDelegate);
  objc_storeStrong((id *)&self->_textEntryFieldConstraints, 0);
  objc_storeStrong((id *)&self->_textEntryField, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end