@interface SSKDefaultDisplayTransformer
- (SSKDefaultDisplayTransformer)init;
- (id)transformDisplayConfiguration:(id)a3;
@end

@implementation SSKDefaultDisplayTransformer

- (SSKDefaultDisplayTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SSKDefaultDisplayTransformer *)&v3 init];
}

- (id)transformDisplayConfiguration:(id)a3
{
  uint64_t v4 = qword_26B350B50;
  id v5 = a3;
  v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  v7 = (void *)qword_26B350B40;
  type metadata accessor for DefaultDisplayTransformerRegistry();
  swift_dynamicCastClassUnconditional();
  id v8 = v7;
  sub_25C460128(v5);

  sub_25C457A30(0, (unint64_t *)&unk_26B350B90);
  sub_25C461080();
  v9 = (void *)sub_25C47AC58();
  swift_bridgeObjectRelease();
  return v9;
}

@end