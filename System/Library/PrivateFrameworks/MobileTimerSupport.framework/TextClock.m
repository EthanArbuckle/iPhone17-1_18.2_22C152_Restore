@interface TextClock
- (_TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock)init;
- (void)dealloc;
- (void)timeFormatterTextDidChange:(id)a3;
@end

@implementation TextClock

- (_TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock_delegate] = 0;
  swift_unknownObjectWeakInit();
  v3 = (char *)self + OBJC_IVAR____TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock_overrideDate;
  uint64_t v4 = sub_1BE322E20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = OBJC_IVAR____TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock__timeFormatterByOffset;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1063C0);
  v6 = (objc_class *)swift_allocObject();
  type metadata accessor for MTSUnfairLock();
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 16) = 0;
  uint64_t v8 = MEMORY[0x1E4FBC868];
  *((void *)v6 + 2) = v7;
  *((void *)v6 + 3) = v8;
  *(Class *)((char *)&self->super.isa + v5) = v6;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TextClock(0);
  return [(TextClock *)&v10 init];
}

- (void)dealloc
{
  v2 = self;
  sub_1BE2D0D5C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for TextClock(0);
  [(TextClock *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_1BE2AC340((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock_delegate);
  sub_1BE29F8A8((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock_overrideDate, (uint64_t *)&unk_1EB838EC0);
  swift_release();
}

- (void)timeFormatterTextDidChange:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1BE2D19AC(a3);
}

@end