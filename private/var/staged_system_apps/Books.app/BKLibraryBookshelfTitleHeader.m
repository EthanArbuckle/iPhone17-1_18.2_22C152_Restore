@interface BKLibraryBookshelfTitleHeader
+ (double)_cachedHeight:(id)a3 withDataSource:(id)a4;
+ (double)heightOf:(id)a3 inSize:(CGSize)a4 withMaxLines:(double)a5;
+ (void)adjustHeight:(id)a3 withDataSource:(id)a4;
- (BKLibraryActionHandler)actionHandler;
- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics;
- (BKLibraryBookshelfSupplementaryDataSource)dataSource;
- (BKLibraryBookshelfTitleHeader)initWithFrame:(CGRect)a3;
- (BOOL)isRTL;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (CALayer)descrBaselineHairline;
- (CALayer)titleBaselineHairline;
- (NSString)descriptionPlaceHolderText;
- (NSString)descriptionText;
- (NSString)titleText;
- (UILabel)titleLabel;
- (UITextView)descriptionLabel;
- (double)descriptionSpacing;
- (double)margins;
- (double)maxDescriptionLines;
- (double)titleSpacing;
- (void)_configureDescriptionLabel;
- (void)_configureDescriptionLabelForAttributeChange;
- (void)_configureForEditableState:(BOOL)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)clearDescriptionLabelText;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setActionHandler:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDescrBaselineHairline:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDescriptionPlaceHolderText:(id)a3;
- (void)setDescriptionSpacing:(double)a3;
- (void)setDescriptionText:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setMainHeaderMetrics:(id)a3;
- (void)setMargins:(double)a3;
- (void)setMaxDescriptionLines:(double)a3;
- (void)setTitleBaselineHairline:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleSpacing:(double)a3;
- (void)setTitleText:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation BKLibraryBookshelfTitleHeader

+ (double)heightOf:(id)a3 inSize:(CGSize)a4 withMaxLines:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  [v8 sizeThatFits:width, height];
  double v10 = v9;
  if (a5 > 0.0)
  {
    v11 = [v8 font];
    [v11 lineHeight];
    double v13 = v12;
    [v8 textContainerInset];
    double v15 = v14 + v13 * a5;
    [v8 textContainerInset];
    double v17 = v15 + v16;

    if (v10 >= v17) {
      double v10 = v17;
    }
  }

  return v10;
}

+ (double)_cachedHeight:(id)a3 withDataSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100B4A510 != -1) {
    dispatch_once(&qword_100B4A510, &stru_100A48A30);
  }
  id v7 = [v5 editable];
  [v5 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v5 columnMetrics];
  [v16 margins];
  double v18 = v17;

  v19 = [v6 collectionTitle];
  v20 = [v5 mainHeaderMetrics];
  v21 = [v20 largeTitleFontAttributes];
  id v22 = +[TUIFontSpec attributedStringWith:v19 attributes:v21];

  if (!v22) {
    id v22 = objc_alloc_init((Class)NSAttributedString);
  }
  v23 = [v6 collectionDescription];
  v24 = v23;
  if (v7)
  {
    if ([v23 length]) {
      [v6 collectionDescription];
    }
    else {
    uint64_t v25 = [v6 collectionDescriptionPlaceHolder];
    }

    v24 = (void *)v25;
  }
  unsigned __int8 v26 = [v6 collectionIsSeries];
  v27 = [v5 mainHeaderMetrics];
  v28 = v27;
  if (v26) {
    [v27 alternateTitleDetailsFontAttributes];
  }
  else {
  v29 = [v27 titleDetailsFontAttributes];
  }
  double v30 = v13 - v18;
  id v31 = +[TUIFontSpec attributedStringWith:v24 attributes:v29];

  if (!v31) {
    id v31 = objc_alloc_init((Class)NSAttributedString);
  }
  v32 = [v5 mainHeaderMetrics];
  [v32 titleDetailsTopMargin];
  double v34 = v33;
  v35 = [v5 mainHeaderMetrics];
  [v35 titleDetailsBottomMargin];
  double v37 = v34 + v36;

  v74[0] = @"editable";
  v38 = +[NSNumber numberWithBool:v7];
  v75[0] = v38;
  v74[1] = @"textViewWidth";
  v39 = +[NSNumber numberWithDouble:v30];
  v75[1] = v39;
  v75[2] = v22;
  v73 = v22;
  v74[2] = @"titleAttributedText";
  v74[3] = @"descAttributedText";
  v75[3] = v31;
  v74[4] = @"margins";
  v40 = +[NSNumber numberWithDouble:v37];
  v75[4] = v40;
  v41 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:5];

  v42 = [(id)qword_100B4A518 objectForKeyedSubscript:v41];
  v43 = v42;
  if (v42)
  {
    [v42 doubleValue];
    double v45 = v44;
  }
  else
  {
    v71 = v19;
    v46 = [v5 columnMetrics];
    [v46 margins];
    double v48 = v13 - v47;

    id v49 = [objc_alloc((Class)UITextView) initWithFrame:v9, v11, v48, v15];
    [v49 setTextContainerInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
    [v49 setEditable:v7];
    [v49 setSelectable:v7];
    v50 = [v6 collectionDescription];
    v51 = v50;
    if (v7)
    {
      if ([v50 length]) {
        [v6 collectionDescription];
      }
      else {
      uint64_t v52 = [v6 collectionDescriptionPlaceHolder];
      }

      v72 = (void *)v52;
    }
    else
    {
      v72 = v50;
    }
    unsigned int v53 = [v6 collectionIsSeries];
    v54 = [v5 mainHeaderMetrics];
    v55 = v54;
    if (v53) {
      [v54 alternateTitleDetailsFontAttributes];
    }
    else {
    v56 = [v54 titleDetailsFontAttributes];
    }
    v57 = +[TUIFontSpec attributedStringWith:v72 attributes:v56];
    [v49 setAttributedText:v57];

    v58 = [v5 mainHeaderMetrics];
    [v58 titleDetailsMaxLines];
    +[BKLibraryBookshelfTitleHeader heightOf:inSize:withMaxLines:](BKLibraryBookshelfTitleHeader, "heightOf:inSize:withMaxLines:", v49, v48, v15, v59);
    double v61 = v60;

    if (([v49 isEditable] & 1) != 0
      || ([v49 text],
          v62 = objc_claimAutoreleasedReturnValue(),
          id v63 = [v62 length],
          v62,
          v63))
    {
      double v45 = v61 + 0.0;
      if (v45 > 0.0)
      {
        v64 = [v5 mainHeaderMetrics];
        [v64 titleDetailsTopMargin];
        double v66 = v45 + v65;

        v67 = [v5 mainHeaderMetrics];
        [v67 titleDetailsBottomMargin];
        double v45 = v66 + v68;
      }
    }
    else
    {
      double v45 = 0.0;
    }
    v69 = +[NSNumber numberWithDouble:v45];
    [(id)qword_100B4A518 setObject:v69 forKeyedSubscript:v41];

    v19 = v71;
  }

  return v45;
}

+ (void)adjustHeight:(id)a3 withDataSource:(id)a4
{
  id v6 = a4;
  id v15 = a3;
  [v15 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [a1 _cachedHeight:v15 withDataSource:v6];
  double v14 = v13;

  [v15 setFrame:v8, v10, v12, v14];
}

- (BKLibraryBookshelfTitleHeader)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)BKLibraryBookshelfTitleHeader;
  v3 = -[BKLibraryBookshelfTitleHeader initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(BKLibraryBookshelfTitleHeader *)v3 setClipsToBounds:1];
    id v5 = objc_alloc((Class)UITextView);
    [(BKLibraryBookshelfTitleHeader *)v4 bounds];
    id v6 = [v5 initWithFrame:];
    [v6 setTextContainerInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
    [(BKLibraryBookshelfTitleHeader *)v4 addSubview:v6];
    [(BKLibraryBookshelfTitleHeader *)v4 setDescriptionLabel:v6];
    double v7 = [(BKLibraryBookshelfTitleHeader *)v4 descriptionLabel];
    [v7 setDelegate:v4];

    double v8 = [(BKLibraryBookshelfTitleHeader *)v4 descriptionLabel];
    [v8 setEditable:0];

    double v9 = [(BKLibraryBookshelfTitleHeader *)v4 descriptionLabel];
    [v9 setSelectable:0];

    double v10 = [(BKLibraryBookshelfTitleHeader *)v4 descriptionLabel];
    [v10 setScrollEnabled:0];
  }
  return v4;
}

- (void)dealloc
{
  +[BKDataBinder unbind:self];
  [(UITextView *)self->_descriptionLabel setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfTitleHeader;
  [(BKLibraryBookshelfTitleHeader *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)BKLibraryBookshelfTitleHeader;
  [(BKLibraryBookshelfTitleHeader *)&v38 layoutSubviews];
  CGFloat v3 = CGRectZero.size.height + 0.0;
  [(BKLibraryBookshelfTitleHeader *)self descriptionSpacing];
  double v5 = v3 + v4;
  [(BKLibraryBookshelfTitleHeader *)self bounds];
  double MaxX = CGRectGetMaxX(v39);
  [(BKLibraryBookshelfTitleHeader *)self margins];
  double v8 = MaxX - v7;
  uint64_t v9 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
  [(BKLibraryBookshelfTitleHeader *)self maxDescriptionLines];
  +[BKLibraryBookshelfTitleHeader heightOf:inSize:withMaxLines:](BKLibraryBookshelfTitleHeader, "heightOf:inSize:withMaxLines:", v9, v8, 0.0, v10);
  double v12 = v11;

  double v13 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
  [v13 frame];
  v42.origin.x = 0.0;
  v42.origin.y = v5;
  v42.size.double width = v8;
  v42.size.double height = v12;
  LOBYTE(v9) = CGRectEqualToRect(v40, v42);

  if ((v9 & 1) == 0)
  {
    double v14 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    [v14 setFrame:0.0, v5, v8, v12];
  }
  id v15 = [(BKLibraryBookshelfTitleHeader *)self descrBaselineHairline];

  if (v15)
  {
    double v16 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    [v16 frame];
    double v18 = v17;
    CGFloat v20 = v19;
    double v22 = v21;
    CGFloat v24 = v23;

    uint64_t v25 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    [v25 textContainerInset];
    double v27 = v26;
    v28 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    v29 = [v28 font];
    [v29 descender];
    double v31 = v27 - v30;
    v32 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    double v33 = [v32 font];
    [v33 leading];
    double v35 = v31 + v34;

    v41.origin.x = v18;
    v41.origin.y = v20;
    v41.size.double width = v22;
    v41.size.double height = v24;
    CGFloat v36 = CGRectGetMaxY(v41) - v35;
    double v37 = [(BKLibraryBookshelfTitleHeader *)self descrBaselineHairline];
    [v37 setFrame:v18, v36, v22, 1.0];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  v71.receiver = self;
  v71.super_class = (Class)BKLibraryBookshelfTitleHeader;
  id v4 = a3;
  [(BKLibraryBookshelfTitleHeader *)&v71 applyLayoutAttributes:v4];
  double v5 = +[UIApplication sharedApplication];
  -[BKLibraryBookshelfTitleHeader setIsRTL:](self, "setIsRTL:", [v5 userInterfaceLayoutDirection] == (id)1);

  objc_opt_class();
  id v6 = BUDynamicCast();

  if ([v6 layoutDebugMode])
  {
    double v7 = +[UIColor redColor];
    id v8 = [v7 colorWithAlphaComponent:0.2];
    id v9 = [v8 CGColor];
    double v10 = [(BKLibraryBookshelfTitleHeader *)self layer];
    [v10 setBorderColor:v9];

    double v11 = [(BKLibraryBookshelfTitleHeader *)self layer];
    [v11 setBorderWidth:0.5];

    id v12 = +[UIColor yellowColor];
    id v13 = [v12 CGColor];
    double v14 = [(BKLibraryBookshelfTitleHeader *)self layer];
    [v14 setBackgroundColor:v13];

    id v15 = +[UIColor redColor];
    id v16 = [v15 colorWithAlphaComponent:0.2];
    id v17 = [v16 CGColor];
    double v18 = [(BKLibraryBookshelfTitleHeader *)self titleLabel];
    double v19 = [v18 layer];
    [v19 setBorderColor:v17];

    CGFloat v20 = [(BKLibraryBookshelfTitleHeader *)self titleLabel];
    double v21 = [v20 layer];
    [v21 setBorderWidth:0.5];

    double v22 = +[UIColor redColor];
    id v23 = [v22 colorWithAlphaComponent:0.2];
    id v24 = [v23 CGColor];
    uint64_t v25 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    double v26 = [v25 layer];
    [v26 setBorderColor:v24];

    double v27 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    v28 = [v27 layer];
    [v28 setBorderWidth:0.5];

    v29 = [(BKLibraryBookshelfTitleHeader *)self titleBaselineHairline];

    if (!v29)
    {
      double v30 = +[CALayer layer];
      [(BKLibraryBookshelfTitleHeader *)self setTitleBaselineHairline:v30];

      double v31 = +[UIColor greenColor];
      id v32 = [v31 colorWithAlphaComponent:0.2];
      id v33 = [v32 CGColor];
      double v34 = [(BKLibraryBookshelfTitleHeader *)self titleBaselineHairline];
      [v34 setBorderColor:v33];

      double v35 = [(BKLibraryBookshelfTitleHeader *)self titleBaselineHairline];
      [v35 setBorderWidth:0.5];

      CGFloat v36 = [(BKLibraryBookshelfTitleHeader *)self layer];
      double v37 = [(BKLibraryBookshelfTitleHeader *)self titleBaselineHairline];
      [v36 addSublayer:v37];
    }
    objc_super v38 = [(BKLibraryBookshelfTitleHeader *)self descrBaselineHairline];

    if (!v38)
    {
      CGRect v39 = +[CALayer layer];
      [(BKLibraryBookshelfTitleHeader *)self setDescrBaselineHairline:v39];

      CGRect v40 = +[UIColor greenColor];
      id v41 = [v40 colorWithAlphaComponent:0.2];
      id v42 = [v41 CGColor];
      v43 = [(BKLibraryBookshelfTitleHeader *)self descrBaselineHairline];
      [v43 setBorderColor:v42];

      double v44 = [(BKLibraryBookshelfTitleHeader *)self descrBaselineHairline];
      [v44 setBorderWidth:0.5];

      double v45 = [(BKLibraryBookshelfTitleHeader *)self layer];
      v46 = [(BKLibraryBookshelfTitleHeader *)self descrBaselineHairline];
      [v45 addSublayer:v46];
    }
  }
  else
  {
    double v47 = [(BKLibraryBookshelfTitleHeader *)self layer];
    [v47 setBorderWidth:0.0];

    double v48 = [(BKLibraryBookshelfTitleHeader *)self titleLabel];
    id v49 = [v48 layer];
    [v49 setBorderWidth:0.0];

    v50 = [(BKLibraryBookshelfTitleHeader *)self titleBaselineHairline];
    [v50 removeFromSuperlayer];

    [(BKLibraryBookshelfTitleHeader *)self setTitleBaselineHairline:0];
    v51 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    uint64_t v52 = [v51 layer];
    [v52 setBorderWidth:0.0];

    unsigned int v53 = [(BKLibraryBookshelfTitleHeader *)self descrBaselineHairline];
    [v53 removeFromSuperlayer];

    [(BKLibraryBookshelfTitleHeader *)self setDescrBaselineHairline:0];
  }
  v54 = [v6 mainHeaderMetrics];
  [(BKLibraryBookshelfTitleHeader *)self setMainHeaderMetrics:v54];

  v55 = [(BKLibraryBookshelfTitleHeader *)self backgroundColor];
  v56 = [(BKLibraryBookshelfTitleHeader *)self mainHeaderMetrics];
  v57 = [v56 headerBackgroundColor];

  if (v55 != v57)
  {
    v58 = [(BKLibraryBookshelfTitleHeader *)self mainHeaderMetrics];
    double v59 = [v58 headerBackgroundColor];
    [(BKLibraryBookshelfTitleHeader *)self setBackgroundColor:v59];
  }
  double v60 = +[UIColor bc_booksKeyColor];
  double v61 = [(BKLibraryBookshelfTitleHeader *)self titleLabel];
  [v61 setTintColor:v60];

  v62 = +[UIColor bc_booksLabelColor];
  id v63 = [(BKLibraryBookshelfTitleHeader *)self titleLabel];
  [v63 setTextColor:v62];

  v64 = +[UIColor bc_booksKeyColor];
  double v65 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
  [v65 setTintColor:v64];

  double v66 = +[UIColor bc_booksLabelColor];
  v67 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
  [v67 setTextColor:v66];

  double v68 = [v6 columnMetrics];
  [v68 margins];
  -[BKLibraryBookshelfTitleHeader setMargins:](self, "setMargins:");

  v69 = [(BKLibraryBookshelfTitleHeader *)self mainHeaderMetrics];
  [v69 titleDetailsMaxLines];
  -[BKLibraryBookshelfTitleHeader setMaxDescriptionLines:](self, "setMaxDescriptionLines:");

  v70 = [(BKLibraryBookshelfTitleHeader *)self mainHeaderMetrics];
  [v70 titleDetailsTopMargin];
  -[BKLibraryBookshelfTitleHeader setDescriptionSpacing:](self, "setDescriptionSpacing:");

  -[BKLibraryBookshelfTitleHeader _configureForEditableState:](self, "_configureForEditableState:", [v6 editable]);
  [(BKLibraryBookshelfTitleHeader *)self _configureHeaderLabel];
  [(BKLibraryBookshelfTitleHeader *)self _configureDescriptionLabelForAttributeChange];
}

- (void)_configureDescriptionLabelForAttributeChange
{
  id v13 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
  if ([v13 isFirstResponder])
  {
    CGFloat v3 = [v13 text];
    if ([v13 isEditable]) {
      char v4 = [v13 isFirstResponder] ^ 1;
    }
    else {
      char v4 = 1;
    }
    double v5 = [(BKLibraryBookshelfTitleHeader *)self descriptionText];
    id v6 = [v5 length];

    if (v6 || (v4 & 1) == 0)
    {
      double v7 = [(BKLibraryBookshelfTitleHeader *)self dataSource];
      unsigned __int8 v9 = [v7 collectionIsSeries];
      double v10 = [(BKLibraryBookshelfTitleHeader *)self mainHeaderMetrics];
      double v11 = v10;
      if (v9) {
        [v10 alternateTitleDetailsFontAttributes];
      }
      else {
      id v8 = [v10 titleDetailsFontAttributes];
      }
    }
    else
    {
      double v7 = [(BKLibraryBookshelfTitleHeader *)self mainHeaderMetrics];
      id v8 = [v7 titleDetailsPlaceholderFontAttributes];
    }

    id v12 = +[TUIFontSpec attributedStringWith:v3 attributes:v8];
    [v13 setAttributedText:v12];

    [(BKLibraryBookshelfTitleHeader *)self setDescriptionText:v3];
  }
  else
  {
    [(BKLibraryBookshelfTitleHeader *)self _configureDescriptionLabel];
  }
}

- (void)_configureDescriptionLabel
{
  id v15 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
  unsigned int v3 = [v15 isEditable];
  if (!v3 || ([v15 isFirstResponder] & 1) == 0)
  {
    char v4 = [(BKLibraryBookshelfTitleHeader *)self descriptionText];
    if ([v4 length]) {
      char v5 = 0;
    }
    else {
      char v5 = v3;
    }
    if (v5)
    {
      id v6 = [(BKLibraryBookshelfTitleHeader *)self descriptionPlaceHolderText];
      double v7 = [(BKLibraryBookshelfTitleHeader *)self mainHeaderMetrics];
      id v8 = [v7 titleDetailsPlaceholderFontAttributes];
    }
    else
    {
      id v6 = v4;
      double v7 = [(BKLibraryBookshelfTitleHeader *)self dataSource];
      unsigned __int8 v9 = [v7 collectionIsSeries];
      double v10 = [(BKLibraryBookshelfTitleHeader *)self mainHeaderMetrics];
      double v11 = v10;
      if (v9) {
        [v10 alternateTitleDetailsFontAttributes];
      }
      else {
      id v8 = [v10 titleDetailsFontAttributes];
      }
    }
    id v12 = +[TUIFontSpec attributedStringWith:v6 attributes:v8];
    [v15 setAttributedText:v12];

    BOOL v13 = (v3 & 1) == 0 && [v6 length] == 0;
    [v15 setHidden:v13];
    double v14 = [(BKLibraryBookshelfTitleHeader *)self descrBaselineHairline];
    [v14 setHidden:v13];
  }
}

- (void)_configureForEditableState:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    unint64_t v5 = 0;
  }
  else
  {
    [(BKLibraryBookshelfTitleHeader *)self maxDescriptionLines];
    unint64_t v5 = (unint64_t)v6;
  }
  double v7 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
  id v8 = [v7 textContainer];
  id v9 = [v8 maximumNumberOfLines];

  if (v9 != (id)v5)
  {
    double v10 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    double v11 = [v10 textContainer];
    [v11 setMaximumNumberOfLines:v5];

    id v12 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    BOOL v13 = [v12 textContainer];
    [v13 setLineBreakMode:4];
  }
  double v14 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
  unsigned int v15 = [v14 isEditable];

  if (v15 != v3)
  {
    id v16 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    [v16 setEditable:v3];

    id v17 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    [v17 setSelectable:v3];

    double v18 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    double v19 = [v18 textContainer];
    CGFloat v20 = [v19 layoutManager];
    double v21 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    double v22 = [v21 textStorage];
    [v20 invalidateLayoutForCharacterRange:0 actualCharacterRange:[v22 length]];

    id v23 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
    LODWORD(v20) = [v23 isEditable];

    id v24 = [(BKLibraryBookshelfTitleHeader *)self dataSource];
    if (v20)
    {
      +[BKDataBinder bind:v24 key:@"collectionDescriptionPlaceHolder" between:self key:@"descriptionPlaceHolderText"];
    }
    else
    {
      +[BKDataBinder unbind:v24 key:@"collectionDescriptionPlaceHolder" from:self key:@"descriptionPlaceHolderText"];

      id v24 = [(BKLibraryBookshelfTitleHeader *)self dataSource];
      +[BKDataBinder unbind:self key:@"descriptionPlaceHolderText" from:v24 key:@"collectionDescriptionPlaceHolder"];
    }

    [(BKLibraryBookshelfTitleHeader *)self setNeedsLayout];
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    +[BKDataBinder unbind:self];
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(BKLibraryBookshelfTitleHeader *)self _configureHeaderLabel];
    [(BKLibraryBookshelfTitleHeader *)self _configureDescriptionLabel];
    unint64_t v5 = [(BKLibraryBookshelfTitleHeader *)self dataSource];

    if (v5)
    {
      double v6 = [(BKLibraryBookshelfTitleHeader *)self dataSource];
      +[BKDataBinder bind:v6 key:@"collectionTitle" to:self key:@"titleText"];

      double v7 = [(BKLibraryBookshelfTitleHeader *)self dataSource];
      +[BKDataBinder bind:v7 key:@"collectionDescription" between:self key:@"descriptionText"];

      id v8 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
      LODWORD(v7) = [v8 isEditable];

      if (v7)
      {
        id v9 = [(BKLibraryBookshelfTitleHeader *)self dataSource];
        +[BKDataBinder bind:v9 key:@"collectionDescriptionPlaceHolder" between:self key:@"descriptionPlaceHolderText"];
      }
    }
  }
}

- (void)setActionHandler:(id)a3
{
}

- (void)setTitleText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_titleText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    [(BKLibraryBookshelfTitleHeader *)self _configureHeaderLabel];
  }
}

- (void)setDescriptionText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_descriptionText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_descriptionText, a3);
    [(BKLibraryBookshelfTitleHeader *)self _configureDescriptionLabel];
  }
}

- (void)setDescriptionPlaceHolderText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_descriptionPlaceHolderText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_descriptionPlaceHolderText, a3);
    [(BKLibraryBookshelfTitleHeader *)self _configureDescriptionLabel];
  }
}

- (void)textViewDidEndEditing:(id)a3
{
  id v8 = a3;
  id v4 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];

  id v5 = v8;
  if (v4 == v8)
  {
    double v6 = [v8 text];
    [(BKLibraryBookshelfTitleHeader *)self setDescriptionText:v6];

    [(BKLibraryBookshelfTitleHeader *)self _configureDescriptionLabel];
    double v7 = [(BKLibraryBookshelfTitleHeader *)self actionHandler];
    [v7 descriptionUpdated];

    id v5 = v8;
  }
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
  if (v5 == v4)
  {
    BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();

    if (!IsVoiceOverRunning)
    {
      double v7 = [(BKLibraryBookshelfTitleHeader *)self descriptionText];
      id v8 = [v7 length];

      if (!v8) {
        [(BKLibraryBookshelfTitleHeader *)self clearDescriptionLabelText];
      }
    }
  }
  else
  {
  }
  return 1;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v10 = a3;
  id v4 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
  if (v4 == v10)
  {
    BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();

    if (IsVoiceOverRunning)
    {
      double v6 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
      double v7 = [v6 text];
      id v8 = [(BKLibraryBookshelfTitleHeader *)self descriptionPlaceHolderText];
      unsigned int v9 = [v7 isEqualToString:v8];

      if (v9) {
        [(BKLibraryBookshelfTitleHeader *)self clearDescriptionLabelText];
      }
    }
  }
  else
  {
  }
}

- (void)clearDescriptionLabelText
{
  BOOL v3 = [(BKLibraryBookshelfTitleHeader *)self mainHeaderMetrics];
  id v4 = [v3 titleDetailsFontAttributes];
  id v5 = +[TUIFontSpec attributedStringWith:@" " attributes:v4];
  double v6 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
  [v6 setAttributedText:v5];

  id v7 = [(BKLibraryBookshelfTitleHeader *)self descriptionLabel];
  [v7 setText:&stru_100A70340];
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (BKLibraryBookshelfSupplementaryDataSource *)WeakRetained;
}

- (BKLibraryActionHandler)actionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  return (BKLibraryActionHandler *)WeakRetained;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (NSString)descriptionPlaceHolderText
{
  return self->_descriptionPlaceHolderText;
}

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (void)setMainHeaderMetrics:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (double)titleSpacing
{
  return self->_titleSpacing;
}

- (void)setTitleSpacing:(double)a3
{
  self->_titleSpacing = a3;
}

- (CALayer)titleBaselineHairline
{
  return self->_titleBaselineHairline;
}

- (void)setTitleBaselineHairline:(id)a3
{
}

- (UITextView)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (double)maxDescriptionLines
{
  return self->_maxDescriptionLines;
}

- (void)setMaxDescriptionLines:(double)a3
{
  self->_maxDescriptionLines = a3;
}

- (double)descriptionSpacing
{
  return self->_descriptionSpacing;
}

- (void)setDescriptionSpacing:(double)a3
{
  self->_descriptionSpacing = a3;
}

- (double)margins
{
  return self->_margins;
}

- (void)setMargins:(double)a3
{
  self->_margins = a3;
}

- (CALayer)descrBaselineHairline
{
  return self->_descrBaselineHairline;
}

- (void)setDescrBaselineHairline:(id)a3
{
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descrBaselineHairline, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleBaselineHairline, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);
  objc_storeStrong((id *)&self->_descriptionPlaceHolderText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_actionHandler);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end