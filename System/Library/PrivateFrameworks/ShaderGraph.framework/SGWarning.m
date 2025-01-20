@interface SGWarning
- (NSString)message;
- (SGWarning)init;
@end

@implementation SGWarning

- (NSString)message
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SGWarning_message);
  uint64_t v3 = *(void *)&self->message[OBJC_IVAR___SGWarning_message];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x261183E60](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (SGWarning)init
{
  result = (SGWarning *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end