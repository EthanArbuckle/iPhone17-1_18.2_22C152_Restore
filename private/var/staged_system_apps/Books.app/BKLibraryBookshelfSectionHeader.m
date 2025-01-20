@interface BKLibraryBookshelfSectionHeader
- (BKLibraryBookshelfSectionHeader)initWithFrame:(CGRect)a3;
- (BOOL)bottomSeparator;
- (BOOL)isRTL;
- (BOOL)useAllCaps;
- (CAShapeLayer)separatorLine;
- (NSDictionary)fontAttrs;
- (NSString)sectionName;
- (UILabel)sectionNameLabel;
- (double)margins;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBottomSeparator:(BOOL)a3;
- (void)setFontAttrs:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setMargins:(double)a3;
- (void)setSectionName:(id)a3;
- (void)setSectionNameLabel:(id)a3;
- (void)setSeparatorLine:(id)a3;
- (void)setUseAllCaps:(BOOL)a3;
@end

@implementation BKLibraryBookshelfSectionHeader

- (BKLibraryBookshelfSectionHeader)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookshelfSectionHeader;
  v3 = -[BKLibraryBookshelfSectionHeader initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    sectionNameLabel = v3->_sectionNameLabel;
    v3->_sectionNameLabel = v4;

    v6 = v3->_sectionNameLabel;
    unint64_t v7 = (unint64_t)[(UILabel *)v6 accessibilityTraits];
    [(UILabel *)v6 setAccessibilityTraits:UIAccessibilityTraitHeader | v7];
    uint64_t v8 = +[CAShapeLayer layer];
    separatorLine = v3->_separatorLine;
    v3->_separatorLine = (CAShapeLayer *)v8;

    v10 = +[UIScreen mainScreen];
    [v10 scale];
    [(CAShapeLayer *)v3->_separatorLine setLineWidth:1.0 / v11];

    [(CAShapeLayer *)v3->_separatorLine setHidden:1];
    [(BKLibraryBookshelfSectionHeader *)v3 addSubview:v3->_sectionNameLabel];
    v12 = [(BKLibraryBookshelfSectionHeader *)v3 layer];
    [v12 addSublayer:v3->_separatorLine];
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BKLibraryBookshelfSectionHeader;
  [(BKLibraryBookshelfSectionHeader *)&v2 dealloc];
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)BKLibraryBookshelfSectionHeader;
  [(BKLibraryBookshelfSectionHeader *)&v47 layoutSubviews];
  [(BKLibraryBookshelfSectionHeader *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(BKLibraryBookshelfSectionHeader *)self margins];
  CGFloat v12 = v11;
  v48.origin.CGFloat x = v4;
  v48.origin.CGFloat y = v6;
  v48.size.CGFloat width = v8;
  v48.size.CGFloat height = v10;
  CGRect v49 = CGRectInset(v48, v12, 0.0);
  CGFloat x = v49.origin.x;
  CGFloat y = v49.origin.y;
  CGFloat width = v49.size.width;
  CGFloat height = v49.size.height;
  CGRectGetMinX(v49);
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  CGRectGetWidth(v50);
  [(BKLibraryBookshelfSectionHeader *)self isRTL];
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  CGRectGetHeight(v51);
  IMRectFlippedForRTL();
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  v25 = [(BKLibraryBookshelfSectionHeader *)self sectionNameLabel];
  [v25 setFrame:v18, v20, v22, v24];

  v26 = +[UIBezierPath bezierPath];
  [(BKLibraryBookshelfSectionHeader *)self isRTL];
  IMRectFlippedForRTL();
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  uint64_t v35 = [(BKLibraryBookshelfSectionHeader *)self separatorLine];
  [(id)v35 lineWidth];
  double v44 = v36 * 0.5;

  LOBYTE(v35) = [(BKLibraryBookshelfSectionHeader *)self bottomSeparator];
  CGFloat v45 = v28;
  v52.origin.CGFloat x = v28;
  v52.origin.CGFloat y = v30;
  CGFloat v46 = v34;
  v52.size.CGFloat width = v32;
  v52.size.CGFloat height = v34;
  double MinX = CGRectGetMinX(v52);
  double v38 = MinX;
  if (v35)
  {
    v53.origin.CGFloat x = x;
    v53.origin.CGFloat y = y;
    v53.size.CGFloat width = width;
    v53.size.CGFloat height = height;
    [v26 moveToPoint:v38, CGRectGetMaxY(v53) - v44];
    v54.origin.CGFloat x = v28;
    v54.origin.CGFloat y = v30;
    v54.size.CGFloat width = v32;
    v54.size.CGFloat height = v46;
    double MaxX = CGRectGetMaxX(v54);
    v55.origin.CGFloat x = x;
    v55.origin.CGFloat y = y;
    v55.size.CGFloat width = width;
    v55.size.CGFloat height = height;
    double v40 = CGRectGetMaxY(v55) - v44;
  }
  else
  {
    double v40 = v44;
    [v26 moveToPoint:MinX, v44];
    v56.origin.CGFloat x = v45;
    v56.origin.CGFloat y = v30;
    v56.size.CGFloat width = v32;
    v56.size.CGFloat height = v46;
    double MaxX = CGRectGetMaxX(v56);
  }
  [v26 addLineToPoint:MaxX, v40];
  id v41 = v26;
  id v42 = [v41 CGPath];
  v43 = [(BKLibraryBookshelfSectionHeader *)self separatorLine];
  [v43 setPath:v42];
}

- (void)setSectionName:(id)a3
{
  CGFloat v4 = (NSString *)[a3 copy];
  sectionName = self->_sectionName;
  self->_sectionName = v4;

  if ([(NSString *)self->_sectionName isEqualToString:BKLibrarySortLastUnknownAuthorString])
  {
    CGFloat v6 = +[BKLibraryAsset unknownAuthor];
  }
  else
  {
    if (![(NSString *)self->_sectionName isEqualToString:BKLibrarySortLastMultipleAuthorString]) {
      goto LABEL_6;
    }
    CGFloat v6 = +[BKLibraryAsset multipleAuthors];
  }
  double v7 = self->_sectionName;
  self->_sectionName = v6;

LABEL_6:
  if (!self->_sectionName)
  {
    CGFloat v8 = +[NSBundle mainBundle];
    double v9 = [v8 localizedStringForKey:@"Unknown" value:&stru_100A70340 table:0];
    CGFloat v10 = self->_sectionName;
    self->_sectionName = v9;
  }
  unsigned __int8 v11 = [(BKLibraryBookshelfSectionHeader *)self useAllCaps];
  CGFloat v12 = self->_sectionName;
  if (v11)
  {
    v13 = [(NSString *)v12 localizedUppercaseString];
  }
  else
  {
    v13 = v12;
  }
  double v18 = v13;
  id v14 = objc_alloc((Class)NSAttributedString);
  v15 = [(BKLibraryBookshelfSectionHeader *)self fontAttrs];
  id v16 = [v14 initWithString:v18 attributes:v15];
  double v17 = [(BKLibraryBookshelfSectionHeader *)self sectionNameLabel];
  [v17 setAttributedText:v16];
}

- (void)applyLayoutAttributes:(id)a3
{
  v38.receiver = self;
  v38.super_class = (Class)BKLibraryBookshelfSectionHeader;
  id v4 = a3;
  [(BKLibraryBookshelfSectionHeader *)&v38 applyLayoutAttributes:v4];
  [(BKLibraryBookshelfSectionHeader *)self setIsRTL:[(BKLibraryBookshelfSectionHeader *)self effectiveUserInterfaceLayoutDirection] == (id)1];
  objc_opt_class();
  double v5 = BUDynamicCast();

  if ([v5 layoutDebugMode])
  {
    CGFloat v6 = +[UIColor redColor];
    id v7 = [v6 colorWithAlphaComponent:0.2];
    id v8 = [v7 CGColor];
    double v9 = [(BKLibraryBookshelfSectionHeader *)self layer];
    [v9 setBorderColor:v8];

    CGFloat v10 = [(BKLibraryBookshelfSectionHeader *)self layer];
    [v10 setBorderWidth:0.5];

    unsigned __int8 v11 = +[UIColor redColor];
    id v12 = [v11 colorWithAlphaComponent:0.2];
    id v13 = [v12 CGColor];
    id v14 = [(BKLibraryBookshelfSectionHeader *)self sectionNameLabel];
    v15 = [v14 layer];
    [v15 setBorderColor:v13];

    id v16 = [(BKLibraryBookshelfSectionHeader *)self sectionNameLabel];
    double v17 = [v16 layer];
    double v18 = v17;
    double v19 = 0.5;
  }
  else
  {
    double v20 = [(BKLibraryBookshelfSectionHeader *)self layer];
    [v20 setBorderWidth:0.0];

    id v16 = [(BKLibraryBookshelfSectionHeader *)self sectionNameLabel];
    double v17 = [v16 layer];
    double v18 = v17;
    double v19 = 0.0;
  }
  [v17 setBorderWidth:v19];

  double v21 = [v5 fontAttrs];
  [(BKLibraryBookshelfSectionHeader *)self setFontAttrs:v21];

  -[BKLibraryBookshelfSectionHeader setUseAllCaps:](self, "setUseAllCaps:", [v5 useAllCaps]);
  double v22 = [v5 columnMetrics];
  [v22 margins];
  -[BKLibraryBookshelfSectionHeader setMargins:](self, "setMargins:");

  unsigned __int8 v23 = [(BKLibraryBookshelfSectionHeader *)self useAllCaps];
  sectionName = self->_sectionName;
  if (v23)
  {
    v25 = [(NSString *)sectionName localizedUppercaseString];
  }
  else
  {
    v25 = sectionName;
  }
  v26 = v25;
  if (v25)
  {
    id v27 = objc_alloc((Class)NSAttributedString);
    CGFloat v28 = [(BKLibraryBookshelfSectionHeader *)self fontAttrs];
    id v29 = [v27 initWithString:v26 attributes:v28];
    CGFloat v30 = [(BKLibraryBookshelfSectionHeader *)self sectionNameLabel];
    [v30 setAttributedText:v29];
  }
  double v31 = [v5 mainHeaderMetrics];
  id v32 = [v31 separatorLineColor];
  id v33 = [v32 CGColor];
  CGFloat v34 = [(BKLibraryBookshelfSectionHeader *)self separatorLine];
  [v34 setStrokeColor:v33];

  uint64_t v35 = [v5 mainHeaderMetrics];
  if (v35) {
    uint64_t v36 = (uint64_t)[v5 firstItem];
  }
  else {
    uint64_t v36 = 1;
  }
  v37 = [(BKLibraryBookshelfSectionHeader *)self separatorLine];
  [v37 setHidden:v36];
}

- (double)margins
{
  return self->_margins;
}

- (void)setMargins:(double)a3
{
  self->_margins = a3;
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (BOOL)bottomSeparator
{
  return self->_bottomSeparator;
}

- (void)setBottomSeparator:(BOOL)a3
{
  self->_bottomSeparator = a3;
}

- (UILabel)sectionNameLabel
{
  return self->_sectionNameLabel;
}

- (void)setSectionNameLabel:(id)a3
{
}

- (CAShapeLayer)separatorLine
{
  return self->_separatorLine;
}

- (void)setSeparatorLine:(id)a3
{
}

- (NSDictionary)fontAttrs
{
  return self->_fontAttrs;
}

- (void)setFontAttrs:(id)a3
{
}

- (BOOL)useAllCaps
{
  return self->_useAllCaps;
}

- (void)setUseAllCaps:(BOOL)a3
{
  self->_useAllCaps = a3;
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
  objc_storeStrong((id *)&self->_fontAttrs, 0);
  objc_storeStrong((id *)&self->_separatorLine, 0);
  objc_storeStrong((id *)&self->_sectionNameLabel, 0);

  objc_storeStrong((id *)&self->_sectionName, 0);
}

@end