@interface NearbyInvitationServiceHost
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC44com_apple_SharePlay_NearbyInvitationsService27NearbyInvitationServiceHost)init;
- (void)dealloc;
@end

@implementation NearbyInvitationServiceHost

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService27NearbyInvitationServiceHost_listener);
  v5 = self;
  [v4 invalidate];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(NearbyInvitationServiceHost *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService27NearbyInvitationServiceHost_listener));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService27NearbyInvitationServiceHost_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService27NearbyInvitationServiceHost_connection));
  swift_release();
}

- (_TtC44com_apple_SharePlay_NearbyInvitationsService27NearbyInvitationServiceHost)init
{
  result = (_TtC44com_apple_SharePlay_NearbyInvitationsService27NearbyInvitationServiceHost *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = specialized NearbyInvitationServiceHost.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

@end