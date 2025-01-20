@interface TVQueueListLockupView
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (_TtC9SeymourUI21TVQueueListLockupView)init;
- (_TtC9SeymourUI21TVQueueListLockupView)initWithCoder:(id)a3;
- (_TtC9SeymourUI21TVQueueListLockupView)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)handlePan:(id)a3;
- (void)handleTap:(id)a3;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation TVQueueListLockupView

- (_TtC9SeymourUI21TVQueueListLockupView)init
{
  return -[TVQueueListLockupView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC9SeymourUI21TVQueueListLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI21TVQueueListLockupView *)sub_23A3F08B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI21TVQueueListLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A3F3B6C();
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return (*((unsigned char *)&self->super.super.super.super.super.super.super.isa
          + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_grabbed) & 1) == 0;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVQueueListLockupView();
  id v2 = v3.receiver;
  [(TVFocusableCollectionViewCell *)&v3 prepareForReuse];
  sub_23A3F1864();
  sub_23A3F1DCC();
  objc_msgSend(v2, sel_setNeedsFocusUpdate, v3.receiver, v3.super_class);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23A3F1A2C((uint64_t)v6, v7);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  sub_239C24FF0(0, &qword_268A102C8);
  sub_23A065B10();
  uint64_t v6 = sub_23A7FFF58();
  id v7 = a4;
  v8 = self;
  sub_23A3F1C00(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, sel_state) == (id)3
    && MEMORY[0x23ECB8640]((char *)v5 + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_delegate))
  {
    sub_239F716B4();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)handlePan:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23A3F1F68(v4);
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_delegate);
  objc_super v3 = *(_UITraitChangeRegistry **)((char *)&self->super.super.super.super.super._traitChangeRegistry
                                  + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_layout);
  id v4 = *(CALayer **)((char *)&self->super.super.super.super.super._layerRetained
                   + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_layout);
  v5 = *(NSArray **)((char *)&self->super.super.super.super.super._subviewCache
                   + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_layout);
  uint64_t v6 = *(UIWindow **)((char *)&self->super.super.super.super.super._window
                    + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_layout);
  objc_release(*(id *)((char *)&self->super.super.super.super.super._gestureRecognizers
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_layout));

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_grabImage));
  id v7 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_grabImageView);
}

@end