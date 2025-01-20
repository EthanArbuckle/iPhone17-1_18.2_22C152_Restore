@interface EditingSectionedCollection
+ (BOOL)supportsSecureCoding;
- (_TtC16MusicApplication26EditingSectionedCollection)init;
- (_TtC16MusicApplication26EditingSectionedCollection)initWithCoder:(id)a3;
- (id)allItems;
- (id)firstItem;
- (id)firstSection;
- (id)identifiersForItemAtIndexPath:(id)a3;
- (id)identifiersForSectionAtIndex:(int64_t)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)itemsInSectionAtIndex:(int64_t)a3;
- (id)lastItem;
- (id)lastSection;
- (id)sectionAtIndex:(int64_t)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)enumerateItemsInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)enumerateSectionsUsingBlock:(id)a3;
@end

@implementation EditingSectionedCollection

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (_TtC16MusicApplication26EditingSectionedCollection)initWithCoder:(id)a3
{
  *(void *)&self->MPSectionedCollection_opaque[OBJC_IVAR____TtC16MusicApplication26EditingSectionedCollection_changeRecords] = _swiftEmptyArrayStorage;
  *(void *)&self->MPSectionedCollection_opaque[OBJC_IVAR____TtC16MusicApplication26EditingSectionedCollection_entries] = _swiftEmptyArrayStorage;
  id v4 = a3;

  result = (_TtC16MusicApplication26EditingSectionedCollection *)sub_AB8280();
  __break(1u);
  return result;
}

- (int64_t)numberOfSections
{
  return *(void *)(*(void *)&self->MPSectionedCollection_opaque[OBJC_IVAR____TtC16MusicApplication26EditingSectionedCollection_entries]
                   + 16);
}

- (id)sectionAtIndex:(int64_t)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication26EditingSectionedCollection_baseSectionedCollection;
  v6 = *(void **)&self->MPSectionedCollection_opaque[OBJC_IVAR____TtC16MusicApplication26EditingSectionedCollection_baseSectionedCollection];
  v7 = self;
  if ((uint64_t)[v6 numberOfSections] <= a3) {
    NSString v8 = sub_AB64D0();
  }
  else {
    NSString v8 = [*(id *)&self->MPSectionedCollection_opaque[v5] sectionAtIndex:a3];
  }
  v9 = v8;

  return v9;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return sub_439A58(a3);
}

- (id)itemAtIndexPath:(id)a3
{
  return sub_43AF24(self, (uint64_t)a2, a3, (uint64_t (*)(char *))sub_439AB8);
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_43D0A4(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)enumerateItemsInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_43D1A0(a3, v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  v9[2] = v4;
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = self;
  v5[3] = sub_43CFB0;
  v5[4] = v9;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_43D05C;
  *(void *)(v6 + 24) = v5;
  aBlock[4] = sub_41369C;
  aBlock[5] = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DE35C;
  aBlock[3] = &block_descriptor_30_2;
  v7 = _Block_copy(aBlock);
  NSString v8 = self;
  swift_retain();
  swift_release();
  [(EditingSectionedCollection *)v8 enumerateSectionsUsingBlock:v7];
  _Block_release(v7);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  _Block_release(v4);

  if (v7) {
    __break(1u);
  }
}

- (id)itemsInSectionAtIndex:(int64_t)a3
{
  id v4 = self;
  sub_43A1BC(a3);

  v5.super.isa = sub_AB6990().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (id)firstSection
{
  v2 = self;
  if ([(EditingSectionedCollection *)v2 numberOfSections] < 1) {
    id v3 = 0;
  }
  else {
    id v3 = [(EditingSectionedCollection *)v2 sectionAtIndex:0];
  }

  return v3;
}

- (id)lastSection
{
  v2 = self;
  id v3 = [(EditingSectionedCollection *)v2 numberOfSections];
  if ((uint64_t)v3 < 1) {
    id v4 = 0;
  }
  else {
    id v4 = [(EditingSectionedCollection *)v2 sectionAtIndex:v3 - 1];
  }

  return v4;
}

- (id)firstItem
{
  v2 = self;
  id v3 = sub_43A538();

  return v3;
}

- (id)lastItem
{
  v2 = self;
  id v3 = sub_43A6B0();

  return v3;
}

- (id)allItems
{
  v2 = self;
  sub_43A7F0();

  v3.super.isa = sub_AB6990().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  return sub_43AF24(self, (uint64_t)a2, a3, (uint64_t (*)(char *))sub_43AD10);
}

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  id v4 = self;
  id v5 = sub_43B040(a3);

  return v5;
}

- (_TtC16MusicApplication26EditingSectionedCollection)init
{
  result = (_TtC16MusicApplication26EditingSectionedCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end