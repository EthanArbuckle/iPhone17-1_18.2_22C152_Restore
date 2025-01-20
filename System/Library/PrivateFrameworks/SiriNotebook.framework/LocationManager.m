@interface LocationManager
- (_TtC12SiriNotebook15LocationManager)init;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationManager

- (_TtC12SiriNotebook15LocationManager)init
{
  return (_TtC12SiriNotebook15LocationManager *)sub_22770B574();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22770B7E4(v4);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SiriNotebook15LocationManager_locationQueue);
}

@end