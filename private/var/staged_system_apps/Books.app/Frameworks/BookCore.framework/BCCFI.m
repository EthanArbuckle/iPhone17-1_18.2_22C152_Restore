@interface BCCFI
+ (BCCFI)cfiWithString:(id)a3 error:(id *)a4;
+ (BOOL)isFragmentEpubCFIFunction:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_cfiLocationFromHeadOf:(id)a3 toTailOf:(id)a4;
+ (id)_cfiLocationFromTailOf:(id)a3 toHeadOf:(id)a4;
+ (id)deserializeCFIFromDictionary:(id)a3;
+ (id)maximumCFI;
+ (id)minimumCFI;
+ (id)pageLocationForString:(id)a3 error:(id *)a4;
+ (id)stringByEscapingString:(id)a3;
+ (id)substringByUnescapingString:(id)a3 inRange:(_NSRange)a4;
+ (id)unknownCFI;
+ (id)unknownCFIString;
+ (id)upsellCFI;
- (BCCFI)cfiWithAdjustedSpineIndex:(int64_t)a3 error:(id *)a4;
- (BCCFI)cfiWithSpineIndexAdjustedUsingAssertionBlock:(id)a3;
- (BCCFI)initWithCFI:(id)a3 error:(id *)a4;
- (BCCFI)initWithCoder:(id)a3;
- (BCCFI)initWithLocationDictionary:(id)a3;
- (BCCFI)initWithSteps:(BCCFIStep *)a3 startStepsPtr:(BCCFIStep *)a4 endStepsPtr:(BCCFIStep *)a5 stepsEnd:(BCCFIStep *)a6;
- (BOOL)_subtractStep:(const BCCFIStep *)a3 fromStep:(BCCFIStep *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPageCFI;
- (BOOL)isRange;
- (BOOL)isUnknownCFI;
- (BOOL)isUpsellCFI;
- (BOOL)parseCFI:(id)a3 error:(id *)a4;
- (BOOL)rangeIntersectsCFI:(id)a3;
- (NSString)manifestId;
- (NSString)redactedString;
- (NSString)string;
- (const)endStepAtIndex:(unint64_t)a3;
- (const)startStepAtIndex:(unint64_t)a3;
- (id)_simplifiedVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)ensureRange;
- (id)generateCFI;
- (id)headCFI;
- (id)intersectWithCFI:(id)a3;
- (id)intersectWithRangeFromHeadOf:(id)a3 toTailOf:(id)a4;
- (id)rangeToCFI:(id)a3;
- (id)rebaseCFIWithHead:(id)a3;
- (id)serializeLocationToDictionary;
- (id)tailCFI;
- (id)unionWithCFI:(id)a3;
- (int64_t)compare:(id)a3;
- (int64_t)compareCFI:(id)a3;
- (int64_t)compareCFIHead:(id)a3;
- (int64_t)compareCFITail:(id)a3;
- (int64_t)compareHeadToTail:(id)a3;
- (int64_t)compareTailToHead:(id)a3;
- (unint64_t)characterCountIfComputable;
- (unint64_t)hash;
- (unint64_t)numberOfCommonSteps;
- (unint64_t)numberOfEndSteps;
- (unint64_t)numberOfStartSteps;
- (unint64_t)pageIndexOffset;
- (unint64_t)spineIndex;
- (void)_copyInto:(id)a3;
- (void)_setPageIndexOffset:(unint64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setString:(id)a3;
@end

@implementation BCCFI

- (NSString)redactedString
{
  v2 = [(BCCFI *)self string];
  v3 = [v2 bc_redactedCFIString];

  return (NSString *)v3;
}

- (BOOL)isRange
{
  unint64_t v3 = [(BCCFI *)self numberOfCommonSteps];
  return v3 != [(BCCFI *)self numberOfStartSteps];
}

- (BOOL)isUnknownCFI
{
  return [(NSString *)self->_string isEqualToString:@"epubcfi_unknownlocation"];
}

- (BOOL)isUpsellCFI
{
  return [(NSString *)self->_string isEqualToString:@"epubcfi_upselllocation"];
}

- (BOOL)isPageCFI
{
  if ([(BCCFI *)self pageIndexOffset] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return ![(BCCFI *)self isUnknownCFI];
  }
}

+ (id)pageLocationForString:(id)a3 error:(id *)a4
{
  v4 = +[BCCFI cfiWithString:a3 error:a4];
  [v4 _setPageIndexOffset:0];

  return v4;
}

+ (BCCFI)cfiWithString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithCFI:v6 error:a4];

  return (BCCFI *)v7;
}

+ (id)deserializeCFIFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"class"];
  if ([v4 isEqualToString:@"BKEpubCFILocation"]) {
    v5 = [[BCCFI alloc] initWithLocationDictionary:v3];
  }
  else {
    v5 = 0;
  }

  return v5;
}

+ (id)unknownCFI
{
  if (qword_345BE0 != -1) {
    dispatch_once(&qword_345BE0, &stru_2C8220);
  }
  v2 = (void *)qword_345BD8;

  return v2;
}

+ (id)unknownCFIString
{
  return @"epubcfi_unknownlocation";
}

+ (id)upsellCFI
{
  if (qword_345BF0 != -1) {
    dispatch_once(&qword_345BF0, &stru_2C8240);
  }
  v2 = (void *)qword_345BE8;

  return v2;
}

+ (id)minimumCFI
{
  if (qword_345C00 != -1) {
    dispatch_once(&qword_345C00, &stru_2C8260);
  }
  v2 = (void *)qword_345BF8;

  return v2;
}

+ (id)maximumCFI
{
  if (qword_345C10 != -1) {
    dispatch_once(&qword_345C10, &stru_2C8280);
  }
  v2 = (void *)qword_345C08;

  return v2;
}

- (BCCFI)initWithCFI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCCFI;
  id v7 = [(BCCFI *)&v12 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_4;
  }
  if ([(BCCFI *)v7 parseCFI:v6 error:a4])
  {
    v8->_pageIndexOffset = 0x7FFFFFFFFFFFFFFFLL;
LABEL_4:
    v9 = v8;
    goto LABEL_8;
  }
  v10 = BCReadingStatisticsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1ECF00((uint64_t)v6, v10);
  }

  v9 = 0;
LABEL_8:

  return v9;
}

- (BCCFI)initWithLocationDictionary:(id)a3
{
  v4 = [a3 objectForKey:@"cfi"];
  v5 = [(BCCFI *)self initWithCFI:v4 error:0];

  return v5;
}

- (BCCFI)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cfi"];
  id v6 = [(BCCFI *)self initWithCFI:v5 error:0];

  if (v6 && [v4 containsValueForKey:@"pageIndexOffset"]) {
    v6->_pageIndexOffset = (unint64_t)[v4 decodeIntegerForKey:@"pageIndexOffset"];
  }

  return v6;
}

- (BCCFI)initWithSteps:(BCCFIStep *)a3 startStepsPtr:(BCCFIStep *)a4 endStepsPtr:(BCCFIStep *)a5 stepsEnd:(BCCFIStep *)a6
{
  v15.receiver = self;
  v15.super_class = (Class)BCCFI;
  v10 = [(BCCFI *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_steps = a3;
    v10->_startStepsPtr = a4;
    v10->_endStepsPtr = a5;
    v10->_stepsEnd = a6;
    v10->_pageIndexOffset = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v12 = [(BCCFI *)v10 generateCFI];
    string = v11->_string;
    v11->_string = (NSString *)v12;
  }
  return v11;
}

- (void)dealloc
{
  steps = self->_steps;
  if (steps < self->_stepsEnd)
  {
    do
      freeCFIStep((uint64_t)steps++);
    while (steps < self->_stepsEnd);
    steps = self->_steps;
  }
  if (steps) {
    free(steps);
  }
  v4.receiver = self;
  v4.super_class = (Class)BCCFI;
  [(BCCFI *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  [(BCCFI *)self _copyInto:v4];
  return v4;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(BCCFI *)self string];
  id v6 = (void *)v5;
  if (self->_pageIndexOffset == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = +[NSString stringWithFormat:@"<%@: %p '%@'%@>", v4, self, v5, &stru_2CE418];
  }
  else
  {
    v8 = +[NSString stringWithFormat:@" pageOffset:%lu", self->_pageIndexOffset];
    id v7 = +[NSString stringWithFormat:@"<%@: %p '%@'%@>", v4, self, v6, v8];
  }

  return v7;
}

- (id)debugDescription
{
  id v3 = [(BCCFI *)self generateCFI];
  id v4 = [(BCCFI *)self string];
  unsigned __int8 v5 = [v4 isEqualToString:v3];

  id v6 = &stru_2CE418;
  if ((v5 & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@" (generated: '%@')", v3];
  }
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  uint64_t v9 = [(BCCFI *)self string];
  v10 = (void *)v9;
  if (self->_pageIndexOffset == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = +[NSString stringWithFormat:@"<%@: %p '%@'%@%@>", v8, self, v9, v6, &stru_2CE418];
  }
  else
  {
    uint64_t v12 = +[NSString stringWithFormat:@" pageOffset:%lu", self->_pageIndexOffset];
    v11 = +[NSString stringWithFormat:@"<%@: %p '%@'%@%@>", v8, self, v10, v6, v12];
  }

  return v11;
}

- (unint64_t)numberOfCommonSteps
{
  return self->_startStepsPtr - self->_steps;
}

- (unint64_t)numberOfStartSteps
{
  return self->_endStepsPtr - self->_steps;
}

- (unint64_t)numberOfEndSteps
{
  return self->_stepsEnd - self->_endStepsPtr + self->_startStepsPtr - self->_steps;
}

- (id)serializeLocationToDictionary
{
  v2 = [(BCCFI *)self string];
  id v3 = +[NSDictionary dictionaryWithObjectsAndKeys:@"BCCFI", @"class", v2, @"cfi", 0];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(BCCFI *)self string];
  [v5 encodeObject:v4 forKey:@"cfi"];

  if (self->_pageIndexOffset != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 encodeInteger:[self pageIndexOffset] forKey:@"pageIndexOffset"];
  }
}

- (unint64_t)spineIndex
{
  unint64_t v3 = [(BCCFI *)self numberOfStartSteps];
  if (v3 < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v4 = v3;
  uint64_t v5 = 1;
  while (1)
  {
    id v6 = [(BCCFI *)self startStepAtIndex:v5];
    if (v6->var0 == 1) {
      break;
    }
    if (v4 == ++v5) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  unint64_t var0 = v6->var1.var0.var0;
  if (var0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return (var0 >> 1) - 1;
  }
}

- (NSString)manifestId
{
  unint64_t v3 = [(BCCFI *)self numberOfStartSteps];
  if (v3 < 2)
  {
LABEL_5:
    id v7 = 0;
  }
  else
  {
    unint64_t v4 = v3;
    uint64_t v5 = 1;
    while (1)
    {
      id v6 = [(BCCFI *)self startStepAtIndex:v5];
      if (v6->var0 == 2) {
        break;
      }
      if (v4 == ++v5) {
        goto LABEL_5;
      }
    }
    id v7 = v6->var1.var1.var0;
  }

  return (NSString *)v7;
}

- (const)startStepAtIndex:(unint64_t)a3
{
  return &self->_steps[a3];
}

- (const)endStepAtIndex:(unint64_t)a3
{
  startStepsPtr = self->_startStepsPtr;
  result = &self->_steps[a3];
  if (result >= startStepsPtr) {
    return &self->_endStepsPtr[a3 - [(BCCFI *)self numberOfCommonSteps]];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = [(BCCFI *)self compare:v4] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  steps = self->_steps;
  stepsEnd = self->_stepsEnd;
  unint64_t v4 = (((char *)self->_endStepsPtr - (char *)self->_startStepsPtr) << 15)
     + (((char *)self->_startStepsPtr - (char *)steps) << 21)
     + (((char *)stepsEnd - (char *)self->_endStepsPtr) << 9);
  while (steps < stepsEnd)
  {
    int var0 = steps->var0;
    if (steps->var0 == 5)
    {
      v4 += steps->var1.var0.var0 << 8;
    }
    else if (var0 == 4)
    {
      v4 += 0x10000;
    }
    else if (var0 == 1)
    {
      v4 += steps->var1.var0.var0;
    }
    ++steps;
  }
  unint64_t pageIndexOffset = self->_pageIndexOffset;
  if (pageIndexOffset == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t pageIndexOffset = 0;
  }
  return pageIndexOffset ^ v4;
}

- (int64_t)compareCFI:(id)a3
{
  id v4 = a3;
  int64_t v5 = sub_AA068(self, v4, 1, 1, 0, 0);
  if (!v5) {
    int64_t v5 = sub_AA068(self, v4, 0, 0, 0, 0);
  }

  return v5;
}

- (int64_t)compareCFIHead:(id)a3
{
  return sub_AA068(self, a3, 1, 1, 0, 0);
}

- (int64_t)compareCFITail:(id)a3
{
  return sub_AA068(self, a3, 0, 0, 0, 0);
}

- (int64_t)compareHeadToTail:(id)a3
{
  return sub_AA068(self, a3, 1, 0, 0, 0);
}

- (int64_t)compareTailToHead:(id)a3
{
  return sub_AA068(self, a3, 0, 1, 0, 0);
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(BCCFI *)self compareCFI:v4];
  if (!v5)
  {
    if ([(BCCFI *)self pageIndexOffset] == 0x7FFFFFFFFFFFFFFFLL
      && [v4 pageIndexOffset] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v5 = 0;
    }
    else
    {
      if ([(BCCFI *)self pageIndexOffset] == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v6 = 0;
      }
      else {
        unint64_t v6 = [(BCCFI *)self pageIndexOffset];
      }
      if ([v4 pageIndexOffset] == (id)0x7FFFFFFFFFFFFFFFLL) {
        id v7 = 0;
      }
      else {
        id v7 = [v4 pageIndexOffset];
      }
      if (v6 < (unint64_t)v7) {
        int64_t v5 = -1;
      }
      else {
        int64_t v5 = v6 > (unint64_t)v7;
      }
    }
  }

  return v5;
}

- (id)intersectWithCFI:(id)a3
{
  return [(BCCFI *)self intersectWithRangeFromHeadOf:a3 toTailOf:a3];
}

- (id)intersectWithRangeFromHeadOf:(id)a3 toTailOf:(id)a4
{
  unint64_t v6 = (BCCFI *)a3;
  id v7 = (BCCFI *)a4;
  uint64_t v8 = sub_AA068(self, v6, 0, 1, 0, 0);
  uint64_t v9 = sub_AA068(self, v7, 1, 0, 0, 0);
  v10 = 0;
  if (v8 != -1)
  {
    uint64_t v11 = v9;
    if (v9 != 1)
    {
      if (v8)
      {
        if (!v9)
        {
LABEL_17:
          objc_super v15 = objc_opt_class();
          v16 = self;
          goto LABEL_18;
        }
        unint64_t v12 = sub_AA068(self, v6, 1, 1, 0, 0);
        uint64_t v13 = sub_AA068(self, v7, 0, 0, 0, 0);
        if (v12 <= 1 && (unint64_t)(v13 + 1) <= 1)
        {
          v14 = (BCCFI *)[(BCCFI *)self copy];
LABEL_20:
          v10 = v14;
          goto LABEL_21;
        }
        if (v12 == -1 && v13 == 1)
        {
          objc_super v15 = objc_opt_class();
          v16 = v6;
LABEL_18:
          v18 = v7;
          goto LABEL_19;
        }
        if (v12 != -1)
        {
          if (v11 != -1)
          {
            v17 = BCReadingStatisticsLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              int v20 = 138412802;
              v21 = self;
              __int16 v22 = 2112;
              v23 = v6;
              __int16 v24 = 2112;
              v25 = v7;
              _os_log_impl(&def_7D91C, v17, OS_LOG_TYPE_DEFAULT, "Failure to intersect range. Case missing. %@ %@ %@", (uint8_t *)&v20, 0x20u);
            }

            v14 = self;
            goto LABEL_20;
          }
          goto LABEL_17;
        }
      }
      objc_super v15 = objc_opt_class();
      v16 = v6;
      v18 = self;
LABEL_19:
      v14 = [v15 _cfiLocationFromHeadOf:v16 toTailOf:v18];
      goto LABEL_20;
    }
  }
LABEL_21:

  return v10;
}

- (id)unionWithCFI:(id)a3
{
  id v4 = (BCCFI *)a3;
  if (sub_AA068(self, v4, 1, 1, 0, 0) == -1) {
    int64_t v5 = self;
  }
  else {
    int64_t v5 = v4;
  }
  unint64_t v6 = v5;
  if (sub_AA068(self, v4, 0, 0, 0, 0) == -1) {
    id v7 = v4;
  }
  else {
    id v7 = self;
  }
  uint64_t v8 = v7;
  uint64_t v9 = [(id)objc_opt_class() _cfiLocationFromHeadOf:v6 toTailOf:v8];

  return v9;
}

- (id)rangeToCFI:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(id)objc_opt_class() _cfiLocationFromTailOf:self toHeadOf:v4];

  return v5;
}

- (BOOL)rangeIntersectsCFI:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BCCFI *)self isRange];
  BOOL v6 = 0;
  if (v4 && v5)
  {
    id v7 = [(BCCFI *)self intersectWithCFI:v4];
    BOOL v6 = v7 != 0;
  }
  return v6;
}

+ (BOOL)isFragmentEpubCFIFunction:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"epubcfi("]
    unsigned __int8 v4 = [v3 hasSuffix:@""]);
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)parseCFI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(BCCFI *)self string];

  if (v7)
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/CFI/BCCFI.m", 699, (uint64_t)"-[BCCFI parseCFI:error:]", (uint64_t)"self.string == nil", @"Cannot parse CFI after initialization", v8, v9, v10, (uint64_t)v148);
    if (v6) {
      goto LABEL_3;
    }
LABEL_203:
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/CFI/BCCFI.m", 700, (uint64_t)"-[BCCFI parseCFI:error:]", (uint64_t)"cfi", @"Unexpected nil CFI!", v8, v9, v10, (uint64_t)v148);
    return 0;
  }
  if (!v6) {
    goto LABEL_203;
  }
LABEL_3:
  if (![v6 isEqualToString:@"epubcfi_unknownlocation"]
    && ![v6 isEqualToString:@"epubcfi_upselllocation"])
  {
    if ([(id)objc_opt_class() isFragmentEpubCFIFunction:v6])
    {
      v18 = [v6 substringWithRange:8, [v6 length] - 9];
      v19 = +[NSScanner scannerWithString:v18];

      [v19 setCharactersToBeSkipped:0];
      v171 = +[NSCharacterSet characterSetWithCharactersInString:@"/[^:~@!, "]);
      int v20 = +[NSCharacterSet characterSetWithCharactersInString:@"^]"];
      uint64_t v178 = 0;
      v179[0] = 0;
      uint64_t v177 = 0;
      if ([v19 isAtEnd])
      {
LABEL_9:
        uint64_t v21 = v179[0];
        uint64_t v169 = v178;
        uint64_t v168 = v177;
        unint64_t v22 = v178 + v179[0] + v177;
        if (v22 <= 1) {
          size_t v23 = 1;
        }
        else {
          size_t v23 = v178 + v179[0] + v177;
        }
        __int16 v24 = (BCCFIStep *)malloc_type_calloc(v23, 0x20uLL, 0x10E204035D40BE2uLL);
        self->_startStepsPtr = 0;
        p_startStepsPtr = &self->_startStepsPtr;
        self->_steps = v24;
        v170 = v24;
        self->_endStepsPtr = 0;
        self->_stepsEnd = &v24[v22];
        [v19 setScanLocation:0];
        uint64_t v176 = 0;
        v26 = +[NSCharacterSet characterSetWithCharactersInString:@"^[](),="];;

        id v27 = [v19 scanLocation];
        if (([v19 scanString:@"/" intoString:0] & 1) == 0
          || ([v19 scanInteger:&v176] & 1) == 0)
        {
          goto LABEL_188;
        }
        if (v176 < 2 || (v176 & 1) != 0)
        {
          v59 = @"First child must be a node";
          goto LABEL_65;
        }
        uint64_t v152 = v21;
        unint64_t v33 = v176;
        steps = self->_steps;
        steps->int var0 = 1;
        uint64_t v161 = v22;
        unint64_t v162 = v33;
        steps->var1.var0.int var0 = v33;
        if ([v19 isAtEnd])
        {
          uint64_t v35 = 0;
          uint64_t v160 = 0;
          uint64_t v167 = 1;
LABEL_18:
          v36 = &v170[v167];
          self->_stepsEnd = v36;
          endStepsPtr = self->_endStepsPtr;
          if (!endStepsPtr)
          {
            self->_endStepsPtr = v36;
            endStepsPtr = &v170[v167];
          }
          if (!*p_startStepsPtr) {
            *p_startStepsPtr = endStepsPtr;
          }
          uint64_t v38 = v160 - v35;
          if (v160 > v35)
          {
            uint64_t v39 = v38 + v161;
            if (v38 + v161 <= 1) {
              size_t v40 = 1;
            }
            else {
              size_t v40 = v38 + v161;
            }
            v41 = (BCCFIStep *)malloc_type_calloc(v40, 0x20uLL, 0x10E204035D40BE2uLL);
            v42 = v41;
            if (v161 < 1)
            {
              v47 = 0;
              v46 = 0;
            }
            else
            {
              uint64_t v43 = 0;
              uint64_t v44 = 0;
              uint64_t v45 = 0;
              v46 = 0;
              v47 = 0;
              do
              {
                v48 = &v41[v45];
                v49 = &self->_steps[v43];
                long long v50 = *(_OWORD *)&v49->var1.var6.var1;
                *(_OWORD *)&v48->int var0 = *(_OWORD *)&v49->var0;
                *(_OWORD *)&v48->var1.var6.var1 = v50;
                v51 = self->_steps;
                v52 = &v51[v43];
                if (&v51[v43] == self->_startStepsPtr) {
                  v47 = &v41[v45];
                }
                if (v52 == self->_endStepsPtr) {
                  v46 = &v41[v45];
                }
                if (v52->var0 == 1 && (v52->var1.var0.var0 & 1) != 0 && (v44 + 1 >= v161 || v51[v43 + 1].var0 != 5))
                {
                  v53 = &v41[++v45];
                  v53->int var0 = 5;
                  *(void *)(&v53->var0 + 1) = 0;
                  *(void **)((char *)&v53->var1.var6.var1 + 4) = 0;
                  *(void *)((char *)&v53->var1.var3 + 4) = 0;
                  *((_DWORD *)&v53->var1.var6 + 5) = 0;
                }
                ++v44;
                ++v45;
                ++v43;
              }
              while (v152 + v168 + v169 != v44);
            }
            free(self->_steps);
            if (v46) {
              v145 = v46;
            }
            else {
              v145 = &v42[v39];
            }
            self->_endStepsPtr = v145;
            self->_stepsEnd = &v42[v39];
            if (v47) {
              v146 = v47;
            }
            else {
              v146 = v145;
            }
            self->_steps = v42;
            self->_startStepsPtr = v146;
            uint64_t v147 = [(BCCFI *)self generateCFI];

            id v6 = (id)v147;
          }
          [(BCCFI *)self setString:v6];
          BOOL v11 = 1;
          goto LABEL_191;
        }
        unint64_t v159 = 0;
        uint64_t v160 = 0;
        uint64_t v35 = 0;
        int v60 = 0;
        unint64_t v158 = 0;
        uint64_t v167 = 1;
        unsigned int v164 = 1;
        v163 = v26;
        while (1)
        {
          v61 = [v19 string];
          id v62 = [v61 characterAtIndex:[v19 scanLocation]];

          id v27 = [v19 scanLocation];
          [v19 setScanLocation:((char *)[v19 scanLocation]) + 1];
          if (v62 != 44) {
            break;
          }
          if (*p_startStepsPtr)
          {
            if (self->_endStepsPtr)
            {
              sub_ABBA0(v19, -1, a4);
              goto LABEL_183;
            }
            v170 += v167;
            self->_endStepsPtr = v170;
            unint64_t v162 = v158;
            int v60 = v159;
            unsigned int v164 = HIDWORD(v159);
          }
          else
          {
            v170 += v167;
            *p_startStepsPtr = v170;
            unint64_t v159 = __PAIR64__(v164, v60);
            unint64_t v158 = v162;
          }
          uint64_t v167 = 0;
LABEL_183:
          if ([v19 isAtEnd]) {
            goto LABEL_18;
          }
        }
        if (v62 == 41) {
          goto LABEL_188;
        }
        if (([v171 characterIsMember:v62] & 1) == 0)
        {
          v143 = v19;
          uint64_t v144 = -1;
          goto LABEL_189;
        }
        if ((int)v62 <= 63)
        {
          if (v62 == 33)
          {
            if (v60)
            {
              v59 = @"Indirection not allowed after terminating step";
              goto LABEL_65;
            }
            if (v164 - 3 >= 0xFFFFFFFE && (v162 & 1) != 0)
            {
              v59 = @"Indirection not allowed after text node";
              goto LABEL_65;
            }
            int v60 = 0;
            v75 = &v170[v167];
            uint64_t v76 = v167 + 1;
            memset(&v179[1], 0, 28);
            unsigned int v164 = 4;
            v75->int var0 = 4;
            long long v77 = *(_OWORD *)&v179[1];
            *(_OWORD *)&v75->var1.var6.var1 = *(_OWORD *)((char *)&v179[2] + 4);
            *(_OWORD *)(&v75->var0 + 1) = v77;
LABEL_101:
            uint64_t v167 = v76;
            goto LABEL_183;
          }
          if (v62 != 47)
          {
            if (v62 != 58) {
              goto LABEL_183;
            }
            if (v164 - 3 <= 0xFFFFFFFD)
            {
              v59 = @"Character offset terminating step only allowed after child node step";
              goto LABEL_65;
            }
            if ([v19 scanInteger:&v176])
            {
              uint64_t v63 = v176;
              if ((v176 & 0x8000000000000000) == 0)
              {
                v64 = &v170[v167];
                unsigned int v164 = 5;
                v64->int var0 = 5;
                v64->var1.var0.int var0 = v63;
                ++v35;
                int v60 = 1;
                ++v167;
                goto LABEL_183;
              }
              v59 = @"Character offset must be a non-negative integer";
LABEL_65:
              sub_ABA80(a4, (uint64_t)v27, v59, v28, v29, v30, v31, v32, (uint64_t)v148);
              goto LABEL_190;
            }
            goto LABEL_188;
          }
          if (v60)
          {
            v59 = @"Child node step not allowed after a terminating step";
            goto LABEL_65;
          }
          if (v164 - 3 >= 0xFFFFFFFE && (v162 & 1) != 0)
          {
            v59 = @"Child node step not allowed after text node";
            goto LABEL_65;
          }
          if ([v19 scanInteger:&v176])
          {
            if (v176 <= 0)
            {
              v59 = @"Child node index must be a positive number";
              goto LABEL_65;
            }
            int v60 = 0;
            uint64_t v78 = v176;
            v79 = &v170[v167];
            uint64_t v76 = v167 + 1;
            unsigned int v164 = 1;
            v79->int var0 = 1;
            unint64_t v162 = v78;
            v79->var1.var0.int var0 = v78;
            v160 += v176 & 1;
            goto LABEL_101;
          }
LABEL_188:
          v143 = v19;
          uint64_t v144 = 0;
LABEL_189:
          sub_ABBA0(v143, v144, a4);
          goto LABEL_190;
        }
        if (v62 != 64)
        {
          if (v62 != 91)
          {
            if (v62 != 126) {
              goto LABEL_183;
            }
            if (v164 - 3 <= 0xFFFFFFFD)
            {
              v59 = @"Temporal offset terminating step only allowed after child node step";
              goto LABEL_65;
            }
            long long v174 = 0uLL;
            int v175 = 0;
            if (([v19 scanDecimal:&v174] & 1) == 0) {
              goto LABEL_188;
            }
            long long v172 = v174;
            int v173 = v175;
            v65 = +[NSDecimalNumber decimalNumberWithDecimal:&v172];
            v66 = +[NSDecimalNumber zero];
            id v67 = [v65 compare:v66];

            if (v67 != (id)-1)
            {
              v73 = &v170[v167];
              id v74 = v65;
              unsigned int v164 = 6;
              v73->int var0 = 6;
              v73->var1.var0.int var0 = (unint64_t)v74;

              int v60 = 1;
              ++v167;
LABEL_112:
              v26 = v163;
              goto LABEL_183;
            }
            sub_ABA80(a4, (uint64_t)v27, @"Temporal offset must be a non-negative number", v68, v69, v70, v71, v72, (uint64_t)v148);

            goto LABEL_220;
          }
          if (v164 == 1)
          {
            if (v162)
            {
              v59 = @"ID assertion cannot follow a text node";
              goto LABEL_65;
            }
          }
          else if (v164 != 5)
          {
            v59 = @"Assertion only allowed after child step or character offset step";
            goto LABEL_65;
          }
          uint64_t v154 = v35;
          v156 = 0;
          uint64_t v157 = (uint64_t)[v19 scanLocation];
          char v149 = 0;
          int v150 = v60;
          v103 = 0;
          v155 = 0;
          v151 = 0;
          while (1)
          {
            if ([v19 isAtEnd]) {
              goto LABEL_163;
            }
            [v19 scanUpToCharactersFromSet:v26 intoString:0];
            if ([v19 isAtEnd]) {
              goto LABEL_163;
            }
            v109 = [v19 string];
            int v110 = [v109 characterAtIndex:[v19 scanLocation]];

            [v19 setScanLocation:[v19 scanLocation] + 1];
            if (v110 == 94)
            {
              if ([v19 isAtEnd])
              {
                v26 = v163;
                goto LABEL_163;
              }
              [v19 setScanLocation:[v19 scanLocation] + 1];
              int v111 = 0;
            }
            else
            {
              int v111 = 0;
              if (v110 > 60)
              {
                if (v110 == 61)
                {
                  if (!v103) {
                    goto LABEL_185;
                  }
                  v122 = v103;
                  v125 = (char *)[v19 scanLocation] + ~v157;
                  v126 = [v19 string];
                  id v127 = [v126 rangeOfString:@" " options:0 range:v157, v125];

                  if (v127 != (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    sub_ABA80(a4, (uint64_t)v127, @"Unexpected space found in key of assertion parameter list", v128, v129, v130, v131, v132, (uint64_t)v148);

                    goto LABEL_187;
                  }
                  v133 = [v19 string];
                  uint64_t v134 = +[BCCFI substringByUnescapingString:inRange:](BCCFI, "substringByUnescapingString:inRange:", v133, v157, v125);

                  uint64_t v157 = (uint64_t)[v19 scanLocation];
                  int v111 = 0;
                  v155 = (void *)v134;
                  goto LABEL_145;
                }
                if (v110 == 93)
                {
LABEL_130:
                  [v19 string];
                  v113 = v112 = v103;
                  [v19 scanLocation];
                  v114 = +[BCCFI substringByUnescapingString:inRange:](BCCFI, "substringByUnescapingString:inRange:", v113);

                  v103 = v112;
                  if (v112)
                  {
                    if (!v155)
                    {
                      sub_ABA80(a4, v157, @"Assertion found with keyless value", v115, v116, v117, v118, v119, (uint64_t)v148);
                      v155 = 0;
                      int v111 = 1;
LABEL_156:
                      v26 = v163;

                      goto LABEL_159;
                    }
                    [v112 setObject:v114 forKey:v155];

                    v155 = 0;
                    if (v110 != 93) {
                      goto LABEL_158;
                    }
LABEL_155:
                    int v111 = 15;
                    char v149 = 1;
                    goto LABEL_156;
                  }
                  if (v156)
                  {
                    if (v164 == 1 || (v135 = v114, v151))
                    {
LABEL_154:
                      if (v110 != 93)
                      {
                        v103 = +[NSMutableDictionary dictionary];
LABEL_158:
                        v26 = v163;
                        uint64_t v157 = (uint64_t)[v19 scanLocation];

                        int v111 = 0;
                        goto LABEL_159;
                      }
                      goto LABEL_155;
                    }
                  }
                  else
                  {
                    v135 = v151;
                    v156 = v114;
                  }
                  id v136 = v114;
                  v151 = v135;
                  goto LABEL_154;
                }
              }
              else
              {
                if (v110 == 44)
                {
                  BOOL v120 = v164 != 1 && v156 == 0;
                  char v121 = v120;
                  v122 = v103;
                  if (!v103 && (v121 & 1) == 0)
                  {
LABEL_185:
                    sub_ABBA0(v19, -1, a4);
LABEL_187:
                    int v111 = 1;
                    v26 = v163;
                    int v60 = v150;
                    goto LABEL_179;
                  }
                  v123 = [v19 string];
                  [v19 scanLocation];
                  uint64_t v124 = +[BCCFI substringByUnescapingString:inRange:](BCCFI, "substringByUnescapingString:inRange:", v123);

                  v156 = (void *)v124;
                  uint64_t v157 = (uint64_t)[v19 scanLocation];
                  int v111 = 0;
LABEL_145:
                  v26 = v163;
                  v103 = v122;
                  int v60 = v150;
                  goto LABEL_159;
                }
                if (v110 == 59) {
                  goto LABEL_130;
                }
              }
            }
            v26 = v163;
LABEL_159:
            if (v111)
            {
              if (v111 != 15)
              {

                goto LABEL_179;
              }
LABEL_163:
              if (v149)
              {
                v137 = &v170[v167];
                id v138 = [v156 copy];
                if (v164 == 1)
                {
                  if ([v103 count])
                  {
                    v141 = (__CFDictionary *)[v103 copy];
                    unsigned int v164 = 2;
                    v137->int var0 = 2;
                    v137->var1.var0.int var0 = (unint64_t)v138;
                    v137->var1.var1.var1 = v141;
                  }
                  else
                  {
                    unsigned int v164 = 2;
                    v137->int var0 = 2;
                    v137->var1.var0.int var0 = (unint64_t)v138;
                    v137->var1.var1.var1 = 0;
                  }
                }
                else
                {
                  id v166 = [v151 length];
                  if (v166)
                  {
                    v139 = (__CFDictionary *)[v151 copy];
                    id v140 = [v103 count:v139];
                  }
                  else
                  {
                    v139 = 0;
                    id v140 = [v103 count:v148];
                  }
                  if (v140)
                  {
                    v142 = (__CFDictionary *)[v103 copy];
                    v137->int var0 = 3;
                    v137->var1.var0.int var0 = (unint64_t)v138;
                    v137->var1.var1.var1 = v139;
                    v137->var1.var2.var2 = v142;
                  }
                  else
                  {
                    v137->int var0 = 3;
                    v137->var1.var0.int var0 = (unint64_t)v138;
                    v137->var1.var1.var1 = v139;
                    v137->var1.var2.var2 = 0;
                  }
                  v26 = v163;
                  if (v166) {

                  }
                  unsigned int v164 = 3;
                  int v60 = v150;
                }

                ++v167;
                int v111 = 0;
              }
              else
              {
                sub_ABA80(a4, -1, @"Encountered end of string while parsing CFI assertion", v104, v105, v106, v107, v108, (uint64_t)v148);

                int v111 = 1;
              }
LABEL_179:

              if (v111)
              {
                BOOL v120 = v111 == 10;
                uint64_t v35 = v154;
                if (!v120)
                {
LABEL_190:
                  BOOL v11 = 0;
                  goto LABEL_191;
                }
              }
              else
              {
                uint64_t v35 = v154;
              }
              goto LABEL_183;
            }
          }
        }
        if (v164 > 6 || ((1 << v164) & 0x46) == 0)
        {
          sub_ABA80(a4, (uint64_t)v27, @"Spatial offset terminating step only allowed after child node step or temporal offset terminating step", v28, v29, v30, v31, v32, (uint64_t)v148);
          goto LABEL_220;
        }
        long long v174 = 0uLL;
        int v175 = 0;
        if (([v19 scanDecimal:&v174] & 1) == 0)
        {
          sub_ABBA0(v19, 0, a4);
          goto LABEL_220;
        }
        long long v172 = v174;
        int v173 = v175;
        v80 = +[NSDecimalNumber decimalNumberWithDecimal:&v172];
        v81 = +[NSDecimalNumber zero];
        if ([v80 compare:v81] == (id)-1)
        {
        }
        else
        {
          uint64_t v153 = v35;
          v82 = +[NSDecimalNumber decimalNumberWithMantissa:100 exponent:0 isNegative:0];
          v83 = v80;
          v84 = (char *)[v80 compare:v82];

          BOOL v120 = v84 == (unsigned char *)&def_7D91C + 1;
          v80 = v83;
          if (!v120)
          {
            id v90 = [v19 scanLocation];
            v26 = v163;
            if (([v19 scanString:@":" intoString:0] & 1) != 0
              && ([v19 scanDecimal:&v174] & 1) != 0)
            {
              uint64_t v165 = (uint64_t)v90;
              long long v172 = v174;
              int v173 = v175;
              v91 = +[NSDecimalNumber decimalNumberWithDecimal:&v172];
              v92 = +[NSDecimalNumber zero];
              if ([v91 compare:v92] == (id)-1)
              {
              }
              else
              {
                v93 = +[NSDecimalNumber decimalNumberWithMantissa:100 exponent:0 isNegative:0];
                v94 = (char *)[v91 compare:v93];

                if (v94 != (unsigned char *)&def_7D91C + 1)
                {
                  v100 = &v170[v167];
                  id v101 = v83;
                  v102 = v91;
                  unsigned int v164 = 7;
                  v100->int var0 = 7;
                  v100->var1.var0.int var0 = (unint64_t)v101;
                  v100->var1.var1.var1 = v102;

                  int v60 = 1;
                  ++v167;
                  uint64_t v35 = v153;
                  goto LABEL_112;
                }
              }
              sub_ABA80(a4, v165, @"Temporal offset parameter must be a number between 0 and 100", v95, v96, v97, v98, v99, (uint64_t)v148);

LABEL_220:
              BOOL v11 = 0;
              v26 = v163;
LABEL_191:

              return v11;
            }
            sub_ABBA0(v19, 0, a4);
LABEL_214:

            goto LABEL_190;
          }
        }
        sub_ABA80(a4, (uint64_t)v27, @"Temporal offset parameter must be a number between 0 and 100", v85, v86, v87, v88, v89, (uint64_t)v148);
        v26 = v163;
        goto LABEL_214;
      }
      v54 = v179;
      while (1)
      {
        [v19 scanUpToCharactersFromSet:v171 intoString:0];
        if ([v19 isAtEnd]) {
          goto LABEL_9;
        }
        v55 = [v19 string];
        int v56 = [v55 characterAtIndex:[v19 scanLocation]];

        [v19 setScanLocation:[v19 scanLocation] + 1];
        if (v56 <= 90)
        {
          if (v56 == 44)
          {
            if (v54 == v179)
            {
              v54 = &v178;
            }
            else
            {
              if (v54 != &v178) {
                goto LABEL_9;
              }
              v54 = &v177;
            }
            goto LABEL_61;
          }
          if (v56 == 41) {
            goto LABEL_9;
          }
        }
        else
        {
          if (v56 == 94)
          {
            if ([v19 isAtEnd]) {
              goto LABEL_9;
            }
            [v19 setScanLocation:((char *)[v19 scanLocation]) + 1];
            goto LABEL_61;
          }
          if (v56 == 91 && ([v19 isAtEnd] & 1) == 0)
          {
            do
            {
              [v19 scanUpToCharactersFromSet:v20 intoString:0];
              if ([v19 isAtEnd]) {
                break;
              }
              v57 = [v19 string];
              unsigned int v58 = [v57 characterAtIndex:[v19 scanLocation]];

              [v19 setScanLocation:[v19 scanLocation] + 1];
              if (v58 != 94) {
                break;
              }
              if (([v19 isAtEnd] & 1) == 0) {
                [v19 setScanLocation:[v19 scanLocation] + 1];
              }
            }
            while (![v19 isAtEnd]);
          }
        }
        ++*v54;
LABEL_61:
        if ([v19 isAtEnd]) {
          goto LABEL_9;
        }
      }
    }
    sub_ABA80(a4, -1, @"CFI was not of the form epubCFI(...)", v13, v14, v15, v16, v17, (uint64_t)v148);

    return 0;
  }
  [(BCCFI *)self setString:v6];

  return 1;
}

- (id)generateCFI
{
  id v3 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"epubcfi(");
  sub_ABCF0(v3, (unint64_t)self->_steps, (unint64_t)self->_startStepsPtr);
  if (self->_stepsEnd > self->_startStepsPtr)
  {
    [v3 appendString:@","];
    sub_ABCF0(v3, (unint64_t)self->_startStepsPtr, (unint64_t)self->_endStepsPtr);
    [v3 appendString:@","];
    sub_ABCF0(v3, (unint64_t)self->_endStepsPtr, (unint64_t)self->_stepsEnd);
  }
  [v3 appendString:@""]);

  return v3;
}

+ (id)stringByEscapingString:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    unsigned __int8 v4 = +[NSCharacterSet characterSetWithCharactersInString:@"^[](),="];;
    id v5 = [v3 rangeOfCharacterFromSet:v4 options:2];
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = v3;
    }
    else
    {
      id v8 = v5;
      uint64_t v9 = v6;
      uint64_t v10 = malloc_type_malloc(4 * ((unsigned char *)[v3 length] - ((unsigned char *)v8 + v6)) + 2 * (void)v8, 0x1000040BDFB0063uLL);
      if (v8) {
        [v3 getCharacters:v10 range:0, v8];
      }
      id v11 = v8;
      do
      {
        uint64_t v12 = (uint64_t)v11 + 1;
        v10[(void)v11] = 94;
        uint64_t v13 = [v3 length];
        id v14 = [v3 rangeOfCharacterFromSet:v4 options:2 range:(char *)v8 + v9 length:[v3 length] - ((unsigned char *)v8 + v9)];
        id v15 = v14;
        uint64_t v9 = v16;
        if (v14 == (id)0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v17 = v13;
        }
        else {
          uint64_t v17 = v14;
        }
        int64_t v18 = v17 - (unsigned char *)v8;
        [v3 getCharacters:&v10[v12] range:v8, v17 - (unsigned char *)v8];
        id v11 = (id)(v18 + v12);
        id v8 = v15;
      }
      while (v15 != (id)0x7FFFFFFFFFFFFFFFLL);
      id v7 = [objc_alloc((Class)NSString) initWithCharactersNoCopy:v10 length:v11 freeWhenDone:1];
      if (!v7) {
        free(v10);
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)substringByUnescapingString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  CFStringRef v6 = (const __CFString *)a3;
  id v7 = (__CFString *)v6;
  if (v6)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    CFStringRef theString = v6;
    NSUInteger v38 = location;
    int64_t v39 = length;
    CharactersPtr = CFStringGetCharactersPtr(v6);
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
    }
    int64_t v40 = 0;
    int64_t v41 = 0;
    v37 = CStringPtr;
    uint64_t v10 = malloc_type_malloc(2 * length, 0x1000040BDFB0063uLL);
    if (length)
    {
      uint64_t v11 = 0;
      int64_t v12 = 0;
      int64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 64;
      while (1)
      {
        if ((unint64_t)v13 >= 4) {
          uint64_t v16 = 4;
        }
        else {
          uint64_t v16 = v13;
        }
        if (v13 < 0 || v39 <= v13)
        {
          UniChar v17 = 0;
        }
        else
        {
          if (CharactersPtr)
          {
            UniChar v17 = CharactersPtr[v13 + v38];
          }
          else if (v37)
          {
            UniChar v17 = v37[v38 + v13];
          }
          else
          {
            if (v41 <= v13 || v12 > v13)
            {
              uint64_t v18 = -v16;
              uint64_t v19 = v16 + v11;
              uint64_t v20 = v15 - v16;
              int64_t v21 = v13 + v18;
              int64_t v22 = v21 + 64;
              if (v21 + 64 >= v39) {
                int64_t v22 = v39;
              }
              int64_t v40 = v21;
              int64_t v41 = v22;
              v23.NSUInteger location = v21 + v38;
              if (v39 >= v20) {
                uint64_t v24 = v20;
              }
              else {
                uint64_t v24 = v39;
              }
              v23.NSUInteger length = v24 + v19;
              CFStringGetCharacters(theString, v23, (UniChar *)&v27);
              int64_t v12 = v40;
            }
            UniChar v17 = *((_WORD *)&v27 + v13 - v12);
          }
          if (v17 == 94) {
            goto LABEL_17;
          }
        }
        v10[v14++] = v17;
LABEL_17:
        ++v13;
        --v11;
        ++v15;
        if (length == v13) {
          goto LABEL_33;
        }
      }
    }
    uint64_t v14 = 0;
LABEL_33:
    id v25 = objc_alloc((Class)NSString);
    id v9 = [v25 initWithCharactersNoCopy:v10 length:v14 freeWhenDone:1 v27, v28, v29, v30, v31, v32, v33, v34];
    if (!v9) {
      free(v10);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)rebaseCFIWithHead:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CFStringRef v6 = v5;
  if (v4)
  {
    p_isa = [(BCCFI *)v5 _simplifiedVersion];
    id v8 = [v4 _simplifiedVersion];
    unint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    sub_AA068(p_isa, v8, 1, 1, (char **)&v29, 0);
    sub_AA068(p_isa, v8, 0, 1, (char **)&v28, 0);
    unint64_t v9 = 0;
    uint64_t v10 = (_DWORD *)p_isa[1];
    if ((unint64_t)v10 < p_isa[3])
    {
      unint64_t v9 = 0;
      unint64_t v11 = 0;
      BOOL v12 = 0;
      BOOL v13 = 0;
      uint64_t v14 = (_DWORD *)v8[1];
      uint64_t v15 = (char *)v29;
      do
      {
        if ((unint64_t)v14 >= v8[3] || v11 > (unint64_t)v15) {
          break;
        }
        if (v13)
        {
          if (v12)
          {
            if (!v10) {
              break;
            }
            if (*v10 == 1)
            {
              if (!v14 || *v14 != 1) {
                break;
              }
            }
            else if (*v10 != 5 || !v14 || *v14 != 5)
            {
              break;
            }
            if (!-[BCCFI _subtractStep:fromStep:](v6, "_subtractStep:fromStep:", v14, v10, v28))
            {
              v26 = BCReadingStatisticsLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                long long v31 = v8;
                __int16 v32 = 2112;
                long long v33 = p_isa;
                _os_log_impl(&def_7D91C, v26, OS_LOG_TYPE_DEFAULT, "Failed to subtract %@ from %@.", buf, 0x16u);
              }

              break;
            }
            BOOL v13 = 1;
            uint64_t v15 = (char *)v29;
            BOOL v12 = 1;
          }
          else
          {
            BOOL v12 = *v10 == 1;
            BOOL v13 = 1;
          }
        }
        else
        {
          BOOL v13 = *v10 == 4;
        }
        if (v11 <= (unint64_t)v15 && *v10 != 5 && (unint64_t)v10 < p_isa[2]) {
          ++v9;
        }
        ++v11;
        v10 += 8;
        v14 += 8;
      }
      while ((unint64_t)v10 < p_isa[3]);
    }
    UniChar v17 = (_DWORD *)p_isa[1];
    unint64_t v18 = p_isa[4];
    if ((unint64_t)v17 < v18)
    {
      unint64_t v19 = 0;
      BOOL v20 = 0;
      BOOL v21 = 0;
      int64_t v22 = (_DWORD *)v8[1];
      do
      {
        if ((unint64_t)v22 >= v8[3] || v19 > v28) {
          break;
        }
        if (v17 == (_DWORD *)p_isa[2])
        {
          UniChar v17 = (_DWORD *)p_isa[3];
          if (!v21)
          {
LABEL_45:
            BOOL v21 = *v17 == 4;
            goto LABEL_52;
          }
        }
        else if (!v21)
        {
          goto LABEL_45;
        }
        if (v20)
        {
          if (v19 >= v9)
          {
            if (v19 >= v28)
            {
              if (!v17) {
                break;
              }
              if (*v17 == 1)
              {
                if (!v22 || *v22 != 1) {
                  break;
                }
              }
              else if (*v17 != 5 || !v22 || *v22 != 5)
              {
                break;
              }
            }
            if (!-[BCCFI _subtractStep:fromStep:](v6, "_subtractStep:fromStep:", v22, v17, v28))
            {
              long long v27 = BCReadingStatisticsLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                long long v31 = v8;
                __int16 v32 = 2112;
                long long v33 = p_isa;
                _os_log_impl(&def_7D91C, v27, OS_LOG_TYPE_DEFAULT, "Failed to subtract %@ from %@.", buf, 0x16u);
              }

              break;
            }
            unint64_t v18 = p_isa[4];
          }
          BOOL v21 = 1;
          BOOL v20 = 1;
        }
        else
        {
          BOOL v20 = *v17 == 1;
          BOOL v21 = 1;
        }
LABEL_52:
        ++v19;
        v17 += 8;
        v22 += 8;
      }
      while ((unint64_t)v17 < v18);
    }
    uint64_t v24 = [p_isa generateCFI:v28];
    [p_isa setString:v24];
  }
  else
  {
    p_isa = &v5->super.isa;
  }

  return p_isa;
}

- (BCCFI)cfiWithAdjustedSpineIndex:(int64_t)a3 error:(id *)a4
{
  id v7 = [(BCCFI *)self copy];
  id v8 = v7;
  unint64_t v9 = v7[1];
  unint64_t v10 = v7[2];
  if (v9 < v10)
  {
    uint64_t v11 = 0;
    do
    {
      if (*(_DWORD *)v9 == 1)
      {
        uint64_t v12 = *(void *)(v9 + 8);
        if ((v12 & 1) == 0 && ++v11 == 2)
        {
          if (v12 + a3 < 0)
          {

            if (a4)
            {
              NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
              UniChar v17 = [(BCCFI *)self string];
              unint64_t v18 = +[NSString stringWithFormat:@"Invalid offset. Offsetting {%@} by %ld would produce a negative spine index.", v17, a3];
              int64_t v22 = v18;
              unint64_t v19 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
              *a4 = +[NSError errorWithDomain:@"BKEpubCFIErrorDomain" code:2 userInfo:v19];
            }
            id v8 = 0;
            break;
          }
          *(void *)(v9 + 8) = v12 + 2 * a3;
          unint64_t v10 = v7[2];
          uint64_t v11 = 2;
        }
      }
      else if (*(_DWORD *)v9 == 4)
      {
        goto LABEL_14;
      }
      v9 += 32;
    }
    while (v9 < v10);
  }
  BOOL v13 = BCReadingStatisticsLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_7D91C, v13, OS_LOG_TYPE_DEFAULT, "ERROR: No indirection available in CFI so unable to offset spine element.", buf, 2u);
  }

  id v8 = 0;
LABEL_14:
  uint64_t v14 = [v8 generateCFI];
  uint64_t v15 = +[BCCFI cfiWithString:v14 error:a4];

  return (BCCFI *)v15;
}

- (BCCFI)cfiWithSpineIndexAdjustedUsingAssertionBlock:(id)a3
{
  id v4 = (uint64_t (**)(id, uint64_t, void))a3;
  id v5 = self;
  stepsEnd = v5->_stepsEnd;
  unint64_t v7 = (unint64_t)&v5->_steps[1];
  while (v7 < (unint64_t)stepsEnd)
  {
    int v8 = *(_DWORD *)v7;
    v7 += 32;
    if (v8 == 1)
    {
      if (v7 < (unint64_t)stepsEnd && *(_DWORD *)v7 == 2)
      {
        uint64_t v9 = *(void *)(v7 - 24);
        uint64_t v10 = v4[2](v4, v9, *(void *)(v7 + 8));
        if (v10 != 0x7FFFFFFFFFFFFFFFLL && v9 != v10)
        {
          uint64_t v12 = [(BCCFI *)v5 cfiWithAdjustedSpineIndex:v10 error:0];

          id v5 = (BCCFI *)v12;
        }
      }
      break;
    }
  }

  return v5;
}

- (id)headCFI
{
  id v3 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"epubcfi(");
  for (i = self->_steps; i < self->_endStepsPtr; ++i)
    sub_AC98C(v3, (uint64_t)i);
  [v3 appendString:@""]);
  id v11 = 0;
  id v5 = +[BCCFI cfiWithString:v3 error:&v11];
  id v6 = v11;
  if (v6)
  {
    unint64_t v7 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_DEFAULT, "Failed to create CFI. %@", buf, 0xCu);
    }
  }
  if (!v5)
  {
    int v8 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(BCCFI *)self description];
      *(_DWORD *)buf = 138412290;
      id v13 = v9;
      _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_DEFAULT, "Failed to create head CFI from %@", buf, 0xCu);
    }
  }

  return v5;
}

- (id)tailCFI
{
  id v3 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"epubcfi(");
  for (i = self->_steps; i < self->_startStepsPtr; ++i)
    sub_AC98C(v3, (uint64_t)i);
  for (j = self->_endStepsPtr; j < self->_stepsEnd; ++j)
    sub_AC98C(v3, (uint64_t)j);
  [v3 appendString:@""]);
  id v12 = 0;
  id v6 = +[BCCFI cfiWithString:v3 error:&v12];
  id v7 = v12;
  if (v7)
  {
    int v8 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_DEFAULT, "Failed to create CFI. %@", buf, 0xCu);
    }
  }
  if (!v6)
  {
    uint64_t v9 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(BCCFI *)self description];
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_impl(&def_7D91C, v9, OS_LOG_TYPE_DEFAULT, "Failed to create tail CFI from %@", buf, 0xCu);
    }
  }

  return v6;
}

- (id)ensureRange
{
  v2 = self;
  if (![(BCCFI *)v2 isRange])
  {
    id v3 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"epubcfi(");
    unint64_t steps = (unint64_t)v2->_steps;
    CFStringRef v5 = @"/1,:0,:1";
    if ((BCCFIStep *)steps < v2->_startStepsPtr)
    {
      char v6 = 0;
      while (2)
      {
        switch(*(_DWORD *)steps)
        {
          case 1:
            sub_AC98C(v3, steps);
            v6 |= *(unsigned char *)(steps + 8);
            goto LABEL_7;
          case 2:
          case 4:
            sub_AC98C(v3, steps);
            goto LABEL_7;
          case 5:
            [v3 appendString:@","];
            sub_AC98C(v3, steps);
            [v3 appendString:@","];
            long long v9 = *(_OWORD *)(steps + 16);
            v10[0] = *(_OWORD *)steps;
            v10[1] = v9;
            *((void *)&v10[0] + 1) = *(void *)(steps + 8) + 1;
            sub_AC98C(v3, (uint64_t)v10);
            if (v6) {
              goto LABEL_11;
            }
            CFStringRef v5 = @"/1,:0,:1";
            break;
          default:
LABEL_7:
            steps += 32;
            if ((BCCFIStep *)steps < v2->_startStepsPtr) {
              continue;
            }
            if (v6) {
              CFStringRef v5 = @",:0,:1";
            }
            break;
        }
        break;
      }
    }
    [v3 appendString:v5];
LABEL_11:
    [v3 appendString:@""]);
    uint64_t v7 = +[BCCFI cfiWithString:v3 error:0];

    v2 = (BCCFI *)v7;
  }

  return v2;
}

- (unint64_t)characterCountIfComputable
{
  if (![(BCCFI *)self isRange]) {
    return 0;
  }
  startStepsPtr = self->_startStepsPtr;
  endStepsPtr = self->_endStepsPtr;
  if (startStepsPtr >= endStepsPtr) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  while (1)
  {
    int var0 = startStepsPtr->var0;
    if (startStepsPtr->var0 <= 7u)
    {
      if (((1 << var0) & 0xD2) != 0) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      if (var0 == 5) {
        break;
      }
    }
    if (++startStepsPtr >= endStepsPtr) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  unint64_t v7 = startStepsPtr->var1.var0.var0;
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    stepsEnd = self->_stepsEnd;
    if (endStepsPtr < stepsEnd)
    {
      while (1)
      {
        int v9 = endStepsPtr->var0;
        if (endStepsPtr->var0 <= 7u)
        {
          if (((1 << v9) & 0xD2) != 0) {
            return 0x7FFFFFFFFFFFFFFFLL;
          }
          if (v9 == 5) {
            break;
          }
        }
        if (++endStepsPtr >= stepsEnd) {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      unint64_t v10 = endStepsPtr->var1.var0.var0;
      if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
        return v10 - v7;
      }
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)_copyInto:(id)a3
{
  id v14 = a3;
  id v4 = [(BCCFI *)self string];
  [v14 setString:v4];

  size_t v5 = (char *)self->_stepsEnd - (char *)self->_steps;
  char v6 = (char *)malloc_type_malloc(v5, 0xBE537BBDuLL);
  v14[1] = v6;
  v14[2] = &v6[(unint64_t)((char *)self->_startStepsPtr - (char *)self->_steps)];
  v14[3] = &v6[(unint64_t)((char *)self->_endStepsPtr - (char *)self->_steps)];
  v14[4] = &v6[(unint64_t)((char *)self->_stepsEnd - (char *)self->_steps)];
  v14[6] = self->_pageIndexOffset;
  memmove(v6, self->_steps, v5);
  unint64_t v7 = v14[1];
  unint64_t v8 = v14[4];
  while (v7 < v8)
  {
    switch(*(_DWORD *)v7)
    {
      case 2:
        id v9 = [*(id *)(v7 + 8) copy];
        *(void *)(v7 + 8) = v9;

        id v10 = [*(id *)(v7 + 16) copy];
        *(void *)(v7 + 16) = v10;
        goto LABEL_6;
      case 3:
        id v11 = [*(id *)(v7 + 8) copy];
        *(void *)(v7 + 8) = v11;

        id v12 = [*(id *)(v7 + 16) copy];
        *(void *)(v7 + 16) = v12;

        id v10 = [*(id *)(v7 + 24) copy];
        *(void *)(v7 + 24) = v10;
LABEL_6:

        break;
      case 6:
        id v13 = *(const void **)(v7 + 8);
        goto LABEL_9;
      case 7:
        CFRetain(*(CFTypeRef *)(v7 + 8));
        id v13 = *(const void **)(v7 + 16);
LABEL_9:
        CFRetain(v13);
        break;
      default:
        break;
    }
    v7 += 32;
  }
}

- (id)_simplifiedVersion
{
  id v3 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"epubcfi(");
  unint64_t steps = self->_steps;
  for (i = self->_startStepsPtr; steps < i; ++steps)
  {
    if (steps->var0 <= 5u && ((1 << steps->var0) & 0x32) != 0)
    {
      sub_AC98C(v3, (uint64_t)steps);
      i = self->_startStepsPtr;
    }
  }
  [v3 appendString:@","];
  sub_ABCF0(v3, (unint64_t)self->_startStepsPtr, (unint64_t)self->_endStepsPtr);
  [v3 appendString:@","];
  sub_ABCF0(v3, (unint64_t)self->_endStepsPtr, (unint64_t)self->_stepsEnd);
  [v3 appendString:@""]);
  unint64_t v7 = +[BCCFI cfiWithString:v3 error:0];

  return v7;
}

- (BOOL)_subtractStep:(const BCCFIStep *)a3 fromStep:(BCCFIStep *)a4
{
  int var0 = a4->var0;
  if (a4->var0 != a3->var0)
  {
    id v13 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      uint64_t v16 = NSStringFromSelector(a2);
      int v24 = 138412546;
      id v25 = v15;
      __int16 v26 = 2112;
      long long v27 = v16;
      UniChar v17 = "Unexpected state in %@ %@.";
LABEL_21:
      _os_log_impl(&def_7D91C, v13, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v24, 0x16u);
    }
LABEL_22:

    return 0;
  }
  if (var0 == 5)
  {
    unint64_t v18 = a4->var1.var0.var0;
    unint64_t v19 = a3->var1.var0.var0;
    if (v19 > v18)
    {
      BOOL v20 = BCReadingStatisticsLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&def_7D91C, v20, OS_LOG_TYPE_DEFAULT, "Subtracting an offset that is too large.", (uint8_t *)&v24, 2u);
      }

      unint64_t v19 = v18;
    }
    unint64_t v21 = v18 - v19;
    goto LABEL_25;
  }
  if (var0 != 1)
  {
    id v13 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v22 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v22);
      uint64_t v16 = NSStringFromSelector(a2);
      int v24 = 138412546;
      id v25 = v15;
      __int16 v26 = 2112;
      long long v27 = v16;
      UniChar v17 = "Unexpected step type in %@ %@.";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  unint64_t v8 = a4->var1.var0.var0;
  unint64_t v9 = a3->var1.var0.var0;
  if (v9 > v8)
  {
    id v10 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&def_7D91C, v10, OS_LOG_TYPE_DEFAULT, "Subtracting an index that is too large.", (uint8_t *)&v24, 2u);
    }

    unint64_t v9 = v8;
  }
  unint64_t v11 = v8 - v9;
  a4->var1.var0.int var0 = v11;
  if (a3->var0 == 1)
  {
    uint64_t v12 = 1;
    if ((a3->var1.var0.var0 & 1) == 0) {
      uint64_t v12 = 2;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }
  unint64_t v21 = v12 + v11;
LABEL_25:
  a4->var1.var0.int var0 = v21;
  return 1;
}

+ (id)_cfiLocationFromHeadOf:(id)a3 toTailOf:(id)a4
{
  size_t v5 = a3;
  char v6 = a4;
  unint64_t v29 = 0;
  long long v30 = 0;
  sub_AA068(v5, v6, 1, 0, &v30, &v29);
  unint64_t v7 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"epubcfi(");
  unint64_t v9 = v5[1];
  unint64_t v8 = v5[2];
  unint64_t v10 = 0;
  if (v9 < v8 && v30 != 0)
  {
    do
    {
      sub_AC98C(v7, v9);
      ++v10;
      v9 += 32;
      unint64_t v8 = v5[2];
    }
    while (v9 < v8 && v10 < (unint64_t)v30);
  }
  unint64_t v13 = v5[3];
  while (v8 < v13)
  {
    if (v10 < (unint64_t)v30)
    {
      sub_AC98C(v7, v8);
      unint64_t v13 = v5[3];
    }
    ++v10;
    v8 += 32;
  }
  [v7 appendString:@","];
  unint64_t v15 = v5[1];
  unint64_t v14 = v5[2];
  if (v15 >= v14)
  {
    unint64_t v16 = 0;
  }
  else
  {
    unint64_t v16 = 0;
    do
    {
      if (v16 >= (unint64_t)v30)
      {
        sub_AC98C(v7, v15);
        unint64_t v14 = v5[2];
      }
      ++v16;
      v15 += 32;
    }
    while (v15 < v14);
  }
  unint64_t v17 = v5[3];
  while (v14 < v17)
  {
    if (v16 >= (unint64_t)v30)
    {
      sub_AC98C(v7, v14);
      unint64_t v17 = v5[3];
    }
    ++v16;
    v14 += 32;
  }
  [v7 appendString:@","];
  unint64_t v19 = v6[1];
  unint64_t v18 = v6[2];
  if (v19 >= v18)
  {
    unint64_t v20 = 0;
  }
  else
  {
    unint64_t v20 = 0;
    do
    {
      if (v20 >= v29)
      {
        sub_AC98C(v7, v19);
        unint64_t v18 = v6[2];
      }
      ++v20;
      v19 += 32;
    }
    while (v19 < v18);
  }
  unint64_t v22 = v6[3];
  unint64_t v21 = v6[4];
  while (v22 < v21)
  {
    if (v20 >= v29)
    {
      sub_AC98C(v7, v22);
      unint64_t v21 = v6[4];
    }
    ++v20;
    v22 += 32;
  }
  [v7 appendString:@""]);
  id v28 = 0;
  CFRange v23 = +[BCCFI cfiWithString:v7 error:&v28];
  int v24 = v28;
  if (v24)
  {
    id v25 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v32 = v24;
      _os_log_impl(&def_7D91C, v25, OS_LOG_TYPE_DEFAULT, "Failed to create CFI. %@", buf, 0xCu);
    }
  }
  if (!v23)
  {
    __int16 v26 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v32 = v5;
      __int16 v33 = 2112;
      long long v34 = v6;
      _os_log_impl(&def_7D91C, v26, OS_LOG_TYPE_DEFAULT, "Failed to create CFI from %@ to %@", buf, 0x16u);
    }
  }

  return v23;
}

+ (id)_cfiLocationFromTailOf:(id)a3 toHeadOf:(id)a4
{
  size_t v5 = a3;
  char v6 = a4;
  unint64_t v29 = 0;
  long long v30 = 0;
  unint64_t v7 = 0;
  if (sub_AA068(v5, v6, 0, 1, &v30, &v29) != 1)
  {
    unint64_t v8 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"epubcfi(");
    unint64_t v9 = v5[1];
    unint64_t v10 = 0;
    if (v9 < v5[2] && v30 != 0)
    {
      do
      {
        sub_AC98C(v8, v9);
        ++v10;
        v9 += 32;
      }
      while (v9 < v5[2] && v10 < (unint64_t)v30);
    }
    unint64_t v14 = v5[3];
    unint64_t v13 = v5[4];
    while (v14 < v13)
    {
      if (v10 < (unint64_t)v30)
      {
        sub_AC98C(v8, v14);
        unint64_t v13 = v5[4];
      }
      ++v10;
      v14 += 32;
    }
    [v8 appendString:@","];
    unint64_t v16 = v5[1];
    unint64_t v15 = v5[2];
    if (v16 >= v15)
    {
      unint64_t v17 = 0;
    }
    else
    {
      unint64_t v17 = 0;
      do
      {
        if (v17 >= (unint64_t)v30)
        {
          sub_AC98C(v8, v16);
          unint64_t v15 = v5[2];
        }
        ++v17;
        v16 += 32;
      }
      while (v16 < v15);
    }
    unint64_t v19 = v5[3];
    unint64_t v18 = v5[4];
    while (v19 < v18)
    {
      if (v17 >= (unint64_t)v30)
      {
        sub_AC98C(v8, v19);
        unint64_t v18 = v5[4];
      }
      ++v17;
      v19 += 32;
    }
    [v8 appendString:@","];
    unint64_t v21 = v6[1];
    unint64_t v20 = v6[2];
    if (v21 >= v20)
    {
      unint64_t v22 = 0;
    }
    else
    {
      unint64_t v22 = 0;
      do
      {
        if (v22 >= v29)
        {
          sub_AC98C(v8, v21);
          unint64_t v20 = v6[2];
        }
        ++v22;
        v21 += 32;
      }
      while (v21 < v20);
    }
    unint64_t v23 = v6[3];
    while (v20 < v23)
    {
      if (v22 >= v29)
      {
        sub_AC98C(v8, v20);
        unint64_t v23 = v6[3];
      }
      ++v22;
      v20 += 32;
    }
    [v8 appendString:@""]);
    id v28 = 0;
    unint64_t v7 = +[BCCFI cfiWithString:v8 error:&v28];
    int v24 = v28;
    if (v24)
    {
      id v25 = BCReadingStatisticsLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v32 = v24;
        _os_log_impl(&def_7D91C, v25, OS_LOG_TYPE_DEFAULT, "Failed to create CFI. %@", buf, 0xCu);
      }
    }
    if (!v7)
    {
      __int16 v26 = BCReadingStatisticsLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v32 = v5;
        __int16 v33 = 2112;
        long long v34 = v6;
        _os_log_impl(&def_7D91C, v26, OS_LOG_TYPE_DEFAULT, "Failed to create CFI from %@ to %@", buf, 0x16u);
      }
    }
  }

  return v7;
}

- (void)_setPageIndexOffset:(unint64_t)a3
{
  self->_unint64_t pageIndexOffset = a3;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (unint64_t)pageIndexOffset
{
  return self->_pageIndexOffset;
}

- (void).cxx_destruct
{
}

@end