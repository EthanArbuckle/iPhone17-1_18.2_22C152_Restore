@interface MCSSyncResumer
- (MCSSyncResumer)init;
- (MCSSyncResumer)initWithDelegate:(id)a3;
- (void)attemptToResumeSyncIfAppropriate;
- (void)attemptToResumeSyncOnAccountUpdateIfAppropriate;
- (void)attemptToResumeSyncOnIdentityUpdateIfAppropriate;
- (void)resumeSyncUsingKey:(id)a3;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)systemDidUnlock;
@end

@implementation MCSSyncResumer

- (MCSSyncResumer)initWithDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MCSSyncResumer_delegate) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SyncResumer();
  swift_unknownObjectRetain();
  return [(MCSSyncResumer *)&v4 init];
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  v2 = self;
  sub_2233F5E80();
}

- (void)systemDidUnlock
{
  uint64_t v2 = qword_26AD5F100;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  if (sub_223424450(1, 0)) {
    sub_2233F7D68(MEMORY[0x263F4AA88], "Identity status update, and we stopped syncing due to bad identity status.");
  }
}

- (void)attemptToResumeSyncOnAccountUpdateIfAppropriate
{
}

- (void)attemptToResumeSyncOnIdentityUpdateIfAppropriate
{
}

- (void)resumeSyncUsingKey:(id)a3
{
  uint64_t v4 = sub_22342C300();
  unint64_t v6 = v5;
  v7 = self;
  sub_2233F76C4(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)attemptToResumeSyncIfAppropriate
{
  uint64_t v2 = self;
  sub_2233F5E80();
}

- (MCSSyncResumer)init
{
  result = (MCSSyncResumer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end