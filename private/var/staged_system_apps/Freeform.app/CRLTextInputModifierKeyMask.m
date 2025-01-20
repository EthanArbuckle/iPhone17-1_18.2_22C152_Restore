@interface CRLTextInputModifierKeyMask
+ (_TtC8Freeform27CRLTextInputModifierKeyMask)command;
+ (_TtC8Freeform27CRLTextInputModifierKeyMask)control;
+ (_TtC8Freeform27CRLTextInputModifierKeyMask)none;
+ (_TtC8Freeform27CRLTextInputModifierKeyMask)option;
+ (_TtC8Freeform27CRLTextInputModifierKeyMask)optionShift;
+ (_TtC8Freeform27CRLTextInputModifierKeyMask)shift;
+ (id)fromKeyCommandFlags:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (_TtC8Freeform27CRLTextInputModifierKeyMask)init;
- (int64_t)hash;
- (int64_t)rawValue;
- (void)setRawValue:(int64_t)a3;
@end

@implementation CRLTextInputModifierKeyMask

+ (_TtC8Freeform27CRLTextInputModifierKeyMask)none
{
  return (_TtC8Freeform27CRLTextInputModifierKeyMask *)sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F780, (void **)&qword_10171B610);
}

+ (_TtC8Freeform27CRLTextInputModifierKeyMask)shift
{
  return (_TtC8Freeform27CRLTextInputModifierKeyMask *)sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F788, (void **)&qword_10171B618);
}

+ (_TtC8Freeform27CRLTextInputModifierKeyMask)option
{
  return (_TtC8Freeform27CRLTextInputModifierKeyMask *)sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F790, (void **)&qword_10171B620);
}

+ (_TtC8Freeform27CRLTextInputModifierKeyMask)command
{
  return (_TtC8Freeform27CRLTextInputModifierKeyMask *)sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F798, (void **)&qword_10171B628);
}

+ (_TtC8Freeform27CRLTextInputModifierKeyMask)control
{
  return (_TtC8Freeform27CRLTextInputModifierKeyMask *)sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F7A0, (void **)&qword_10171B630);
}

+ (_TtC8Freeform27CRLTextInputModifierKeyMask)optionShift
{
  return (_TtC8Freeform27CRLTextInputModifierKeyMask *)sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F7A8, (void **)&qword_10171B638);
}

- (int64_t)rawValue
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLTextInputModifierKeyMask_rawValue);
}

- (void)setRawValue:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLTextInputModifierKeyMask_rawValue) = (Class)a3;
}

- (int64_t)hash
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLTextInputModifierKeyMask_rawValue);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_100A56A40((uint64_t)v8);

  sub_10052E2B0((uint64_t)v8);
  return v6;
}

- (_TtC8Freeform27CRLTextInputModifierKeyMask)init
{
  result = (_TtC8Freeform27CRLTextInputModifierKeyMask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (id)fromKeyCommandFlags:(int64_t)a3
{
  id v3 = sub_100A573A4(a3);

  return v3;
}

@end