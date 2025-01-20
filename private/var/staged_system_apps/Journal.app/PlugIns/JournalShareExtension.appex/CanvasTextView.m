@interface CanvasTextView
- (BOOL)_shouldAdjustKeyboardGuidesForTextFormattingIfNeeded;
- (BOOL)_shouldHandleTextFormattingChangeValue:(id)a3;
- (BOOL)_supportsTextKit2TextLists;
- (BOOL)accessibilityActivate;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)textContentManager:(id)a3 shouldEnumerateTextElement:(id)a4 options:(unint64_t)a5;
- (CGRect)accessibilityFrame;
- (CGSize)intrinsicContentSize;
- (_TtC21JournalShareExtension14CanvasTextView)initWithCoder:(id)a3;
- (_TtC21JournalShareExtension14CanvasTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)_configurationForTextFormattingOptions;
- (id)_descriptorForTextFormattingOptions;
- (void)deleteBackward;
- (void)layoutSubviews;
- (void)setAccessibilityFrame:(CGRect)a3;
- (void)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4;
- (void)viewportDidLayout;
@end

@implementation CanvasTextView

- (_TtC21JournalShareExtension14CanvasTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  return (_TtC21JournalShareExtension14CanvasTextView *)sub_10005BDD0(a4, x, y, width, height);
}

- (_TtC21JournalShareExtension14CanvasTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100065480();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_10005C0F4();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CanvasTextView();
  v2 = (char *)v5.receiver;
  [(CanvasTextView *)&v5 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC21JournalShareExtension14CanvasTextView_topAccessoryView];
  if (v3)
  {
    [v3 bounds];
    double Height = CGRectGetHeight(v6);
  }
  else
  {
    double Height = 0.0;
  }
  [v2 textContainerInset];
  [v2 setTextContainerInset:Height];
}

- (BOOL)_supportsTextKit2TextLists
{
  return 0;
}

- (void)viewportDidLayout
{
  v2 = self;
  sub_10005C9E4();
}

- (void)deleteBackward
{
  v2 = self;
  sub_10005D448();
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  if (([(CanvasTextView *)v2 isFirstResponder] & 1) == 0) {
    [(CanvasTextView *)v2 becomeFirstResponder];
  }
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for CanvasTextView();
  BOOL v3 = [(CanvasTextView *)&v5 accessibilityActivate];

  return v3;
}

- (CGRect)accessibilityFrame
{
  v2 = self;
  double v3 = sub_10005E754();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (void)setAccessibilityFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CanvasTextView();
  -[CanvasTextView setAccessibilityFrame:](&v7, "setAccessibilityFrame:", x, y, width, height);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    double v6 = self;
    swift_unknownObjectRetain();
    sub_10010A7B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    objc_super v7 = self;
  }
  unsigned __int8 v8 = sub_10005E964((uint64_t)a3, (uint64_t)v10);

  sub_10000B9CC((uint64_t)v10, &qword_10015A8A0);
  return v8 & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension14CanvasTextView_currentSelectedColor));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension14CanvasTextView_topAccessoryView));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC21JournalShareExtension14CanvasTextView_blockQuoteLayerView);
}

- (BOOL)_shouldAdjustKeyboardGuidesForTextFormattingIfNeeded
{
  return 0;
}

- (BOOL)_shouldHandleTextFormattingChangeValue:(id)a3
{
  uint64_t v4 = sub_10010A570();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (objc_class *)((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10010A560();
  unsigned __int8 v8 = self;
  char v9 = sub_1000620BC(v7);

  (*(void (**)(objc_class *, uint64_t))(v5 + 8))(v7, v4);
  return v9 & 1;
}

- (id)_configurationForTextFormattingOptions
{
  id v2 = sub_10006581C();

  return v2;
}

- (id)_descriptorForTextFormattingOptions
{
  uint64_t v3 = sub_10010A550();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v7 = self;
  sub_1000629D8((uint64_t)v6);

  unsigned __int8 v8 = (void *)sub_10010A520();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v8;
}

- (void)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  sub_1000659B0(a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (BOOL)textContentManager:(id)a3 shouldEnumerateTextElement:(id)a4 options:(unint64_t)a5
{
  self;
  uint64_t v8 = swift_dynamicCastObjCClass();
  if (v8)
  {
    char v9 = (void *)v8;
    v15[4] = sub_100065460;
    v15[5] = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 1107296256;
    v15[2] = sub_100064914;
    v15[3] = &unk_100142740;
    uint64_t v10 = _Block_copy(v15);
    id v11 = a4;
    id v12 = a3;
    double v13 = self;
    swift_release();
    [v9 setMarkerTextAttributeOverrides:v10];
    _Block_release(v10);
  }
  return 1;
}

@end