@interface ICCollaboratorStatusView
- (ICCollaboratorStatusView)initWithCoder:(id)a3;
- (ICCollaboratorStatusView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)didMoveToWindow;
@end

@implementation ICCollaboratorStatusView

- (ICCollaboratorStatusView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorStatusView_hasDisplayedInWindow) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorStatusView_avatarView) = 0;
  uint64_t v4 = OBJC_IVAR___ICCollaboratorStatusView_selectionViews;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_20BFD5138(MEMORY[0x263F8EE78]);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorStatusView_isRemovingFromSuperview) = 0;

  result = (ICCollaboratorStatusView *)sub_20C163BD0();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for CollaboratorStatusView();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[ICCollaboratorStatusView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  sub_20BFCEE58(0, (unint64_t *)&qword_26AD812D0);
  id v11 = v7;
  id v7 = v10;
  LOBYTE(v10) = sub_20C163630();

  if (v10)
  {
LABEL_5:

    id v7 = 0;
  }

  return v7;
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_20C020EAC();
}

- (ICCollaboratorStatusView)initWithFrame:(CGRect)a3
{
  result = (ICCollaboratorStatusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20C02A6C8((uint64_t)self + OBJC_IVAR___ICCollaboratorStatusView_collaboratorStatus);

  swift_bridgeObjectRelease();
}

@end