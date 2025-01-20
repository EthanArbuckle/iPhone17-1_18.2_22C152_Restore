@interface DisplayLinkHandler
- (_TtC10PodcastsUIP33_F2E0E53B2EE06FB9F5D0B47C18CD8DEC18DisplayLinkHandler)init;
- (void)handleDisplayLinkFired:(id)a3;
@end

@implementation DisplayLinkHandler

- (void)handleDisplayLinkFired:(id)a3
{
  if (a3)
  {
    v3 = *(void (**)(uint64_t))((char *)&self->super.isa
                                        + OBJC_IVAR____TtC10PodcastsUIP33_F2E0E53B2EE06FB9F5D0B47C18CD8DEC18DisplayLinkHandler__handler);
    v5 = self;
    swift_unknownObjectRetain();
    self;
    uint64_t v4 = swift_dynamicCastObjCClassUnconditional();
    v3(v4);
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (_TtC10PodcastsUIP33_F2E0E53B2EE06FB9F5D0B47C18CD8DEC18DisplayLinkHandler)init
{
  result = (_TtC10PodcastsUIP33_F2E0E53B2EE06FB9F5D0B47C18CD8DEC18DisplayLinkHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end