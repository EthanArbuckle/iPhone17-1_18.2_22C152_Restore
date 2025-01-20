@interface WFPrescriptionRecord
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (WFPrescriptionRecord)init;
- (WFPrescriptionRecord)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFPrescriptionRecord

- (NSString)description
{
  v2 = (void *)sub_25E7BC3D0();
  return (NSString *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PrescriptionRecord.encode(with:)((NSCoder)v4);
}

- (WFPrescriptionRecord)initWithCoder:(id)a3
{
  return (WFPrescriptionRecord *)PrescriptionRecord.init(coder:)(a3);
}

- (WFPrescriptionRecord)init
{
  result = (WFPrescriptionRecord *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_25E77D724(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFPrescriptionRecord_accPayload), *(void *)&self->version[OBJC_IVAR___WFPrescriptionRecord_accPayload]);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___WFPrescriptionRecord_enrollmentDate;
  uint64_t v4 = sub_25E7BC220();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end