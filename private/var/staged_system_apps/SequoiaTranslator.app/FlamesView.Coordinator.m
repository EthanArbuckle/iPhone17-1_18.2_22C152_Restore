@interface FlamesView.Coordinator
- (_TtCV17SequoiaTranslator10FlamesView11Coordinator)init;
- (float)audioLevelForFlamesView:(id)a3;
@end

@implementation FlamesView.Coordinator

- (_TtCV17SequoiaTranslator10FlamesView11Coordinator)init
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtCV17SequoiaTranslator10FlamesView11Coordinator_audioLevel) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FlamesView.Coordinator();
  return [(FlamesView.Coordinator *)&v3 init];
}

- (float)audioLevelForFlamesView:(id)a3
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____TtCV17SequoiaTranslator10FlamesView11Coordinator_audioLevel);
}

@end