@interface JSAPackage
- (BOOL)isBundled;
- (JSAPackage)init;
- (NSArray)allLocales;
- (NSArray)allLocalizationPaths;
- (NSString)nameForJSContext;
- (NSString)version;
- (id)bytesAtPath:(id)a3;
- (id)dataAtPath:(id)a3;
- (id)dirAtPath:(id)a3;
- (id)localizationPathForLocale:(id)a3;
- (id)stringAtPath:(id)a3;
- (void)startEviction;
@end

@implementation JSAPackage

- (NSString)nameForJSContext
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_86830();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)isBundled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___JSAPackage_isBundled);
}

- (NSString)version
{
  type metadata accessor for BooksJetPackResourceBundle();
  sub_62024(&qword_CC878, (void (*)(uint64_t))type metadata accessor for BooksJetPackResourceBundle);
  v3 = self;
  sub_86490();
  if (!v4)
  {
    if (qword_CC4D0 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
  }

  NSString v5 = sub_86830();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (id)dataAtPath:(id)a3
{
  uint64_t v4 = sub_86860();
  NSString v5 = self;
  uint64_t v6 = Package.data(atPath:)(v4);
  unint64_t v8 = v7;

  swift_bridgeObjectRelease();
  if (v8 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_85EE0().super.isa;
    sub_43AA4(v6, v8);
  }

  return isa;
}

- (id)bytesAtPath:(id)a3
{
  uint64_t v4 = sub_86860();
  NSString v5 = self;
  uint64_t v6 = sub_603C0(v4);

  swift_bridgeObjectRelease();
  if (v6)
  {
    v7.super.Class isa = sub_86A10().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.Class isa = 0;
  }

  return v7.super.isa;
}

- (id)stringAtPath:(id)a3
{
  uint64_t v4 = sub_86860();
  uint64_t v6 = v5;
  NSArray v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = Package.string(atPath:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    NSString v10 = sub_86830();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

- (id)dirAtPath:(id)a3
{
  sub_86860();
  uint64_t v4 = self;
  Package.dir(atPath:)();

  swift_bridgeObjectRelease();
  v5.super.Class isa = sub_86A10().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (NSArray)allLocalizationPaths
{
  return (NSArray *)sub_613BC(self, (uint64_t)a2, (void (*)(void))Package.allLocalizationPaths.getter);
}

- (NSArray)allLocales
{
  return (NSArray *)sub_613BC(self, (uint64_t)a2, Package.allLocales.getter);
}

- (id)localizationPathForLocale:(id)a3
{
  uint64_t v4 = sub_86860();
  uint64_t v6 = v5;
  NSArray v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  Package.localizationPath(forLocale:)(v8);

  swift_bridgeObjectRelease();
  NSString v9 = sub_86830();
  swift_bridgeObjectRelease();

  return v9;
}

- (void)startEviction
{
  NSString v2 = self;
  Package.startEviction()();
}

- (JSAPackage)init
{
  result = (JSAPackage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_3F314((uint64_t)self + OBJC_IVAR___JSAPackage_jetPack);

  swift_bridgeObjectRelease();
}

@end