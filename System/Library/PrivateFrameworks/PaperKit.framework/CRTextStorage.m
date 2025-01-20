@interface CRTextStorage
- (_TtC8PaperKit13CRTextStorage)init;
- (_TtC8PaperKit13CRTextStorage)initWithAttachment:(id)a3 attributes:(id)a4;
- (_TtC8PaperKit13CRTextStorage)initWithAttributedString:(id)a3;
- (_TtC8PaperKit13CRTextStorage)initWithCoder:(id)a3;
- (_TtC8PaperKit13CRTextStorage)initWithContentsOfMarkdownFileAtURL:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6;
- (_TtC8PaperKit13CRTextStorage)initWithData:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6;
- (_TtC8PaperKit13CRTextStorage)initWithFileURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6;
- (_TtC8PaperKit13CRTextStorage)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (_TtC8PaperKit13CRTextStorage)initWithMarkdown:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6;
- (_TtC8PaperKit13CRTextStorage)initWithMarkdownString:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6;
- (_TtC8PaperKit13CRTextStorage)initWithString:(id)a3;
- (_TtC8PaperKit13CRTextStorage)initWithString:(id)a3 attributes:(id)a4;
- (_TtC8PaperKit13CRTextStorage)initWithURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6;
- (id)mutableAttributedString;
- (void)fixAttributesInRange:(_NSRange)a3;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
@end

@implementation CRTextStorage

- (_TtC8PaperKit13CRTextStorage)init
{
  return (_TtC8PaperKit13CRTextStorage *)CRTextStorage.init()();
}

- (_TtC8PaperKit13CRTextStorage)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit13CRTextStorage_darkMode) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit13CRTextStorage_isFixingAttributes) = 0;
  id v4 = a3;

  result = (_TtC8PaperKit13CRTextStorage *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit13CRTextStorage_darkMode) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit13CRTextStorage_isFixingAttributes) = 0;

  result = (_TtC8PaperKit13CRTextStorage *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)mutableAttributedString
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC8PaperKit13CRTextStorage_viewAttributedString));
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  Swift::Int length = a3.length;
  Swift::Int location = a3.location;
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  v10 = self;
  v11.Swift::Int location = location;
  v11.Swift::Int length = length;
  v12._countAndFlagsBits = v7;
  v12._object = v9;
  CRTextStorage.replaceCharacters(in:with:)(v11, v12);

  swift_bridgeObjectRelease();
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  Swift::Int length = a4.length;
  char location = a4.location;
  v6 = a3;
  if (a3)
  {
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey();
    v6 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v8 = self;
  v11.value._rawValue = v6;
  v11.is_nil = location;
  v9.char location = length;
  CRTextStorage.setAttributes(_:range:)(v11, v9);

  swift_bridgeObjectRelease();
}

- (void)fixAttributesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = OBJC_IVAR____TtC8PaperKit13CRTextStorage_isFixingAttributes;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit13CRTextStorage_isFixingAttributes) = 1;
  v9.receiver = self;
  v9.super_class = ObjectType;
  id v8 = self;
  -[CRTextStorage fixAttributesInRange:](&v9, sel_fixAttributesInRange_, location, length);
  *((unsigned char *)&self->super.super.super.super.super.isa + v7) = 0;
}

- (_TtC8PaperKit13CRTextStorage)initWithFileURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
}

- (_TtC8PaperKit13CRTextStorage)initWithURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
}

- (_TtC8PaperKit13CRTextStorage)initWithData:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  id v7 = a3;
  id v8 = a4;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithContentsOfMarkdownFileAtURL:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, v13, 1, v11);
  id v14 = a4;
  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithMarkdown:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  if (v14)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v15 = type metadata accessor for URL();
    uint64_t v17 = 0;
    uint64_t v16 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  }
  else
  {
    uint64_t v15 = type metadata accessor for URL();
    uint64_t v16 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = 1;
  }
  (*v16)(v11, v17, 1, v15);
  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithMarkdownString:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v13 = 0;
    id v12 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  }
  else
  {
    uint64_t v11 = type metadata accessor for URL();
    id v12 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = 1;
  }
  (*v12)(v10, v13, 1, v11);
  id v14 = a4;
  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithString:(id)a3
{
  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithString:(id)a3 attributes:(id)a4
{
  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithAttributedString:(id)a3
{
  id v3 = a3;
  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithAttachment:(id)a3 attributes:(id)a4
{
  id v4 = a3;
  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13CRTextStorage_viewAttributedString));
  id v3 = (char *)self + OBJC_IVAR____TtC8PaperKit13CRTextStorage_mergeableString;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRAttributedString<TextAttributeScope>);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end