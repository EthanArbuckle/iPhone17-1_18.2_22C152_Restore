@interface MSCMSTimestampAttributeInternal
- (BOOL)verifyTimestamp:(id)a3 error:(id *)a4;
- (MSCMSTimestampAttributeInternal)init;
- (MSCMSTimestampAttributeInternal)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSTimestampAttributeInternal)initWithTimestampToken:(id)a3 error:(id *)a4;
- (MSOID)attributeType;
- (id)encodeAttributeWithError:(id *)a3;
- (id)timestampToken;
- (void)dealloc;
- (void)setAttributeType:(id)a3;
@end

@implementation MSCMSTimestampAttributeInternal

- (MSOID)attributeType
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType);
  swift_beginAccess();
  return (MSOID *)*v2;
}

- (void)setAttributeType:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_beginAccess();
  v4 = self;
  free_TSTInfo();
  swift_endAccess();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(MSCMSTimestampAttributeInternal *)&v5 dealloc];
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData);
}

- (MSCMSTimestampAttributeInternal)initWithAttribute:(id)a3 error:(id *)a4
{
  MSCMSTimestampAttributeInternal.init(attribute:)(a3);
  return result;
}

- (MSCMSTimestampAttributeInternal)initWithTimestampToken:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = sub_20D8DF148();
  unint64_t v7 = v6;

  return (MSCMSTimestampAttributeInternal *)MSCMSTimestampAttributeInternal.init(timestampToken:)(v5, v7);
}

- (BOOL)verifyTimestamp:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = self;
  uint64_t v7 = sub_20D8DF148();
  unint64_t v9 = v8;

  MSCMSTimestampAttributeInternal.verifyTimestamp(expectedMessageDigest:)(v7, v9);
  sub_20D8CD7B8(v7, v9);
  return 1;
}

- (id)encodeAttributeWithError:(id *)a3
{
  sub_20D8D2F08();
  id v4 = (void *)swift_allocError();
  *(void *)uint64_t v5 = 0;
  *(void *)(v5 + 8) = 0;
  *(unsigned char *)(v5 + 16) = 48;
  swift_willThrow();
  if (a3)
  {
    unint64_t v6 = (void *)sub_20D8DF0C8();

    id v7 = v6;
    *a3 = v6;
  }
  else
  {
  }

  return 0;
}

- (id)timestampToken
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo);
  swift_beginAccess();
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF910]), sel_initWithTimeIntervalSince1970_, (double)v2[11]);

  return v3;
}

- (MSCMSTimestampAttributeInternal)init
{
  result = (MSCMSTimestampAttributeInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end