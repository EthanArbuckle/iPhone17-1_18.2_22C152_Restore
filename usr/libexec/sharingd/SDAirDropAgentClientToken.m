@interface SDAirDropAgentClientToken
- (_TtC16DaemoniOSLibrary20SDAirDropAgentClient)agentClient;
- (_TtC16DaemoniOSLibrary25SDAirDropAgentClientToken)init;
@end

@implementation SDAirDropAgentClientToken

- (_TtC16DaemoniOSLibrary20SDAirDropAgentClient)agentClient
{
  return (_TtC16DaemoniOSLibrary20SDAirDropAgentClient *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                 + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropAgentClientToken_agentClient));
}

- (_TtC16DaemoniOSLibrary25SDAirDropAgentClientToken)init
{
  result = (_TtC16DaemoniOSLibrary25SDAirDropAgentClientToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropAgentClientToken_agentClient));

  swift_release();
}

@end