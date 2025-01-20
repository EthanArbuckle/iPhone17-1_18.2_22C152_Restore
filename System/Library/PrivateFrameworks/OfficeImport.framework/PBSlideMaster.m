@interface PBSlideMaster
+ (id)createMasterStyleMap:(id)a3 state:(id)a4;
+ (id)textBodyForPlaceholderType:(int)a3 slideLayout:(id)a4;
+ (int)textTypeFor:(int)a3 placeholderType:(int)a4;
+ (void)flattenBaseMasterStyleType:(int)a3 masterStyleMap:(id)a4;
+ (void)flattenMasterStyleType:(int)a3 baseType:(int)a4 masterStyleMap:(id)a5;
+ (void)flattenPlaceholderTextStylesIntoLayout:(id)a3 layoutType:(int)a4 masterStyleMap:(id)a5;
+ (void)flattenTextStyle:(id)a3 intoTextBox:(id)a4;
+ (void)padMissingLevels:(id)a3;
+ (void)readMasterDrawables:(id)a3 slideHolder:(id)a4 state:(id)a5;
+ (void)readSlideMasterColorScheme:(id)a3 slideHolder:(id)a4 state:(id)a5;
+ (void)readSlideMasterName:(id)a3 slideHolder:(id)a4 state:(id)a5;
+ (void)readSlideMasterTextStyles:(id)a3 slideHolder:(id)a4 state:(id)a5;
+ (void)setCannedOtherTextListStyle:(id)a3;
+ (void)setFont:(id)a3 fromCharacterProperties:(id)a4;
+ (void)setSlideMasterTextStyles:(id)a3 state:(id)a4;
@end

@implementation PBSlideMaster

+ (id)createMasterStyleMap:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = [v5 indexOfFirstChildOfType:4003 afterIndex:-1];
  while (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = [v5 childAt:v7];
    v9 = v8;
    if (v8)
    {
      v10 = (const void *)[v8 eshObject];
      if (!v10
      {

        id v18 = +[TCMessageException exceptionWithMessage:TCUnknownProblemMessage];
        objc_exception_throw(v18);
      }
      v12 = v11;
      uint64_t Instance = EshRecord::getInstance(v11);
      if (Instance > 8) {
        uint64_t Instance = 0xFFFFFFFFLL;
      }
      else {
        *(void *)[v6 currentSourceMasterStyleInfoOfType:Instance] = v12;
      }
      if (PptTextHeaderAtom::isDerivedType(Instance))
      {
        uint64_t v14 = *(void *)[v6 currentSourceMasterStyleInfoOfType:PptTextHeaderAtom::getBaseType(Instance)];
        TCVerifyInputMeetsCondition(v14 != 0);
      }
      else
      {
        uint64_t v14 = 0;
      }
      if (Instance != -1)
      {
        v15 = objc_alloc_init(OADTextListStyle);
        +[PBMasterStyle readMasterStyleAtom:baseMasterStyleAtom:masterBulletStyleAtom:textListStyle:state:](PBMasterStyle, "readMasterStyleAtom:baseMasterStyleAtom:masterBulletStyleAtom:textListStyle:state:", *(void *)[v6 currentSourceMasterStyleInfoOfType:Instance], v14, *(void *)(objc_msgSend(v6, "currentSourceMasterStyleInfoOfType:", Instance) + 8), v15, v6);
        v16 = [NSNumber numberWithLong:Instance];
        [v19 setObject:v15 forKey:v16];
      }
    }
    uint64_t v7 = [v5 indexOfFirstChildOfType:4003 afterIndex:v7];
  }
  return v19;
}

+ (void)padMissingLevels:(id)a3
{
  id v16 = a3;
  v3 = [v16 allKeys];
  for (unsigned int i = 0; ; unsigned int i = v5 + 1)
  {
    unsigned int v5 = i;
    if ([v3 count] <= (unint64_t)i) {
      break;
    }
    id v6 = [v3 objectAtIndex:i];
    uint64_t v7 = [v16 objectForKey:v6];
    unsigned int v8 = [v6 longValue] - 1;
    if (v8 > 7) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = qword_238EF0240[v8];
    }
    v10 = [v7 propertiesForListLevel:v9];
    [v10 leftMargin];
    double v12 = v11;
    unint64_t v13 = v9 | 1;
    do
    {
      uint64_t v14 = [v7 propertiesForListLevel:v13];
      [v14 overrideWithProperties:v10];
      if (v13 >= 5)
      {
        HIDWORD(v15) = 1078067200;
        double v12 = v12 + 36.0;
        *(float *)&double v15 = v12;
        [v14 setLeftMargin:v15];
      }

      ++v13;
    }
    while (v13 != 9);
  }
}

+ (void)setFont:(id)a3 fromCharacterProperties:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  if ([v5 hasLatinFont]
    && ([v5 latinFont],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        v7))
  {
    unsigned int v8 = [v5 latinFont];
    [v17 setLatinFont:v8];
  }
  else
  {
    uint64_t v9 = [NSString stringWithUTF8String:"+[PBSlideMaster setFont:fromCharacterProperties:]"];
    v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Binary/Mapper/PBSlideMaster.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:244 isFatal:0 description:"The latin typeface is undefined in a master character style"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if ([v5 hasEastAsianFont])
  {
    float v11 = [v5 eastAsianFont];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      unint64_t v13 = [v5 eastAsianFont];
      [v17 setEastAsianFont:v13];
    }
  }
  if ([v5 hasBidiFont])
  {
    uint64_t v14 = [v5 bidiFont];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      id v16 = [v5 bidiFont];
      [v17 setComplexScriptFont:v16];
    }
  }
}

+ (void)readMasterDrawables:(id)a3 slideHolder:(id)a4 state:(id)a5
{
}

+ (void)flattenPlaceholderTextStylesIntoLayout:(id)a3 layoutType:(int)a4 masterStyleMap:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v17 = a3;
  id v8 = a5;
  uint64_t v9 = [a1 textBodyForPlaceholderType:0 slideLayout:v17];
  int v10 = [a1 textTypeFor:v6 placeholderType:0];
  float v11 = [NSNumber numberWithLong:v10];
  uint64_t v12 = [v8 objectForKey:v11];
  [a1 flattenTextStyle:v12 intoTextBox:v9];

  unint64_t v13 = [a1 textBodyForPlaceholderType:1 slideLayout:v17];
  int v14 = [a1 textTypeFor:v6 placeholderType:1];
  uint64_t v15 = [NSNumber numberWithLong:v14];
  id v16 = [v8 objectForKey:v15];
  [a1 flattenTextStyle:v16 intoTextBox:v13];
}

+ (id)textBodyForPlaceholderType:(int)a3 slideLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  uint64_t v6 = v5;
  if (v4 != -1
    && (([v5 placeholderWithType:v4 placeholderTypeIndex:0 overrideIndex:1],
         (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0)
     || ([v6 placeholderWithType:v4 placeholderTypeIndex:0 useBaseTypeMatch:1 overrideIndex:1],
         (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    id v8 = [v7 textBody];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (int)textTypeFor:(int)a3 placeholderType:(int)a4
{
  if ((a3 & 0xFFFFFFFD) != 0) {
    int v4 = 1;
  }
  else {
    int v4 = 5;
  }
  if ((a3 & 0xFFFFFFFD) != 0) {
    int v5 = 0;
  }
  else {
    int v5 = 6;
  }
  if (a4) {
    int v6 = -1;
  }
  else {
    int v6 = v5;
  }
  if (a4 == 1) {
    return v4;
  }
  else {
    return v6;
  }
}

+ (void)flattenTextStyle:(id)a3 intoTextBox:(id)a4
{
  id v6 = a3;
  int v5 = [a4 overrideTextListStyle];
  [v5 overrideWithTextStyle:v6];
}

+ (void)readSlideMasterName:(id)a3 slideHolder:(id)a4 state:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 childOfType:4026 instance:2];
  int v10 = v9;
  if (v9)
  {
    float v11 = (char *)[v9 eshObject];
    if (v11) {
    uint64_t v12 = [NSString stringWithCsString:v11 + 48];
    }
    unint64_t v13 = [v14 theme];
    [v13 setName:v12];
  }
}

+ (void)flattenBaseMasterStyleType:(int)a3 masterStyleMap:(id)a4
{
  id v14 = a4;
  uint64_t v5 = a3;
  id v6 = [NSNumber numberWithLong:a3];
  id v7 = [v14 objectForKey:v6];

  id v8 = objc_alloc_init(OADTextListStyle);
  for (uint64_t i = 0; i != 9; ++i)
  {
    for (uint64_t j = i; j != 9; ++j)
    {
      float v11 = [(OADTextListStyle *)v8 propertiesForListLevel:j];
      uint64_t v12 = [v7 propertiesForListLevel:i];
      [v11 overrideWithProperties:v12];
    }
  }
  unint64_t v13 = [NSNumber numberWithLong:v5];
  [v14 setObject:v8 forKey:v13];
}

+ (void)flattenMasterStyleType:(int)a3 baseType:(int)a4 masterStyleMap:(id)a5
{
  id v14 = a5;
  uint64_t v7 = a3;
  id v8 = [NSNumber numberWithLong:a3];
  uint64_t v9 = [v14 objectForKey:v8];

  if (v9)
  {
    int v10 = [NSNumber numberWithLong:a4];
    float v11 = [v14 objectForKey:v10];

    uint64_t v12 = objc_alloc_init(OADTextListStyle);
    [(OADTextListStyle *)v12 overrideWithTextStyle:v11];
    [(OADTextListStyle *)v12 overrideWithTextStyle:v9];
    unint64_t v13 = [NSNumber numberWithLong:v7];
    [v14 setObject:v12 forKey:v13];
  }
}

+ (void)setCannedOtherTextListStyle:(id)a3
{
  id v10 = a3;
  v3 = +[OADSchemeColor schemeColorWithIndex:1];
  int v4 = objc_alloc_init(OADSolidFill);
  [(OADSolidFill *)v4 setColor:v3];
  for (uint64_t i = 0; i != 9; ++i)
  {
    id v6 = [v10 propertiesForListLevel:i];
    [v6 setLevel:i];
    double v7 = (double)i * 36.0;
    *(float *)&double v7 = v7;
    [v6 setLeftMargin:v7];
    LODWORD(v8) = 1108344832;
    [v6 setDefaultTab:v8];
    [v6 setIsRightToLeft:0];
    [v6 setIsLatinLineBreak:0];
    [v6 setAlign:0];
    LODWORD(v9) = 18.0;
    [v6 setSize:v9];
    [v6 setLatinFont:@"+mn-lt"];
    [v6 setEastAsianFont:@"+mn-ea"];
    [v6 setBidiFont:@"+mn-cs"];
    [v6 setFill:v4];
  }
}

+ (void)readSlideMasterTextStyles:(id)a3 slideHolder:(id)a4 state:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  +[PBProgTag readBulletStylesFromMainMaster:v8 state:v9];
  id v10 = (void *)[a1 createMasterStyleMap:v8 state:v9];
  [a1 padMissingLevels:v10];
  [v9 setMasterStyles:v10 slideMaster:v11];
}

+ (void)readSlideMasterColorScheme:(id)a3 slideHolder:(id)a4 state:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v14 theme];
  id v11 = [v10 baseStyles];
  uint64_t v12 = [v11 colorScheme];

  unint64_t v13 = [v14 colorMap];
  [a1 readColorScheme:v8 colorScheme:v12 colorMap:v13 state:v9];
}

+ (void)setSlideMasterTextStyles:(id)a3 state:(id)a4
{
  id v22 = a3;
  id v6 = objc_msgSend(a4, "masterStyles:");
  double v7 = [v22 theme];
  id v8 = [v7 baseStyles];
  id v9 = [v8 fontScheme];

  id v10 = [NSNumber numberWithUnsignedInt:0];
  id v11 = [v6 objectForKey:v10];

  [v22 setTitleTextStyle:v11];
  uint64_t v12 = [v9 majorFont];
  unint64_t v13 = [v11 propertiesForListLevel:0];
  [a1 setFont:v12 fromCharacterProperties:v13];

  id v14 = [NSNumber numberWithUnsignedInt:1];
  uint64_t v15 = [v6 objectForKey:v14];

  [v22 setBodyTextStyle:v15];
  id v16 = [v9 minorFont];
  id v17 = [v15 propertiesForListLevel:0];
  [a1 setFont:v16 fromCharacterProperties:v17];

  id v18 = [NSNumber numberWithUnsignedInt:7];
  id v19 = [v6 objectForKey:v18];

  [v22 setOtherTextStyle:v19];
  v20 = [v9 minorFont];
  v21 = [v19 propertiesForListLevel:1];
  [a1 setFont:v20 fromCharacterProperties:v21];
}

@end