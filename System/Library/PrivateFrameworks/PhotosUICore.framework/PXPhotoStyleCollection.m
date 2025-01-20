@interface PXPhotoStyleCollection
+ (NSArray)macStyleCollections;
+ (id)allDefaultStyles;
- (NSArray)elements;
- (NSString)description;
- (NSString)name;
- (PXPhotoStyleCollection)init;
- (void)setElements:(id)a3;
@end

@implementation PXPhotoStyleCollection

- (NSString)name
{
}

- (NSArray)elements
{
}

- (void)setElements:(id)a3
{
  type metadata accessor for PhotoStyleElement(0);
  uint64_t v4 = sub_1AB23AADC();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___PXPhotoStyleCollection_elements);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  v2 = self;
  PhotoStyleCollection.description.getter();
}

- (PXPhotoStyleCollection)init
{
  result = (PXPhotoStyleCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___PXPhotoStyleCollection__selectedIndex;
  uint64_t v4 = sub_1AA6AA97C();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotoStyleCollection_observable);
}

+ (id)allDefaultStyles
{
  sub_1AA6AB0DC();
  type metadata accessor for PhotoStyleElement(0);
  v2 = (void *)sub_1AB23AABC();
  swift_bridgeObjectRelease();
  return v2;
}

+ (NSArray)macStyleCollections
{
}

@end