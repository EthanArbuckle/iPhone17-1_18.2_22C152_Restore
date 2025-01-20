@interface WFToolInvocationOptions
- (NSString)lnInterfaceIdiom;
- (NSString)locale;
- (NSString)requestIdentifier;
- (WFToolInvocationOptions)init;
- (int64_t)lnInteractionMode;
@end

@implementation WFToolInvocationOptions

- (int64_t)lnInteractionMode
{
  return ToolInvocationOptionsBox.lnInteractionMode.getter();
}

- (NSString)locale
{
  return (NSString *)sub_1C7FA4F00((uint64_t)self, (uint64_t)a2, (void (*)(void))ToolInvocationOptionsBox.locale.getter);
}

- (NSString)requestIdentifier
{
  return (NSString *)sub_1C7FA4F00((uint64_t)self, (uint64_t)a2, (void (*)(void))ToolInvocationOptionsBox.requestIdentifier.getter);
}

- (NSString)lnInterfaceIdiom
{
  v2 = ToolInvocationOptionsBox.lnInterfaceIdiom.getter();
  return (NSString *)v2;
}

- (WFToolInvocationOptions)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WFToolInvocationOptions_lnInterfaceIdiom);
}

@end