@interface SXColumnLayout
- (BOOL)isEqual:(id)a3;
- (CGSize)constrainedViewportSize;
- (CGSize)viewportSize;
- (SXColumnLayout)initWithConstrainedViewportSize:(CGSize)a3 viewportSize:(CGSize)a4 layoutWidth:(double)a5 documentLayout:(id)a6 numberOfLayoutColumns:(unint64_t)a7 leftMargin:(double)a8 rightMargin:(double)a9 numberOfColumns:(unint64_t)a10 columnWidth:(double)a11 leftScreenMargin:(double)a12 rightScreenMargin:(double)a13 contentScaleFactor:(double)a14;
- (SXDocumentLayout)documentLayout;
- (_NSRange)convertColumnRange:(_NSRange)a3 minimumColumnLength:(int64_t)a4;
- (double)columnWidth;
- (double)contentScaleFactor;
- (double)leftInset;
- (double)leftMargin;
- (double)leftScreenMargin;
- (double)minimumHeight;
- (double)minimumViewportWidthForLooseLayout;
- (double)rightInset;
- (double)rightMargin;
- (double)rightScreenMargin;
- (double)widthForColumnRange:(_NSRange)a3 ignoreMargin:(unint64_t)a4 ignoreGutter:(unint64_t)a5 ignoreViewportPadding:(unint64_t)a6;
- (double)xPositionForColumnIndex:(int64_t)a3 ignoreMargin:(unint64_t)a4 ignoreGutter:(unint64_t)a5 ignoreViewportPadding:(unint64_t)a6;
- (id)columnLayoutForComponentBlueprint:(id)a3 unitConverter:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)gutter;
- (int64_t)layoutWidth;
- (int64_t)leftColumnOffset;
- (int64_t)rightColumnOffset;
- (unint64_t)layoutColumns;
- (unint64_t)numberOfColumns;
- (void)setLeftInset:(double)a3;
- (void)setMinimumHeight:(double)a3;
- (void)setMinimumViewportWidthForLooseLayout:(double)a3;
- (void)setRightColumnOffset:(int64_t)a3;
- (void)setRightInset:(double)a3;
@end

@implementation SXColumnLayout

- (double)widthForColumnRange:(_NSRange)a3 ignoreMargin:(unint64_t)a4 ignoreGutter:(unint64_t)a5 ignoreViewportPadding:(unint64_t)a6
{
  NSUInteger numberOfColumns = self->_numberOfColumns;
  if (a3.length >= numberOfColumns) {
    unint64_t length = self->_numberOfColumns;
  }
  else {
    unint64_t length = a3.length;
  }
  double v12 = (double)((length - 1) * self->_gutter);
  double v13 = self->_columnWidth * (double)length;
  BOOL v14 = (self->_leftColumnOffset | a3.location) == 0;
  if (self->_rightColumnOffset) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = a3.location + a3.length >= numberOfColumns;
  }
  int v16 = v15;
  BOOL v17 = (a4 & 0xFFFFFFFFFFFFFFFDLL) != 1 && [(SXDocumentLayout *)self->_documentLayout margin] != 0;
  double v18 = v13 + v12;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    BOOL v19 = (a6 & 0xFFFFFFFFFFFFFFFDLL) == 1;
    BOOL v20 = (a6 & 0xFFFFFFFFFFFFFFFELL) == 2;
    BOOL v21 = 1;
  }
  else
  {
    BOOL v21 = [(SXDocumentLayout *)self->_documentLayout margin] == 0;
    unint64_t v22 = a6 & 0xFFFFFFFFFFFFFFFDLL;
    BOOL v19 = (a6 & 0xFFFFFFFFFFFFFFFDLL) == 1;
    unint64_t v23 = a6 & 0xFFFFFFFFFFFFFFFELL;
    BOOL v20 = (a6 & 0xFFFFFFFFFFFFFFFELL) == 2;
    if (!a4)
    {
      BOOL v33 = v19;
      if ([(SXDocumentLayout *)self->_documentLayout margin]
        || self->_viewportSize.width != self->_constrainedViewportSize.width)
      {
        if (v22 == 1 && v14) {
          double v18 = v18 + self->_leftMargin;
        }
        BOOL v19 = v33;
        if (v23 == 2) {
          int v35 = v16;
        }
        else {
          int v35 = 0;
        }
        if (v35 == 1)
        {
          double v18 = v18 + self->_rightMargin;
          BOOL v20 = 1;
        }
        goto LABEL_25;
      }
      BOOL v19 = v33;
    }
  }
  int v24 = !v14;
  int v25 = v16 ^ 1;
  if (v17 || !v21 || (v24 & 1) != 0 || (v25 & 1) != 0)
  {
    if ((v17 | v24))
    {
      if ((!v21 | v25)) {
        goto LABEL_25;
      }
      double rightMargin = self->_rightMargin;
    }
    else
    {
      double rightMargin = self->_leftMargin;
    }
  }
  else
  {
    double rightMargin = self->_leftMargin + self->_rightMargin;
  }
  double v18 = v18 + rightMargin;
LABEL_25:
  if (a5)
  {
    int v27 = a5 != 3 || v14;
    if (((v27 | v16) & 1) == 0)
    {
      double gutter = (double)self->_gutter;
      goto LABEL_38;
    }
    if ((a5 | 2) == 3 && !v14)
    {
      double leftScreenMargin = (double)(self->_gutter / 2);
      goto LABEL_41;
    }
    if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      char v28 = v16;
    }
    else {
      char v28 = 1;
    }
    if ((v28 & 1) == 0)
    {
      double gutter = (double)(self->_gutter / 2);
LABEL_38:
      double v18 = v18 + gutter;
    }
  }
  if (!v19 || !v14) {
    goto LABEL_42;
  }
  double leftScreenMargin = self->_leftScreenMargin;
LABEL_41:
  double v18 = v18 + leftScreenMargin;
LABEL_42:
  if ((v20 & v16) == 1) {
    double v18 = v18 + self->_rightScreenMargin;
  }
  float v31 = v18;
  return roundf(v31);
}

- (SXColumnLayout)initWithConstrainedViewportSize:(CGSize)a3 viewportSize:(CGSize)a4 layoutWidth:(double)a5 documentLayout:(id)a6 numberOfLayoutColumns:(unint64_t)a7 leftMargin:(double)a8 rightMargin:(double)a9 numberOfColumns:(unint64_t)a10 columnWidth:(double)a11 leftScreenMargin:(double)a12 rightScreenMargin:(double)a13 contentScaleFactor:(double)a14
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat v22 = a3.height;
  CGFloat v23 = a3.width;
  id v25 = a6;
  v29.receiver = self;
  v29.super_class = (Class)SXColumnLayout;
  v26 = [(SXColumnLayout *)&v29 init];
  int v27 = v26;
  if (v26)
  {
    v26->_constrainedViewportSize.CGFloat width = v23;
    v26->_constrainedViewportSize.CGFloat height = v22;
    v26->_viewportSize.CGFloat width = width;
    v26->_viewportSize.CGFloat height = height;
    v26->_layoutWidth = [v25 width];
    objc_storeStrong((id *)&v27->_documentLayout, a6);
    v27->_leftMargin = a8;
    v27->_double rightMargin = a9;
    v27->_double gutter = [v25 gutter];
    v27->_NSUInteger numberOfColumns = a10;
    v27->_columnWidth = a11;
    v27->_layoutColumns = a7;
    v27->_double leftScreenMargin = a12;
    v27->_rightScreenMargin = a13;
    v27->_contentScaleFactor = a14;
  }

  return v27;
}

- (id)columnLayoutForComponentBlueprint:(id)a3 unitConverter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 componentLayout];
  BOOL v9 = [v8 ignoreDocumentMargin] == 3 || objc_msgSend(v8, "ignoreDocumentMargin") == 1;
  BOOL v10 = [v8 ignoreDocumentMargin] == 3 || objc_msgSend(v8, "ignoreDocumentMargin") == 2;
  if ([v6 columnRange]) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = self->_leftColumnOffset == 0;
  }
  uint64_t v12 = [v6 columnRange];
  [v6 columnRange];
  BOOL v14 = v13 + v12 == self->_numberOfColumns && self->_rightColumnOffset == 0;
  BOOL v15 = [v8 ignoreViewportPadding] != 1 && objc_msgSend(v8, "ignoreViewportPadding") != 3;
  BOOL v16 = [v8 ignoreViewportPadding] != 2 && objc_msgSend(v8, "ignoreViewportPadding") != 3;
  BOOL v17 = self->_viewportSize.width - self->_constrainedViewportSize.width < 2.22044605e-16
     && [(SXDocumentLayout *)self->_documentLayout margin] == 0;
  double leftScreenMargin = 0.0;
  double leftMargin = 0.0;
  if (v11 && (v9 || v17)) {
    double leftMargin = self->_leftMargin;
  }
  if (v11 && !v15)
  {
    double leftMargin = self->_leftMargin;
    double leftScreenMargin = self->_leftScreenMargin;
  }
  double rightScreenMargin = 0.0;
  double rightMargin = 0.0;
  if (v14 && (v10 || v17)) {
    double rightMargin = self->_rightMargin;
  }
  if (v14 && !v16)
  {
    double rightMargin = self->_rightMargin;
    double rightScreenMargin = self->_rightScreenMargin;
  }
  double columnWidth = self->_columnWidth;
  CGFloat v23 = [v6 componentSizer];
  [v23 contentInsetsWithUnitConverter:v7];
  double v25 = v24;
  double v27 = v26;

  double v28 = v25 + v27;
  if (v28 > 0.0)
  {
    [v6 columnRange];
    double columnWidth = columnWidth - v28 / (double)v29;
  }
  v30 = [SXColumnLayout alloc];
  double v31 = (double)[(SXDocumentLayout *)self->_documentLayout width];
  documentLayout = self->_documentLayout;
  [v8 columnRange];
  uint64_t v34 = v33;
  [v6 columnRange];
  v36 = -[SXColumnLayout initWithConstrainedViewportSize:viewportSize:layoutWidth:documentLayout:numberOfLayoutColumns:leftMargin:rightMargin:numberOfColumns:columnWidth:leftScreenMargin:rightScreenMargin:contentScaleFactor:](v30, "initWithConstrainedViewportSize:viewportSize:layoutWidth:documentLayout:numberOfLayoutColumns:leftMargin:rightMargin:numberOfColumns:columnWidth:leftScreenMargin:rightScreenMargin:contentScaleFactor:", documentLayout, v34, v35, self->_constrainedViewportSize.width, self->_constrainedViewportSize.height, self->_viewportSize.width, self->_viewportSize.height, v31, leftMargin, rightMargin, columnWidth, *(void *)&leftScreenMargin, *(void *)&rightScreenMargin, *(void *)&self->_contentScaleFactor);
  int64_t leftColumnOffset = self->_leftColumnOffset;
  v36->_int64_t leftColumnOffset = [v6 columnRange] + leftColumnOffset;
  int64_t v39 = self->_leftColumnOffset;
  int64_t rightColumnOffset = self->_rightColumnOffset;
  unint64_t numberOfColumns = self->_numberOfColumns;
  uint64_t v41 = [(SXColumnLayout *)v36 leftColumnOffset];
  v36->_int64_t rightColumnOffset = v39
                          + rightColumnOffset
                          + numberOfColumns
                          - (v41
                           + [(SXColumnLayout *)v36 numberOfColumns]);
  [(SXColumnLayout *)v36 setMinimumViewportWidthForLooseLayout:self->_minimumViewportWidthForLooseLayout];
  if (([v8 ignoreDocumentGutter] == 3 || objc_msgSend(v8, "ignoreDocumentGutter") == 1)
    && [(SXColumnLayout *)v36 leftColumnOffset])
  {
    [(SXColumnLayout *)v36 setLeftInset:(double)(self->_gutter / 2)];
  }
  if (([v8 ignoreDocumentGutter] == 3 || objc_msgSend(v8, "ignoreDocumentGutter") == 2)
    && [(SXColumnLayout *)v36 rightColumnOffset])
  {
    [(SXColumnLayout *)v36 setRightInset:(double)(self->_gutter / 2)];
  }
  [v8 minimumHeight];
  if (v42)
  {
    uint64_t v43 = [v8 minimumHeight];
    objc_msgSend(v7, "convertValueToPoints:", v43, v44);
    -[SXColumnLayout setMinimumHeight:](v36, "setMinimumHeight:");
  }

  return v36;
}

- (_NSRange)convertColumnRange:(_NSRange)a3 minimumColumnLength:(int64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double width = self->_constrainedViewportSize.width;
  double minimumViewportWidthForLooseLayout = self->_minimumViewportWidthForLooseLayout;
  if (width <= minimumViewportWidthForLooseLayout)
  {
    if (width >= minimumViewportWidthForLooseLayout
      || (double v10 = (double)a3.length,
          (double)a3.length / (double)[(SXDocumentLayout *)self->_documentLayout columns] >= 0.25))
    {
      NSUInteger v29 = 0;
      NSUInteger numberOfColumns = self->_numberOfColumns;
      goto LABEL_49;
    }
  }
  else
  {
    double v10 = (double)a3.length;
  }
  unint64_t v11 = self->_numberOfColumns;
  if (v11 >= a4) {
    uint64_t v12 = a4;
  }
  else {
    uint64_t v12 = self->_numberOfColumns;
  }
  if (v12 >= length) {
    uint64_t v12 = length;
  }
  double layoutColumns = (double)self->_layoutColumns;
  BOOL v15 = v10 / layoutColumns <= 0.45 && v12 == 1;
  double v16 = (double)v11 / layoutColumns;
  float v17 = v16 * (double)location;
  uint64_t v18 = llroundf(v17);
  *(float *)&double v16 = v16 * (double)(location + length);
  int64_t v19 = llroundf(*(float *)&v16) - v18;
  unint64_t v20 = v12 + v18 - v11;
  if (v12 + v18 < v11) {
    unint64_t v20 = 0;
  }
  if (v18 >= -1) {
    uint64_t v21 = -1;
  }
  else {
    uint64_t v21 = v18;
  }
  unint64_t v22 = v18 - v21;
  if (v20 >= v22) {
    unint64_t v20 = v22;
  }
  uint64_t v23 = v18 - v20;
  if (v19 < v12) {
    uint64_t v18 = v23;
  }
  else {
    uint64_t v12 = v19;
  }
  if (v12 != 1) {
    BOOL v15 = 1;
  }
  uint64_t v24 = 1;
  if (v18) {
    BOOL v25 = v18 + 2 <= (uint64_t)v11;
  }
  else {
    BOOL v25 = 1;
  }
  uint64_t v26 = !v25;
  uint64_t v27 = v18 - v26;
  if (v11 < 2) {
    uint64_t v27 = v18;
  }
  else {
    uint64_t v24 = 2;
  }
  if (v15)
  {
    int64_t v28 = v18;
  }
  else
  {
    uint64_t v12 = v24;
    int64_t v28 = v27;
  }
  if (v28 >= (uint64_t)(v11 - 1)) {
    NSUInteger v29 = v11 - 1;
  }
  else {
    NSUInteger v29 = v28;
  }
  if (v12 <= 1) {
    uint64_t v12 = 1;
  }
  int64_t v30 = v11 - v29;
  if (v12 >= v30) {
    NSUInteger numberOfColumns = v30;
  }
  else {
    NSUInteger numberOfColumns = v12;
  }
LABEL_49:
  result.NSUInteger length = numberOfColumns;
  result.NSUInteger location = v29;
  return result;
}

- (double)xPositionForColumnIndex:(int64_t)a3 ignoreMargin:(unint64_t)a4 ignoreGutter:(unint64_t)a5 ignoreViewportPadding:(unint64_t)a6
{
  double v10 = self->_columnWidth * (double)a3 + (double)(self->_gutter * a3);
  double leftInset = self->_leftInset;
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    BOOL v12 = 1;
  }
  else if ([(SXDocumentLayout *)self->_documentLayout margin])
  {
    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = self->_viewportSize.width == self->_constrainedViewportSize.width;
  }
  double v13 = leftInset + v10;
  unint64_t v14 = a6 & 0xFFFFFFFFFFFFFFFDLL;
  if (self->_leftColumnOffset + a3)
  {
    double v13 = v13 + self->_leftMargin;
    if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      double v13 = v13 - (double)(self->_gutter / 2);
    }
  }
  else if (v14 != 1 && !v12)
  {
    double v13 = v13 + self->_leftMargin;
  }
  if (v14 != 1) {
    double v13 = v13 + self->_leftScreenMargin;
  }
  float v15 = v13;
  return roundf(v15);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SXColumnLayout *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (v5->_constrainedViewportSize.width == self->_constrainedViewportSize.width
        ? (BOOL v6 = v5->_constrainedViewportSize.height == self->_constrainedViewportSize.height)
        : (BOOL v6 = 0),
          v6
       && (v5->_viewportSize.width == self->_viewportSize.width
         ? (BOOL v7 = v5->_viewportSize.height == self->_viewportSize.height)
         : (BOOL v7 = 0),
           v7
        && v5->_layoutWidth == self->_layoutWidth
        && v5->_leftMargin == self->_leftMargin
        && v5->_rightMargin == self->_rightMargin
        && v5->_gutter == self->_gutter
        && v5->_numberOfColumns == self->_numberOfColumns
        && v5->_columnWidth == self->_columnWidth
        && v5->_minimumHeight == self->_minimumHeight
        && v5->_leftScreenMargin == self->_leftScreenMargin
        && v5->_rightScreenMargin == self->_rightScreenMargin))
      && v5->_contentScaleFactor == self->_contentScaleFactor;

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithConstrainedViewportSize:viewportSize:layoutWidth:documentLayout:numberOfLayoutColumns:leftMargin:rightMargin:numberOfColumns:columnWidth:leftScreenMargin:rightScreenMargin:contentScaleFactor:", self->_documentLayout, self->_layoutColumns, self->_numberOfColumns, self->_constrainedViewportSize.width, self->_constrainedViewportSize.height, self->_viewportSize.width, self->_viewportSize.height, (double)self->_layoutWidth, self->_leftMargin, self->_rightMargin, self->_columnWidth, *(void *)&self->_leftScreenMargin, *(void *)&self->_rightScreenMargin, *(void *)&self->_contentScaleFactor);
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; columns: %lu", self->_numberOfColumns);
  objc_msgSend(v3, "appendFormat:", @"; columnWidth: %f", *(void *)&self->_columnWidth);
  v4 = NSStringFromCGSize(self->_constrainedViewportSize);
  [v3 appendFormat:@"; constrainedViewportSize: %@", v4];

  v5 = NSStringFromCGSize(self->_viewportSize);
  [v3 appendFormat:@"; viewportSize: %@", v5];

  objc_msgSend(v3, "appendFormat:", @"; layoutWidth: %lu", self->_layoutWidth);
  objc_msgSend(v3, "appendFormat:", @"; leftMargin: %lu", *(void *)&self->_leftMargin);
  objc_msgSend(v3, "appendFormat:", @"; rightMargin: %lu", *(void *)&self->_rightMargin);
  objc_msgSend(v3, "appendFormat:", @"; gutter: %lu", self->_gutter);
  objc_msgSend(v3, "appendFormat:", @"; leftColumnOffset: %lu", self->_leftColumnOffset);
  objc_msgSend(v3, "appendFormat:", @"; rightColumnOffset: %lu", self->_rightColumnOffset);
  objc_msgSend(v3, "appendFormat:", @"; leftInset: %f", *(void *)&self->_leftInset);
  objc_msgSend(v3, "appendFormat:", @"; rightInset: %f", *(void *)&self->_rightInset);
  objc_msgSend(v3, "appendFormat:", @"; minimumHeight: %f", *(void *)&self->_minimumHeight);
  objc_msgSend(v3, "appendFormat:", @"; leftScreenMargin: %f", *(void *)&self->_leftScreenMargin);
  objc_msgSend(v3, "appendFormat:", @"; rightScreenMargin: %f", *(void *)&self->_rightScreenMargin);
  objc_msgSend(v3, "appendFormat:", @"; documentLayout: {width: %lu, columns: %lu, margin: %lu, columns: %lu}",
    [(SXDocumentLayout *)self->_documentLayout width],
    [(SXDocumentLayout *)self->_documentLayout columns],
    [(SXDocumentLayout *)self->_documentLayout margin],
    [(SXDocumentLayout *)self->_documentLayout gutter]);
  objc_msgSend(v3, "appendFormat:", @"; contentScaleFactor: %f", *(void *)&self->_contentScaleFactor);
  [v3 appendString:@">"];
  return v3;
}

- (CGSize)constrainedViewportSize
{
  double width = self->_constrainedViewportSize.width;
  double height = self->_constrainedViewportSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)viewportSize
{
  double width = self->_viewportSize.width;
  double height = self->_viewportSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (SXDocumentLayout)documentLayout
{
  return self->_documentLayout;
}

- (int64_t)layoutWidth
{
  return self->_layoutWidth;
}

- (double)leftMargin
{
  return self->_leftMargin;
}

- (double)rightMargin
{
  return self->_rightMargin;
}

- (int64_t)gutter
{
  return self->_gutter;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (double)columnWidth
{
  return self->_columnWidth;
}

- (int64_t)leftColumnOffset
{
  return self->_leftColumnOffset;
}

- (int64_t)rightColumnOffset
{
  return self->_rightColumnOffset;
}

- (void)setRightColumnOffset:(int64_t)a3
{
  self->_int64_t rightColumnOffset = a3;
}

- (double)leftInset
{
  return self->_leftInset;
}

- (void)setLeftInset:(double)a3
{
  self->_double leftInset = a3;
}

- (double)rightInset
{
  return self->_rightInset;
}

- (void)setRightInset:(double)a3
{
  self->_rightInset = a3;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (double)minimumViewportWidthForLooseLayout
{
  return self->_minimumViewportWidthForLooseLayout;
}

- (void)setMinimumViewportWidthForLooseLayout:(double)a3
{
  self->_double minimumViewportWidthForLooseLayout = a3;
}

- (double)leftScreenMargin
{
  return self->_leftScreenMargin;
}

- (double)rightScreenMargin
{
  return self->_rightScreenMargin;
}

- (double)contentScaleFactor
{
  return self->_contentScaleFactor;
}

- (unint64_t)layoutColumns
{
  return self->_layoutColumns;
}

- (void).cxx_destruct
{
}

@end