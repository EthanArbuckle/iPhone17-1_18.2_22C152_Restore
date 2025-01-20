@interface MRDMediaControlIPCServer
- (MRDMediaControlIPCServer)init;
- (void)collectDiagnostic:(id)a3;
- (void)start;
@end

@implementation MRDMediaControlIPCServer

- (void)start
{
  uint64_t v3 = type metadata accessor for Features.MediaRemote();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Features.MediaRemote.cayenne(_:), v3);
  v7 = self;
  char v8 = Features.MediaRemote.isEnabled.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (v8)
  {
    if (qword_100484210 != -1) {
      swift_once();
    }
    swift_beginAccess();
    v9 = *(void (**)(uint64_t))(*(void *)qword_1004862C8 + 192);
    uint64_t v10 = swift_retain();
    v9(v10);

    swift_release();
  }
  else
  {
  }
}

- (void)collectDiagnostic:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10030854C((uint64_t)a3);
}

- (MRDMediaControlIPCServer)init
{
  v3.receiver = self;
  v3.super_class = (Class)MRDMediaControlIPCServer;
  return [(MRDMediaControlIPCServer *)&v3 init];
}

@end