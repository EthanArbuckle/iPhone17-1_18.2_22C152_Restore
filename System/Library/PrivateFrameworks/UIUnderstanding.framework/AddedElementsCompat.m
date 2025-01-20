@interface AddedElementsCompat
- (AddedElementsCompat)init;
- (AddedElementsCompat)initWithGroupID:(id)a3 dedupeElements:(id)a4;
- (NSArray)dedupeElements;
- (NSString)groupID;
@end

@implementation AddedElementsCompat

- (NSString)groupID
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_260655788();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSArray)dedupeElements
{
  type metadata accessor for DedupeElement();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_260655928();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (AddedElementsCompat)initWithGroupID:(id)a3 dedupeElements:(id)a4
{
  uint64_t v5 = sub_2606557B8();
  uint64_t v7 = v6;
  type metadata accessor for DedupeElement();
  v8 = (objc_class *)sub_260655938();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___AddedElementsCompat_groupID);
  uint64_t *v9 = v5;
  v9[1] = v7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AddedElementsCompat_dedupeElements) = v8;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AddedElements();
  return [(AddedElementsCompat *)&v11 init];
}

- (AddedElementsCompat)init
{
  result = (AddedElementsCompat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end