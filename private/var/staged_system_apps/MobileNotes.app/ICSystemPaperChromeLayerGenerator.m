@interface ICSystemPaperChromeLayerGenerator
- (_TtC11MobileNotes33ICSystemPaperChromeLayerGenerator)init;
- (id)generateChromeThumbnailsWithError:(id *)a3;
@end

@implementation ICSystemPaperChromeLayerGenerator

- (id)generateChromeThumbnailsWithError:(id *)a3
{
  v3 = self;
  unint64_t v4 = sub_10021B848();
  v5 = v3;
  sub_10021C6E4(v4);
  swift_bridgeObjectRelease();

  type metadata accessor for URL();
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (_TtC11MobileNotes33ICSystemPaperChromeLayerGenerator)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC11MobileNotes33ICSystemPaperChromeLayerGenerator____lazy_storage___chromeLayerTraitCollections) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(ICSystemPaperChromeLayerGenerator *)&v5 init];
}

- (void).cxx_destruct
{
}

@end