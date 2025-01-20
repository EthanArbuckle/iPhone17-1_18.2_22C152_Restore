@interface DOCInsetTextField
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7517DOCInsetTextField)initWithCoder:(id)a3;
- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7517DOCInsetTextField)initWithFrame:(CGRect)a3;
@end

@implementation DOCInsetTextField

- (CGRect)textRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  double v8 = sub_1002E4798(x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  -[DOCInsetTextField textRectForBounds:](self, "textRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7517DOCInsetTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCInsetTextField();
  return -[DOCInsetTextField initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7517DOCInsetTextField)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCInsetTextField();
  return [(DOCInsetTextField *)&v5 initWithCoder:a3];
}

@end