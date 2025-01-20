@interface HitView
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (_TtC17SequoiaTranslator7HitView)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator7HitView)initWithFrame:(CGRect)a3;
- (void)fourSelectedWithSender:(id)a3;
- (void)oneSelectedWithSender:(id)a3;
- (void)threeSelectedWithSender:(id)a3;
- (void)twoSelectedWithSender:(id)a3;
@end

@implementation HitView

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  char v7 = sub_100012D64();

  sub_1000132A0((uint64_t)v9);
  return v7 & 1;
}

- (void)oneSelectedWithSender:(id)a3
{
}

- (void)twoSelectedWithSender:(id)a3
{
}

- (void)threeSelectedWithSender:(id)a3
{
}

- (void)fourSelectedWithSender:(id)a3
{
}

- (_TtC17SequoiaTranslator7HitView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)&self->delegate[OBJC_IVAR____TtC17SequoiaTranslator7HitView_delegate] = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HitView();
  return -[HitView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC17SequoiaTranslator7HitView)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC17SequoiaTranslator7HitView_delegate] = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HitView();
  return [(HitView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end