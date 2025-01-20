@interface BridgedProperty
- (BOOL)isInvalidated;
- (BOOL)isVelocityUsableForVFD;
- (_TtC5UIKit15BridgedProperty)init;
- (id)presentationValue;
- (id)transformer;
- (id)value;
- (id)velocity;
- (id)velocityTarget:(BOOL)a3;
- (void)invalidateAndStopImmediately:(BOOL)a3;
- (void)setIsVelocityUsableForVFD:(BOOL)a3;
- (void)setPresentationValue:(id)a3;
- (void)setTransformer:(id)a3;
- (void)setValue:(id)a3;
- (void)setVelocity:(id)a3;
- (void)setVelocity:(id)a3 target:(BOOL)a4;
@end

@implementation BridgedProperty

- (void)setValue:(id)a3
{
}

- (void)invalidateAndStopImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = *(void *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  uint64_t ObjectType = swift_getObjectType();
  v7 = *(void (**)(BOOL, uint64_t, uint64_t))(v5 + 32);
  v8 = self;
  v7(v3, ObjectType, v5);
}

- (id)presentationValue
{
  return sub_1854F6A24((char *)self, (uint64_t)a2, (void (*)(void *__return_ptr, uint64_t, uint64_t))sub_1854F6AD8);
}

- (id)value
{
  return sub_1854F6A24((char *)self, (uint64_t)a2, (void (*)(void *__return_ptr, uint64_t, uint64_t))sub_1854F6E4C);
}

- (void)setTransformer:(id)a3
{
  if (a3)
  {
    BOOL v3 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v4 = self;
  }
  sub_18557CF74((uint64_t)v6);
}

- (void).cxx_destruct
{
}

- (void)setVelocity:(id)a3 target:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  uint64_t v8 = *(void *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  uint64_t ObjectType = swift_getObjectType();
  sub_185B135C0((uint64_t)v10, v4, ObjectType, v8);

  sub_1853BFC80((uint64_t)v10);
}

- (id)velocityTarget:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = *(void *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  uint64_t ObjectType = swift_getObjectType();
  v7 = self;
  sub_185B138EC(v3, ObjectType, v5);

  __swift_project_boxed_opaque_existential_0Tm(v10, v10[3]);
  uint64_t v8 = (void *)sub_186A1F83C();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
  return v8;
}

- (void)setPresentationValue:(id)a3
{
}

- (id)velocity
{
  return sub_1854F6A24((char *)self, (uint64_t)a2, (void (*)(void *__return_ptr, uint64_t, uint64_t))sub_185B13C70);
}

- (void)setVelocity:(id)a3
{
}

- (BOOL)isInvalidated
{
  uint64_t v3 = *(void *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 24);
  v6 = self;
  char v7 = v5(ObjectType, v3);

  return v7 & 1;
}

- (id)transformer
{
  uint64_t v3 = *(void *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 40);
  v6 = self;
  char v7 = (void *)v5(ObjectType, v3);
  if (v7)
  {
    uint64_t v8 = _s29AnimatablePropertyTransformerCMa();
    v15[3] = v8;
    v15[0] = v7;

    if (v8)
    {
      v9 = __swift_project_boxed_opaque_existential_0Tm(v15, v8);
      uint64_t v10 = *(void *)(v8 - 8);
      double v11 = MEMORY[0x1F4188790](v9);
      v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, double))(v10 + 16))(v13, v11);
      char v7 = (void *)sub_186A1F83C();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
  }
  return v7;
}

- (BOOL)isVelocityUsableForVFD
{
  uint64_t v3 = *(void *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 64);
  v6 = self;
  char v7 = v5(ObjectType, v3);

  return v7 & 1;
}

- (void)setIsVelocityUsableForVFD:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = *(void *)&self->property[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  uint64_t ObjectType = swift_getObjectType();
  char v7 = *(void (**)(BOOL, uint64_t, uint64_t))(v5 + 72);
  uint64_t v8 = self;
  v7(v3, ObjectType, v5);
}

- (_TtC5UIKit15BridgedProperty)init
{
  result = (_TtC5UIKit15BridgedProperty *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end