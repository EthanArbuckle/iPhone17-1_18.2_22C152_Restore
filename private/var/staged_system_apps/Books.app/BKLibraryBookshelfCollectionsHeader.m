@interface BKLibraryBookshelfCollectionsHeader
- (BKLibraryActionHandler)actionHandler;
- (BKLibraryBookshelfCollectionsHeader)initWithFrame:(CGRect)a3;
- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics;
- (BKLibraryBookshelfSupplementaryDataSource)dataSource;
- (BOOL)isRTL;
- (NSString)buttonText;
- (UIButton)button;
- (UIImage)chevronImage;
- (UIImageView)chevron;
- (double)chevronSpacing;
- (double)margins;
- (double)padding;
- (void)_setupGlyphs;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setActionHandler:(id)a3;
- (void)setButton:(id)a3;
- (void)setButtonText:(id)a3;
- (void)setChevron:(id)a3;
- (void)setChevronImage:(id)a3;
- (void)setChevronSpacing:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setMainHeaderMetrics:(id)a3;
- (void)setMargins:(double)a3;
- (void)setPadding:(double)a3;
- (void)updateButtonWithText:(id)a3 attributes:(id)a4;
@end

@implementation BKLibraryBookshelfCollectionsHeader

- (BKLibraryBookshelfCollectionsHeader)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryBookshelfCollectionsHeader;
  v3 = -[BKLibraryBookshelfCollectionsHeader initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIButton buttonWithType:0];
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    [(BKLibraryBookshelfCollectionsHeader *)v3 bounds];
    -[UIButton setFrame:](v3->_button, "setFrame:");
    [(UIButton *)v3->_button setAutoresizingMask:18];
    [(UIButton *)v3->_button setSpringLoaded:1];
    v6 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    chevron = v3->_chevron;
    v3->_chevron = v6;

    [(BKLibraryBookshelfCollectionsHeader *)v3 addSubview:v3->_chevron];
    [(BKLibraryBookshelfCollectionsHeader *)v3 addSubview:v3->_button];
  }
  return v3;
}

- (void)dealloc
{
  +[BKDataBinder unbind:self];
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfCollectionsHeader;
  [(BKLibraryBookshelfCollectionsHeader *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)BKLibraryBookshelfCollectionsHeader;
  [(BKLibraryBookshelfCollectionsHeader *)&v51 layoutSubviews];
  [(BKLibraryBookshelfCollectionsHeader *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(BKLibraryBookshelfCollectionsHeader *)self chevron];
  [v11 sizeThatFits:1.79769313e308, 1.79769313e308];
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v52.origin.x = v4;
  v52.origin.y = v6;
  v52.size.width = v8;
  v52.size.height = v10;
  double Height = CGRectGetHeight(v52);
  v53.origin.x = v4;
  v53.origin.y = v6;
  v53.size.width = v13;
  CGFloat v50 = v15;
  v53.size.height = v15;
  CGFloat v49 = round((Height - CGRectGetHeight(v53)) * 0.5);
  [(BKLibraryBookshelfCollectionsHeader *)self margins];
  double v18 = v8 + v17 * -2.0;
  [(BKLibraryBookshelfCollectionsHeader *)self margins];
  double v20 = v4 + v19;
  v21 = [(BKLibraryBookshelfCollectionsHeader *)self button];
  [v21 sizeThatFits:v18 v10];
  double v23 = v22;

  v24 = [(BKLibraryBookshelfCollectionsHeader *)self traitCollection];
  id v25 = [v24 horizontalSizeClass];

  if (v25 == (id)1)
  {
    v54.origin.x = v4;
    v54.origin.y = v6;
    v54.size.width = v8;
    v54.size.height = v10;
    CGRectGetMaxX(v54);
    v55.origin.x = v4;
    v55.origin.y = v49;
    v55.size.height = v50;
    v55.size.width = v13;
    CGRectGetWidth(v55);
    [(BKLibraryBookshelfCollectionsHeader *)self margins];
    chevron = self->_chevron;
    uint64_t v27 = 0;
  }
  else
  {
    v56.origin.x = v20;
    v56.origin.y = v6;
    v56.size.width = v18;
    v56.size.height = v10;
    double v28 = v23 + CGRectGetMinX(v56);
    [(BKLibraryBookshelfCollectionsHeader *)self chevronSpacing];
    CGFloat v30 = v28 + v29;
    [(BKLibraryBookshelfCollectionsHeader *)self chevronSpacing];
    v57.origin.x = v30;
    v57.origin.y = v49;
    v57.size.height = v50;
    v57.size.width = v13;
    CGRectGetWidth(v57);
    chevron = self->_chevron;
    uint64_t v27 = 1;
  }
  [(UIImageView *)chevron setHidden:v27];
  [(BKLibraryBookshelfCollectionsHeader *)self isRTL];
  IMRectFlippedForRTL();
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  v39 = [(BKLibraryBookshelfCollectionsHeader *)self button];
  [v39 setFrame:v32, v34, v36, v38];

  [(BKLibraryBookshelfCollectionsHeader *)self isRTL];
  IMRectFlippedForRTL();
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  v48 = [(BKLibraryBookshelfCollectionsHeader *)self chevron];
  [v48 setFrame:v41, v43, v45, v47];
}

- (void)applyLayoutAttributes:(id)a3
{
  v74.receiver = self;
  v74.super_class = (Class)BKLibraryBookshelfCollectionsHeader;
  id v4 = a3;
  [(BKLibraryBookshelfCollectionsHeader *)&v74 applyLayoutAttributes:v4];
  objc_opt_class();
  double v5 = BUDynamicCast();

  CGFloat v6 = [v5 mainHeaderMetrics];
  [(BKLibraryBookshelfCollectionsHeader *)self setMainHeaderMetrics:v6];
  double v7 = +[UIColor systemGroupedBackgroundColor];
  if (!qword_100B4A3D8 || ([(id)qword_100B4A3D0 isEqual:v7] & 1) == 0)
  {
    objc_storeStrong((id *)&qword_100B4A3D0, v7);
    uint64_t v8 = +[UIImage imageWithColor:qword_100B4A3D0];
    double v9 = (void *)qword_100B4A3D8;
    qword_100B4A3D8 = v8;
  }
  double v10 = [v6 readingListHighlightColor];
  v11 = v10;
  if (!qword_100B4A3C8 || ([v10 isEqual:qword_100B4A3C0] & 1) == 0)
  {
    objc_storeStrong((id *)&qword_100B4A3C0, v11);
    uint64_t v12 = +[UIImage imageWithColor:qword_100B4A3C0];
    CGFloat v13 = (void *)qword_100B4A3C8;
    qword_100B4A3C8 = v12;
  }
  double v14 = +[UIApplication sharedApplication];
  -[BKLibraryBookshelfCollectionsHeader setIsRTL:](self, "setIsRTL:", [v14 userInterfaceLayoutDirection] == (id)1);

  CGFloat v15 = [(BKLibraryBookshelfCollectionsHeader *)self button];
  if ([v5 layoutDebugMode])
  {
    v16 = +[UIColor redColor];
    id v17 = [v16 colorWithAlphaComponent:0.2];
    id v18 = [v17 CGColor];
    [(BKLibraryBookshelfCollectionsHeader *)self layer];
    double v19 = v70 = v7;
    [v19 setBorderColor:v18];

    double v20 = [(BKLibraryBookshelfCollectionsHeader *)self layer];
    [v20 setBorderWidth:0.5];

    v21 = +[UIColor greenColor];
    id v22 = [v21 colorWithAlphaComponent:0.2];
    id v23 = [v22 CGColor];
    v24 = [v15 layer];
    [v24 setBackgroundColor:v23];

    id v25 = +[UIColor redColor];
    id v26 = [v25 colorWithAlphaComponent:0.2];
    id v27 = [v26 CGColor];
    double v28 = [v15 imageView];
    double v29 = [v28 layer];
    [v29 setBorderColor:v27];

    CGFloat v30 = [v15 imageView];
    double v31 = [v30 layer];
    [v31 setBorderWidth:0.5];

    double v32 = +[UIColor redColor];
    id v33 = [v32 colorWithAlphaComponent:0.2];
    id v34 = [v33 CGColor];
    double v35 = [v15 titleLabel];
    double v36 = [v35 layer];
    [v36 setBorderColor:v34];

    double v37 = [v15 titleLabel];
    double v38 = [v37 layer];
    [v38 setBorderWidth:0.5];

    v39 = +[UIColor redColor];
    id v40 = [v39 colorWithAlphaComponent:0.2];
    id v41 = [v40 CGColor];
    double v42 = [(BKLibraryBookshelfCollectionsHeader *)self chevron];
    double v43 = [v42 layer];
    [v43 setBorderColor:v41];

    double v7 = v70;
    double v44 = [(BKLibraryBookshelfCollectionsHeader *)self chevron];
    double v45 = [v44 layer];
    double v46 = v45;
    double v47 = 0.5;
  }
  else
  {
    v48 = [(BKLibraryBookshelfCollectionsHeader *)self layer];
    [v48 setBorderWidth:0.0];

    CGFloat v49 = [v15 layer];
    [v49 setBackgroundColor:0];

    CGFloat v50 = [v15 imageView];
    objc_super v51 = [v50 layer];
    [v51 setBorderWidth:0.0];

    CGRect v52 = [v15 titleLabel];
    CGRect v53 = [v52 layer];
    [v53 setBorderWidth:0.0];

    double v44 = [(BKLibraryBookshelfCollectionsHeader *)self chevron];
    double v45 = [v44 layer];
    double v46 = v45;
    double v47 = 0.0;
  }
  [v45 setBorderWidth:v47];

  CGRect v54 = [(BKLibraryBookshelfCollectionsHeader *)self backgroundColor];
  CGRect v55 = [v6 headerBackgroundColor];

  if (v54 != v55)
  {
    CGRect v56 = [v6 headerBackgroundColor];
    [(BKLibraryBookshelfCollectionsHeader *)self setBackgroundColor:v56];
  }
  [v6 readingListPadding];
  -[BKLibraryBookshelfCollectionsHeader setPadding:](self, "setPadding:");
  [v6 chevronSpacing];
  -[BKLibraryBookshelfCollectionsHeader setChevronSpacing:](self, "setChevronSpacing:");
  CGRect v57 = [v5 columnMetrics];
  [v57 margins];
  -[BKLibraryBookshelfCollectionsHeader setMargins:](self, "setMargins:");

  [v6 readingListImageSpacing];
  double v59 = v58;
  double v60 = v58 * 0.5;
  if ([(BKLibraryBookshelfCollectionsHeader *)self isRTL]) {
    double v61 = -(v59 * 0.5);
  }
  else {
    double v61 = v60;
  }
  v62 = [v6 readingListHighlightColor];
  v63 = &qword_100B4A3C8;
  if (!v62) {
    v63 = &qword_100B4A3D8;
  }
  id v64 = (id)*v63;

  [v15 setContentVerticalAlignment:0];
  [v15 setContentHorizontalAlignment:4];
  [v15 setImageEdgeInsets:0.0, -v61, 0.0, v61];
  [v15 setTitleEdgeInsets:0.0, v61, 0.0, -v61];
  [v15 setContentEdgeInsets:0.0, v60, 0.0, v60];
  [v15 setBackgroundImage:v64 forState:1];
  [(BKLibraryBookshelfCollectionsHeader *)self _setupGlyphs];
  unsigned int v65 = [v15 isEnabled];
  if (v65 == [v5 editMode])
  {
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_10012AEF8;
    v71[3] = &unk_100A43DD8;
    id v72 = v15;
    id v73 = v5;
    +[UIView transitionWithView:v72 duration:5242880 options:v71 animations:0 completion:0.3];
  }
  v66 = [(BKLibraryBookshelfCollectionsHeader *)self buttonText];

  if (v66)
  {
    v67 = [(BKLibraryBookshelfCollectionsHeader *)self buttonText];
    v68 = [v6 collectionsLabelFontAttributes];
    v69 = [v68 attributes];
    [(BKLibraryBookshelfCollectionsHeader *)self updateButtonWithText:v67 attributes:v69];
  }
}

- (void)_setupGlyphs
{
  double v3 = [(BKLibraryBookshelfCollectionsHeader *)self mainHeaderMetrics];
  id v4 = [v3 chevronFontAttributes];
  double v5 = [v4 font];
  CGFloat v6 = +[UIImageSymbolConfiguration configurationWithFont:v5 scale:1];

  double v7 = [(BKLibraryBookshelfCollectionsHeader *)self mainHeaderMetrics];
  uint64_t v8 = [v7 chevronName];
  double v9 = +[UIImage systemImageNamed:v8];
  double v10 = [v9 imageWithConfiguration:v6];
  [(BKLibraryBookshelfCollectionsHeader *)self setChevronImage:v10];

  v11 = [(BKLibraryBookshelfCollectionsHeader *)self chevronImage];
  uint64_t v12 = [(BKLibraryBookshelfCollectionsHeader *)self chevron];
  [v12 setImage:v11];

  CGFloat v13 = [(BKLibraryBookshelfCollectionsHeader *)self mainHeaderMetrics];
  double v14 = [v13 chevronFontAttributes];
  CGFloat v15 = [v14 foregroundColor];
  v16 = [(BKLibraryBookshelfCollectionsHeader *)self chevron];
  [v16 setTintColor:v15];

  id v17 = [(BKLibraryBookshelfCollectionsHeader *)self mainHeaderMetrics];
  id v18 = [v17 iconFontAttributes];
  double v19 = [v18 font];
  id v30 = +[UIImageSymbolConfiguration configurationWithFont:v19 scale:3];

  double v20 = [(BKLibraryBookshelfCollectionsHeader *)self mainHeaderMetrics];
  v21 = [v20 iconName];
  id v22 = +[UIImage systemImageNamed:v21];
  id v23 = [v22 imageWithConfiguration:v30];

  v24 = [(BKLibraryBookshelfCollectionsHeader *)self button];
  [v24 setImage:v23 forState:0];

  id v25 = [(BKLibraryBookshelfCollectionsHeader *)self mainHeaderMetrics];
  id v26 = [v25 iconFontAttributes];
  id v27 = [v26 foregroundColor];
  double v28 = [(BKLibraryBookshelfCollectionsHeader *)self button];
  double v29 = [v28 imageView];
  [v29 setTintColor:v27];
}

- (void)setDataSource:(id)a3
{
  id v4 = a3;
  +[BKDataBinder unbind:self];
  objc_storeWeak((id *)&self->_dataSource, v4);

  [(BKLibraryBookshelfCollectionsHeader *)self _setupGlyphs];
  double v5 = [(BKLibraryBookshelfCollectionsHeader *)self button];
  CGFloat v6 = [v5 imageView];
  [v6 setContentMode:1];

  double v7 = [(BKLibraryBookshelfCollectionsHeader *)self dataSource];

  if (v7)
  {
    id v8 = [(BKLibraryBookshelfCollectionsHeader *)self dataSource];
    +[BKDataBinder bind:v8 key:@"readingListButtonText" to:self key:@"buttonText"];
  }
}

- (void)setActionHandler:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_actionHandler, obj);
    CGFloat v6 = [(BKLibraryBookshelfCollectionsHeader *)self button];
    [v6 removeTarget:0 action:0 forControlEvents:64];

    double v7 = [(BKLibraryBookshelfCollectionsHeader *)self button];
    id v8 = [(BKLibraryBookshelfCollectionsHeader *)self actionHandler];
    [v7 addTarget:v8 action:"showReadingLists" forControlEvents:64];

    double v5 = obj;
  }
}

- (void)setButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_buttonText, a3);
  id v5 = a3;
  id v8 = [(BKLibraryBookshelfCollectionsHeader *)self mainHeaderMetrics];
  CGFloat v6 = [v8 collectionsLabelFontAttributes];
  double v7 = [v6 attributes];
  [(BKLibraryBookshelfCollectionsHeader *)self updateButtonWithText:v5 attributes:v7];
}

- (void)updateButtonWithText:(id)a3 attributes:(id)a4
{
  id v48 = a3;
  id v6 = [a4 mutableCopy];
  double v7 = [v6 objectForKeyedSubscript:NSParagraphStyleAttributeName];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = +[NSParagraphStyle defaultParagraphStyle];
  }
  double v10 = v9;

  id v11 = [v10 mutableCopy];
  [v11 setLineBreakMode:4];
  id v12 = [v11 copy];
  [v6 setObject:v12 forKeyedSubscript:NSParagraphStyleAttributeName];

  id v13 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v48 attributes:v6];
  double v14 = [(BKLibraryBookshelfCollectionsHeader *)self traitCollection];
  id v15 = [v14 horizontalSizeClass];

  double v45 = v10;
  id v46 = v15;
  if (v15 == (id)1)
  {
    NSAttributedStringKey v16 = NSForegroundColorAttributeName;
  }
  else
  {
    id v17 = objc_alloc_init((Class)NSTextAttachment);
    id v18 = [(BKLibraryBookshelfCollectionsHeader *)self chevronImage];
    double v19 = [v18 imageWithRenderingMode:2];
    [v17 setImage:v19];

    id v20 = [objc_alloc((Class)NSAttributedString) initWithString:@" " attributes:v6];
    [v13 appendAttributedString:v20];

    v21 = +[NSAttributedString attributedStringWithAttachment:v17];
    id v22 = [v21 mutableCopy];

    NSAttributedStringKey v16 = NSForegroundColorAttributeName;
    [(BKLibraryBookshelfCollectionsHeader *)self mainHeaderMetrics];
    id v23 = v13;
    id v25 = v24 = v11;
    id v26 = [v25 chevronFontAttributes];
    id v27 = [v26 foregroundColor];
    [v22 addAttribute:NSForegroundColorAttributeName value:v27 range:NSMakeRange(0, [v22 length])];

    id v11 = v24;
    id v13 = v23;
    [v23 appendAttributedString:v22];

    double v10 = v45;
  }
  double v28 = [(BKLibraryBookshelfCollectionsHeader *)self button];
  [v28 setAttributedTitle:v13 forState:0];

  id v29 = v6;
  id v30 = [v29 objectForKey:v16];
  double v31 = [v30 colorWithAlphaComponent:0.5];
  [v29 setObject:v31 forKey:v16];

  id v32 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v48 attributes:v29];
  if (v46 != (id)1)
  {
    id v33 = objc_alloc_init((Class)NSTextAttachment);
    id v34 = [(BKLibraryBookshelfCollectionsHeader *)self chevronImage];
    double v35 = [v34 imageWithRenderingMode:2];
    double v47 = v33;
    [v33 setImage:v35];

    id v36 = [objc_alloc((Class)NSAttributedString) initWithString:@" " attributes:v29];
    [v32 appendAttributedString:v36];

    double v37 = +[NSAttributedString attributedStringWithAttachment:v33];
    id v38 = [v37 mutableCopy];

    v39 = [(BKLibraryBookshelfCollectionsHeader *)self mainHeaderMetrics];
    id v40 = [v39 chevronFontAttributes];
    [v40 foregroundColor];
    id v41 = v13;
    v43 = id v42 = v11;
    [v38 addAttribute:v16 value:v43 range:0, [v38 length]];

    id v11 = v42;
    id v13 = v41;

    [v32 appendAttributedString:v38];
    double v10 = v45;
  }
  double v44 = [(BKLibraryBookshelfCollectionsHeader *)self button];
  [v44 setAttributedTitle:v32 forState:2];

  [(BKLibraryBookshelfCollectionsHeader *)self setNeedsLayout];
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

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (void)setMainHeaderMetrics:(id)a3
{
}

- (UIImage)chevronImage
{
  return self->_chevronImage;
}

- (void)setChevronImage:(id)a3
{
}

- (UIImageView)chevron
{
  return self->_chevron;
}

- (void)setChevron:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (double)margins
{
  return self->_margins;
}

- (void)setMargins:(double)a3
{
  self->_margins = a3;
}

- (double)chevronSpacing
{
  return self->_chevronSpacing;
}

- (void)setChevronSpacing:(double)a3
{
  self->_chevronSpacing = a3;
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
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_chevronImage, 0);
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);
  objc_destroyWeak((id *)&self->_actionHandler);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end