@interface NDLiveActivityServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NDLiveActivityServiceListenerDelegate)init;
@end

@implementation NDLiveActivityServiceListenerDelegate

- (NDLiveActivityServiceListenerDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_10006A9E8;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  Container.resolver.getter();
  sub_100017A60(v8, v8[3]);
  type metadata accessor for LiveActivityService();
  result = (NDLiveActivityServiceListenerDelegate *)dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    *(Class *)((char *)&v5->super.isa + OBJC_IVAR___NDLiveActivityServiceListenerDelegate_liveActivityService) = (Class)result;

    sub_1000185C0((uint64_t)v8);
    v7.receiver = v5;
    v7.super_class = ObjectType;
    return [(NDLiveActivityServiceListenerDelegate *)&v7 init];
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100017E70(v7);

  return v9 & 1;
}

- (void).cxx_destruct
{
}

@end