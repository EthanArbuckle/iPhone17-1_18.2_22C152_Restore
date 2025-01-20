@interface HighlightColorChooserView
- (_TtC8BookCore25HighlightColorChooserView)initWithCoder:(id)a3;
- (_TtC8BookCore25HighlightColorChooserView)initWithFrame:(CGRect)a3;
@end

@implementation HighlightColorChooserView

- (_TtC8BookCore25HighlightColorChooserView)initWithFrame:(CGRect)a3
{
  return (_TtC8BookCore25HighlightColorChooserView *)sub_1D6240(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8BookCore25HighlightColorChooserView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8BookCore25HighlightColorChooserView_pageTheme) = (Class)&dword_4;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC8BookCore25HighlightColorChooserView *)sub_1F27F0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC8BookCore25HighlightColorChooserView_delegate;

  sub_19ECC4((uint64_t)v3);
}

@end