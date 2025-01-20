@interface FMTableViewCellImageContainer
- (_TtC6FindMy29FMTableViewCellImageContainer)init;
- (_TtC6FindMy29FMTableViewCellImageContainer)initWithArrangedSubviews:(id)a3;
- (_TtC6FindMy29FMTableViewCellImageContainer)initWithCoder:(id)a3;
- (_TtC6FindMy29FMTableViewCellImageContainer)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMTableViewCellImageContainer

- (void).cxx_destruct
{
  v3 = *(void **)&self->NUIContainerBoxView_opaque[OBJC_IVAR____TtC6FindMy29FMTableViewCellImageContainer_currentMaskingContext];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100035948();
}

- (_TtC6FindMy29FMTableViewCellImageContainer)init
{
  return (_TtC6FindMy29FMTableViewCellImageContainer *)sub_100040EE8();
}

- (_TtC6FindMy29FMTableViewCellImageContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002F6108();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMTableViewCellImageContainer();
  id v4 = a3;
  id v5 = v6.receiver;
  [(FMTableViewCellImageContainer *)&v6 traitCollectionDidChange:v4];
  sub_100035E90();
}

- (_TtC6FindMy29FMTableViewCellImageContainer)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy29FMTableViewCellImageContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC6FindMy29FMTableViewCellImageContainer)initWithArrangedSubviews:(id)a3
{
  result = (_TtC6FindMy29FMTableViewCellImageContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end