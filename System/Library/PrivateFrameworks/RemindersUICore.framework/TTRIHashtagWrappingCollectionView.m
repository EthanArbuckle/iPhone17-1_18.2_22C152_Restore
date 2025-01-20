@interface TTRIHashtagWrappingCollectionView
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC15RemindersUICore33TTRIHashtagWrappingCollectionView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore33TTRIHashtagWrappingCollectionView)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (void)addTagButtonAction:(id)a3;
- (void)containerViewDidLayoutArrangedSubviews:(id)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)hashtagButtonAction:(id)a3;
- (void)layoutSubviews;
@end

@implementation TTRIHashtagWrappingCollectionView

- (_TtC15RemindersUICore33TTRIHashtagWrappingCollectionView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *)sub_1B96A79B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore33TTRIHashtagWrappingCollectionView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *)sub_1B96A7F0C(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  TTRIHashtagWrappingCollectionView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = TTRIHashtagWrappingCollectionView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_wrappingContainer);
  if (v2) {
    LOBYTE(v2) = objc_msgSend(v2, sel_isLayoutSizeDependentOnPerpendicularAxis);
  }
  else {
    __break(1u);
  }
  return (char)v2;
}

- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  -[TTRIHashtagWrappingCollectionView _layoutSizeThatFits:fixedAxes:](&v9, sel__layoutSizeThatFits_fixedAxes_, a4, width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)addTagButtonAction:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v5 = self;
  }
  CGSize v6 = (char *)self + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_delegate;
  swift_beginAccess();
  if (MEMORY[0x1BA9DB180](v6))
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(_TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *, uint64_t, uint64_t))(v7 + 16))(self, ObjectType, v7);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_1B90CCA68((uint64_t)v9, &qword_1EB9B4D10);
}

- (void)hashtagButtonAction:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1B96A970C((uint64_t)v6);

  sub_1B90CCA68((uint64_t)v6, &qword_1EB9B4D10);
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_wrappingContainer));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_internalSelection;
  uint64_t v4 = sub_1B996BAD0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1B940DFB4(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_dropState), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_dropState));
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_focusGuide);
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  uint64_t v4 = (NUIContainerView *)a3;
  v5 = self;
  TTRIHashtagWrappingCollectionView.containerViewDidLayoutArrangedSubviews(_:)(v4);
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  CGSize v6 = (char *)self + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_delegate;
  swift_beginAccess();
  if (MEMORY[0x1BA9DB180](v6))
  {
    uint64_t v7 = *((void *)v6 + 1);
    swift_getObjectType();
    double v8 = *(uint64_t (**)(void))(v7 + 32);
    id v9 = a3;
    swift_unknownObjectRetain();
    v10 = self;
    char v11 = v8();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  id v8 = sub_1B96A9C20((char **)a4);
  uint64_t v10 = v9;
  sub_1B96AA200((uint64_t)v8, v9);
  if (v10)
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = 2;
  }
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1740]), sel_initWithDropOperation_, v10);

  swift_unknownObjectRelease();

  return v11;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1B96ADAAC((char **)a4);

  swift_unknownObjectRelease();
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  v12 = (void *)sub_1B96ADDA0((uint64_t)v10);

  return v12;
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  sub_1B96AA200(0, 1uLL);
  uint64_t v7 = *(uint64_t *)((char *)&v6->super.super.super.isa
                  + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_dropState);
  uint64_t v8 = *(void *)((char *)&v6->super.super._responderFlags
                 + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_dropState);
  *(_OWORD *)((char *)&v6->super.super.super.isa
            + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_dropState) = xmmword_1B9978060;
  sub_1B940DFB4(v7, v8);
  id v9 = (Class *)((char *)&v6->super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_targetHashtagLabelForPerformingDrop);
  *id v9 = 0;
  v9[1] = 0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  id v6 = self;
  uint64_t v7 = _s15RemindersUICore33TTRIHashtagWrappingCollectionViewC22contextMenuInteraction_016configurationForH10AtLocationSo09UIContextH13ConfigurationCSgSo0nhI0C_So7CGPointVtF_0();

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1B96AE3B0();
  id v10 = v9;

  return v10;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1B96AE3B0();
  id v10 = v9;

  return v10;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  _s15RemindersUICore33TTRIHashtagWrappingCollectionViewC22contextMenuInteraction_10willEndFor8animatorySo09UIContexthI0C_So0nH13ConfigurationCSo0nhI9Animating_pSgtF_0();

  swift_unknownObjectRelease();
}

@end