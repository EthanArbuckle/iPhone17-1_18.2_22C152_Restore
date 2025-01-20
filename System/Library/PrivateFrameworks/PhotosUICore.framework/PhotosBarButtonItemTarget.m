@interface PhotosBarButtonItemTarget
- (_TtC12PhotosUICoreP33_2F41475DB669B278177E293B1734139625PhotosBarButtonItemTarget)init;
- (void)performPrimaryAction:(id)a3;
@end

@implementation PhotosBarButtonItemTarget

- (void)performPrimaryAction:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AB23BC4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  (*(void (**)(_OWORD *))((char *)&self->super.isa
                                   + OBJC_IVAR____TtC12PhotosUICoreP33_2F41475DB669B278177E293B1734139625PhotosBarButtonItemTarget_primaryAction))(v6);

  sub_1A9BA860C((uint64_t)v6);
}

- (_TtC12PhotosUICoreP33_2F41475DB669B278177E293B1734139625PhotosBarButtonItemTarget)init
{
  result = (_TtC12PhotosUICoreP33_2F41475DB669B278177E293B1734139625PhotosBarButtonItemTarget *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end