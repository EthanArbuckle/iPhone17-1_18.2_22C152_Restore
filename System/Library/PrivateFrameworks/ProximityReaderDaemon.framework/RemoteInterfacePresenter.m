@interface RemoteInterfacePresenter
- (_TtC21ProximityReaderDaemon24RemoteInterfacePresenter)init;
@end

@implementation RemoteInterfacePresenter

- (_TtC21ProximityReaderDaemon24RemoteInterfacePresenter)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21ProximityReaderDaemon24RemoteInterfacePresenter_invalidationHandler) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RemoteInterfacePresenter();
  return [(RemoteInterfacePresenter *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityReaderDaemon24RemoteInterfacePresenter_invalidationHandler));
}

@end