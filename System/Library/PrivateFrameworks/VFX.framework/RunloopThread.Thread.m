@interface RunloopThread.Thread
- (_TtCC3VFX13RunloopThreadP33_C5453D25073BE51EF98804DB40F9E2866Thread)init;
- (void)main;
@end

@implementation RunloopThread.Thread

- (_TtCC3VFX13RunloopThreadP33_C5453D25073BE51EF98804DB40F9E2866Thread)init
{
  return (_TtCC3VFX13RunloopThreadP33_C5453D25073BE51EF98804DB40F9E2866Thread *)sub_1B6ADA5D4();
}

- (void)main
{
  v2 = self;
  sub_1B6ADA6B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC3VFX13RunloopThreadP33_C5453D25073BE51EF98804DB40F9E2866Thread_runloopSource));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC3VFX13RunloopThreadP33_C5453D25073BE51EF98804DB40F9E2866Thread_currentRunloop));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtCC3VFX13RunloopThreadP33_C5453D25073BE51EF98804DB40F9E2866Thread_startedCallback);

  sub_1B62C6A50(v3);
}

@end