@interface TextViewWithPlaceHolder
- (NSString)text;
- (UIEdgeInsets)textContainerInset;
- (UIFont)font;
- (_TtC17SequoiaTranslator23TextViewWithPlaceHolder)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator23TextViewWithPlaceHolder)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)_axPlaceholderTextView;
- (int64_t)textAlignment;
- (void)paste:(id)a3;
- (void)setFont:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextContainerInset:(UIEdgeInsets)a3;
- (void)textDidUpdate;
@end

@implementation TextViewWithPlaceHolder

- (UIFont)font
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  v2 = [(TextViewWithPlaceHolder *)&v4 font];

  return v2;
}

- (void)setFont:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  id v4 = a3;
  id v5 = v8.receiver;
  [(TextViewWithPlaceHolder *)&v8 setFont:v4];
  id v6 = sub_1001E74EC();
  id v7 = [v5 font];
  [v6 setFont:v7];
}

- (int64_t)textAlignment
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  return [(TextViewWithPlaceHolder *)&v3 textAlignment];
}

- (void)setTextAlignment:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  id v4 = v6.receiver;
  [(TextViewWithPlaceHolder *)&v6 setTextAlignment:a3];
  id v5 = sub_1001E74EC();
  [v5 setTextAlignment:[v4 textAlignment]];
}

- (UIEdgeInsets)textContainerInset
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  [(TextViewWithPlaceHolder *)&v6 textContainerInset];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setTextContainerInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = self;
  id v8 = sub_1001E74EC();
  [v8 setTextContainerInset:top, left, bottom, right];

  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  -[TextViewWithPlaceHolder setTextContainerInset:](&v9, "setTextContainerInset:", top, left, bottom, right);
}

- (NSString)text
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  id v2 = v7.receiver;
  double v3 = [(TextViewWithPlaceHolder *)&v7 text];
  if (v3)
  {
    double v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setText:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    double v4 = self;
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v6 = self;
    NSString v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  [(TextViewWithPlaceHolder *)&v7 setText:v5];

  sub_1001E7550();
}

- (_TtC17SequoiaTranslator23TextViewWithPlaceHolder)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  return (_TtC17SequoiaTranslator23TextViewWithPlaceHolder *)sub_1001E7D8C(a4, x, y, width, height);
}

- (_TtC17SequoiaTranslator23TextViewWithPlaceHolder)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator23TextViewWithPlaceHolder____lazy_storage___placeholder) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC17SequoiaTranslator23TextViewWithPlaceHolder_adjustsFontSize) = 0;
  *(int64x2_t *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC17SequoiaTranslator23TextViewWithPlaceHolder_minSourceTextSize) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  id v4 = a3;
  NSString v5 = [(TranslateCalloutDisabledTextView *)&v7 initWithCoder:v4];
  if (v5)
  {

    UIEdgeInsets result = (_TtC17SequoiaTranslator23TextViewWithPlaceHolder *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {

    return 0;
  }
  return result;
}

- (void)textDidUpdate
{
  id v2 = self;
  sub_1001E7550();
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    objc_super v7 = self;
    NSString v8 = String._bridgeToObjectiveC()();
  }
  else
  {
    id v9 = self;
    NSString v8 = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TextViewWithPlaceHolder();
  -[TextViewWithPlaceHolder setMarkedText:selectedRange:](&v10, "setMarkedText:selectedRange:", v8, location, length);

  sub_1001E7550();
  swift_bridgeObjectRelease();
}

- (void)paste:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    NSString v5 = self;
  }
  sub_1001E8424((uint64_t)v6);

  sub_1000132A0((uint64_t)v6);
}

- (id)_axPlaceholderTextView
{
  id v2 = self;
  id v3 = sub_1001E74EC();

  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator23TextViewWithPlaceHolder____lazy_storage___placeholder));
}

@end