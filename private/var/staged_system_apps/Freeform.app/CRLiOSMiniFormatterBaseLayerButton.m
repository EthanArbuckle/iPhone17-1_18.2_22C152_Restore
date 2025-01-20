@interface CRLiOSMiniFormatterBaseLayerButton
- (BOOL)crl_representsPhysicalKeyboard;
- (_TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton)initWithCoder:(id)a3;
- (_TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton)initWithFrame:(CGRect)a3;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation CRLiOSMiniFormatterBaseLayerButton

- (BOOL)crl_representsPhysicalKeyboard
{
  return 0;
}

- (_TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton_isPresentingPopover) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterBaseLayerButton();
  return -[CRLiOSMiniFormatterBaseLayerButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton_isPresentingPopover) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterBaseLayerButton();
  return [(CRLiOSMiniFormatterBaseLayerButton *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    objc_super v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v7 = self;
  }
  sub_101060E54((uint64_t)a3, (uint64_t)v16, (uint64_t)v17);

  sub_100522F00((uint64_t)v16, &qword_101672BF0);
  uint64_t v8 = v18;
  if (v18)
  {
    objc_super v9 = sub_10050F848(v17, v18);
    uint64_t v10 = *(void *)(v8 - 8);
    __n128 v11 = __chkstk_darwin(v9, v9);
    v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v10 + 16))(v13, v11);
    v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v17);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
}

@end