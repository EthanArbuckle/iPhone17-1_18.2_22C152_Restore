@interface MRDGroupSessionAssertionManager
- (BOOL)isAsserting;
- (MRDGroupSessionAssertionManager)init;
- (NSString)debugDescription;
- (id)createAssertionWithReason:(id)a3;
- (void)addObserver:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation MRDGroupSessionAssertionManager

- (NSString)debugDescription
{
  swift_getObjectType();
  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionAssertionManager_lock) + 16);
  v3 = self;
  os_unfair_lock_lock(v2);
  sub_1002FB4E0(&v7);
  os_unfair_lock_unlock(v2);

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (BOOL)isAsserting
{
  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionAssertionManager_lock) + 16);
  v3 = self;
  os_unfair_lock_lock(v2);
  sub_1002FAE70(&v5);
  os_unfair_lock_unlock(v2);
  LOBYTE(v2) = v5;

  return (char)v2;
}

- (id)createAssertionWithReason:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;
  uint64_t v7 = self;
  v8 = (void *)sub_1002F8940(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)addObserver:(id)a3
{
  uint64_t v4 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionAssertionManager_lock) + 16);
  swift_unknownObjectRetain();
  unint64_t v5 = self;
  os_unfair_lock_lock(v4);
  sub_100013C90();
  os_unfair_lock_unlock(v4);
  swift_unknownObjectRelease();
}

- (void)removeObserver:(id)a3
{
  uint64_t v4 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionAssertionManager_lock) + 16);
  swift_unknownObjectRetain();
  unint64_t v5 = self;
  os_unfair_lock_lock(v4);
  sub_100013C90();
  os_unfair_lock_unlock(v4);
  swift_unknownObjectRelease();
}

- (MRDGroupSessionAssertionManager)init
{
  return (MRDGroupSessionAssertionManager *)sub_1002F9F80();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)collectDiagnostic:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    id v5 = a3;
    unint64_t v6 = [(MRDGroupSessionAssertionManager *)v4 debugDescription];
    [v5 setGroupSessionAssertionManagerState:v6];
  }
  else
  {
    __break(1u);
  }
}

@end