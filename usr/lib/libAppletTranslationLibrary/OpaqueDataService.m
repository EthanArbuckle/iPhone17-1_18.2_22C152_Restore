@interface OpaqueDataService
+ (id)serializedHPKEWithData:(id)a3 publicKey:(id)a4 scheme:(id)a5 error:(id *)a6;
- (_TtC24AppletTranslationLibrary17OpaqueDataService)init;
@end

@implementation OpaqueDataService

+ (id)serializedHPKEWithData:(id)a3 publicKey:(id)a4 scheme:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)sub_1CA5FD598();
  unint64_t v13 = v12;

  v14 = (void *)sub_1CA5FD598();
  unint64_t v16 = v15;

  if (v10)
  {
    sub_1CA5FD8A8();
  }
  v17 = sub_1CA5F38E0(v11, v13, v14, v16);
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  sub_1CA5B6EF4((uint64_t)v14, v16);
  sub_1CA5B6EF4((uint64_t)v11, v13);
  v20 = (void *)sub_1CA5FD578();
  sub_1CA5B6EF4((uint64_t)v17, v19);

  return v20;
}

- (_TtC24AppletTranslationLibrary17OpaqueDataService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OpaqueDataService();
  return [(OpaqueDataService *)&v3 init];
}

@end