@interface SCRCMathExpression
+ (Class)_classForExpressionType:(id)a3;
+ (id)mathExpressionWithDictionary:(id)a3;
+ (void)setPathToSegmentOrderingPlist:(id)a3;
- (BOOL)beginsWithSpace;
- (BOOL)canBeUsedWithBase;
- (BOOL)canBeUsedWithRange;
- (BOOL)canBeWrappedInLatexMathIndicators;
- (BOOL)canFormWordStartingWithExpression:(id)a3;
- (BOOL)endsWithSpace;
- (BOOL)hasSimpleArrayOfChildren;
- (BOOL)isBaseSubSuperscript;
- (BOOL)isEllipsis;
- (BOOL)isFenceDelimiter;
- (BOOL)isFunctionName;
- (BOOL)isInteger;
- (BOOL)isMultiRowTable;
- (BOOL)isNaturalSuperscript;
- (BOOL)isNumber;
- (BOOL)isNumberOverride;
- (BOOL)isOperationSymbol;
- (BOOL)isRangeSubSuperscript;
- (BOOL)isSimpleNumericalFraction;
- (BOOL)isTermSeparator;
- (BOOL)isUnlinedFraction;
- (BOOL)isWordOrAbbreviation;
- (NSArray)children;
- (NSArray)siblings;
- (NSArray)subExpressions;
- (NSString)latexFormatStringAsOver;
- (NSString)latexFormatStringAsUnder;
- (SCRCMathExpression)initWithDictionary:(id)a3;
- (SCRCMathExpression)parent;
- (id)_scrcBundle;
- (id)arrayWithoutNilsFromFirstChild:(id)a3 secondChild:(id)a4 thirdChild:(id)a5;
- (id)dollarCodeDescription;
- (id)dollarCodeDescriptionAsBinomialCoefficientWithTreePosition:(id)a3 numberOfOuterRadicals:(unint64_t)a4;
- (id)dollarCodeDescriptionAsMixedNumberFractionWithTreePosition:(id)a3;
- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4;
- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4 openOperator:(id)a5 openOperatorTreePosition:(id)a6 closeOperator:(id)a7 closeOperatorTreePosition:(id)a8;
- (id)fenceDelimiters;
- (id)latexDescription;
- (id)latexDescriptionForChildrenJoinedByString:(id)a3;
- (id)latexDescriptionInMathMode:(BOOL)a3;
- (id)latexIdentifierForFenceOperator:(id)a3 isClosingOperator:(BOOL)a4;
- (id)latexIdentifierForIdentifier:(id)a3;
- (id)latexMathModeDescription;
- (id)localizedAttributedStringForKey:(id)a3;
- (id)localizedAttributedStringForKey:(id)a3 treePosition:(id)a4;
- (id)localizedSegmentOrderingForKey:(id)a3;
- (id)localizedStringForKey:(id)a3;
- (id)localizedStringForNumber:(id)a3;
- (id)mathMLString;
- (id)speakableDescription;
- (id)speakableDescriptionAsBinomialCoefficientWithSpeakingStyle:(int64_t)a3;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (id)speakableSegments:(id)a3 withLocalizablePrefix:(id)a4 localizableSuffix:(id)a5;
- (id)speakableSegments:(id)a3 withPrefix:(id)a4 suffix:(id)a5;
- (id)speakableSegmentsAsBinomialCoefficientWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5;
- (id)speakableSegmentsUpToDepth:(unint64_t)a3;
- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4;
- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5;
- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5 localizablePrefix:(id)a6 localizableSuffix:(id)a7;
- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5 prefix:(id)a6 suffix:(id)a7;
- (id)speakableSummary;
- (int64_t)integerValue;
- (unint64_t)fractionLevel;
- (unint64_t)maximumDepth;
- (unint64_t)maximumFractionLevelOfSubExpressions;
- (unint64_t)numberOfTables;
- (void)_applyTreePositionOfOriginalSegment:(id)a3 toPrefixedOrSuffixedSegment:(id)a4;
- (void)setParent:(id)a3;
@end

@implementation SCRCMathExpression

+ (id)mathExpressionWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"AXMType"];
  v6 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_classForExpressionType:", v5)), "initWithDictionary:", v4);

  return v6;
}

- (SCRCMathExpression)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCRCMathExpression;
  v5 = [(SCRCMathExpression *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AXMIsNumberOverride"];
    v7 = v6;
    if (v6) {
      LOBYTE(v6) = [v6 BOOLValue];
    }
    v5->_isNumberOverride = (char)v6;
  }
  return v5;
}

- (NSArray)subExpressions
{
  return 0;
}

- (id)speakableDescription
{
  return [(SCRCMathExpression *)self speakableDescriptionWithSpeakingStyle:0];
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3
{
  return [(SCRCMathExpression *)self speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:1];
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  return 0;
}

- (id)speakableDescriptionAsBinomialCoefficientWithSpeakingStyle:(int64_t)a3
{
  return 0;
}

- (id)dollarCodeDescription
{
  v3 = [MEMORY[0x263F088C8] indexPathWithIndex:0];
  id v4 = [(SCRCMathExpression *)self dollarCodeDescriptionWithNumberOfOuterRadicals:0 treePosition:v3];

  return v4;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  return 0;
}

- (id)dollarCodeDescriptionAsMixedNumberFractionWithTreePosition:(id)a3
{
  return 0;
}

- (id)dollarCodeDescriptionAsBinomialCoefficientWithTreePosition:(id)a3 numberOfOuterRadicals:(unint64_t)a4
{
  return 0;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4 openOperator:(id)a5 openOperatorTreePosition:(id)a6 closeOperator:(id)a7 closeOperatorTreePosition:(id)a8
{
  return 0;
}

- (unint64_t)maximumDepth
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t result = self->_cachedMaximumDepth;
  if (!result)
  {
    id v4 = [(SCRCMathExpression *)self subExpressions];
    if ([v4 count])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        unint64_t v8 = 0;
        uint64_t v9 = *(void *)v14;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v5);
            }
            unint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "maximumDepth", (void)v13);
            if (v11 > v8) {
              unint64_t v8 = v11;
            }
            ++v10;
          }
          while (v7 != v10);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
        unint64_t v12 = v8 + 1;
      }
      else
      {
        unint64_t v12 = 1;
      }
    }
    else
    {
      unint64_t v12 = 1;
    }
    self->_cachedMaximumDepth = v12;

    return self->_cachedMaximumDepth;
  }
  return result;
}

- (id)speakableSegmentsUpToDepth:(unint64_t)a3
{
  return [(SCRCMathExpression *)self speakableSegmentsWithSpeakingStyle:0 upToDepth:a3];
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4
{
  uint64_t v7 = [MEMORY[0x263F088C8] indexPathWithIndex:0];
  unint64_t v8 = [(SCRCMathExpression *)self speakableSegmentsWithSpeakingStyle:a3 upToDepth:a4 treePosition:v7];

  return v8;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  v13[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  unint64_t v8 = [(SCRCMathExpression *)self speakableDescriptionWithSpeakingStyle:a3];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)[v8 mutableCopy];
    objc_msgSend(v10, "addAttribute:value:range:", @"kSCRCMathStringAttributeTreePosition", v7, 0, objc_msgSend(v10, "length"));
    v13[0] = v10;
    unint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (id)speakableSegmentsAsBinomialCoefficientWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  return 0;
}

- (id)mathMLString
{
  return 0;
}

- (id)speakableSummary
{
  unint64_t v3 = [(SCRCMathExpression *)self numberOfTables];
  id v4 = (void *)v3;
  if (v3)
  {
    if (v3 == 1) {
      id v5 = @"table.summary.single.formatter";
    }
    else {
      id v5 = @"table.summary.multiple.formatter";
    }
    uint64_t v6 = [(SCRCMathExpression *)self localizedStringForKey:v5];
    id v4 = objc_msgSend(NSString, "localizedStringWithFormat:", v6, v4);
  }
  return v4;
}

- (id)latexDescription
{
  return [(SCRCMathExpression *)self latexDescriptionInMathMode:0];
}

- (id)latexDescriptionInMathMode:(BOOL)a3
{
  id v4 = [(SCRCMathExpression *)self latexMathModeDescription];
  id v5 = v4;
  if (!a3)
  {
    uint64_t v6 = [v4 stringWithMathIndicators];

    id v5 = (void *)v6;
  }
  return v5;
}

- (id)latexMathModeDescription
{
  return 0;
}

- (NSArray)children
{
  return 0;
}

- (BOOL)isRangeSubSuperscript
{
  return 0;
}

- (BOOL)canBeUsedWithRange
{
  return 0;
}

- (BOOL)isBaseSubSuperscript
{
  return 0;
}

- (BOOL)canBeUsedWithBase
{
  return 0;
}

- (BOOL)isNumber
{
  return 0;
}

- (BOOL)isInteger
{
  return 0;
}

- (int64_t)integerValue
{
  return 0;
}

- (BOOL)isNaturalSuperscript
{
  return 0;
}

- (BOOL)hasSimpleArrayOfChildren
{
  return 0;
}

- (BOOL)isEllipsis
{
  return 0;
}

- (BOOL)isTermSeparator
{
  return 0;
}

- (BOOL)isOperationSymbol
{
  return 0;
}

- (BOOL)isFenceDelimiter
{
  return 0;
}

- (BOOL)isFunctionName
{
  return 0;
}

- (BOOL)isWordOrAbbreviation
{
  return 0;
}

- (unint64_t)fractionLevel
{
  return 0;
}

- (BOOL)isSimpleNumericalFraction
{
  return 0;
}

- (BOOL)beginsWithSpace
{
  return 0;
}

- (BOOL)endsWithSpace
{
  return 0;
}

- (BOOL)isMultiRowTable
{
  return 0;
}

- (BOOL)isUnlinedFraction
{
  return 0;
}

- (BOOL)canFormWordStartingWithExpression:(id)a3
{
  return 0;
}

- (unint64_t)numberOfTables
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SCRCMathExpression *)self subExpressions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) numberOfTables];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (NSString)latexFormatStringAsOver
{
  return 0;
}

- (NSString)latexFormatStringAsUnder
{
  return 0;
}

- (id)_scrcBundle
{
  if (_scrcBundle_onceToken != -1) {
    dispatch_once(&_scrcBundle_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_scrcBundle_ScreenReaderCoreBundle;
  return v2;
}

uint64_t __33__SCRCMathExpression__scrcBundle__block_invoke()
{
  _scrcBundle_ScreenReaderCoreBundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.ScreenReaderCore"];
  return MEMORY[0x270F9A758]();
}

- (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SCRCMathExpression *)self _scrcBundle];
  uint64_t v6 = [v5 localizedStringForKey:v4 value:&stru_26CC25790 table:@"MathExpressionStrings"];

  return v6;
}

- (id)localizedAttributedStringForKey:(id)a3
{
  return [(SCRCMathExpression *)self localizedAttributedStringForKey:a3 treePosition:0];
}

- (id)localizedAttributedStringForKey:(id)a3 treePosition:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = v7;
  if (v7)
  {
    uint64_t v14 = @"kSCRCMathStringAttributeTreePosition";
    v15[0] = v7;
    long long v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    long long v9 = 0;
  }
  id v10 = objc_alloc(MEMORY[0x263F086A0]);
  long long v11 = [(SCRCMathExpression *)self localizedStringForKey:v6];
  long long v12 = (void *)[v10 initWithString:v11 attributes:v9];

  return v12;
}

- (id)localizedStringForNumber:(id)a3
{
  uint64_t v3 = localizedStringForNumber__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&localizedStringForNumber__onceToken, &__block_literal_global_20);
  }
  unint64_t v5 = [(id)localizedStringForNumber__NumberFormatter stringFromNumber:v4];

  return v5;
}

uint64_t __47__SCRCMathExpression_localizedStringForNumber___block_invoke()
{
  localizedStringForNumber__NumberFormatter = (uint64_t)objc_alloc_init(MEMORY[0x263F08A30]);
  return MEMORY[0x270F9A758]();
}

- (id)localizedSegmentOrderingForKey:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SCRCMathExpression_localizedSegmentOrderingForKey___block_invoke;
  block[3] = &unk_2643D7120;
  block[4] = self;
  if (localizedSegmentOrderingForKey__onceToken != -1) {
    dispatch_once(&localizedSegmentOrderingForKey__onceToken, block);
  }
  if (_PathToSegmentOrderingPlist)
  {
    objc_msgSend(NSDictionary, "dictionaryWithContentsOfFile:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = (id)localizedSegmentOrderingForKey__SegmentOrderings;
  }
  id v6 = v5;
  id v7 = [v5 objectForKey:v4];

  return v7;
}

void __53__SCRCMathExpression_localizedSegmentOrderingForKey___block_invoke(uint64_t a1)
{
  v1 = NSDictionary;
  id v5 = [*(id *)(a1 + 32) _scrcBundle];
  v2 = [v5 pathForResource:@"MathExpressionSegmentOrdering" ofType:@"plist"];
  uint64_t v3 = [v1 dictionaryWithContentsOfFile:v2];
  id v4 = (void *)localizedSegmentOrderingForKey__SegmentOrderings;
  localizedSegmentOrderingForKey__SegmentOrderings = v3;
}

- (NSArray)siblings
{
  v2 = [(SCRCMathExpression *)self parent];
  uint64_t v3 = [v2 children];

  return (NSArray *)v3;
}

- (id)arrayWithoutNilsFromFirstChild:(id)a3 secondChild:(id)a4 thirdChild:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  long long v11 = v10;
  if (v7) {
    [v10 addObject:v7];
  }
  if (v8) {
    [v11 addObject:v8];
  }
  if (v9) {
    [v11 addObject:v9];
  }

  return v11;
}

- (void)_applyTreePositionOfOriginalSegment:(id)a3 toPrefixedOrSuffixedSegment:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if ([v7 length])
  {
    id v6 = [v7 attribute:@"kSCRCMathStringAttributeTreePosition" atIndex:0 effectiveRange:0];
    if (v6) {
      objc_msgSend(v5, "addAttribute:value:range:", @"kSCRCMathStringAttributeTreePosition", v6, 0, objc_msgSend(v5, "length"));
    }
  }
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5 localizablePrefix:(id)a6 localizableSuffix:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  uint64_t v14 = [(SCRCMathExpression *)self localizedAttributedStringForKey:a6];
  long long v15 = [(SCRCMathExpression *)self localizedAttributedStringForKey:v12];

  long long v16 = [(SCRCMathExpression *)self speakableSegmentsWithSpeakingStyle:a3 upToDepth:a4 treePosition:v13 prefix:v14 suffix:v15];

  return v16;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5 prefix:(id)a6 suffix:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  uint64_t v14 = [(SCRCMathExpression *)self speakableSegmentsWithSpeakingStyle:a3 upToDepth:a4 treePosition:a5];
  long long v15 = [(SCRCMathExpression *)self speakableSegments:v14 withPrefix:v13 suffix:v12];

  return v15;
}

- (id)speakableSegments:(id)a3 withLocalizablePrefix:(id)a4 localizableSuffix:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SCRCMathExpression *)self localizedAttributedStringForKey:a4];
  long long v11 = [(SCRCMathExpression *)self localizedAttributedStringForKey:v8];

  id v12 = [(SCRCMathExpression *)self speakableSegments:v9 withPrefix:v10 suffix:v11];

  return v12;
}

- (id)speakableSegments:(id)a3 withPrefix:(id)a4 suffix:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)[a3 mutableCopy];
  if ([v10 count])
  {
    if ([v8 length])
    {
      long long v11 = [v10 objectAtIndex:0];
      id v12 = [MEMORY[0x263F089B8] scrcStringWithFormat:@"%@%@", v8, v11];
      [(SCRCMathExpression *)self _applyTreePositionOfOriginalSegment:v11 toPrefixedOrSuffixedSegment:v12];
      [v10 replaceObjectAtIndex:0 withObject:v12];
    }
    if ([v9 length])
    {
      id v13 = [v10 lastObject];
      uint64_t v14 = [MEMORY[0x263F089B8] scrcStringWithFormat:@"%@%@", v13, v9];
      [(SCRCMathExpression *)self _applyTreePositionOfOriginalSegment:v13 toPrefixedOrSuffixedSegment:v14];
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", objc_msgSend(v10, "count") - 1, v14);
    }
  }

  return v10;
}

- (unint64_t)maximumFractionLevelOfSubExpressions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SCRCMathExpression *)self subExpressions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 fractionLevel] > v5) {
          unint64_t v5 = [v8 fractionLevel];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)fenceDelimiters
{
  if (fenceDelimiters_onceToken != -1) {
    dispatch_once(&fenceDelimiters_onceToken, &__block_literal_global_34);
  }
  v2 = (void *)fenceDelimiters_Delimiters;
  return v2;
}

uint64_t __37__SCRCMathExpression_fenceDelimiters__block_invoke()
{
  fenceDelimiters_Delimiters = [MEMORY[0x263EFFA08] setWithArray:&unk_26CC2D4A0];
  return MEMORY[0x270F9A758]();
}

- (id)latexIdentifierForIdentifier:(id)a3
{
  id v3 = a3;
  if (latexIdentifierForIdentifier__onceToken != -1) {
    dispatch_once(&latexIdentifierForIdentifier__onceToken, &__block_literal_global_58);
  }
  id v4 = [(id)latexIdentifierForIdentifier___IdentifierLookupTable objectForKey:v3];
  if (!v4) {
    id v4 = v3;
  }

  return v4;
}

void __51__SCRCMathExpression_latexIdentifierForIdentifier___block_invoke()
{
  v0 = (void *)latexIdentifierForIdentifier___IdentifierLookupTable;
  latexIdentifierForIdentifier___IdentifierLookupTable = (uint64_t)&unk_26CC2D4D0;
}

- (id)latexIdentifierForFenceOperator:(id)a3 isClosingOperator:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SCRCMathExpression *)self fenceDelimiters];
  if ([v7 containsObject:v6])
  {
    id v8 = NSString;
    uint64_t v9 = [(SCRCMathExpression *)self latexIdentifierForIdentifier:v6];
    long long v10 = (void *)v9;
    if (v4) {
      [v8 stringWithFormat:@"\\right%@", v9];
    }
    else {
    long long v11 = [v8 stringWithFormat:@"\\left%@", v9];
    }
  }
  else
  {
    long long v11 = [(SCRCMathExpression *)self latexIdentifierForIdentifier:v6];
  }

  return v11;
}

- (id)latexDescriptionForChildrenJoinedByString:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(SCRCMathExpression *)self children];
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "latexDescriptionInMathMode:", 0, (void)v15);
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  long long v13 = [v6 componentsJoinedByString:v4];

  return v13;
}

- (BOOL)canBeWrappedInLatexMathIndicators
{
  return 1;
}

+ (Class)_classForExpressionType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"Row"] & 1) != 0
    || ([v3 isEqualToString:@"Identifier"] & 1) != 0
    || ([v3 isEqualToString:@"Operator"] & 1) != 0
    || ([v3 isEqualToString:@"SubSuperScript"] & 1) != 0
    || ([v3 isEqualToString:@"Space"] & 1) != 0
    || ([v3 isEqualToString:@"Text"] & 1) != 0
    || ([v3 isEqualToString:@"Fraction"] & 1) != 0
    || ([v3 isEqualToString:@"UnderOver"] & 1) != 0
    || ([v3 isEqualToString:@"RootOperation"] & 1) != 0
    || ([v3 isEqualToString:@"TableCell"] & 1) != 0
    || ([v3 isEqualToString:@"TableRow"] & 1) != 0
    || ([v3 isEqualToString:@"Table"] & 1) != 0
    || ([v3 isEqualToString:@"Fenced"] & 1) != 0
    || ([v3 isEqualToString:@"LongDivision"] & 1) != 0
    || ([v3 isEqualToString:@"Number"] & 1) != 0
    || [v3 isEqualToString:@"Multiscript"])
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }
  unint64_t v5 = v4;

  return v5;
}

- (SCRCMathExpression)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (SCRCMathExpression *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (BOOL)isNumberOverride
{
  return self->_isNumberOverride;
}

- (void).cxx_destruct
{
}

+ (void)setPathToSegmentOrderingPlist:(id)a3
{
  id v4 = a3;
  if ((id)_PathToSegmentOrderingPlist != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&_PathToSegmentOrderingPlist, a3);
    id v4 = v5;
  }
}

@end