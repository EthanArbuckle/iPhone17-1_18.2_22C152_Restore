@interface SceneMetricsRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC15SiriInteractive19SceneMetricsRequest)init;
- (_TtC15SiriInteractive19SceneMetricsRequest)initWithCoder:(id)a3;
- (_TtC15SiriInteractive19SceneMetricsRequest)initWithLockScreenMetrics:(id)a3;
- (_TtC15SiriInteractive19SceneMetricsRequest)initWithXPCDictionary:(id)a3;
- (_TtC15SiriInteractive23SceneItemMetricsRequest)lockScreenMetrics;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setLockScreenMetrics:(id)a3;
@end

@implementation SceneMetricsRequest

- (_TtC15SiriInteractive23SceneItemMetricsRequest)lockScreenMetrics
{
  id v2 = sub_25C98F4F4();
  return (_TtC15SiriInteractive23SceneItemMetricsRequest *)v2;
}

- (void)setLockScreenMetrics:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25C98F560(v4);
}

- (_TtC15SiriInteractive19SceneMetricsRequest)initWithLockScreenMetrics:(id)a3
{
  return (_TtC15SiriInteractive19SceneMetricsRequest *)SceneMetricsRequest.init(lockScreenMetrics:)((uint64_t)a3);
}

- (int64_t)hash
{
  id v2 = self;
  int64_t v3 = sub_25C98F7DC();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_25C9B8410();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_25C98F828((uint64_t)v8);

  sub_25C98D484((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  id v2 = self;
  sub_25C98FA18();

  int64_t v3 = (void *)sub_25C9B8140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC15SiriInteractive19SceneMetricsRequest)initWithXPCDictionary:(id)a3
{
  return (_TtC15SiriInteractive19SceneMetricsRequest *)SceneMetricsRequest.init(xpcDictionary:)();
}

- (void)encodeWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_25C98FC34((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  int64_t v3 = self;
  sub_25C98FCC0(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  id v4 = (void *)sub_25C9B85E0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25C98FDA4(v4);
}

- (_TtC15SiriInteractive19SceneMetricsRequest)initWithCoder:(id)a3
{
  return (_TtC15SiriInteractive19SceneMetricsRequest *)SceneMetricsRequest.init(coder:)(a3);
}

- (_TtC15SiriInteractive19SceneMetricsRequest)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics));
}

@end