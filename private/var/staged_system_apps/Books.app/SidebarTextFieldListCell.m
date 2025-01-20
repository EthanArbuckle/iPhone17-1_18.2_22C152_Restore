@interface SidebarTextFieldListCell
- (UICellConfigurationState)_bridgedConfigurationState;
- (_TtC5Books24SidebarTextFieldListCell)initWithCoder:(id)a3;
- (_TtC5Books24SidebarTextFieldListCell)initWithFrame:(CGRect)a3;
@end

@implementation SidebarTextFieldListCell

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3 = sub_1007F7190();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1007304C4();

  v8.super.super.isa = sub_1007F7160().super.super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (UICellConfigurationState *)v8.super.super.isa;
}

- (_TtC5Books24SidebarTextFieldListCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Books24SidebarTextFieldListCell_shouldBeginEditing) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SidebarTextFieldListCell();
  return -[SidebarTextFieldListCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books24SidebarTextFieldListCell)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Books24SidebarTextFieldListCell_shouldBeginEditing) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SidebarTextFieldListCell();
  return [(SidebarTextFieldListCell *)&v5 initWithCoder:a3];
}

@end