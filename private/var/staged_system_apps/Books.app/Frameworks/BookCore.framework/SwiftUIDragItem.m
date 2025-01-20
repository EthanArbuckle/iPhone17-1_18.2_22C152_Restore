@interface SwiftUIDragItem
+ (BOOL)supportsSecureCoding;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (_TtC8BookCore15SwiftUIDragItem)init;
- (_TtC8BookCore15SwiftUIDragItem)initWithCoder:(id)a3;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SwiftUIDragItem

- (_TtC8BookCore15SwiftUIDragItem)initWithCoder:(id)a3
{
  return (_TtC8BookCore15SwiftUIDragItem *)SwiftUIDragItem.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  NSString v6 = sub_1F2160();
  id v7 = sub_1F2160();
  [v4 encodeObject:v6 forKey:v7];
}

- (_TtC8BookCore15SwiftUIDragItem)init
{
  result = (_TtC8BookCore15SwiftUIDragItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v2.super.isa = sub_1F2230().super.isa;

  return (NSArray *)v2.super.isa;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1F2190();
  uint64_t v8 = v7;
  _Block_copy(v5);
  v9 = self;
  v10 = (void *)sub_1C4378(v6, v8, (uint64_t)v9, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();

  return v10;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v2.super.isa = sub_1F2230().super.isa;

  return (NSArray *)v2.super.isa;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_1F1170();
  unint64_t v10 = v9;

  v11 = (void *)sub_1F2190();
  uint64_t v13 = v12;

  swift_getObjCClassMetadata();
  id v14 = static SwiftUIDragItem.object(withItemProviderData:typeIdentifier:)(v8, v10, v11, v13);
  swift_bridgeObjectRelease();
  sub_1A2B9C(v8, v10);

  return v14;
}

@end