@interface ScrollingCapsuleCollectionView.CapsuleView
- (BOOL)isSelected;
- (_TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView)initWithCoder:(id)a3;
- (_TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)didReceiveHover:(id)a3;
- (void)didReceiveTap;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
- (void)updateShadowOpacity;
@end

@implementation ScrollingCapsuleCollectionView.CapsuleView

- (void)layoutSubviews
{
  v2 = self;
  sub_18C3E8CA0();
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)_s11CapsuleViewCMa();
  v12.receiver = self;
  v12.super_class = v5;
  v6 = self;
  unsigned int v7 = [(ScrollingCapsuleCollectionView.CapsuleView *)&v12 isSelected];
  v11.receiver = v6;
  v11.super_class = v5;
  [(ScrollingCapsuleCollectionView.CapsuleView *)&v11 setSelected:v3];
  if (v7 == [(ScrollingCapsuleCollectionView.CapsuleView *)v6 isSelected])
  {
  }
  else
  {
    if (qword_1E91759A0 != -1) {
      swift_once();
    }
    uint64_t v8 = qword_1E9190410;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v6;
    v10 = v6;
    sub_18C3B3898(v8, 0, (uint64_t)sub_18C3EB664, v9, (void (*)())CGRectMake, 0);

    swift_release();
  }
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)_s11CapsuleViewCMa();
  return [(ScrollingCapsuleCollectionView.CapsuleView *)&v3 isSelected];
}

- (_TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *)sub_18C412EFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *)sub_18C5E2DE0(a3);
}

- (void)didReceiveTap
{
  v2 = *(void (**)(_TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView *))((char *)&self->super.super.super.super.isa
                                                                                                 + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_tapHandler);
  if (v2)
  {
    objc_super v3 = self;
    sub_18C5622A0((uint64_t)v2);
    v2(v3);
    sub_18C3F33C8((uint64_t)v2);
  }
}

- (void)didReceiveHover:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18C5E33BC(v4);
}

- (void)updateShadowOpacity
{
  v2 = self;
  sub_18C5E370C();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_18C5E3E00();

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_18C5E3F70(a5);

  swift_unknownObjectRelease();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_18C5E355C(0, a5);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_contentView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_systemSnapshotBackgroundView));
  sub_18C3F33C8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_tapHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_highlightView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari30ScrollingCapsuleCollectionView11CapsuleView_shadowView);
}

@end