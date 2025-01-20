@interface MetadataExpandableTextView
- (UIView)viewForLastBaselineLayout;
- (_TtC9SeymourUI26MetadataExpandableTextView)init;
- (_TtC9SeymourUI26MetadataExpandableTextView)initWithCoder:(id)a3;
- (_TtC9SeymourUI26MetadataExpandableTextView)initWithFrame:(CGRect)a3;
@end

@implementation MetadataExpandableTextView

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC9SeymourUI26MetadataExpandableTextView_expandableTextView));
}

- (_TtC9SeymourUI26MetadataExpandableTextView)init
{
  return (_TtC9SeymourUI26MetadataExpandableTextView *)sub_23A7931CC();
}

- (_TtC9SeymourUI26MetadataExpandableTextView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI26MetadataExpandableTextView_onEntryTapped);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC9SeymourUI26MetadataExpandableTextView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI26MetadataExpandableTextView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI26MetadataExpandableTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26MetadataExpandableTextView_expandableTextView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI26MetadataExpandableTextView_onEntryTapped);

  sub_239C25118(v3);
}

@end