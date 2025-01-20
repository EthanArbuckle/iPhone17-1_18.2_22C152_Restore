@interface OITSUNumberFormat
+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10;
+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 prefixString:(id)a11 suffixString:(id)a12 scaleFactor:(double)a13 base:(unsigned __int8)a14 basePlaces:(unsigned __int16)a15 baseUseMinusSign:(BOOL)a16 isCustom:(BOOL)a17 formatName:(id)a18;
- (BOOL)baseUseMinusSign;
- (BOOL)canFormatText;
- (BOOL)customFormatShouldAutoInsertPercentSymbol;
- (BOOL)hasValidDecimalPlaces;
- (BOOL)ignoreDecimalPlacesForZeroValue;
- (BOOL)isCustom;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalent:(id)a3;
- (BOOL)isTextFormat;
- (BOOL)requiresParensToBeReplacedWithSpacesForDouble:(double)a3;
- (BOOL)showThousandsSeparator;
- (BOOL)useScientificFormattingAutomatically;
- (BOOL)usesAccountingStyle;
- (BOOL)usesTabs;
- (BOOL)usesTextFormatForValue:(double)a3;
- (NSString)description;
- (OITSUNumberFormat)init;
- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10;
- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 base:(unsigned __int8)a11 basePlaces:(unsigned __int16)a12 baseUseMinusSign:(BOOL)a13;
- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 prefixString:(id)a11 suffixString:(id)a12 isCustom:(BOOL)a13;
- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 prefixString:(id)a11 suffixString:(id)a12 scaleFactor:(double)a13 base:(unsigned __int8)a14 basePlaces:(unsigned __int16)a15 baseUseMinusSign:(BOOL)a16 isCustom:(BOOL)a17 interstitialStrings:(id)a18 interstitialStringInsertionIndexes:(id)a19 indexFromRightOfLastDigitPlaceholder:(unsigned __int16)a20 minimumIntegerWidth:(unsigned __int8)a21 decimalWidth:(unsigned __int8)a22 numberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a23 numberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a24 isTextFormat:(BOOL)a25 formatName:(id)a26 customFormatKey:(id)a27;
- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 suffixString:(id)a11;
- (double)scaleFactor;
- (id)baseStringFromDouble:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currencyCode;
- (id)customFormatKey;
- (id)customNumberFormatTokens;
- (id)formatName;
- (id)formatString;
- (id)initCustomFormatWithFormatString:(id)a3 currencyCode:(id)a4 showThousandsSeparator:(BOOL)a5 fractionAccuracy:(int)a6 scaleFactor:(double)a7 interstitialStrings:(id)a8 interstitialStringInsertionIndexes:(id)a9 indexFromRightOfLastDigitPlaceholder:(unsigned __int16)a10 minimumIntegerWidth:(unsigned __int8)a11 decimalWidth:(unsigned __int8)a12 numberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a13 numberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a14 isTextFormat:(BOOL)a15 formatName:(id)a16;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)numberFormatBySettingNegativeStyle:(int)a3;
- (id)numberFormatBySettingUseAccountingStyle:(BOOL)a3;
- (id)prefixString;
- (id)stringFromDouble:(double)a3 locale:(id)a4;
- (id)stringFromDouble:(double)a3 locale:(id)a4 decimalPlaces:(unsigned __int16)a5 minimumDecimalPlaces:(unsigned __int16)a6;
- (id)stringFromDouble:(double)a3 locale:(id)a4 decimalPlaces:(unsigned __int16)a5 minimumDecimalPlaces:(unsigned __int16)a6 forceSuppressMinusSign:(BOOL)a7;
- (id)stringFromDouble:(double)a3 locale:(id)a4 forceSuppressMinusSign:(BOOL)a5;
- (id)stringFromDouble:(double)a3 locale:(id)a4 minimumDecimalPlaces:(unsigned __int16)a5;
- (id)stringFromDouble:(double)a3 locale:(id)a4 minimumDecimalPlaces:(unsigned __int16)a5 forceSuppressMinusSign:(BOOL)a6;
- (id)stringFromString:(id)a3;
- (id)suffixString;
- (int)fractionAccuracy;
- (int)negativeStyle;
- (int)valueType;
- (unint64_t)hash;
- (unsigned)base;
- (unsigned)basePlaces;
- (unsigned)decimalPlaces;
- (void)dealloc;
- (void)setFormatName:(id)a3;
- (void)setIgnoreDecimalPlacesForZeroValue:(BOOL)a3;
- (void)setUseScientificFormattingAutomatically:(BOOL)a3;
@end

@implementation OITSUNumberFormat

+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10
{
  HIDWORD(v12) = a10;
  LOBYTE(v12) = a9;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", *(void *)&a3, a4, a5, a6, a7, *(void *)&a8, v12);
  return v10;
}

+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 prefixString:(id)a11 suffixString:(id)a12 scaleFactor:(double)a13 base:(unsigned __int8)a14 basePlaces:(unsigned __int16)a15 baseUseMinusSign:(BOOL)a16 isCustom:(BOOL)a17 formatName:(id)a18
{
  BYTE6(v22) = 0;
  *(_DWORD *)((char *)&v22 + 2) = 0;
  LOWORD(v22) = 0;
  BYTE5(v21) = a17;
  BYTE4(v21) = a16;
  WORD1(v21) = a15;
  LOBYTE(v21) = a14;
  HIDWORD(v20) = a10;
  LOBYTE(v20) = a9;
  v18 = objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:", *(void *)&a3, a4, a5, a6, a7, a8, a13, v20, a11, a12, v21, 0, 0,
                  v22,
                  a18,
                  0);
  return v18;
}

- (OITSUNumberFormat)init
{
  HIDWORD(v3) = -1;
  LOBYTE(v3) = 1;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", 0, 0, 2, +[OITSUNumberFormatter currentLocaleCurrencyCode](OITSUNumberFormatter, "currentLocaleCurrencyCode"), 0, 0, v3);
}

- (id)initCustomFormatWithFormatString:(id)a3 currencyCode:(id)a4 showThousandsSeparator:(BOOL)a5 fractionAccuracy:(int)a6 scaleFactor:(double)a7 interstitialStrings:(id)a8 interstitialStringInsertionIndexes:(id)a9 indexFromRightOfLastDigitPlaceholder:(unsigned __int16)a10 minimumIntegerWidth:(unsigned __int8)a11 decimalWidth:(unsigned __int8)a12 numberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a13 numberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a14 isTextFormat:(BOOL)a15 formatName:(id)a16
{
  *(_WORD *)((char *)&v19 + 5) = __PAIR16__(a15, a14);
  *(_WORD *)((char *)&v19 + 3) = __PAIR16__(a13, a12);
  BYTE2(v19) = a11;
  LOWORD(v19) = a10;
  *(_DWORD *)((char *)&v18 + 2) = 16842752;
  LOBYTE(v18) = 10;
  HIDWORD(v17) = a6;
  LOBYTE(v17) = a5;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:", 0, a3, 0, a4, 0, 0, a7, v17, 0, 0, v18, a8, a9,
           v19,
           a16,
           0);
}

- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10
{
  BYTE4(v12) = 1;
  WORD1(v12) = 0;
  LOBYTE(v12) = 10;
  HIDWORD(v11) = a10;
  LOBYTE(v11) = a9;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:", *(void *)&a3, a4, a5, a6, a7, *(void *)&a8, v11, v12);
}

- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 base:(unsigned __int8)a11 basePlaces:(unsigned __int16)a12 baseUseMinusSign:(BOOL)a13
{
  BYTE6(v16) = 0;
  *(_DWORD *)((char *)&v16 + 2) = 0;
  LOWORD(v16) = 0;
  BYTE5(v15) = 0;
  BYTE4(v15) = a13;
  WORD1(v15) = a12;
  LOBYTE(v15) = a11;
  HIDWORD(v14) = a10;
  LOBYTE(v14) = a9;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:", *(void *)&a3, a4, a5, a6, a7, *(void *)&a8, 1.0, v14, 0, 0, v15, 0, 0,
           v16,
           0,
           0);
}

- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 prefixString:(id)a11 suffixString:(id)a12 isCustom:(BOOL)a13
{
  BYTE6(v16) = 0;
  *(_DWORD *)((char *)&v16 + 2) = 0;
  LOWORD(v16) = 0;
  BYTE5(v15) = a13;
  BYTE4(v15) = 1;
  WORD1(v15) = 0;
  LOBYTE(v15) = 10;
  HIDWORD(v14) = a10;
  LOBYTE(v14) = a9;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:", *(void *)&a3, a4, a5, a6, a7, *(void *)&a8, 1.0, v14, a11, a12, v15, 0, 0,
           v16,
           0,
           0);
}

- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 suffixString:(id)a11
{
  LOBYTE(v13) = 0;
  HIDWORD(v12) = a10;
  LOBYTE(v12) = a9;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:isCustom:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:isCustom:", *(void *)&a3, a4, a5, a6, a7, *(void *)&a8, v12, 0, a11, v13);
}

- (OITSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 prefixString:(id)a11 suffixString:(id)a12 scaleFactor:(double)a13 base:(unsigned __int8)a14 basePlaces:(unsigned __int16)a15 baseUseMinusSign:(BOOL)a16 isCustom:(BOOL)a17 interstitialStrings:(id)a18 interstitialStringInsertionIndexes:(id)a19 indexFromRightOfLastDigitPlaceholder:(unsigned __int16)a20 minimumIntegerWidth:(unsigned __int8)a21 decimalWidth:(unsigned __int8)a22 numberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a23 numberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a24 isTextFormat:(BOOL)a25 formatName:(id)a26 customFormatKey:(id)a27
{
  BOOL v29 = a7;
  uint64_t v33 = *(void *)&a3;
  v50.receiver = self;
  v50.super_class = (Class)OITSUNumberFormat;
  v34 = [(OITSUNumberFormat *)&v50 init];
  v35 = v34;
  if (v34)
  {
    v34->mFormatStringContainsTabCharacter = 0;
    BOOL v49 = v29;
    if (a17)
    {
      if (!a4)
      {
        uint64_t v36 = [NSString stringWithUTF8String:"-[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:]"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"], 310, 0, "Passed a nil format string while creating a custom format!");
        +[OITSUAssertionHandler logBacktraceThrottled];
      }
      v35->mFormatString = (NSString *)a4;
      v35->mFormatStringRequiresSuppressionOfMinusSign = 0;
      uint64_t v37 = [a4 length];
      if (v37)
      {
        uint64_t v38 = v37;
        for (uint64_t i = 0; i != v38; ++i)
        {
          int v40 = [a4 characterAtIndex:i];
          p_mFormatStringContainsTabCharacter = &v35->mFormatStringContainsTabCharacter;
          if (v40 != 9)
          {
            p_mFormatStringContainsTabCharacter = &v35->mRequiresFractionReplacement;
            if (v40 != (unsigned __int16)TSUCustomNumberFormatFractionReplacementCharacter) {
              continue;
            }
          }
          BOOL *p_mFormatStringContainsTabCharacter = 1;
        }
      }
    }
    else
    {
      if (v29) {
        unsigned int v42 = 2;
      }
      else {
        unsigned int v42 = a8;
      }
      if (v33 != 1) {
        unsigned int v42 = a8;
      }
      if (v33 == 3) {
        uint64_t v43 = 0;
      }
      else {
        uint64_t v43 = v42;
      }
      if (a4) {
        id v44 = +[OITSUNumberFormatter formatString:a4 transformedForNegativeStyle:v43];
      }
      else {
        id v44 = +[OITSUNumberFormatter defaultFormatStringForValueType:v33 negativeStyle:v43];
      }
      v35->mFormatString = (NSString *)v44;
      v35->mFormatStringRequiresSuppressionOfMinusSign = a8 == 1;
    }
    if (a6)
    {
      v45 = (NSString *)a6;
    }
    else
    {
      uint64_t v46 = [NSString stringWithUTF8String:"-[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v46, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"], 352, 0, "We require the currencyCode from the locale you are using, don't pass in nil.");
      +[OITSUAssertionHandler logBacktraceThrottled];
      uint64_t v47 = [NSString stringWithUTF8String:"-[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"], 353, 0, "No locale passed in, falling to back current locale.");
      +[OITSUAssertionHandler logBacktraceThrottled];
      v45 = (NSString *)(id)objc_msgSend(+[OITSULocale currentLocale](OITSULocale, "currentLocale"), "currencyCode");
    }
    v35->mCurrencyCode = v45;
    v35->mValueType = v33;
    v35->mDecimalPlaces = a5;
    v35->mNegativeStyle = a8;
    v35->mShowThousandsSeparator = a9;
    v35->mUseAccountingStyle = v49;
    v35->mFractionAccuracy = a10;
    v35->mScaleFactor = a13;
    v35->mIsCustom = a17;
    v35->mCustomFormatKey = (NSUUID *)a27;
    v35->mInterstitialStrings = (NSArray *)a18;
    v35->mInterstitialStringInsertionIndexes = (NSIndexSet *)a19;
    v35->mIsTextFormat = a25;
    v35->mIndexFromRightOfLastDigitPlaceholder = a20;
    v35->mMinimumIntegerWidth = a21;
    v35->mDecimalWidth = a22;
    v35->mNumberOfNonSpaceIntegerPlaceholderDigits = a23;
    v35->mNumberOfNonSpaceDecimalPlaceholderDigits = a24;
    v35->mFormatName = (NSString *)a26;
    v35->mBase = a14;
    v35->mBasePlaces = a15;
    v35->mBaseUseMinusSign = a16;
    v35->mSuffixString = (NSString *)[a12 copy];
    v35->mPrefixString = (NSString *)[a11 copy];
    if (a17) {
      v35->mFormatContainsSpecialTokens = 0;
    }
  }
  return v35;
}

- (id)numberFormatBySettingNegativeStyle:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(OITSUNumberFormat *)self valueType];
  id v7 = [(OITSUNumberFormat *)self formatString];
  uint64_t v8 = [(OITSUNumberFormat *)self decimalPlaces];
  id v9 = [(OITSUNumberFormat *)self currencyCode];
  BOOL v10 = [(OITSUNumberFormat *)self usesAccountingStyle];
  BOOL v11 = [(OITSUNumberFormat *)self showThousandsSeparator];
  int v12 = [(OITSUNumberFormat *)self fractionAccuracy];
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = v11;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v3, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (id)numberFormatBySettingUseAccountingStyle:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(OITSUNumberFormat *)self valueType];
  id v7 = [(OITSUNumberFormat *)self formatString];
  uint64_t v8 = [(OITSUNumberFormat *)self decimalPlaces];
  id v9 = [(OITSUNumberFormat *)self currencyCode];
  uint64_t v10 = [(OITSUNumberFormat *)self negativeStyle];
  BOOL v11 = [(OITSUNumberFormat *)self showThousandsSeparator];
  int v12 = [(OITSUNumberFormat *)self fractionAccuracy];
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = v11;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v3, v10, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (void)dealloc
{
  self->mFormatString = 0;
  self->mCurrencyCode = 0;

  self->mInterstitialStrings = 0;
  self->mInterstitialStringInsertionIndexes = 0;

  self->mFormatName = 0;
  self->mPrefixString = 0;

  self->mSuffixString = 0;
  self->mCustomFormatKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)OITSUNumberFormat;
  [(OITSUNumberFormat *)&v3 dealloc];
}

- (void)setFormatName:(id)a3
{
  id v5 = a3;

  self->mFormatName = (NSString *)a3;
}

- (id)formatName
{
  return self->mFormatName;
}

- (BOOL)isCustom
{
  return self->mIsCustom;
}

- (id)customFormatKey
{
  return self->mCustomFormatKey;
}

- (int)valueType
{
  return self->mValueType;
}

- (unsigned)decimalPlaces
{
  if (self->mDecimalPlaces == 0xFFFF) {
    return 0;
  }
  else {
    return self->mDecimalPlaces;
  }
}

- (id)prefixString
{
  return self->mPrefixString;
}

- (id)suffixString
{
  return self->mSuffixString;
}

- (id)formatString
{
  return self->mFormatString;
}

- (id)currencyCode
{
  return self->mCurrencyCode;
}

- (int)negativeStyle
{
  return self->mNegativeStyle;
}

- (BOOL)showThousandsSeparator
{
  return self->mShowThousandsSeparator;
}

- (int)fractionAccuracy
{
  return self->mFractionAccuracy;
}

- (BOOL)usesAccountingStyle
{
  return self->mUseAccountingStyle;
}

- (double)scaleFactor
{
  return self->mScaleFactor;
}

- (BOOL)isTextFormat
{
  return self->mIsTextFormat;
}

- (BOOL)canFormatText
{
  return self->mIsTextFormat;
}

- (BOOL)usesTextFormatForValue:(double)a3
{
  return self->mIsTextFormat;
}

- (unsigned)base
{
  return self->mBase;
}

- (unsigned)basePlaces
{
  return self->mBasePlaces;
}

- (BOOL)baseUseMinusSign
{
  return self->mBaseUseMinusSign;
}

- (BOOL)hasValidDecimalPlaces
{
  return (__int16)self->mDecimalPlaces != -1;
}

- (BOOL)customFormatShouldAutoInsertPercentSymbol
{
  if (!self->mIsCustom)
  {
    uint64_t v3 = [NSString stringWithUTF8String:"-[OITSUNumberFormat customFormatShouldAutoInsertPercentSymbol]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"], 567, 0, "not a custom format!");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  [(OITSUNumberFormat *)self scaleFactor];
  return v4 == 100.0;
}

- (BOOL)useScientificFormattingAutomatically
{
  return self->mUseScientificFormattingAutomatically;
}

- (void)setUseScientificFormattingAutomatically:(BOOL)a3
{
  self->mUseScientificFormattingAutomatically = a3;
}

- (BOOL)ignoreDecimalPlacesForZeroValue
{
  return self->mIgnoreDecimalPlacesForZeroValue;
}

- (void)setIgnoreDecimalPlacesForZeroValue:(BOOL)a3
{
  self->mIgnoreDecimalPlacesForZeroValue = a3;
}

- (BOOL)usesTabs
{
  if (self->mFormatStringContainsTabCharacter) {
    return 1;
  }
  if (self->mValueType == 1) {
    return self->mUseAccountingStyle;
  }
  return 0;
}

- (BOOL)requiresParensToBeReplacedWithSpacesForDouble:(double)a3
{
  return a3 >= 0.0 && (self->mNegativeStyle & 0xFFFFFFFE) == 2;
}

- (id)stringFromDouble:(double)a3 locale:(id)a4 forceSuppressMinusSign:(BOOL)a5
{
  [(OITSUNumberFormat *)self decimalPlaces];
  return -[OITSUNumberFormat stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", a4, a3);
}

- (id)stringFromDouble:(double)a3 locale:(id)a4
{
  [(OITSUNumberFormat *)self decimalPlaces];
  return -[OITSUNumberFormat stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:locale:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", a4, a3);
}

- (id)stringFromDouble:(double)a3 locale:(id)a4 minimumDecimalPlaces:(unsigned __int16)a5 forceSuppressMinusSign:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  uint64_t v11 = [(OITSUNumberFormat *)self decimalPlaces];
  return [(OITSUNumberFormat *)self stringFromDouble:a4 locale:v11 decimalPlaces:v7 minimumDecimalPlaces:v6 forceSuppressMinusSign:a3];
}

- (id)stringFromDouble:(double)a3 locale:(id)a4 minimumDecimalPlaces:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v9 = [(OITSUNumberFormat *)self decimalPlaces];
  return [(OITSUNumberFormat *)self stringFromDouble:a4 locale:v9 decimalPlaces:v5 minimumDecimalPlaces:0 forceSuppressMinusSign:a3];
}

- (id)stringFromDouble:(double)a3 locale:(id)a4 decimalPlaces:(unsigned __int16)a5 minimumDecimalPlaces:(unsigned __int16)a6
{
  return [(OITSUNumberFormat *)self stringFromDouble:a4 locale:a5 decimalPlaces:a6 minimumDecimalPlaces:0 forceSuppressMinusSign:a3];
}

- (id)stringFromDouble:(double)a3 locale:(id)a4 decimalPlaces:(unsigned __int16)a5 minimumDecimalPlaces:(unsigned __int16)a6 forceSuppressMinusSign:(BOOL)a7
{
  int mValueType = self->mValueType;
  uint64_t v15 = [(OITSUNumberFormat *)self formatString];
  id v14 = [(OITSUNumberFormat *)self currencyCode];
  BOOL v13 = [(OITSUNumberFormat *)self hasValidDecimalPlaces];
  HIBYTE(v11) = self->mRequiresFractionReplacement;
  *(_WORD *)((char *)&v11 + 1) = *(_WORD *)&self->mFormatContainsSpecialTokens;
  LOBYTE(v11) = self->mIsCustom;
  HIWORD(v10) = self->mIndexFromRightOfLastDigitPlaceholder;
  WORD2(v10) = *(_WORD *)&self->mNumberOfHashDecimalPlaceholders;
  LODWORD(v10) = *(_DWORD *)&self->mMinimumIntegerWidth;
  return TSUNumberFormatStringFromDouble(mValueType, a5, a6, a7, v15, (uint64_t)v14, v13, self->mInterstitialStrings, a3, self->mScaleFactor, self->mInterstitialStringInsertionIndexes, v10, self->mFormatStringRequiresSuppressionOfMinusSign, self->mIsTextFormat, v11, HIWORD(v11), [(OITSUNumberFormat *)self showThousandsSeparator], self->mUseAccountingStyle, *(_WORD *)&self->mUseScientificFormattingAutomatically,
           self->mBase,
           self->mBasePlaces,
           self->mBaseUseMinusSign,
           self->mFractionAccuracy,
           a4);
}

- (id)stringFromString:(id)a3
{
  if (!self->mIsTextFormat)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"-[OITSUNumberFormat stringFromString:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"], 655, 0, "Attempt to generate a string from a string with a non-text number format!");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  BOOL v6 = (void *)[MEMORY[0x263F089D8] stringWithString:self->mFormatString];
  [v6 replaceOccurrencesOfString:objc_msgSend(NSString, "stringWithFormat:", @"%C", (unsigned __int16)TSUCustomNumberFormatTextReplacementCharacter), a3, 0, 0, objc_msgSend(v6, "length") withString options range];
  return v6;
}

- (BOOL)isEquivalent:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int mValueType = self->mValueType, mValueType == *((_DWORD *)a3 + 2)))
  {
    switch(mValueType)
    {
      case 0:
      case 2:
        if (self->mDecimalPlaces != *((unsigned __int16 *)a3 + 12) || self->mNegativeStyle != *((_DWORD *)a3 + 11)) {
          goto LABEL_22;
        }
        int mShowThousandsSeparator = self->mShowThousandsSeparator;
        int v7 = *((unsigned __int8 *)a3 + 48);
        goto LABEL_18;
      case 1:
        if (self->mDecimalPlaces != *((unsigned __int16 *)a3 + 12)) {
          goto LABEL_22;
        }
        mCurrencyCode = self->mCurrencyCode;
        if ((unint64_t)mCurrencyCode | *((void *)a3 + 4))
        {
          BOOL v8 = -[NSString isEqualToString:](mCurrencyCode, "isEqualToString:");
          if (!v8) {
            return v8;
          }
        }
        if (self->mNegativeStyle != *((_DWORD *)a3 + 11)
          || self->mShowThousandsSeparator != *((unsigned __int8 *)a3 + 48))
        {
          goto LABEL_22;
        }
        int mShowThousandsSeparator = self->mUseAccountingStyle;
        int v7 = *((unsigned __int8 *)a3 + 40);
LABEL_18:
        LOBYTE(v8) = mShowThousandsSeparator == v7;
        break;
      case 3:
        int mShowThousandsSeparator = self->mDecimalPlaces;
        int v7 = *((unsigned __int16 *)a3 + 12);
        goto LABEL_18;
      case 4:
        int mShowThousandsSeparator = self->mFractionAccuracy;
        int v7 = *((_DWORD *)a3 + 13);
        goto LABEL_18;
      case 5:
        if (self->mBase != *((unsigned __int8 *)a3 + 80) || self->mBasePlaces != *((unsigned __int16 *)a3 + 41)) {
          goto LABEL_22;
        }
        int mShowThousandsSeparator = self->mBaseUseMinusSign;
        int v7 = *((unsigned __int8 *)a3 + 84);
        goto LABEL_18;
      default:
        LOBYTE(v8) = [(OITSUNumberFormat *)self isEqual:a3];
        return v8;
    }
  }
  else
  {
LABEL_22:
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)customNumberFormatTokens
{
  return 0;
}

- (unint64_t)hash
{
  int v3 = self->mValueType << 24;
  NSUInteger v27 = [(NSString *)self->mFormatString hash] + v3;
  int v26 = self->mDecimalPlaces << 16;
  NSUInteger v24 = [(NSString *)self->mCurrencyCode hash];
  BOOL mUseAccountingStyle = self->mUseAccountingStyle;
  uint64_t mNegativeStyle = self->mNegativeStyle;
  BOOL mShowThousandsSeparator = self->mShowThousandsSeparator;
  BOOL mFormatStringRequiresSuppressionOfMinusSign = self->mFormatStringRequiresSuppressionOfMinusSign;
  uint64_t mFractionAccuracy = self->mFractionAccuracy;
  BOOL mIsCustom = self->mIsCustom;
  uint64_t v18 = [(NSUUID *)self->mCustomFormatKey hash];
  int mScaleFactor = (int)self->mScaleFactor;
  BOOL mFormatStringContainsTabCharacter = self->mFormatStringContainsTabCharacter;
  BOOL mRequiresFractionReplacement = self->mRequiresFractionReplacement;
  uint64_t v14 = [(NSArray *)self->mInterstitialStrings hash];
  uint64_t v4 = [(NSIndexSet *)self->mInterstitialStringInsertionIndexes hash];
  uint64_t mIndexFromRightOfLastDigitPlaceholder = self->mIndexFromRightOfLastDigitPlaceholder;
  BOOL mIsTextFormat = self->mIsTextFormat;
  uint64_t mMinimumIntegerWidth = self->mMinimumIntegerWidth;
  uint64_t mDecimalWidth = self->mDecimalWidth;
  uint64_t mNumberOfNonSpaceIntegerPlaceholderDigits = self->mNumberOfNonSpaceIntegerPlaceholderDigits;
  uint64_t mNumberOfNonSpaceDecimalPlaceholderDigits = self->mNumberOfNonSpaceDecimalPlaceholderDigits;
  NSUInteger v11 = [(NSString *)self->mFormatName hash];
  NSUInteger v12 = [(NSString *)self->mSuffixString hash];
  return v27
       + v24
       + v26
       + mUseAccountingStyle
       + mNegativeStyle
       + mShowThousandsSeparator
       + mFractionAccuracy
       + mFormatStringRequiresSuppressionOfMinusSign
       + mIsCustom
       + v18
       + mScaleFactor
       + mFormatStringContainsTabCharacter
       + mRequiresFractionReplacement
       + v14
       + v4
       + mIndexFromRightOfLastDigitPlaceholder
       + mIsTextFormat
       + mMinimumIntegerWidth
       + mDecimalWidth
       + mNumberOfNonSpaceIntegerPlaceholderDigits
       + mNumberOfNonSpaceDecimalPlaceholderDigits
       + v11
       + v12
       + [(NSString *)self->mPrefixString hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->mValueType != *((_DWORD *)a3 + 2)) {
    goto LABEL_38;
  }
  mFormatString = self->mFormatString;
  if ((unint64_t)mFormatString | *((void *)a3 + 2))
  {
    int v6 = -[NSString isEqualToString:](mFormatString, "isEqualToString:");
    if (!v6) {
      return v6;
    }
  }
  if (self->mDecimalPlaces != *((unsigned __int16 *)a3 + 12)) {
    goto LABEL_38;
  }
  mCurrencyCode = self->mCurrencyCode;
  if ((unint64_t)mCurrencyCode | *((void *)a3 + 4))
  {
    int v6 = -[NSString isEqualToString:](mCurrencyCode, "isEqualToString:");
    if (!v6) {
      return v6;
    }
  }
  if (self->mUseAccountingStyle != *((unsigned __int8 *)a3 + 40)
    || self->mNegativeStyle != *((_DWORD *)a3 + 11)
    || self->mShowThousandsSeparator != *((unsigned __int8 *)a3 + 48)
    || self->mFractionAccuracy != *((_DWORD *)a3 + 13)
    || self->mFormatStringRequiresSuppressionOfMinusSign != *((unsigned __int8 *)a3 + 56)
    || self->mIsCustom != *((unsigned __int8 *)a3 + 85))
  {
    goto LABEL_38;
  }
  mCustomFormatKey = self->mCustomFormatKey;
  if ((unint64_t)mCustomFormatKey | *((void *)a3 + 17))
  {
    int v6 = -[NSUUID isEqual:](mCustomFormatKey, "isEqual:");
    if (!v6) {
      return v6;
    }
  }
  if (self->mScaleFactor != *((double *)a3 + 11)
    || self->mFormatStringContainsTabCharacter != *((unsigned __int8 *)a3 + 96)
    || self->mRequiresFractionReplacement != *((unsigned __int8 *)a3 + 101))
  {
    goto LABEL_38;
  }
  mInterstitialStrings = self->mInterstitialStrings;
  if ((unint64_t)mInterstitialStrings | *((void *)a3 + 13))
  {
    int v6 = -[NSArray isEqual:](mInterstitialStrings, "isEqual:");
    if (!v6) {
      return v6;
    }
  }
  mInterstitialStringInsertionIndexes = self->mInterstitialStringInsertionIndexes;
  if ((unint64_t)mInterstitialStringInsertionIndexes | *((void *)a3 + 14))
  {
    int v6 = -[NSIndexSet isEqual:](mInterstitialStringInsertionIndexes, "isEqual:");
    if (!v6) {
      return v6;
    }
  }
  if (self->mIndexFromRightOfLastDigitPlaceholder != *((unsigned __int16 *)a3 + 60)
    || self->mIsTextFormat != *((unsigned __int8 *)a3 + 122)
    || self->mMinimumIntegerWidth != *((unsigned __int8 *)a3 + 123)
    || self->mDecimalWidth != *((unsigned __int8 *)a3 + 124)
    || self->mNumberOfNonSpaceIntegerPlaceholderDigits != *((unsigned __int8 *)a3 + 125)
    || self->mNumberOfNonSpaceDecimalPlaceholderDigits != *((unsigned __int8 *)a3 + 126))
  {
    goto LABEL_38;
  }
  mFormatName = self->mFormatName;
  if ((unint64_t)mFormatName | *((void *)a3 + 16))
  {
    int v6 = -[NSString isEqual:](mFormatName, "isEqual:");
    if (!v6) {
      return v6;
    }
  }
  if (self->mBase != *((unsigned __int8 *)a3 + 80)
    || self->mBasePlaces != *((unsigned __int16 *)a3 + 41)
    || self->mBaseUseMinusSign != *((unsigned __int8 *)a3 + 84))
  {
LABEL_38:
    LOBYTE(v6) = 0;
    return v6;
  }
  mSuffixString = self->mSuffixString;
  if (!((unint64_t)mSuffixString | *((void *)a3 + 9))
    || (int v6 = -[NSString isEqual:](mSuffixString, "isEqual:")) != 0)
  {
    mPrefixString = self->mPrefixString;
    if ((unint64_t)mPrefixString | *((void *)a3 + 8))
    {
      LOBYTE(v6) = -[NSString isEqual:](mPrefixString, "isEqual:");
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (NSString)description
{
  int v3 = (NSString *)[MEMORY[0x263F089D8] stringWithCapacity:200];
  [(NSString *)v3 appendFormat:@"TSUNumberFormat[%p]\n", self];
  if (self->mIsCustom) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  [(NSString *)v3 appendFormat:@"Custom Format: %@\n", v4];
  [(NSString *)v3 appendFormat:@"Name: %@\n", self->mFormatName];
  [(NSString *)v3 appendFormat:@"Value Type: %@\n", TSUNumberFormatterStringFromValueType(self->mValueType)];
  [(NSString *)v3 appendFormat:@"Format String: %@\n", self->mFormatString];
  [(NSString *)v3 appendFormat:@"Decimal Places: %d\n", self->mDecimalPlaces];
  [(NSString *)v3 appendFormat:@"Currency Code: %@\n", self->mCurrencyCode];
  if (self->mUseAccountingStyle) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  [(NSString *)v3 appendFormat:@"Use Accounting Style: %@\n", v5];
  [(NSString *)v3 appendFormat:@"Negative Style: %@\n", TSUNumberFormatterStringFromNegativeStyle(self->mNegativeStyle)];
  if (self->mShowThousandsSeparator) {
    int v6 = @"YES";
  }
  else {
    int v6 = @"NO";
  }
  [(NSString *)v3 appendFormat:@"Show Thousands Separator: %@\n", v6];
  [(NSString *)v3 appendFormat:@"Fraction Accuracy: %@\n", TSUNumberFormatterStringFromFractionAccuracy(self->mFractionAccuracy)];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BYTE6(v8) = self->mIsTextFormat;
  *(_DWORD *)((char *)&v8 + 2) = *(_DWORD *)&self->mMinimumIntegerWidth;
  LOWORD(v8) = self->mIndexFromRightOfLastDigitPlaceholder;
  *(_DWORD *)((char *)&v7 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v7) = self->mBase;
  HIDWORD(v6) = self->mFractionAccuracy;
  LOBYTE(v6) = self->mShowThousandsSeparator;
  return (id)objc_msgSend(v4, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:", self->mValueType, self->mFormatString, self->mDecimalPlaces, self->mCurrencyCode, self->mUseAccountingStyle, self->mNegativeStyle, self->mScaleFactor, v6, self->mPrefixString, self->mSuffixString, v7, self->mInterstitialStrings, self->mInterstitialStringInsertionIndexes,
               v8,
               self->mFormatName,
               self->mCustomFormatKey);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[OITSUMutableNumberFormat allocWithZone:a3];
  BYTE6(v8) = self->mIsTextFormat;
  *(_DWORD *)((char *)&v8 + 2) = *(_DWORD *)&self->mMinimumIntegerWidth;
  LOWORD(v8) = self->mIndexFromRightOfLastDigitPlaceholder;
  *(_DWORD *)((char *)&v7 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v7) = self->mBase;
  HIDWORD(v6) = self->mFractionAccuracy;
  LOBYTE(v6) = self->mShowThousandsSeparator;
  return -[OITSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:](v4, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:customFormatKey:", self->mValueType, self->mFormatString, self->mDecimalPlaces, self->mCurrencyCode, self->mUseAccountingStyle, self->mNegativeStyle, self->mScaleFactor, v6, self->mPrefixString, self->mSuffixString, v7, self->mInterstitialStrings, self->mInterstitialStringInsertionIndexes,
           v8,
           self->mFormatName,
           self->mCustomFormatKey);
}

- (id)baseStringFromDouble:(double)a3
{
  return TSUNumberFormatBaseStringFromDouble(self->mBase, self->mBasePlaces, self->mBaseUseMinusSign, a3);
}

@end