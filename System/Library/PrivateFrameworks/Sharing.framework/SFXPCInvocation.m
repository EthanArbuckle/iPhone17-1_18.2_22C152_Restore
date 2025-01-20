@interface SFXPCInvocation
+ (BOOL)supportsSecureCoding;
- (SFXPCInvocation)init;
- (SFXPCInvocation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFXPCInvocation

- (SFXPCInvocation)init
{
  swift_getObjectType();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v4 = self;
  v5 = NSStringFromClass(ObjCClassFromMetadata);
  uint64_t v6 = sub_1A56D50D8();
  uint64_t v8 = v7;

  v9 = (uint64_t *)((char *)v4 + OBJC_IVAR___SFXPCInvocation_name);
  uint64_t *v9 = v6;
  v9[1] = v8;

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for SFXPCInvocation();
  return [(SFXPCInvocation *)&v11 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFXPCInvocation)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (SFXPCInvocation *)sub_1A55B2384(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  if (*(void *)&self->name[OBJC_IVAR___SFXPCInvocation_name])
  {
    id v4 = a3;
    v5 = self;
    uint64_t v6 = (void *)sub_1A56D5098();
    id v7 = (id)sub_1A56D5098();
    objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);
  }
}

- (void).cxx_destruct
{
}

@end