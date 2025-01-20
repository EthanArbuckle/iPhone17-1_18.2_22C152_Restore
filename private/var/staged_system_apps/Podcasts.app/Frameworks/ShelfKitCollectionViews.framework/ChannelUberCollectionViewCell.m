@interface ChannelUberCollectionViewCell
- (_TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ChannelUberCollectionViewCell

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_58388(a3);
}

- (_TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell_innerView);
  void *v9 = 0;
  v9[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell_currentModel) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell_sizeClass) = 8;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell_objectGraph) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[UberCollectionViewCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell *)sub_587D0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell_innerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell_currentModel));

  swift_release();
}

@end