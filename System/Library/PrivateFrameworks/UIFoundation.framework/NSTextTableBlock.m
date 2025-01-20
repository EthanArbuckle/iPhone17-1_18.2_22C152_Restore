@interface NSTextTableBlock
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (CGRect)boundsRectForContentRect:(CGRect)a3 inRect:(CGRect)a4 textContainer:(id)a5 characterRange:(_NSRange)a6;
- (CGRect)rectForLayoutAtPoint:(CGPoint)a3 inRect:(CGRect)a4 textContainer:(id)a5 characterRange:(_NSRange)a6;
- (NSInteger)columnSpan;
- (NSInteger)rowSpan;
- (NSInteger)startingColumn;
- (NSInteger)startingRow;
- (NSTextTable)table;
- (NSTextTableBlock)init;
- (NSTextTableBlock)initWithCoder:(id)a3;
- (NSTextTableBlock)initWithTable:(NSTextTable *)table startingRow:(NSInteger)row rowSpan:(NSInteger)rowSpan startingColumn:(NSInteger)col columnSpan:(NSInteger)colSpan;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setColumnSpan:(int64_t)a3;
- (void)_setRowSpan:(int64_t)a3;
- (void)dealloc;
- (void)drawBackgroundWithFrame:(CGRect)a3 inView:(id)a4 characterRange:(_NSRange)a5 layoutManager:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSTextTableBlock

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSTextTableBlock setVersion:1];
    __NSTextTableBlockClass = (uint64_t)a1;
  }
}

- (NSTextTableBlock)init
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Non-designated initializer called for NSTextTableBlock"];
  v3 = objc_alloc_init(NSTextTable);

  return [(NSTextTableBlock *)self initWithTable:v3 startingRow:0 rowSpan:9 startingColumn:9 columnSpan:0];
}

- (NSTextTableBlock)initWithTable:(NSTextTable *)table startingRow:(NSInteger)row rowSpan:(NSInteger)rowSpan startingColumn:(NSInteger)col columnSpan:(NSInteger)colSpan
{
  v15.receiver = self;
  v15.super_class = (Class)NSTextTableBlock;
  v12 = [(NSTextBlock *)&v15 init];
  v13 = v12;
  if (v12)
  {
    if (table)
    {
      v12->_table = table;
      v13->_rowNum = row;
      v13->_colNum = col;
      v13->_rowSpan = rowSpan;
      v13->_colSpan = colSpan;
    }
    else
    {

      return 0;
    }
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSTextTableBlock;
  [(NSTextBlock *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NSTextTableBlock;
  -[NSTextBlock encodeWithCoder:](&v10, sel_encodeWithCoder_);
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:self->_table forKey:@"NSTable"];
    [a3 encodeInteger:self->_rowNum forKey:@"NSRowNum"];
    [a3 encodeInteger:self->_colNum forKey:@"NSColNum"];
    [a3 encodeInteger:self->_rowSpan forKey:@"NSRowSpan"];
    [a3 encodeInteger:self->_colSpan forKey:@"NSColSpan"];
  }
  else
  {
    int64_t rowNum = self->_rowNum;
    int colNum = self->_colNum;
    int v9 = rowNum;
    int rowSpan = self->_rowSpan;
    int colSpan = self->_colSpan;
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@IIII", &self->_table, &v9, &colNum, &rowSpan, &colSpan);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextTableBlock)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NSTextTableBlock;
  v4 = -[NSTextBlock initWithCoder:](&v12, sel_initWithCoder_);
  if (v4)
  {
    if ([a3 allowsKeyedCoding])
    {
      v4->_table = (NSTextTable *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSTable"];
      v4->_int64_t rowNum = [a3 decodeIntegerForKey:@"NSRowNum"];
      v4->_int colNum = [a3 decodeIntegerForKey:@"NSColNum"];
      v4->_int rowSpan = [a3 decodeIntegerForKey:@"NSRowSpan"];
      v4->_int colSpan = [a3 decodeIntegerForKey:@"NSColSpan"];
    }
    else
    {
      uint64_t v5 = [a3 versionForClassName:@"NSTextTableBlock"];
      if (v5 == 1)
      {
        unsigned int v11 = 0;
        unsigned int v10 = 0;
        uint64_t v9 = 0;
        objc_msgSend(a3, "decodeValuesOfObjCTypes:", "@IIII", &v4->_table, &v11, &v10, (char *)&v9 + 4, &v9);
        v4->_int64_t rowNum = v11;
        v4->_int colNum = v10;
        v4->_int rowSpan = HIDWORD(v9);
        v4->_int colSpan = v9;
      }
      else
      {
        uint64_t v6 = v5;
        uint64_t v7 = _NSFullMethodName();
        NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v7, 1, v6);

        return 0;
      }
    }
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTable:startingRow:rowSpan:startingColumn:columnSpan:", self->_table, self->_rowNum, self->_rowSpan, self->_colNum, self->_colSpan);
  [v4 _takeValuesFromTextBlock:self];
  return v4;
}

- (NSTextTable)table
{
  return self->_table;
}

- (NSInteger)startingRow
{
  return self->_rowNum;
}

- (NSInteger)rowSpan
{
  return self->_rowSpan;
}

- (NSInteger)startingColumn
{
  return self->_colNum;
}

- (NSInteger)columnSpan
{
  return self->_colSpan;
}

- (void)_setRowSpan:(int64_t)a3
{
  self->_int rowSpan = a3;
}

- (void)_setColumnSpan:(int64_t)a3
{
  self->_int colSpan = a3;
}

- (CGRect)rectForLayoutAtPoint:(CGPoint)a3 inRect:(CGRect)a4 textContainer:(id)a5 characterRange:(_NSRange)a6
{
  -[NSTextTable rectForBlock:layoutAtPoint:inRect:textContainer:characterRange:](self->_table, "rectForBlock:layoutAtPoint:inRect:textContainer:characterRange:", self, a5, a6.location, a6.length, a3.x, a3.y, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)boundsRectForContentRect:(CGRect)a3 inRect:(CGRect)a4 textContainer:(id)a5 characterRange:(_NSRange)a6
{
  -[NSTextTable boundsRectForBlock:contentRect:inRect:textContainer:characterRange:](self->_table, "boundsRectForBlock:contentRect:inRect:textContainer:characterRange:", self, a5, a6.location, a6.length, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)drawBackgroundWithFrame:(CGRect)a3 inView:(id)a4 characterRange:(_NSRange)a5 layoutManager:(id)a6
{
}

@end