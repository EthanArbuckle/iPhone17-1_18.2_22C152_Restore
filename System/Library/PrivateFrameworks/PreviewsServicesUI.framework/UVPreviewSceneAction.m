@interface UVPreviewSceneAction
+ (id)new;
- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)init;
- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)initWithCoder:(id)a3;
- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)initWithXPCDictionary:(id)a3;
- (id)keyDescriptionForSetting:(int64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5;
@end

@implementation UVPreviewSceneAction

- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)initWithCoder:(id)a3
{
  return (_TtC18PreviewsServicesUI20UVPreviewSceneAction *)sub_23996AAD0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)initWithXPCDictionary:(id)a3
{
  return (_TtC18PreviewsServicesUI20UVPreviewSceneAction *)sub_23996AAD0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  _Block_copy(a6);
  result = (_TtC18PreviewsServicesUI20UVPreviewSceneAction *)sub_23997FFC0();
  __break(1u);
  return result;
}

+ (id)new
{
  id result = (id)sub_23997FFC0();
  __break(1u);
  return result;
}

- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)init
{
  id result = (_TtC18PreviewsServicesUI20UVPreviewSceneAction *)sub_23997FFC0();
  __break(1u);
  return result;
}

- (id)keyDescriptionForSetting:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
  {
    v3 = 0;
  }
  else
  {
    v3 = (void *)sub_23997FE20();
    swift_bridgeObjectRelease();
  }

  return v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5
{
  if (a4)
  {
    v7 = self;
    swift_unknownObjectRetain();
    sub_23997FF40();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v8 = self;
  }
  sub_23996BB0C((uint64_t)v13, a5);
  uint64_t v10 = v9;

  sub_23996BD80((uint64_t)v13, &qword_268A06B30);
  if (v10)
  {
    v11 = (void *)sub_23997FE20();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)initWithInfo:(id)a3 responder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id result = (_TtC18PreviewsServicesUI20UVPreviewSceneAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end