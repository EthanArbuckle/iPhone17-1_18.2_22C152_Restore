@interface SKRFlowExtensionUserInputResultXPC
+ (BOOL)supportsSecureCoding;
- (SKRFlowExtensionUserInputResultXPC)init;
- (SKRFlowExtensionUserInputResultXPC)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKRFlowExtensionUserInputResultXPC

- (SKRFlowExtensionUserInputResultXPC)initWithCoder:(id)a3
{
  return (SKRFlowExtensionUserInputResultXPC *)FlowExtensionUserInputResultXPC.init(coder:)(a3);
}

- (void).cxx_destruct
{
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData), *(void *)&self->type[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData]);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_error);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  FlowExtensionUserInputResultXPC.encode(with:)((NSCoder)v4);
}

- (SKRFlowExtensionUserInputResultXPC)init
{
  result = (SKRFlowExtensionUserInputResultXPC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end