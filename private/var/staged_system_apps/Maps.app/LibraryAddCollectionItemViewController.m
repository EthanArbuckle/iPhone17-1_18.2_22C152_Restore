@interface LibraryAddCollectionItemViewController
- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4;
- (NSString)headerTitle;
- (_TtC4Maps38LibraryAddCollectionItemViewController)initWithCoder:(id)a3;
- (_TtC4Maps38LibraryAddCollectionItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int)requestSource;
- (void)saveMapItem:(id)a3;
@end

@implementation LibraryAddCollectionItemViewController

- (NSString)headerTitle
{
  uint64_t v2 = qword_1015CBD78;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v9._countAndFlagsBits = 0xD00000000000002BLL;
  v9._object = (void *)0x8000000100F77940;
  v4._object = (void *)0x8000000100F77920;
  v4._countAndFlagsBits = 0xD000000000000018;
  v5._countAndFlagsBits = 0x4C206F7420646441;
  v5._object = (void *)0xEE00797261726269;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v4, (Swift::String_optional)0, (NSBundle)qword_101611820, v5, v9);

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (int)requestSource
{
  return 22;
}

- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    id v8 = a3;
    Swift::String v9 = self;
  }
  char v10 = sub_10014BB20((uint64_t)a3, (uint64_t)v12);

  sub_1001189D4((uint64_t)v12);
  return v10 & 1;
}

- (void)saveMapItem:(id)a3
{
  id v4 = a3;
  Swift::String v5 = self;
  sub_10014BDF0(v4);
}

- (_TtC4Maps38LibraryAddCollectionItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for LibraryAddCollectionItemViewController();
  Swift::String v9 = [(AddFromACViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC4Maps38LibraryAddCollectionItemViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryAddCollectionItemViewController();
  return [(LibraryAddCollectionItemViewController *)&v5 initWithCoder:a3];
}

@end