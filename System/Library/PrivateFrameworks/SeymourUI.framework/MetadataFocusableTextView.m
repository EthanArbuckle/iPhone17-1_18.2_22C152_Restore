@interface MetadataFocusableTextView
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI25MetadataFocusableTextView)initWithCoder:(id)a3;
- (_TtC9SeymourUI25MetadataFocusableTextView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MetadataFocusableTextView

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI25MetadataFocusableTextView_textView);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI25MetadataFocusableTextView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI25MetadataFocusableTextView *)sub_23A296C3C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI25MetadataFocusableTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A297B94();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A297244();
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25MetadataFocusableTextView_onEntryTapped));
  id v3 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI25MetadataFocusableTextView_layout);
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC9SeymourUI25MetadataFocusableTextView_layout));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25MetadataFocusableTextView_textView));
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI25MetadataFocusableTextView_textViewHeightConstraint);
}

@end