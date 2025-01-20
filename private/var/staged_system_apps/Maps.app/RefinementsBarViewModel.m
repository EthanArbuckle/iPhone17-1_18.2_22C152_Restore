@interface RefinementsBarViewModel
- (BOOL)hasAllRefinements;
- (BOOL)tapInteractionEnabled;
- (_TtC4Maps23RefinementsBarViewModel)init;
- (void)setTapInteractionEnabled:(BOOL)a3;
@end

@implementation RefinementsBarViewModel

- (BOOL)tapInteractionEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps23RefinementsBarViewModel_tapInteractionEnabled);
}

- (void)setTapInteractionEnabled:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps23RefinementsBarViewModel_tapInteractionEnabled) = a3;
}

- (BOOL)hasAllRefinements
{
  v2 = self;
  char v3 = sub_10012F274();

  return v3 & 1;
}

- (_TtC4Maps23RefinementsBarViewModel)init
{
  result = (_TtC4Maps23RefinementsBarViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC4Maps23RefinementsBarViewModel__refinements;
  uint64_t v3 = sub_1000FF33C(&qword_1015CEDB8);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end