@interface FCPingBasedOnlineNetworkTransitionMonitor
- (FCPingBasedOnlineNetworkTransitionMonitor)init;
- (FCPingBasedOnlineNetworkTransitionMonitor)initWithConfigurationManager:(id)a3 hostName:(id)a4 port:(unsigned __int16)a5;
- (NSDate)dateOfLastTransition;
- (id)notifyWhenTransitionOccursOnQueue:(id)a3 withBlock:(id)a4;
@end

@implementation FCPingBasedOnlineNetworkTransitionMonitor

- (FCPingBasedOnlineNetworkTransitionMonitor)initWithConfigurationManager:(id)a3 hostName:(id)a4 port:(unsigned __int16)a5
{
  uint64_t v6 = sub_1A4942AE0();
  uint64_t v8 = v7;
  uint64_t v9 = swift_unknownObjectRetain();
  v10 = (FCPingBasedOnlineNetworkTransitionMonitor *)sub_1A46ECBC8(v9, v6, v8, a5);
  swift_unknownObjectRelease();
  return v10;
}

- (id)notifyWhenTransitionOccursOnQueue:(id)a3 withBlock:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = sub_1A46EA950(v8, (uint64_t)sub_1A46ED540, v7);

  swift_release();
  return v10;
}

- (NSDate)dateOfLastTransition
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5CF570);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___FCPingBasedOnlineNetworkTransitionMonitor_dateOfLastTransitionLock);
  uint64_t v7 = v6 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v6 + 16);
  id v8 = (os_unfair_lock_s *)(v6 + ((*(unsigned int *)(*(void *)v6 + 48) + 3) & 0x1FFFFFFFCLL));
  uint64_t v9 = self;
  os_unfair_lock_lock(v8);
  sub_1A46EB344(v7, (uint64_t)v5);
  os_unfair_lock_unlock(v8);

  uint64_t v10 = sub_1A49421A0();
  uint64_t v11 = *(void *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10) != 1)
  {
    v12 = (void *)sub_1A4942150();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
  }
  return (NSDate *)v12;
}

- (FCPingBasedOnlineNetworkTransitionMonitor)init
{
  result = (FCPingBasedOnlineNetworkTransitionMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end