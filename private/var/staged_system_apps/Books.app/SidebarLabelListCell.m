@interface SidebarLabelListCell
- (BOOL)isEditing;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC5Books20SidebarLabelListCell)initWithCoder:(id)a3;
- (_TtC5Books20SidebarLabelListCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)prepareForReuse;
- (void)setEditing:(BOOL)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation SidebarLabelListCell

- (BOOL)isEditing
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SidebarLabelListCell();
  return [(SidebarLabelListCell *)&v3 isEditing];
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for SidebarLabelListCell();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  unsigned int v7 = [(SidebarLabelListCell *)&v9 isEditing];
  v8.receiver = v6;
  v8.super_class = v5;
  [(SidebarLabelListCell *)&v8 setEditing:v3];
  if (v7 != [(SidebarLabelListCell *)v6 isEditing]) {
    sub_100629910([(SidebarLabelListCell *)v6 isEditing]);
  }
}

- (_TtC5Books20SidebarLabelListCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Books20SidebarLabelListCell *)sub_1006285FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Books20SidebarLabelListCell)initWithCoder:(id)a3
{
  return (_TtC5Books20SidebarLabelListCell *)sub_100628748(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1007F7190();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unsigned int v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F7170();
  objc_super v8 = self;
  sub_100628888();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100628DA4();
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  unsigned int v7 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  sub_100628F84(a4);

  _s5Books15CurrentPageViewVwxx_0((uint64_t)&v8);
}

- (void).cxx_destruct
{
  sub_1005761FC(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC5Books20SidebarLabelListCell_item), *(void *)&self->item[OBJC_IVAR____TtC5Books20SidebarLabelListCell_item], *(void *)&self->item[OBJC_IVAR____TtC5Books20SidebarLabelListCell_item + 8], *(void *)&self->item[OBJC_IVAR____TtC5Books20SidebarLabelListCell_item + 16], *(void *)&self->item[OBJC_IVAR____TtC5Books20SidebarLabelListCell_item + 24], *(void *)&self->item[OBJC_IVAR____TtC5Books20SidebarLabelListCell_item + 32], *(void **)&self->item[OBJC_IVAR____TtC5Books20SidebarLabelListCell_item + 40]);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books20SidebarLabelListCell_inlineEditingDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books20SidebarLabelListCell__inlineEditingTextField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books20SidebarLabelListCell_inlineEditingLeadingConstraint));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Books20SidebarLabelListCell_inlineEditingLeadingAXConstraint);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v8 = *(id *)(Strong + OBJC_IVAR____TtCV5Books21SidebarCollectionView11Coordinator_editingCell);
    *(void *)(Strong + OBJC_IVAR____TtCV5Books21SidebarCollectionView11Coordinator_editingCell) = self;
    id v6 = a3;
    unsigned int v7 = self;

    swift_unknownObjectRelease();
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v5 = a3;
    id v6 = self;
    sub_1005757B0((char *)v6);

    swift_unknownObjectRelease();
  }
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_10062A3EC(self, (uint64_t)a2, (void (*)(void))sub_10062A130);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_10062A3EC(self, (uint64_t)a2, (void (*)(void))sub_10062A46C);
}

@end