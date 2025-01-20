@interface TPSLastDisplayedContent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasContent;
- (NSString)collectionId;
- (NSString)description;
- (NSString)tipId;
- (TPSLastDisplayedContent)init;
- (TPSLastDisplayedContent)initWithCoder:(id)a3;
- (TPSLastDisplayedContent)initWithCollectionId:(id)a3 tipId:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionId:(id)a3;
- (void)setTipId:(id)a3;
@end

@implementation TPSLastDisplayedContent

- (TPSLastDisplayedContent)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSLastDisplayedContent_tipId) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSLastDisplayedContent_collectionId) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(TPSLastDisplayedContent *)&v5 init];
}

- (BOOL)hasContent
{
  v2 = self;
  Swift::Bool v3 = TPSLastDisplayedContent.hasContent()();

  return v3;
}

- (NSString)tipId
{
  return (NSString *)sub_1000691DC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLastDisplayedContent_tipId);
}

- (void)setTipId:(id)a3
{
}

- (NSString)collectionId
{
  return (NSString *)sub_1000691DC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLastDisplayedContent_collectionId);
}

- (void)setCollectionId:(id)a3
{
}

- (TPSLastDisplayedContent)initWithCollectionId:(id)a3 tipId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (TPSLastDisplayedContent *)sub_100069B54(a3, a4);

  return v8;
}

- (NSString)description
{
  v2 = self;
  TPSLastDisplayedContent.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSLastDisplayedContent_collectionId);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  TPSLastDisplayedContent.encode(with:)((NSCoder)v4);
}

- (TPSLastDisplayedContent)initWithCoder:(id)a3
{
  return (TPSLastDisplayedContent *)TPSLastDisplayedContent.init(coder:)(a3);
}

@end