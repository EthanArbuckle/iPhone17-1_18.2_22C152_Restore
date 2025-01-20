@interface TimerContext
- (NSString)description;
- (_TtC18MobileTimerSupport12TimerContext)init;
- (_TtC18MobileTimerSupport12TimerContext)initWithState:(int64_t)a3 timerId:(id)a4 duration:(double)a5 remainingTime:(double)a6 firing:(BOOL)a7 fireDate:(id)a8 title:(id)a9;
@end

@implementation TimerContext

- (_TtC18MobileTimerSupport12TimerContext)initWithState:(int64_t)a3 timerId:(id)a4 duration:(double)a5 remainingTime:(double)a6 firing:(BOOL)a7 fireDate:(id)a8 title:(id)a9
{
  uint64_t v14 = sub_1BE3233C0();
  uint64_t v16 = v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB838EC0);
  MEMORY[0x1F4188790](v17 - 8);
  v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a8)
  {
    sub_1BE322DE0();
    uint64_t v20 = sub_1BE322E20();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 0, 1, v20);
  }
  else
  {
    uint64_t v21 = sub_1BE322E20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v19, 1, 1, v21);
  }
  uint64_t v22 = sub_1BE3233C0();
  return (_TtC18MobileTimerSupport12TimerContext *)TimerContext.init(state:timerId:duration:remainingTime:firing:fireDate:title:)(a3, v14, v16, a7, (uint64_t)v19, v22, v23, a5, a6);
}

- (NSString)description
{
  return (NSString *)sub_1BE296904(self, (uint64_t)a2, (void (*)(void))sub_1BE2905C4);
}

- (_TtC18MobileTimerSupport12TimerContext)init
{
  result = (_TtC18MobileTimerSupport12TimerContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1BE29F8A8((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport12TimerContext_firedDate, (uint64_t *)&unk_1EB838EC0);
  sub_1BE29F8A8((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport12TimerContext_fireDate, (uint64_t *)&unk_1EB838EC0);
  sub_1BE29F8A8((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport12TimerContext_dismissedDate, (uint64_t *)&unk_1EB838EC0);
  swift_bridgeObjectRelease();
}

@end