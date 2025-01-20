@interface EMColumnInfoMapper
- (EMColumnInfoMapper)initWithDefaultWidth:(double)a3 span:(unint64_t)a4 parent:(id)a5;
- (EMColumnInfoMapper)initWithEDColumnInfo:(id)a3 maxSpan:(unint64_t)a4 parent:(id)a5;
- (double)columnWidth;
- (void)mapAt:(id)a3 withState:(id)a4;
@end

@implementation EMColumnInfoMapper

- (EMColumnInfoMapper)initWithDefaultWidth:(double)a3 span:(unint64_t)a4 parent:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)EMColumnInfoMapper;
  v9 = [(CMMapper *)&v16 initWithParent:v8];
  v10 = v9;
  if (v9)
  {
    edColumnInfo = v9->edColumnInfo;
    v9->edColumnInfo = 0;

    v12 = [v8 columnWidthConvertor];
    [v12 lassoColumnWidthFromXl:a3];
    v10->columnWidth = v13;

    if (a4 <= 1) {
      unint64_t v14 = 1;
    }
    else {
      unint64_t v14 = a4;
    }
    v10->columnSpan = v14;
  }

  return v10;
}

- (double)columnWidth
{
  return self->columnWidth;
}

- (EMColumnInfoMapper)initWithEDColumnInfo:(id)a3 maxSpan:(unint64_t)a4 parent:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)EMColumnInfoMapper;
  v11 = [(CMMapper *)&v21 initWithParent:v10];
  v12 = v11;
  if (v11)
  {
    p_edColumnInfo = (id *)&v11->edColumnInfo;
    objc_storeStrong((id *)&v11->edColumnInfo, a3);
    unint64_t v14 = [v10 columnWidthConvertor];
    [*p_edColumnInfo width];
    objc_msgSend(v14, "lassoColumnWidthFromXl:");
    v12->columnWidth = v15;

    v12->unint64_t columnSpan = 1;
    objc_super v16 = [*p_edColumnInfo range];
    v17 = v16;
    if (v16)
    {
      int v18 = [v16 lastColumn];
      unint64_t columnSpan = (int)(v18 - [v17 firstColumn] + 1);
      v12->unint64_t columnSpan = columnSpan;
    }
    else
    {
      unint64_t columnSpan = v12->columnSpan;
    }
    if (columnSpan > a4) {
      v12->unint64_t columnSpan = a4;
    }
  }
  return v12;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v12 = a3;
  v11 = +[OIXMLElement elementWithType:2];
  [v12 addChild:v11];
  id v10 = [[CMLengthProperty alloc] initWithNumber:self->columnWidth + 1.0];
  v5 = [(CMLengthProperty *)v10 cssStringForName:@"width"];
  v6 = +[OIXMLAttribute attributeWithName:@"style" stringValue:v5];
  [v11 addAttribute:v6];
  if (self->columnSpan >= 2)
  {
    unint64_t v7 = 1;
    do
    {
      id v8 = +[OIXMLElement elementWithType:2];
      id v9 = +[OIXMLAttribute attributeWithName:@"style" stringValue:v5];
      [v8 addAttribute:v9];
      [v12 addChild:v8];

      ++v7;
    }
    while (self->columnSpan > v7);
  }
}

- (void).cxx_destruct
{
}

@end