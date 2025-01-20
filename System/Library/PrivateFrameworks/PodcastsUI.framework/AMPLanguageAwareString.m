@interface AMPLanguageAwareString
+ (AMPLanguageAwareString)AMPLanguageAwareStringEmpty;
+ (AMPLanguageAwareStringPreprocessor)delegate;
+ (BOOL)alwaysGenerateAttributedString;
+ (void)setAlwaysGenerateAttributedString:(BOOL)a3;
+ (void)setDelegate:(id)a3;
- (AMPLanguageAwareString)init;
- (AMPLanguageAwareString)initWithAttributedString:(id)a3 baseParagraphStyle:(id)a4;
- (AMPLanguageAwareString)initWithLanguageAwareString:(id)a3 attributes:(id)a4;
- (AMPLanguageAwareString)initWithString:(id)a3 attributes:(id)a4 baseParagraphStyle:(id)a5;
- (AMPLanguageAwareString)initWithString:(id)a3 baseParagraphStyle:(id)a4 generateAttributedString:(BOOL)a5;
- (AMPLanguageAwareString)localizedLowercase;
- (AMPLanguageAwareString)localizedUppercase;
- (AMPLanguageAwareString)newlinesCollapsedToSpace;
- (AMPLanguageAwareString)trimmed;
- (BOOL)isEmpty;
- (NSArray)numbers;
- (NSAttributedString)attributedString;
- (NSString)string;
- (_NSRange)fullRange;
- (id)writingDirectionsQuantities;
- (int64_t)baseWritingDirectionForCharacterAtLocation:(int64_t)a3;
- (int64_t)length;
- (int64_t)thresholdBaseWritingDirection;
- (int64_t)utf32Length;
- (int64_t)writingDirectionOfLine:(int64_t)a3 maximumLinesShown:(int64_t)a4 withWidth:(double)a5 lineBreakMode:(int64_t)a6 cacheLayoutInfo:(BOOL)a7;
- (void)setAttributedString:(id)a3;
- (void)setFullRange:(_NSRange)a3;
- (void)setIsEmpty:(BOOL)a3;
- (void)setLength:(int64_t)a3;
- (void)setLocalizedLowercase:(id)a3;
- (void)setLocalizedUppercase:(id)a3;
- (void)setNewlinesCollapsedToSpace:(id)a3;
- (void)setThresholdBaseWritingDirection:(int64_t)a3;
- (void)setTrimmed:(id)a3;
- (void)setUtf32Length:(int64_t)a3;
@end

@implementation AMPLanguageAwareString

- (NSAttributedString)attributedString
{
  v2 = self;
  id v3 = sub_1E3E3DED4();

  return (NSAttributedString *)v3;
}

- (void)setAttributedString:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString) = (Class)a3;
  id v3 = a3;
}

- (NSString)string
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E3E7CCF0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (AMPLanguageAwareString)localizedLowercase
{
  v2 = self;
  id v3 = sub_1E3E3E564();

  return (AMPLanguageAwareString *)v3;
}

- (void)setLocalizedLowercase:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase) = (Class)a3;
  id v3 = a3;
}

- (AMPLanguageAwareString)localizedUppercase
{
  v2 = self;
  id v3 = sub_1E3E3E678();

  return (AMPLanguageAwareString *)v3;
}

- (void)setLocalizedUppercase:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase) = (Class)a3;
  id v3 = a3;
}

- (AMPLanguageAwareString)newlinesCollapsedToSpace
{
  v2 = self;
  id v3 = sub_1E3E3E878();

  return (AMPLanguageAwareString *)v3;
}

- (void)setNewlinesCollapsedToSpace:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace) = (Class)a3;
  id v3 = a3;
}

- (AMPLanguageAwareString)trimmed
{
  v2 = self;
  id v3 = sub_1E3E3EA98();

  return (AMPLanguageAwareString *)v3;
}

- (void)setTrimmed:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed) = (Class)a3;
  id v3 = a3;
}

- (NSArray)numbers
{
  type metadata accessor for _NSRange(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E3E7D050();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (_NSRange)fullRange
{
  v2 = self;
  uint64_t v3 = sub_1E3E3EDAC();
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setFullRange:(_NSRange)a3
{
  uint64_t v3 = (_NSRange *)((char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange);
  *uint64_t v3 = a3;
  LOBYTE(v3[1].location) = 0;
}

- (BOOL)isEmpty
{
  return sub_1E3E3EEBC();
}

- (void)setIsEmpty:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty) = a3;
}

- (int64_t)length
{
  v2 = self;
  int64_t v3 = sub_1E3E3EFC0();

  return v3;
}

- (void)setLength:(int64_t)a3
{
  int64_t v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count;
  *(void *)int64_t v3 = a3;
  v3[8] = 0;
}

- (int64_t)utf32Length
{
  v2 = self;
  int64_t v3 = sub_1E3E3F108();

  return v3;
}

- (void)setUtf32Length:(int64_t)a3
{
  int64_t v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count;
  *(void *)int64_t v3 = a3;
  v3[8] = 0;
}

+ (BOOL)alwaysGenerateAttributedString
{
  return byte_1EAE29AD0;
}

+ (void)setAlwaysGenerateAttributedString:(BOOL)a3
{
  byte_1EAE29AD0 = a3;
}

+ (AMPLanguageAwareStringPreprocessor)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (AMPLanguageAwareStringPreprocessor *)v2;
}

+ (void)setDelegate:(id)a3
{
  qword_1EBFDF088 = (uint64_t)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

+ (AMPLanguageAwareString)AMPLanguageAwareStringEmpty
{
  if (qword_1EAE24588 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EAE29AE0;

  return (AMPLanguageAwareString *)v2;
}

- (AMPLanguageAwareString)initWithAttributedString:(id)a3 baseParagraphStyle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  NSUInteger v7 = (AMPLanguageAwareString *)sub_1E3E43400(v5, a4);

  return v7;
}

- (AMPLanguageAwareString)initWithString:(id)a3 attributes:(id)a4 baseParagraphStyle:(id)a5
{
  uint64_t v7 = sub_1E3E7CD30();
  uint64_t v9 = v8;
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1E3D20770();
    a4 = (id)sub_1E3E7CB60();
  }
  id v10 = a5;
  v11 = (AMPLanguageAwareString *)sub_1E3E43780(v7, v9, (uint64_t)a4, a5);

  return v11;
}

- (AMPLanguageAwareString)initWithString:(id)a3 baseParagraphStyle:(id)a4 generateAttributedString:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    uint64_t v7 = sub_1E3E7CD30();
    uint64_t v9 = v8;
    id v10 = *(uint64_t (**)(uint64_t, uint64_t, id, BOOL))(swift_getObjectType() + 464);
    id v11 = a4;
    v12 = (AMPLanguageAwareString *)v10(v7, v9, a4, v5);
  }
  else
  {
    swift_getObjectType();
    v12 = 0;
  }
  swift_deallocPartialClassInstance();
  return v12;
}

- (AMPLanguageAwareString)initWithLanguageAwareString:(id)a3 attributes:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1E3D20770();
    uint64_t v4 = sub_1E3E7CB60();
  }
  id v6 = a3;
  uint64_t v7 = (AMPLanguageAwareString *)sub_1E3E43E4C((uint64_t)v6, v4);

  return v7;
}

- (int64_t)baseWritingDirectionForCharacterAtLocation:(int64_t)a3
{
  uint64_t v4 = self;
  id v5 = sub_1E3E3DED4();
  id v6 = NSAttributedString.baseWritingDirection(forCharacterAt:)(a3);
  char v8 = v7;

  if (v8) {
    return -1;
  }
  else {
    return (int64_t)v6;
  }
}

- (int64_t)thresholdBaseWritingDirection
{
  return sub_1E3E40544();
}

- (void)setThresholdBaseWritingDirection:(int64_t)a3
{
  int64_t v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection;
  *(void *)int64_t v3 = a3;
  v3[8] = 0;
}

- (int64_t)writingDirectionOfLine:(int64_t)a3 maximumLinesShown:(int64_t)a4 withWidth:(double)a5 lineBreakMode:(int64_t)a6 cacheLayoutInfo:(BOOL)a7
{
  v12 = self;
  sub_1E3E40640(a3, (id)a4, (id)a6, a7, a5);
  int64_t v14 = v13;

  return v14;
}

- (id)writingDirectionsQuantities
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections));
}

- (AMPLanguageAwareString)init
{
  _NSRange result = (AMPLanguageAwareString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace));

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end