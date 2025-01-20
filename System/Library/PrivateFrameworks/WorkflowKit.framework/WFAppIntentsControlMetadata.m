@interface WFAppIntentsControlMetadata
- (CHSControlIdentity)identity;
- (WFAppIntentsControlMetadata)init;
- (unint64_t)type;
- (void)presentIfPossibleInUserInterface:(WFUserInterfaceHost *)a3 completionBlock:(id)a4;
@end

@implementation WFAppIntentsControlMetadata

- (unint64_t)type
{
  return ControlMetadata.type.getter();
}

- (CHSControlIdentity)identity
{
  id v2 = ControlMetadata.identity.getter();
  return (CHSControlIdentity *)v2;
}

- (WFAppIntentsControlMetadata)init
{
}

- (void).cxx_destruct
{
}

- (void)presentIfPossibleInUserInterface:(WFUserInterfaceHost *)a3 completionBlock:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1C82A95B4((uint64_t)&unk_1EA517320, (uint64_t)v7);
}

@end