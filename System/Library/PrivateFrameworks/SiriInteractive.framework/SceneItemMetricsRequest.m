@interface SceneItemMetricsRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (CGSize)initialSize;
- (CGSize)maximumSize;
- (NSString)description;
- (_TtC15SiriInteractive20SizeDimensionRequest)heightRequest;
- (_TtC15SiriInteractive20SizeDimensionRequest)widthRequest;
- (_TtC15SiriInteractive23SceneItemMetricsRequest)init;
- (_TtC15SiriInteractive23SceneItemMetricsRequest)initWithCoder:(id)a3;
- (_TtC15SiriInteractive23SceneItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5;
- (_TtC15SiriInteractive23SceneItemMetricsRequest)initWithXPCDictionary:(id)a3;
- (double)cornerRadius;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHeightRequest:(id)a3;
- (void)setWidthRequest:(id)a3;
@end

@implementation SceneItemMetricsRequest

- (_TtC15SiriInteractive20SizeDimensionRequest)widthRequest
{
  id v2 = sub_25C995F24();
  return (_TtC15SiriInteractive20SizeDimensionRequest *)v2;
}

- (void)setWidthRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25C995F8C(v4);
}

- (_TtC15SiriInteractive20SizeDimensionRequest)heightRequest
{
  id v2 = sub_25C996078();
  return (_TtC15SiriInteractive20SizeDimensionRequest *)v2;
}

- (void)setHeightRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25C9960E0(v4);
}

- (double)cornerRadius
{
  return sub_25C9962B0();
}

- (void)setCornerRadius:(double)a3
{
}

- (CGSize)initialSize
{
  double v2 = sub_25C9963E0();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)maximumSize
{
  double v2 = sub_25C996464();
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC15SiriInteractive23SceneItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5
{
  return (_TtC15SiriInteractive23SceneItemMetricsRequest *)SceneItemMetricsRequest.init(width:height:cornerRadius:)(a3, a4, a5);
}

- (BOOL)isValid
{
  return sub_25C99666C();
}

- (int64_t)hash
{
  double v2 = self;
  int64_t v3 = sub_25C9967B4();

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
  BOOL v6 = sub_25C9968C0((uint64_t)v8);

  sub_25C98D484((uint64_t)v8);
  return v6;
}

- (NSString)description
{
  double v2 = self;
  sub_25C996AF8();

  int64_t v3 = (void *)sub_25C9B8140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_25C996BE0((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (_TtC15SiriInteractive23SceneItemMetricsRequest)initWithXPCDictionary:(id)a3
{
  return (_TtC15SiriInteractive23SceneItemMetricsRequest *)SceneItemMetricsRequest.init(xpcDictionary:)();
}

- (id)copyWithZone:(void *)a3
{
  int64_t v3 = self;
  sub_25C996ED8(v6);

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
  sub_25C996FE4(v4);
}

- (_TtC15SiriInteractive23SceneItemMetricsRequest)initWithCoder:(id)a3
{
  return (_TtC15SiriInteractive23SceneItemMetricsRequest *)SceneItemMetricsRequest.init(coder:)(a3);
}

- (_TtC15SiriInteractive23SceneItemMetricsRequest)init
{
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_12();

  id v4 = *(void **)(v2 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest);
}

@end