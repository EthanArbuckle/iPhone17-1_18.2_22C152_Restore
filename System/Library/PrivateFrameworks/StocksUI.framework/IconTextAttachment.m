@interface IconTextAttachment
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6;
- (_TtC8StocksUI18IconTextAttachment)initWithCoder:(id)a3;
- (_TtC8StocksUI18IconTextAttachment)initWithData:(id)a3 ofType:(id)a4;
@end

@implementation IconTextAttachment

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  id v15 = a3;
  v16 = self;
  double v17 = sub_20A859834((uint64_t)a3, a6, v12, v11, width, height, x, y);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (_TtC8StocksUI18IconTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  v5 = a3;
  if (!a3)
  {
    id v13 = a4;
    unint64_t v9 = 0xF000000000000000;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    return (_TtC8StocksUI18IconTextAttachment *)sub_20A859A48((uint64_t)v5, v9, v10, v12);
  }
  id v6 = a4;
  id v7 = v5;
  v5 = (void *)sub_20A8C2560();
  unint64_t v9 = v8;

  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = sub_20A8CE280();
  uint64_t v12 = v11;

  return (_TtC8StocksUI18IconTextAttachment *)sub_20A859A48((uint64_t)v5, v9, v10, v12);
}

- (_TtC8StocksUI18IconTextAttachment)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = (char *)self + OBJC_IVAR____TtC8StocksUI18IconTextAttachment_baselineAdjustment;
  *(void *)id v6 = 0;
  v6[8] = 1;
  id v7 = (char *)self + OBJC_IVAR____TtC8StocksUI18IconTextAttachment_imageHeightOverride;
  *(void *)id v7 = 0;
  v7[8] = 1;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(IconTextAttachment *)&v9 initWithCoder:a3];
}

@end