@interface CanvasAttachmentProvider
- (BOOL)isEqual:(id)a3;
- (NSArray)attachments;
- (_TtC8PaperKit24CanvasAttachmentProvider)init;
@end

@implementation CanvasAttachmentProvider

- (NSArray)attachments
{
  v2 = self;
  unint64_t v3 = swift_bridgeObjectRetain();
  specialized _arrayForceCast<A, B>(_:)(v3);

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CHCanvasAttachment);
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v4.super.isa;
}

- (BOOL)isEqual:(id)a3
{
  return @objc CanvasAttachment.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CanvasAttachmentProvider.isEqual(_:));
}

- (_TtC8PaperKit24CanvasAttachmentProvider)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit24CanvasAttachmentProvider_paperkitAttachments) = (Class)MEMORY[0x263F8EE78];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(CanvasAttachmentProvider *)&v5 init];
}

- (void).cxx_destruct
{
}

@end