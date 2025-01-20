@interface PlaceholderTextView
- (CGRect)alignmentRectForFrame:(CGRect)a3;
- (CGRect)frameForAlignmentRect:(CGRect)a3;
- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSAttributedString)attributedText;
- (NSLayoutYAxisAnchor)firstBaselineAnchor;
- (NSLayoutYAxisAnchor)lastBaselineAnchor;
- (NSString)text;
- (UIColor)textColor;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)textContainerInset;
- (UIFont)font;
- (UIView)viewForFirstBaselineLayout;
- (UIView)viewForLastBaselineLayout;
- (_TtC17SequoiaTranslator19PlaceholderTextView)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator19PlaceholderTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)_axPlaceholderTextView;
- (int64_t)textAlignment;
- (void)dealloc;
- (void)layoutSubviews;
- (void)scribbleInteractionDidFinishWriting:(id)a3;
- (void)scribbleInteractionWillBeginWriting:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setFont:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextContainerInset:(UIEdgeInsets)a3;
- (void)textChangedWithNotification:(id)a3;
@end

@implementation PlaceholderTextView

- (NSString)text
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PlaceholderTextView();
  id v2 = v7.receiver;
  v3 = [(PlaceholderTextView *)&v7 text];
  if (v3)
  {
    v4 = v3;
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
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  objc_super v7 = self;
  PlaceholderTextView.text.setter(v4, v6);
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)sub_10018360C(self, (uint64_t)a2, (SEL *)&selRef_attributedText);
}

- (void)setAttributedText:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_100184D14((uint64_t)a3);
}

- (UIColor)textColor
{
  return (UIColor *)sub_10018360C(self, (uint64_t)a2, (SEL *)&selRef_textColor);
}

- (void)setTextColor:(id)a3
{
}

- (UIFont)font
{
  return (UIFont *)sub_10018360C(self, (uint64_t)a2, (SEL *)&selRef_font);
}

- (void)setFont:(id)a3
{
}

- (int64_t)textAlignment
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlaceholderTextView();
  return [(PlaceholderTextView *)&v3 textAlignment];
}

- (void)setTextAlignment:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlaceholderTextView();
  id v4 = v5.receiver;
  [(PlaceholderTextView *)&v5 setTextAlignment:a3];
  PlaceholderTextView.updatePlaceholderProperties()();
}

- (UIEdgeInsets)textContainerInset
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlaceholderTextView();
  [(PlaceholderTextView *)&v6 textContainerInset];
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
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PlaceholderTextView();
  id v7 = v8.receiver;
  -[PlaceholderTextView setTextContainerInset:](&v8, "setTextContainerInset:", top, left, bottom, right);
  PlaceholderTextView.updatePlaceholderProperties()();
}

- (CGSize)intrinsicContentSize
{
  double v2 = self;
  PlaceholderTextView.intrinsicContentSize.getter();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2 = self;
  PlaceholderTextView.alignmentRectInsets.getter();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double right = v14;
  result.double bottom = v13;
  result.double left = v12;
  result.double top = v11;
  return result;
}

- (UIView)viewForFirstBaselineLayout
{
  double v2 = self;
  id Baseline = PlaceholderTextView.forFirstBaselineLayout.getter();

  return (UIView *)Baseline;
}

- (UIView)viewForLastBaselineLayout
{
  double v2 = self;
  id Baseline = PlaceholderTextView.forLastBaselineLayout.getter();

  return (UIView *)Baseline;
}

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  double v2 = self;
  id v3 = PlaceholderTextView.firstBaselineAnchor.getter();

  return (NSLayoutYAxisAnchor *)v3;
}

- (NSLayoutYAxisAnchor)lastBaselineAnchor
{
  double v2 = self;
  id v3 = PlaceholderTextView.lastBaselineAnchor.getter();

  return (NSLayoutYAxisAnchor *)v3;
}

- (_TtC17SequoiaTranslator19PlaceholderTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  return (_TtC17SequoiaTranslator19PlaceholderTextView *)PlaceholderTextView.init(frame:textContainer:)(a4, x, y, width, height);
}

- (_TtC17SequoiaTranslator19PlaceholderTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s17SequoiaTranslator19PlaceholderTextViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  id v3 = self;
  double v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4 name:UITextViewTextDidChangeNotification object:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PlaceholderTextView();
  [(PlaceholderTextView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19PlaceholderTextView_placeholderTextView));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator19PlaceholderTextView_placeholderColor);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlaceholderTextView();
  double v2 = (char *)v4.receiver;
  [(PlaceholderTextView *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC17SequoiaTranslator19PlaceholderTextView_placeholderTextView];
  [v2 bounds];
  [v3 setFrame:];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  PlaceholderTextView.sizeThatFits(_:)(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  PlaceholderTextView.systemLayoutSizeFitting(_:)(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = self;
  PlaceholderTextView.systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)(width, height, a4, a5);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = self;
  PlaceholderTextView._systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)(width, height, a4, a5);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGRect)alignmentRectForFrame:(CGRect)a3
{
  double v3 = sub_10018492C(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (double (*)(double, double, double, double))PlaceholderTextView.alignmentRect(forFrame:));
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)frameForAlignmentRect:(CGRect)a3
{
  double v3 = sub_10018492C(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (double (*)(double, double, double, double))PlaceholderTextView.frame(forAlignmentRect:));
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  Swift::Int length = a4.length;
  Swift::Int location = a4.location;
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    double v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    double v9 = 0;
  }
  double v10 = self;
  v11.value._countAndFlagsBits = v7;
  v11.value._object = v9;
  v12.Swift::Int location = location;
  v12.Swift::Int length = length;
  PlaceholderTextView.setMarkedText(_:selectedRange:)(v11, v12);

  swift_bridgeObjectRelease();
}

- (void)textChangedWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  double v8 = self;
  PlaceholderTextView.textChanged(notification:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)_axPlaceholderTextView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC17SequoiaTranslator19PlaceholderTextView_placeholderTextView));
}

- (void)scribbleInteractionWillBeginWriting:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  PlaceholderTextView.suppressPlaceholder.setter(1);
}

- (void)scribbleInteractionDidFinishWriting:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  PlaceholderTextView.suppressPlaceholder.setter(0);
}

@end