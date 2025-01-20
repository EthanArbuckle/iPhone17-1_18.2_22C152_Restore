@interface AMPLanguageAwareString
+ (AMPLanguageAwareString)AMPLanguageAwareStringEmpty;
+ (AMPLanguageAwareStringPreprocessor)delegate;
+ (BOOL)alwaysGenerateAttributedString;
+ (BOOL)keepStatisticsOnLanguageComponents;
+ (void)setAlwaysGenerateAttributedString:(BOOL)a3;
+ (void)setDelegate:(id)a3;
+ (void)setKeepStatisticsOnLanguageComponents:(BOOL)a3;
- (AMPLanguageAwareString)init;
- (AMPLanguageAwareString)initWithAttributedString:(id)a3 baseParagraphStyle:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5;
- (AMPLanguageAwareString)initWithLanguageAwareString:(id)a3 attributes:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5;
- (AMPLanguageAwareString)initWithString:(id)a3 attributes:(id)a4 baseParagraphStyle:(id)a5 keepStatisticsOnLanguageComponents:(BOOL)a6;
- (AMPLanguageAwareString)initWithString:(id)a3 baseParagraphStyle:(id)a4 generateAttributedString:(BOOL)a5 keepStatisticsOnLanguageComponents:(BOOL)a6;
- (AMPLanguageAwareString)localizedLowercase;
- (AMPLanguageAwareString)localizedUppercase;
- (AMPLanguageAwareString)newlinesCollapsedToSpace;
- (AMPLanguageAwareString)trimmed;
- (BOOL)isEmpty;
- (NSArray)numbers;
- (NSArray)paragraphs;
- (NSArray)words;
- (NSAttributedString)attributedString;
- (NSString)string;
- (_NSRange)fullRange;
- (id)writingDirectionsQuantities;
- (int64_t)baseWritingDirectionForCharacterAtLocation:(int64_t)a3;
- (int64_t)length;
- (int64_t)numberOfCharacters;
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
- (void)setNumberOfCharacters:(int64_t)a3;
- (void)setThresholdBaseWritingDirection:(int64_t)a3;
- (void)setTrimmed:(id)a3;
- (void)setUtf32Length:(int64_t)a3;
@end

@implementation AMPLanguageAwareString

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSAttributedString)attributedString
{
  v2 = self;
  id v3 = LanguageAwareString.attributedString.getter();

  return (NSAttributedString *)v3;
}

- (void)setAttributedString:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_129_0();
  sub_1E342DE44(v6);
}

- (NSString)string
{
  LanguageAwareString.string.getter();
  v2 = (void *)sub_1E387C8E8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (AMPLanguageAwareString)localizedLowercase
{
  v2 = self;
  id v3 = LanguageAwareString.localizedLowercase.getter();

  return (AMPLanguageAwareString *)v3;
}

- (void)setLocalizedLowercase:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_129_0();
  sub_1E342E028(v6);
}

- (AMPLanguageAwareString)localizedUppercase
{
  v2 = self;
  id v3 = LanguageAwareString.localizedUppercase.getter();

  return (AMPLanguageAwareString *)v3;
}

- (void)setLocalizedUppercase:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_129_0();
  sub_1E342E2E4(v6);
}

- (AMPLanguageAwareString)newlinesCollapsedToSpace
{
  v2 = self;
  id v3 = LanguageAwareString.newlinesCollapsedToSpace.getter();

  return (AMPLanguageAwareString *)v3;
}

- (void)setNewlinesCollapsedToSpace:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_129_0();
  sub_1E342E53C(v6);
}

- (AMPLanguageAwareString)trimmed
{
  v2 = self;
  id v3 = LanguageAwareString.trimmed.getter();

  return (AMPLanguageAwareString *)v3;
}

- (void)setTrimmed:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_129_0();
  sub_1E342E81C(v6);
}

- (NSArray)numbers
{
  LanguageAwareString.numbers.getter();
  type metadata accessor for _NSRange();
  v2 = (void *)sub_1E387CC88();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSArray)paragraphs
{
  return (NSArray *)sub_1E342E93C((uint64_t)self, (uint64_t)a2, (void (*)(void))LanguageAwareString.paragraphs.getter);
}

- (NSArray)words
{
  return (NSArray *)sub_1E342E93C((uint64_t)self, (uint64_t)a2, (void (*)(void))LanguageAwareString.words.getter);
}

- (_NSRange)fullRange
{
  v2 = self;
  uint64_t v3 = LanguageAwareString.fullRange.getter();
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setFullRange:(_NSRange)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_17_91((uint64_t)self, a3.length, a3.location);
  sub_1E342EAD0(v3, v4);
}

- (BOOL)isEmpty
{
  return LanguageAwareString.isEmpty.getter();
}

- (void)setIsEmpty:(BOOL)a3
{
}

- (int64_t)length
{
  v2 = self;
  int64_t v3 = LanguageAwareString.utf16Count.getter();

  return v3;
}

- (void)setLength:(int64_t)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_17_91((uint64_t)self, (uint64_t)a2, a3);
  sub_1E342ED48(v3);
}

- (int64_t)utf32Length
{
  v2 = self;
  int64_t v3 = LanguageAwareString.utf32Count.getter();

  return v3;
}

- (void)setUtf32Length:(int64_t)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_17_91((uint64_t)self, (uint64_t)a2, a3);
  sub_1E342EEE0(v3);
}

- (int64_t)numberOfCharacters
{
  v2 = self;
  int64_t v3 = LanguageAwareString.characterCount.getter();

  return v3;
}

- (void)setNumberOfCharacters:(int64_t)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_17_91((uint64_t)self, (uint64_t)a2, a3);
  sub_1E342F068(v3);
}

+ (BOOL)alwaysGenerateAttributedString
{
  return static LanguageAwareString.alwaysGenerateAttributedString.getter() & 1;
}

+ (void)setAlwaysGenerateAttributedString:(BOOL)a3
{
}

+ (BOOL)keepStatisticsOnLanguageComponents
{
  return static LanguageAwareString.keepStatisticsOnLanguageComponents.getter() & 1;
}

+ (void)setKeepStatisticsOnLanguageComponents:(BOOL)a3
{
}

+ (AMPLanguageAwareStringPreprocessor)delegate
{
  v2 = (void *)static LanguageAwareString.delegate.getter();
  return (AMPLanguageAwareStringPreprocessor *)v2;
}

+ (void)setDelegate:(id)a3
{
  uint64_t v3 = swift_unknownObjectRetain();
  static LanguageAwareString.delegate.setter(v3);
}

+ (AMPLanguageAwareString)AMPLanguageAwareStringEmpty
{
  id v2 = static LanguageAwareString.empty.getter();
  return (AMPLanguageAwareString *)v2;
}

- (AMPLanguageAwareString)initWithAttributedString:(id)a3 baseParagraphStyle:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  return (AMPLanguageAwareString *)LanguageAwareString.init(_:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(v7, a4, a5);
}

- (AMPLanguageAwareString)initWithString:(id)a3 attributes:(id)a4 baseParagraphStyle:(id)a5 keepStatisticsOnLanguageComponents:(BOOL)a6
{
  sub_1E387C928();
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1E2C79920((unint64_t *)&unk_1EBF8E730);
    a4 = (id)sub_1E387C678();
  }
  id v9 = a5;
  uint64_t v10 = OUTLINED_FUNCTION_41_2();
  return (AMPLanguageAwareString *)LanguageAwareString.init(_:attributes:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(v10, v11, (uint64_t)a4, a5, a6);
}

- (AMPLanguageAwareString)initWithString:(id)a3 baseParagraphStyle:(id)a4 generateAttributedString:(BOOL)a5 keepStatisticsOnLanguageComponents:(BOOL)a6
{
  if (a3) {
    sub_1E387C928();
  }
  id v8 = a4;
  uint64_t v9 = OUTLINED_FUNCTION_41_2();
  return (AMPLanguageAwareString *)LanguageAwareString.init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)(v9, v10, a4, a5);
}

- (AMPLanguageAwareString)initWithLanguageAwareString:(id)a3 attributes:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5
{
  uint64_t v6 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1E2C79920((unint64_t *)&unk_1EBF8E730);
    OUTLINED_FUNCTION_41_2();
    uint64_t v6 = sub_1E387C678();
  }
  return (AMPLanguageAwareString *)LanguageAwareString.init(_:attributes:keepStatisticsOnLanguageComponents:)((char *)a3, v6, a5);
}

- (int64_t)baseWritingDirectionForCharacterAtLocation:(int64_t)a3
{
  uint64_t v4 = self;
  OUTLINED_FUNCTION_11_4();
  int64_t v5 = LanguageAwareString.baseWritingDirection(forCharacterAt:)();

  return v5;
}

- (int64_t)thresholdBaseWritingDirection
{
  return LanguageAwareString.thresholdBaseWritingDirection.getter();
}

- (void)setThresholdBaseWritingDirection:(int64_t)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_17_91((uint64_t)self, (uint64_t)a2, a3);
  sub_1E3430D60(v3);
}

- (int64_t)writingDirectionOfLine:(int64_t)a3 maximumLinesShown:(int64_t)a4 withWidth:(double)a5 lineBreakMode:(int64_t)a6 cacheLayoutInfo:(BOOL)a7
{
  v12 = self;
  LanguageAwareString.writingDirectionOfLine(_:maximumLinesShown:withWidth:lineBreakMode:cacheLayoutInfo:)(a3, (id)a4, (id)a6, a7, a5);
  int64_t v14 = v13;

  return v14;
}

- (id)writingDirectionsQuantities
{
  id v2 = LanguageAwareString.writingDirectionsQuantities()();
  return v2;
}

- (AMPLanguageAwareString)init
{
}

@end