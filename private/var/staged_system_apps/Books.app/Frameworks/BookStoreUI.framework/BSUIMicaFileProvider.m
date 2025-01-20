@interface BSUIMicaFileProvider
- (BSUIMicaFileProvider)init;
- (id)dataFor:(id)a3;
@end

@implementation BSUIMicaFileProvider

- (id)dataFor:(id)a3
{
  uint64_t v4 = sub_2E4420();
  unint64_t v6 = v5;
  v7 = self;
  uint64_t v8 = sub_148F58(v4, v6);
  unint64_t v10 = v9;

  swift_bridgeObjectRelease();
  if (v10 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_2DDCE0().super.isa;
    sub_14921C(v8, v10);
  }

  return isa;
}

- (BSUIMicaFileProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MicaFileProvider();
  return [(BSUIMicaFileProvider *)&v3 init];
}

@end