@interface MacTextView
- (NSString)text;
- (UIBezierPath)accessibilityPath;
- (_TtC10PodcastsUI11MacTextView)initWithCoder:(id)a3;
- (_TtC10PodcastsUI11MacTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)setText:(id)a3;
- (void)updateAppearance;
@end

@implementation MacTextView

- (NSString)text
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MacTextView();
  id v2 = v7.receiver;
  v3 = [(MacTextView *)&v7 text];
  if (v3)
  {
    v4 = v3;
    sub_1E3E7CD30();

    v5 = (void *)sub_1E3E7CCF0();
    swift_bridgeObjectRelease();
  }
  else
  {

    v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setText:(id)a3
{
  if (a3)
  {
    sub_1E3E7CD30();
    v4 = self;
    v5 = (void *)sub_1E3E7CCF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MacTextView();
  [(MacTextView *)&v7 setText:v5];
}

- (_TtC10PodcastsUI11MacTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for MacTextView();
  id v9 = a4;
  v10 = -[MacTextView initWithFrame:textContainer:](&v16, sel_initWithFrame_textContainer_, v9, x, y, width, height);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE29A78);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1E3E86660;
  uint64_t v12 = sub_1E3E7A890();
  uint64_t v13 = MEMORY[0x1E4FB0EB8];
  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = v13;
  v14 = v10;
  MEMORY[0x1E4E772B0](v11, sel_updateAppearance);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_1E3E365A4();

  return v14;
}

- (void)updateAppearance
{
  id v2 = self;
  sub_1E3E365A4();
}

- (_TtC10PodcastsUI11MacTextView)initWithCoder:(id)a3
{
  result = (_TtC10PodcastsUI11MacTextView *)sub_1E3E7DF80();
  __break(1u);
  return result;
}

- (UIBezierPath)accessibilityPath
{
  id v2 = self;
  [(MacTextView *)v2 bounds];
  -[MacTextView convertRect:toView:](v2, sel_convertRect_toView_, 0);
  id v7 = objc_msgSend(self, sel_bezierPathWithRect_, v3, v4, v5, v6);

  return (UIBezierPath *)v7;
}

@end