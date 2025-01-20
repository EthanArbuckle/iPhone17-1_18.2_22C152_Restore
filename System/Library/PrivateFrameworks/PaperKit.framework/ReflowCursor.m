@interface ReflowCursor
- (CGRect)frame;
- (_TtC8PaperKit12ReflowCursor)initWithCoder:(id)a3;
- (_TtC8PaperKit12ReflowCursor)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation ReflowCursor

- (_TtC8PaperKit12ReflowCursor)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ReflowCursor();
  v7 = -[ReflowCursor initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v8 = self;
  v9 = v7;
  id v10 = objc_msgSend(v8, sel_tintColor);
  [(ReflowCursor *)v9 setBackgroundColor:v10];

  id v11 = [(ReflowCursor *)v9 layer];
  v14.origin.double x = x;
  v14.origin.double y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  objc_msgSend(v11, sel_setCornerRadius_, CGRectGetWidth(v14) * 0.5);

  return v9;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ReflowCursor();
  [(ReflowCursor *)&v6 frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ReflowCursor();
  id v7 = v9.receiver;
  -[ReflowCursor setFrame:](&v9, sel_setFrame_, x, y, width, height);
  id v8 = objc_msgSend(v7, sel_layer, v9.receiver, v9.super_class);
  objc_msgSend(v7, sel_frame);
  objc_msgSend(v8, sel_setCornerRadius_, CGRectGetWidth(v10) * 0.5);
}

- (_TtC8PaperKit12ReflowCursor)initWithCoder:(id)a3
{
  CGRect result = (_TtC8PaperKit12ReflowCursor *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end