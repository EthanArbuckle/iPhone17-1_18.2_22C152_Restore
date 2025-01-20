@interface CRLiOSBoardView
- (_TtC8Freeform15CRLiOSBoardView)initWithCoder:(id)a3;
- (_TtC8Freeform15CRLiOSBoardView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
@end

@implementation CRLiOSBoardView

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CRLiOSBoardView();
  id v2 = v4.receiver;
  [(CRLiOSBoardView *)&v4 didMoveToWindow];
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v3 = [v2 window];
    sub_100E71F84(v3);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC8Freeform15CRLiOSBoardView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)&self->delegate[OBJC_IVAR____TtC8Freeform15CRLiOSBoardView_delegate] = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CRLiOSBoardView();
  return -[CRLiOSBoardView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform15CRLiOSBoardView)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC8Freeform15CRLiOSBoardView_delegate] = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLiOSBoardView();
  return [(CRLiOSBoardView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end