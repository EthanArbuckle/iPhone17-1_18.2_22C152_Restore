@interface JSMusicKitHTTPRequest
- (void)dealloc;
@end

@implementation JSMusicKitHTTPRequest

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_urlRequest);
  if (v4)
  {
    sub_100057778(0, &qword_1010A5FB0);
    v5 = self;
    id v6 = v4;
    id v7 = static ICURLSessionManager.musicSession.getter();
    [v7 cancelRequest:v6];
  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = ObjectType;
  [(JSObject *)&v9 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_urlRequest));
  swift_bridgeObjectRelease();
  sub_10007A5C4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_receivedData), *(void *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_receivedData]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_response));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_responseExpirationDate, &qword_1010A9820);
}

@end