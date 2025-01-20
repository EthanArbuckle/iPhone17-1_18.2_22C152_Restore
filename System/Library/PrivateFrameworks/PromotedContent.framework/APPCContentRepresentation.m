@interface APPCContentRepresentation
- (APPCAdPolicyData)adPolicyData;
- (APPCContentRepresentation)init;
- (APPCTapAction)tapAction;
- (CGSize)adSize;
- (NSString)identifier;
- (NSUUID)id;
- (int64_t)adType;
- (int64_t)desiredPosition;
- (int64_t)privacyMarkerPosition;
- (void)performActionWithCompletion:(id)a3;
@end

@implementation APPCContentRepresentation

- (int64_t)adType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCContentRepresentation_adType);
}

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B5CB33B0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSUUID)id
{
  v2 = (void *)sub_1B5CB30C0();
  return (NSUUID *)v2;
}

- (int64_t)desiredPosition
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCContentRepresentation_desiredPosition);
}

- (int64_t)privacyMarkerPosition
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCContentRepresentation_privacyMarkerPosition);
}

- (CGSize)adSize
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR___APPCContentRepresentation_adSize);
  double v3 = *(double *)&self->identifier[OBJC_IVAR___APPCContentRepresentation_adSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (APPCTapAction)tapAction
{
  return (APPCTapAction *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR___APPCContentRepresentation_tapAction));
}

- (APPCAdPolicyData)adPolicyData
{
  return (APPCAdPolicyData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___APPCContentRepresentation_adPolicyData));
}

- (void)performActionWithCompletion:(id)a3
{
  double v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (APPCContentRepresentation)init
{
  CGSize result = (APPCContentRepresentation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  double v3 = (char *)self + OBJC_IVAR___APPCContentRepresentation_id;
  uint64_t v4 = sub_1B5CB3100();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCContentRepresentation_adPolicyData);
}

@end