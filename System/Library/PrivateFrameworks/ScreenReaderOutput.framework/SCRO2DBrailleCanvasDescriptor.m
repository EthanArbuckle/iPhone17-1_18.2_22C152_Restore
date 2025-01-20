@interface SCRO2DBrailleCanvasDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)hasConsistentHorizontalPinSpacing;
- (BOOL)hasConsistentVerticalPinSpacing;
- (BOOL)skipPinBetweenCellsHorizontally;
- (BOOL)skipPinBetweenCellsVertically;
- (SCRO2DBrailleCanvasDescriptor)initWithCoder:(id)a3;
- (double)horizontalPinSpacing;
- (double)interCellHorizontalSpacing;
- (double)interCellVerticalSpacing;
- (double)verticalPinSpacing;
- (unint64_t)cellHeight;
- (unint64_t)cellWidth;
- (unint64_t)detentCount;
- (unint64_t)height;
- (unint64_t)numberOfCellsInRowAvailable;
- (unint64_t)numberOfGraphicsLinesAvailableForTextLines:(unint64_t)a3;
- (unint64_t)numberOfTextLinesAvailable;
- (unint64_t)pinHeightStyle;
- (unint64_t)width;
- (void)encodeWithCoder:(id)a3;
- (void)setCellHeight:(unint64_t)a3;
- (void)setCellWidth:(unint64_t)a3;
- (void)setDetentCount:(unint64_t)a3;
- (void)setHasConsistentHorizontalPinSpacing:(BOOL)a3;
- (void)setHasConsistentVerticalPinSpacing:(BOOL)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setHorizontalPinSpacing:(double)a3;
- (void)setInterCellHorizontalSpacing:(double)a3;
- (void)setInterCellVerticalSpacing:(double)a3;
- (void)setPinHeightStyle:(unint64_t)a3;
- (void)setSkipPinBetweenCellsHorizontally:(BOOL)a3;
- (void)setSkipPinBetweenCellsVertically:(BOOL)a3;
- (void)setVerticalPinSpacing:(double)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation SCRO2DBrailleCanvasDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCRO2DBrailleCanvasDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SCRO2DBrailleCanvasDescriptor;
  v5 = [(SCRO2DBrailleCanvasDescriptor *)&v12 init];
  if (v5)
  {
    v5->_height = [v4 decodeIntegerForKey:@"height"];
    v5->_width = [v4 decodeIntegerForKey:@"width"];
    v5->_cellHeight = [v4 decodeIntegerForKey:@"cellHeight"];
    v5->_cellWidth = [v4 decodeIntegerForKey:@"cellWidth"];
    v5->_hasConsistentHorizontalPinSpacing = [v4 decodeBoolForKey:@"hasConsistentHorizontalPinSpacing"];
    v5->_hasConsistentVerticalPinSpacing = [v4 decodeBoolForKey:@"hasConsistentVerticalPinSpacing"];
    [v4 decodeDoubleForKey:@"verticalPinSpacing"];
    v5->_verticalPinSpacing = v6;
    [v4 decodeDoubleForKey:@"horizontalPinSpacing"];
    v5->_horizontalPinSpacing = v7;
    [v4 decodeDoubleForKey:@"interCellHorizontalSpacing"];
    v5->_interCellHorizontalSpacing = v8;
    [v4 decodeDoubleForKey:@"interCellVerticalSpacing"];
    v5->_interCellVerticalSpacing = v9;
    v5->_skipPinBetweenCellsHorizontally = [v4 decodeBoolForKey:@"skipPinBetweenCellsHorizontally"];
    v5->_skipPinBetweenCellsVertically = [v4 decodeBoolForKey:@"skipPinBetweenCellsVertically"];
    v5->_pinHeightStyle = [v4 decodeIntegerForKey:@"pinHeightStyle"];
    v5->_detentCount = [v4 decodeIntegerForKey:@"detentCount"];
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t height = self->_height;
  id v5 = a3;
  [v5 encodeInteger:height forKey:@"height"];
  [v5 encodeInteger:self->_width forKey:@"width"];
  objc_msgSend(v5, "encodeInteger:forKey:", -[SCRO2DBrailleCanvasDescriptor cellHeight](self, "cellHeight"), @"cellHeight");
  objc_msgSend(v5, "encodeInteger:forKey:", -[SCRO2DBrailleCanvasDescriptor cellWidth](self, "cellWidth"), @"cellWidth");
  objc_msgSend(v5, "encodeBool:forKey:", -[SCRO2DBrailleCanvasDescriptor hasConsistentHorizontalPinSpacing](self, "hasConsistentHorizontalPinSpacing"), @"hasConsistentHorizontalPinSpacing");
  objc_msgSend(v5, "encodeBool:forKey:", -[SCRO2DBrailleCanvasDescriptor hasConsistentVerticalPinSpacing](self, "hasConsistentVerticalPinSpacing"), @"hasConsistentVerticalPinSpacing");
  [(SCRO2DBrailleCanvasDescriptor *)self verticalPinSpacing];
  objc_msgSend(v5, "encodeDouble:forKey:", @"verticalPinSpacing");
  [(SCRO2DBrailleCanvasDescriptor *)self horizontalPinSpacing];
  objc_msgSend(v5, "encodeDouble:forKey:", @"horizontalPinSpacing");
  [(SCRO2DBrailleCanvasDescriptor *)self interCellHorizontalSpacing];
  objc_msgSend(v5, "encodeDouble:forKey:", @"interCellHorizontalSpacing");
  [(SCRO2DBrailleCanvasDescriptor *)self interCellVerticalSpacing];
  objc_msgSend(v5, "encodeDouble:forKey:", @"interCellVerticalSpacing");
  objc_msgSend(v5, "encodeBool:forKey:", -[SCRO2DBrailleCanvasDescriptor skipPinBetweenCellsHorizontally](self, "skipPinBetweenCellsHorizontally"), @"skipPinBetweenCellsHorizontally");
  objc_msgSend(v5, "encodeBool:forKey:", -[SCRO2DBrailleCanvasDescriptor skipPinBetweenCellsVertically](self, "skipPinBetweenCellsVertically"), @"skipPinBetweenCellsVertically");
  objc_msgSend(v5, "encodeInteger:forKey:", -[SCRO2DBrailleCanvasDescriptor pinHeightStyle](self, "pinHeightStyle"), @"pinHeightStyle");
  objc_msgSend(v5, "encodeInteger:forKey:", -[SCRO2DBrailleCanvasDescriptor detentCount](self, "detentCount"), @"detentCount");
}

- (unint64_t)numberOfCellsInRowAvailable
{
  BOOL v3 = [(SCRO2DBrailleCanvasDescriptor *)self skipPinBetweenCellsHorizontally];
  unint64_t v4 = [(SCRO2DBrailleCanvasDescriptor *)self cellWidth] + v3;
  unint64_t width = self->_width;
  unint64_t v6 = width / v4;
  if (width % v4 == [(SCRO2DBrailleCanvasDescriptor *)self cellWidth]) {
    return v6 + 1;
  }
  else {
    return v6;
  }
}

- (unint64_t)numberOfTextLinesAvailable
{
  BOOL v3 = [(SCRO2DBrailleCanvasDescriptor *)self skipPinBetweenCellsVertically];
  unint64_t v4 = [(SCRO2DBrailleCanvasDescriptor *)self cellHeight] + v3;
  unint64_t height = self->_height;
  unint64_t v6 = height / v4;
  if (height % v4 == [(SCRO2DBrailleCanvasDescriptor *)self cellHeight]) {
    return v6 + 1;
  }
  else {
    return v6;
  }
}

- (unint64_t)numberOfGraphicsLinesAvailableForTextLines:(unint64_t)a3
{
  uint64_t v5 = [(SCRO2DBrailleCanvasDescriptor *)self skipPinBetweenCellsVertically] << 63 >> 63;
  uint64_t v6 = v5 - [(SCRO2DBrailleCanvasDescriptor *)self cellHeight];
  BOOL v7 = [(SCRO2DBrailleCanvasDescriptor *)self skipPinBetweenCellsVertically];
  if (a3) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }
  return self->_height + v6 * a3 + v8;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_unint64_t height = a3;
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_unint64_t width = a3;
}

- (unint64_t)cellHeight
{
  return self->_cellHeight;
}

- (void)setCellHeight:(unint64_t)a3
{
  self->_cellHeight = a3;
}

- (unint64_t)cellWidth
{
  return self->_cellWidth;
}

- (void)setCellWidth:(unint64_t)a3
{
  self->_cellWidth = a3;
}

- (BOOL)hasConsistentHorizontalPinSpacing
{
  return self->_hasConsistentHorizontalPinSpacing;
}

- (void)setHasConsistentHorizontalPinSpacing:(BOOL)a3
{
  self->_hasConsistentHorizontalPinSpacing = a3;
}

- (BOOL)hasConsistentVerticalPinSpacing
{
  return self->_hasConsistentVerticalPinSpacing;
}

- (void)setHasConsistentVerticalPinSpacing:(BOOL)a3
{
  self->_hasConsistentVerticalPinSpacing = a3;
}

- (double)verticalPinSpacing
{
  return self->_verticalPinSpacing;
}

- (void)setVerticalPinSpacing:(double)a3
{
  self->_verticalPinSpacing = a3;
}

- (double)horizontalPinSpacing
{
  return self->_horizontalPinSpacing;
}

- (void)setHorizontalPinSpacing:(double)a3
{
  self->_horizontalPinSpacing = a3;
}

- (double)interCellHorizontalSpacing
{
  return self->_interCellHorizontalSpacing;
}

- (void)setInterCellHorizontalSpacing:(double)a3
{
  self->_interCellHorizontalSpacing = a3;
}

- (double)interCellVerticalSpacing
{
  return self->_interCellVerticalSpacing;
}

- (void)setInterCellVerticalSpacing:(double)a3
{
  self->_interCellVerticalSpacing = a3;
}

- (BOOL)skipPinBetweenCellsHorizontally
{
  return self->_skipPinBetweenCellsHorizontally;
}

- (void)setSkipPinBetweenCellsHorizontally:(BOOL)a3
{
  self->_skipPinBetweenCellsHorizontally = a3;
}

- (BOOL)skipPinBetweenCellsVertically
{
  return self->_skipPinBetweenCellsVertically;
}

- (void)setSkipPinBetweenCellsVertically:(BOOL)a3
{
  self->_skipPinBetweenCellsVertically = a3;
}

- (unint64_t)pinHeightStyle
{
  return self->_pinHeightStyle;
}

- (void)setPinHeightStyle:(unint64_t)a3
{
  self->_pinHeightStyle = a3;
}

- (unint64_t)detentCount
{
  return self->_detentCount;
}

- (void)setDetentCount:(unint64_t)a3
{
  self->_detentCount = a3;
}

@end