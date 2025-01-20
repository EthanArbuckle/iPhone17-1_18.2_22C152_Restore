@interface BKDebugBoolDefaultSwitch
- (BKDebugBoolDefaultSwitch)initWithCoder:(id)a3;
- (BKDebugBoolDefaultSwitch)initWithDefaults:(id)a3 key:(id)a4;
- (BKDebugBoolDefaultSwitch)initWithDefaults:(id)a3 key:(id)a4 action:(id)a5;
- (BKDebugBoolDefaultSwitch)initWithDefaultsKey:(id)a3;
- (BKDebugBoolDefaultSwitch)initWithDefaultsKey:(id)a3 action:(id)a4;
- (BKDebugBoolDefaultSwitch)initWithFrame:(CGRect)a3;
- (BKDebugBoolDefaultSwitch)initWithInitialValue:(BOOL)a3 synchronize:(id)a4;
- (BKDebugBoolDefaultSwitch)initWithInitialValue:(BOOL)a3 synchronize:(id)a4 action:(id)a5;
- (void)didTapWithSender:(id)a3;
@end

@implementation BKDebugBoolDefaultSwitch

- (BKDebugBoolDefaultSwitch)initWithInitialValue:(BOOL)a3 synchronize:(id)a4
{
  BOOL v4 = a3;
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_10078E1D8;
    v11[4] = sub_10078E1D8;
    v11[5] = v7;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_1000510C0;
    v11[3] = &unk_100A6E5D8;
    v8 = _Block_copy(v11);
    swift_retain();
    swift_release();
  }
  else
  {
    v8 = 0;
  }
  v9 = [(BKDebugBoolDefaultSwitch *)self initWithInitialValue:v4 synchronize:v8 action:0];
  sub_10003E138((uint64_t)v6);
  _Block_release(v8);
  return v9;
}

- (BKDebugBoolDefaultSwitch)initWithInitialValue:(BOOL)a3 synchronize:(id)a4 action:(id)a5
{
  uint64_t v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  v9 = v8;
  if (!v7)
  {
    uint64_t v10 = 0;
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    v12 = 0;
    uint64_t v11 = 0;
    return (BKDebugBoolDefaultSwitch *)sub_10078D538(a3, (uint64_t)v7, v10, (uint64_t)v12, v11);
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v7;
  uint64_t v7 = sub_10078E1D8;
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  v12 = sub_10078E1D8;
  return (BKDebugBoolDefaultSwitch *)sub_10078D538(a3, (uint64_t)v7, v10, (uint64_t)v12, v11);
}

- (BKDebugBoolDefaultSwitch)initWithDefaultsKey:(id)a3
{
  sub_1007FDC70();
  id v4 = [self standardUserDefaults];
  NSString v5 = sub_1007FDC30();
  swift_bridgeObjectRelease();
  v6 = [(BKDebugBoolDefaultSwitch *)self initWithDefaults:v4 key:v5 action:0];

  return v6;
}

- (BKDebugBoolDefaultSwitch)initWithDefaultsKey:(id)a3 action:(id)a4
{
  id v4 = _Block_copy(a4);
  uint64_t v5 = sub_1007FDC70();
  uint64_t v7 = v6;
  if (v4)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v4;
    v9 = sub_10078E1D8;
  }
  else
  {
    v9 = 0;
    uint64_t v8 = 0;
  }
  return (BKDebugBoolDefaultSwitch *)sub_10078D7C8(v5, v7, (uint64_t)v9, v8);
}

- (BKDebugBoolDefaultSwitch)initWithDefaults:(id)a3 key:(id)a4
{
  sub_1007FDC70();
  id v6 = a3;
  NSString v7 = sub_1007FDC30();
  swift_bridgeObjectRelease();
  uint64_t v8 = [(BKDebugBoolDefaultSwitch *)self initWithDefaults:v6 key:v7 action:0];

  return v8;
}

- (BKDebugBoolDefaultSwitch)initWithDefaults:(id)a3 key:(id)a4 action:(id)a5
{
  id v6 = _Block_copy(a5);
  uint64_t v7 = sub_1007FDC70();
  uint64_t v9 = v8;
  if (v6)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v6;
    id v6 = sub_100575F28;
  }
  else
  {
    uint64_t v10 = 0;
  }
  return (BKDebugBoolDefaultSwitch *)sub_10078DA88(a3, v7, v9, (uint64_t)v6, v10);
}

- (BKDebugBoolDefaultSwitch)initWithCoder:(id)a3
{
  result = (BKDebugBoolDefaultSwitch *)sub_1007FF260();
  __break(1u);
  return result;
}

- (void)didTapWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10078DCDC(v4);
}

- (BKDebugBoolDefaultSwitch)initWithFrame:(CGRect)a3
{
  result = (BKDebugBoolDefaultSwitch *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10078DF88(*(void **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___BKDebugBoolDefaultSwitch_type), *(void *)&self->type[OBJC_IVAR___BKDebugBoolDefaultSwitch_type], *(void *)&self->type[OBJC_IVAR___BKDebugBoolDefaultSwitch_type + 8], self->type[OBJC_IVAR___BKDebugBoolDefaultSwitch_type + 16]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___BKDebugBoolDefaultSwitch_action);

  sub_10003E138(v3);
}

@end