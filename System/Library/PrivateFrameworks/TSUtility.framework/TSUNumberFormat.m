@interface TSUNumberFormat
+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10;
+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 base:(unsigned __int8)a11 basePlaces:(unsigned __int16)a12 baseUseMinusSign:(BOOL)a13;
+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 prefixString:(id)a11 suffixString:(id)a12 scaleFactor:(double)a13 base:(unsigned __int8)a14 basePlaces:(unsigned __int16)a15 baseUseMinusSign:(BOOL)a16 isCustom:(BOOL)a17 formatName:(id)a18;
+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 scaleFactor:(double)a11 isCustom:(BOOL)a12 formatName:(id)a13;
+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 suffixString:(id)a11;
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
- (TSUNumberFormat)init;
- (TSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10;
- (TSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 base:(unsigned __int8)a11 basePlaces:(unsigned __int16)a12 baseUseMinusSign:(BOOL)a13;
- (TSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 prefixString:(id)a11 suffixString:(id)a12 scaleFactor:(double)a13 base:(unsigned __int8)a14 basePlaces:(unsigned __int16)a15 baseUseMinusSign:(BOOL)a16 isCustom:(BOOL)a17 interstitialStrings:(id)a18 interstitialStringInsertionIndexes:(id)a19 indexFromRightOfLastDigitPlaceholder:(unsigned __int16)a20 minimumIntegerWidth:(unsigned __int8)a21 decimalWidth:(unsigned __int8)a22 numberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a23 numberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a24 isTextFormat:(BOOL)a25 formatName:(id)a26;
- (TSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 suffixString:(id)a11;
- (double)scaleFactor;
- (id)baseStringFromDouble:(double)a3;
- (id)chartLabelStringFromDouble:(double)a3;
- (id)chartLabelStringFromDouble:(double)a3 forceSuppressMinusSign:(BOOL)a4;
- (id)chartLabelStringNofixFromDouble:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currencyCode;
- (id)customNumberFormatTokens;
- (id)formatName;
- (id)formatString;
- (id)fractionStringFromDouble:(double)a3;
- (id)initCustomFormatWithFormatString:(id)a3 currencyCode:(id)a4 showThousandsSeparator:(BOOL)a5 fractionAccuracy:(int)a6 scaleFactor:(double)a7 interstitialStrings:(id)a8 interstitialStringInsertionIndexes:(id)a9 indexFromRightOfLastDigitPlaceholder:(unsigned __int16)a10 minimumIntegerWidth:(unsigned __int8)a11 decimalWidth:(unsigned __int8)a12 numberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a13 numberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a14 isTextFormat:(BOOL)a15 formatName:(id)a16;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)numberFormatByIncrementingDecimalPlaces:(signed __int16)a3;
- (id)numberFormatBySettingBase:(unsigned __int8)a3;
- (id)numberFormatBySettingBasePlaces:(unsigned __int16)a3;
- (id)numberFormatBySettingBaseRepresentNegativeWithMinus:(BOOL)a3;
- (id)numberFormatBySettingCurrencyCode:(id)a3;
- (id)numberFormatBySettingDecimalPlaces:(unsigned __int16)a3;
- (id)numberFormatBySettingDecimalPlaces:(unsigned __int16)a3 andNegativeStyle:(int)a4;
- (id)numberFormatBySettingFractionAccuracy:(int)a3;
- (id)numberFormatBySettingNegativeStyle:(int)a3;
- (id)numberFormatBySettingPrefixString:(id)a3;
- (id)numberFormatBySettingShowThousandsSeparator:(BOOL)a3;
- (id)numberFormatBySettingSuffixString:(id)a3;
- (id)numberFormatBySettingUseAccountingStyle:(BOOL)a3;
- (id)numberFormatBySettingValueType:(int)a3;
- (id)prefixString;
- (id)stringFromDouble:(double)a3;
- (id)stringFromDouble:(double)a3 decimalPlaces:(unsigned __int16)a4 minimumDecimalPlaces:(unsigned __int16)a5;
- (id)stringFromDouble:(double)a3 decimalPlaces:(unsigned __int16)a4 minimumDecimalPlaces:(unsigned __int16)a5 forceSuppressMinusSign:(BOOL)a6;
- (id)stringFromDouble:(double)a3 forceSuppressMinusSign:(BOOL)a4;
- (id)stringFromDouble:(double)a3 minimumDecimalPlaces:(unsigned __int16)a4;
- (id)stringFromDouble:(double)a3 minimumDecimalPlaces:(unsigned __int16)a4 forceSuppressMinusSign:(BOOL)a5;
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

@implementation TSUNumberFormat

+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10
{
  HIDWORD(v12) = a10;
  LOBYTE(v12) = a9;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", *(void *)&a3, a4, a5, a6, a7, *(void *)&a8, v12);
  return v10;
}

+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 suffixString:(id)a11
{
  HIDWORD(v13) = a10;
  LOBYTE(v13) = a9;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:suffixString:", *(void *)&a3, a4, a5, a6, a7, *(void *)&a8, v13, a11);
  return v11;
}

+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 base:(unsigned __int8)a11 basePlaces:(unsigned __int16)a12 baseUseMinusSign:(BOOL)a13
{
  BYTE4(v16) = a13;
  WORD1(v16) = a12;
  LOBYTE(v16) = a11;
  HIDWORD(v15) = a10;
  LOBYTE(v15) = a9;
  uint64_t v13 = objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:", *(void *)&a3, a4, a5, a6, a7, a8, v15, v16);
  return v13;
}

+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 scaleFactor:(double)a11 isCustom:(BOOL)a12 formatName:(id)a13
{
  BYTE6(v17) = 0;
  *(_DWORD *)((char *)&v17 + 2) = 0;
  LOWORD(v17) = 0;
  BYTE5(v16) = a12;
  BYTE4(v16) = 1;
  WORD1(v16) = 0;
  LOBYTE(v16) = 10;
  HIDWORD(v15) = a10;
  LOBYTE(v15) = a9;
  uint64_t v13 = objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", *(void *)&a3, a4, a5, a6, a7, *(void *)&a8, a11, v15, 0, 0, v16, 0, 0,
                  v17,
                  a13);
  return v13;
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
  v18 = objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", *(void *)&a3, a4, a5, a6, a7, a8, a13, v20, a11, a12, v21, 0, 0,
                  v22,
                  a18);
  return v18;
}

- (TSUNumberFormat)init
{
  HIDWORD(v3) = -1;
  LOBYTE(v3) = 1;
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", 0, 0, 2, 0, 0, 0, v3);
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
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", 0, a3, 0, a4, 0, 0, a7, v17, 0, 0, v18, a8, a9, v19,
           a16);
}

- (TSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10
{
  BYTE4(v12) = 1;
  WORD1(v12) = 0;
  LOBYTE(v12) = 10;
  HIDWORD(v11) = a10;
  LOBYTE(v11) = a9;
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:", *(void *)&a3, a4, a5, a6, a7, *(void *)&a8, v11, v12);
}

- (TSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 base:(unsigned __int8)a11 basePlaces:(unsigned __int16)a12 baseUseMinusSign:(BOOL)a13
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
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", *(void *)&a3, a4, a5, a6, a7, *(void *)&a8, 1.0, v14, 0, 0, v15, 0, 0, v16,
           0);
}

- (TSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 suffixString:(id)a11
{
  BYTE6(v14) = 0;
  *(_DWORD *)((char *)&v14 + 2) = 0;
  LOWORD(v14) = 0;
  *(_DWORD *)((char *)&v13 + 2) = 0x10000;
  LOBYTE(v13) = 10;
  HIDWORD(v12) = a10;
  LOBYTE(v12) = a9;
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:](self, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", *(void *)&a3, a4, a5, a6, a7, *(void *)&a8, 1.0, v12, 0, a11, v13, 0, 0, v14,
           0);
}

- (TSUNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 prefixString:(id)a11 suffixString:(id)a12 scaleFactor:(double)a13 base:(unsigned __int8)a14 basePlaces:(unsigned __int16)a15 baseUseMinusSign:(BOOL)a16 isCustom:(BOOL)a17 interstitialStrings:(id)a18 interstitialStringInsertionIndexes:(id)a19 indexFromRightOfLastDigitPlaceholder:(unsigned __int16)a20 minimumIntegerWidth:(unsigned __int8)a21 decimalWidth:(unsigned __int8)a22 numberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a23 numberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a24 isTextFormat:(BOOL)a25 formatName:(id)a26
{
  BOOL v28 = a7;
  v48.receiver = self;
  uint64_t v31 = *(void *)&a3;
  v48.super_class = (Class)TSUNumberFormat;
  v32 = [(TSUNumberFormat *)&v48 init];
  v33 = v32;
  if (v32)
  {
    v32->mFormatStringContainsTabCharacter = 0;
    BOOL v46 = v28;
    if (a17)
    {
      if (!a4)
      {
        id v34 = +[TSUAssertionHandler currentHandler];
        uint64_t v35 = [NSString stringWithUTF8String:"-[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:]"];
        objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormat.m"), 376, @"Passed a nil format string while creating a custom format!");
      }
      v33->mFormatString = (NSString *)a4;
      v33->mFormatStringRequiresSuppressionOfMinusSign = 0;
      uint64_t v36 = [a4 length];
      if (v36)
      {
        uint64_t v37 = v36;
        for (uint64_t i = 0; i != v37; ++i)
        {
          int v39 = [a4 characterAtIndex:i];
          p_mFormatStringContainsTabCharacter = &v33->mFormatStringContainsTabCharacter;
          if (v39 != 9)
          {
            p_mFormatStringContainsTabCharacter = &v33->mRequiresFractionReplacement;
            if (v39 != (unsigned __int16)TSUCustomNumberFormatFractionReplacementCharacter) {
              continue;
            }
          }
          BOOL *p_mFormatStringContainsTabCharacter = 1;
        }
      }
    }
    else
    {
      if (v28) {
        unsigned int v41 = 2;
      }
      else {
        unsigned int v41 = a8;
      }
      if (v31 != 1) {
        unsigned int v41 = a8;
      }
      if (v31 == 3) {
        uint64_t v42 = 0;
      }
      else {
        uint64_t v42 = v41;
      }
      if (a4) {
        id v43 = +[TSUNumberFormatter formatString:a4 transformedForNegativeStyle:v42];
      }
      else {
        id v43 = +[TSUNumberFormatter defaultFormatStringForValueType:v31 negativeStyle:v42];
      }
      v33->mFormatString = (NSString *)v43;
      v33->mFormatStringRequiresSuppressionOfMinusSign = a8 == 1;
    }
    if (a6) {
      v44 = (NSString *)a6;
    }
    else {
      v44 = (NSString *)+[TSUNumberFormatter currentLocaleCurrencyCode];
    }
    v33->mCurrencyCode = v44;
    v33->mValueType = v31;
    v33->mDecimalPlaces = a5;
    v33->mNegativeStyle = a8;
    v33->mShowThousandsSeparator = a9;
    v33->mUseAccountingStyle = v46;
    v33->mFractionAccuracy = a10;
    v33->mScaleFactor = a13;
    v33->mIsCustom = a17;
    v33->mInterstitialStrings = (NSArray *)a18;
    v33->mInterstitialStringInsertionIndexes = (NSIndexSet *)a19;
    v33->mIsTextFormat = a25;
    v33->mIndexFromRightOfLastDigitPlaceholder = a20;
    v33->mMinimumIntegerWidth = a21;
    v33->mDecimalWidth = a22;
    v33->mNumberOfNonSpaceIntegerPlaceholderDigits = a23;
    v33->mNumberOfNonSpaceDecimalPlaceholderDigits = a24;
    v33->mFormatName = (NSString *)a26;
    v33->mBase = a14;
    v33->mBasePlaces = a15;
    v33->mBaseUseMinusSign = a16;
    v33->mSuffixString = (NSString *)[a12 copy];
    v33->mPrefixString = (NSString *)[a11 copy];
    if (a17) {
      v33->mFormatContainsSpecialTokens = 0;
    }
  }
  return v33;
}

- (id)numberFormatBySettingValueType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(TSUNumberFormat *)self valueType];
  if ((v3 - 1) <= 1 && v5 == v3)
  {
    v6 = (void *)[(TSUNumberFormat *)self copy];
    return v6;
  }
  else
  {
    uint64_t v8 = [(TSUNumberFormat *)self decimalPlaces];
    id v9 = [(TSUNumberFormat *)self currencyCode];
    if (v3 == 1)
    {
      uint64_t v8 = +[TSUNumberFormatter defaultDecimalPlacesForCurrencyCode:](TSUNumberFormatter, "defaultDecimalPlacesForCurrencyCode:", +[TSUNumberFormatter currentLocaleCurrencyCode]);
      id v10 = 0;
    }
    else
    {
      id v10 = v9;
    }
    BOOL v11 = [(TSUNumberFormat *)self showThousandsSeparator];
    char v12 = (v3 - 1) < 2 || v11;
    uint64_t v13 = objc_opt_class();
    BOOL v14 = [(TSUNumberFormat *)self usesAccountingStyle];
    uint64_t v15 = [(TSUNumberFormat *)self negativeStyle];
    int v16 = [(TSUNumberFormat *)self fractionAccuracy];
    BYTE5(v18) = 0;
    BYTE4(v18) = self->mBaseUseMinusSign;
    WORD1(v18) = self->mBasePlaces;
    LOBYTE(v18) = self->mBase;
    HIDWORD(v17) = v16;
    LOBYTE(v17) = v12;
    return (id)objc_msgSend(v13, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v3, 0, v8, v10, v14, v15, 1.0, v17, self->mPrefixString, self->mSuffixString, v18, 0);
  }
}

- (id)numberFormatBySettingDecimalPlaces:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = objc_opt_class();
  uint64_t v6 = [(TSUNumberFormat *)self valueType];
  id v7 = [(TSUNumberFormat *)self formatString];
  id v8 = [(TSUNumberFormat *)self currencyCode];
  BOOL v9 = [(TSUNumberFormat *)self usesAccountingStyle];
  uint64_t v10 = [(TSUNumberFormat *)self negativeStyle];
  BOOL v11 = [(TSUNumberFormat *)self showThousandsSeparator];
  int v12 = [(TSUNumberFormat *)self fractionAccuracy];
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = v11;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v3, v8, v9, v10, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (id)numberFormatBySettingPrefixString:(id)a3
{
  int v5 = objc_opt_class();
  uint64_t v6 = [(TSUNumberFormat *)self valueType];
  id v7 = [(TSUNumberFormat *)self formatString];
  uint64_t v8 = [(TSUNumberFormat *)self decimalPlaces];
  id v9 = [(TSUNumberFormat *)self currencyCode];
  BOOL v10 = [(TSUNumberFormat *)self usesAccountingStyle];
  uint64_t v11 = [(TSUNumberFormat *)self negativeStyle];
  BOOL v12 = [(TSUNumberFormat *)self showThousandsSeparator];
  int v13 = [(TSUNumberFormat *)self fractionAccuracy];
  *(_DWORD *)((char *)&v16 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v16) = self->mBase;
  HIDWORD(v15) = v13;
  LOBYTE(v15) = v12;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v15, a3, self->mSuffixString, v16, self->mFormatName);
}

- (id)numberFormatBySettingSuffixString:(id)a3
{
  int v5 = objc_opt_class();
  uint64_t v6 = [(TSUNumberFormat *)self valueType];
  id v7 = [(TSUNumberFormat *)self formatString];
  uint64_t v8 = [(TSUNumberFormat *)self decimalPlaces];
  id v9 = [(TSUNumberFormat *)self currencyCode];
  BOOL v10 = [(TSUNumberFormat *)self usesAccountingStyle];
  uint64_t v11 = [(TSUNumberFormat *)self negativeStyle];
  BOOL v12 = [(TSUNumberFormat *)self showThousandsSeparator];
  int v13 = [(TSUNumberFormat *)self fractionAccuracy];
  *(_DWORD *)((char *)&v16 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v16) = self->mBase;
  HIDWORD(v15) = v13;
  LOBYTE(v15) = v12;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v15, self->mPrefixString, a3, v16, self->mFormatName);
}

- (id)numberFormatByIncrementingDecimalPlaces:(signed __int16)a3
{
  int v3 = a3;
  unsigned int v5 = [(TSUNumberFormat *)self decimalPlaces];
  if ((v3 & 0x80000000) == 0 || (unsigned __int16 v6 = 0, -v3 <= v5)) {
    unsigned __int16 v6 = v5 + v3;
  }
  if (v6 >= (unsigned __int16)kTSUNumberFormatUserMaxNumberOfDecimalPlaces) {
    uint64_t v7 = (unsigned __int16)kTSUNumberFormatUserMaxNumberOfDecimalPlaces;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(TSUNumberFormat *)self valueType];
  id v10 = [(TSUNumberFormat *)self formatString];
  id v11 = [(TSUNumberFormat *)self currencyCode];
  BOOL v12 = [(TSUNumberFormat *)self usesAccountingStyle];
  uint64_t v13 = [(TSUNumberFormat *)self negativeStyle];
  BOOL v14 = [(TSUNumberFormat *)self showThousandsSeparator];
  int v15 = [(TSUNumberFormat *)self fractionAccuracy];
  BYTE4(v18) = self->mBaseUseMinusSign;
  WORD1(v18) = self->mBasePlaces;
  LOBYTE(v18) = self->mBase;
  HIDWORD(v17) = v15;
  LOBYTE(v17) = v14;
  return (id)objc_msgSend(v8, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:", v9, v10, v7, v11, v12, v13, v17, v18);
}

- (id)numberFormatBySettingCurrencyCode:(id)a3
{
  unsigned int v5 = objc_opt_class();
  uint64_t v6 = [(TSUNumberFormat *)self valueType];
  id v7 = [(TSUNumberFormat *)self formatString];
  uint64_t v8 = [(TSUNumberFormat *)self decimalPlaces];
  BOOL v9 = [(TSUNumberFormat *)self usesAccountingStyle];
  uint64_t v10 = [(TSUNumberFormat *)self negativeStyle];
  BOOL v11 = [(TSUNumberFormat *)self showThousandsSeparator];
  int v12 = [(TSUNumberFormat *)self fractionAccuracy];
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = v11;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, a3, v9, v10, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (id)numberFormatBySettingNegativeStyle:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = objc_opt_class();
  uint64_t v6 = [(TSUNumberFormat *)self valueType];
  id v7 = [(TSUNumberFormat *)self formatString];
  uint64_t v8 = [(TSUNumberFormat *)self decimalPlaces];
  id v9 = [(TSUNumberFormat *)self currencyCode];
  BOOL v10 = [(TSUNumberFormat *)self usesAccountingStyle];
  BOOL v11 = [(TSUNumberFormat *)self showThousandsSeparator];
  int v12 = [(TSUNumberFormat *)self fractionAccuracy];
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = v11;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v3, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (id)numberFormatBySettingDecimalPlaces:(unsigned __int16)a3 andNegativeStyle:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  id v7 = objc_opt_class();
  uint64_t v8 = [(TSUNumberFormat *)self valueType];
  id v9 = [(TSUNumberFormat *)self formatString];
  id v10 = [(TSUNumberFormat *)self currencyCode];
  BOOL v11 = [(TSUNumberFormat *)self usesAccountingStyle];
  BOOL v12 = [(TSUNumberFormat *)self showThousandsSeparator];
  int v13 = [(TSUNumberFormat *)self fractionAccuracy];
  *(_DWORD *)((char *)&v16 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v16) = self->mBase;
  HIDWORD(v15) = v13;
  LOBYTE(v15) = v12;
  return (id)objc_msgSend(v7, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v8, v9, v5, v10, v11, v4, self->mScaleFactor, v15, self->mPrefixString, self->mSuffixString, v16, self->mFormatName);
}

- (id)numberFormatBySettingShowThousandsSeparator:(BOOL)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(TSUNumberFormat *)self valueType];
  id v7 = [(TSUNumberFormat *)self formatString];
  uint64_t v8 = [(TSUNumberFormat *)self decimalPlaces];
  id v9 = [(TSUNumberFormat *)self currencyCode];
  BOOL v10 = [(TSUNumberFormat *)self usesAccountingStyle];
  uint64_t v11 = [(TSUNumberFormat *)self negativeStyle];
  int v12 = [(TSUNumberFormat *)self fractionAccuracy];
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = a3;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (id)numberFormatBySettingFractionAccuracy:(int)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(TSUNumberFormat *)self valueType];
  id v7 = [(TSUNumberFormat *)self formatString];
  uint64_t v8 = [(TSUNumberFormat *)self decimalPlaces];
  id v9 = [(TSUNumberFormat *)self currencyCode];
  BOOL v10 = [(TSUNumberFormat *)self usesAccountingStyle];
  uint64_t v11 = [(TSUNumberFormat *)self negativeStyle];
  BOOL v12 = [(TSUNumberFormat *)self showThousandsSeparator];
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = a3;
  LOBYTE(v14) = v12;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (id)numberFormatBySettingUseAccountingStyle:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(TSUNumberFormat *)self valueType];
  id v7 = [(TSUNumberFormat *)self formatString];
  uint64_t v8 = [(TSUNumberFormat *)self decimalPlaces];
  id v9 = [(TSUNumberFormat *)self currencyCode];
  uint64_t v10 = [(TSUNumberFormat *)self negativeStyle];
  BOOL v11 = [(TSUNumberFormat *)self showThousandsSeparator];
  int v12 = [(TSUNumberFormat *)self fractionAccuracy];
  *(_DWORD *)((char *)&v15 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v15) = self->mBase;
  HIDWORD(v14) = v12;
  LOBYTE(v14) = v11;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v3, v10, self->mScaleFactor, v14, self->mPrefixString, self->mSuffixString, v15, self->mFormatName);
}

- (id)numberFormatBySettingBase:(unsigned __int8)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(TSUNumberFormat *)self valueType];
  id v7 = [(TSUNumberFormat *)self formatString];
  uint64_t v8 = [(TSUNumberFormat *)self decimalPlaces];
  id v9 = [(TSUNumberFormat *)self currencyCode];
  BOOL v10 = [(TSUNumberFormat *)self usesAccountingStyle];
  uint64_t v11 = [(TSUNumberFormat *)self negativeStyle];
  BOOL v12 = [(TSUNumberFormat *)self showThousandsSeparator];
  int v13 = [(TSUNumberFormat *)self fractionAccuracy];
  *(_DWORD *)((char *)&v16 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v16) = a3;
  HIDWORD(v15) = v13;
  LOBYTE(v15) = v12;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v15, self->mPrefixString, self->mSuffixString, v16, self->mFormatName);
}

- (id)numberFormatBySettingBasePlaces:(unsigned __int16)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(TSUNumberFormat *)self valueType];
  id v7 = [(TSUNumberFormat *)self formatString];
  uint64_t v8 = [(TSUNumberFormat *)self decimalPlaces];
  id v9 = [(TSUNumberFormat *)self currencyCode];
  BOOL v10 = [(TSUNumberFormat *)self usesAccountingStyle];
  uint64_t v11 = [(TSUNumberFormat *)self negativeStyle];
  BOOL v12 = [(TSUNumberFormat *)self showThousandsSeparator];
  int v13 = [(TSUNumberFormat *)self fractionAccuracy];
  WORD2(v16) = *(_WORD *)&self->mBaseUseMinusSign;
  WORD1(v16) = a3;
  LOBYTE(v16) = self->mBase;
  HIDWORD(v15) = v13;
  LOBYTE(v15) = v12;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v15, self->mPrefixString, self->mSuffixString, v16, self->mFormatName);
}

- (id)numberFormatBySettingBaseRepresentNegativeWithMinus:(BOOL)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(TSUNumberFormat *)self valueType];
  id v7 = [(TSUNumberFormat *)self formatString];
  uint64_t v8 = [(TSUNumberFormat *)self decimalPlaces];
  id v9 = [(TSUNumberFormat *)self currencyCode];
  BOOL v10 = [(TSUNumberFormat *)self usesAccountingStyle];
  uint64_t v11 = [(TSUNumberFormat *)self negativeStyle];
  BOOL v12 = [(TSUNumberFormat *)self showThousandsSeparator];
  int v13 = [(TSUNumberFormat *)self fractionAccuracy];
  BYTE5(v16) = self->mIsCustom;
  BYTE4(v16) = a3;
  WORD1(v16) = self->mBasePlaces;
  LOBYTE(v16) = self->mBase;
  HIDWORD(v15) = v13;
  LOBYTE(v15) = v12;
  return (id)objc_msgSend(v5, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:formatName:", v6, v7, v8, v9, v10, v11, self->mScaleFactor, v15, self->mPrefixString, self->mSuffixString, v16, self->mFormatName);
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
  v3.receiver = self;
  v3.super_class = (Class)TSUNumberFormat;
  [(TSUNumberFormat *)&v3 dealloc];
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

- (int)valueType
{
  return self->mValueType;
}

- (unsigned)decimalPlaces
{
  if (self->mDecimalPlaces == kTSUNumberFormatInvalidDecimalPlaces) {
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
  return self->mDecimalPlaces != kTSUNumberFormatInvalidDecimalPlaces;
}

- (BOOL)customFormatShouldAutoInsertPercentSymbol
{
  if (!self->mIsCustom)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSUNumberFormat customFormatShouldAutoInsertPercentSymbol]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormat.m"), 908, @"not a custom format!");
  }
  [(TSUNumberFormat *)self scaleFactor];
  return v5 == 100.0;
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

- (id)chartLabelStringNofixFromDouble:(double)a3
{
  int v5 = [(TSUNumberFormat *)self decimalPlaces];
  if (v5 == (unsigned __int16)kTSUNumberFormatterDecimalPlacesAsManyAsNecessary)
  {
    return [(TSUNumberFormat *)self stringFromDouble:3 decimalPlaces:0 minimumDecimalPlaces:0 forceSuppressMinusSign:a3];
  }
  else
  {
    return [(TSUNumberFormat *)self stringFromDouble:0 forceSuppressMinusSign:a3];
  }
}

- (id)chartLabelStringFromDouble:(double)a3
{
  int v5 = [(TSUNumberFormat *)self decimalPlaces];
  if (v5 == (unsigned __int16)kTSUNumberFormatterDecimalPlacesAsManyAsNecessary) {
    id v6 = [(TSUNumberFormat *)self stringFromDouble:3 decimalPlaces:0 minimumDecimalPlaces:0 forceSuppressMinusSign:a3];
  }
  else {
    id v6 = [(TSUNumberFormat *)self stringFromDouble:0 forceSuppressMinusSign:a3];
  }
  id v7 = v6;
  if (self->mPrefixString && (uint64_t v8 = objc_msgSend(NSString, "stringWithString:")) != 0) {
    id result = (id)[v8 stringByAppendingString:v7];
  }
  else {
    id result = (id)[NSString stringWithString:v7];
  }
  if (self->mSuffixString)
  {
    return (id)objc_msgSend(result, "stringByAppendingString:");
  }
  return result;
}

- (id)chartLabelStringFromDouble:(double)a3 forceSuppressMinusSign:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = [(TSUNumberFormat *)self decimalPlaces];
  if (v7 == (unsigned __int16)kTSUNumberFormatterDecimalPlacesAsManyAsNecessary) {
    id v8 = [(TSUNumberFormat *)self stringFromDouble:3 decimalPlaces:0 minimumDecimalPlaces:v4 forceSuppressMinusSign:a3];
  }
  else {
    id v8 = [(TSUNumberFormat *)self stringFromDouble:v4 forceSuppressMinusSign:a3];
  }
  id v9 = v8;
  if (self->mPrefixString && (BOOL v10 = objc_msgSend(NSString, "stringWithString:")) != 0) {
    id result = (id)[v10 stringByAppendingString:v9];
  }
  else {
    id result = (id)[NSString stringWithString:v9];
  }
  if (self->mSuffixString)
  {
    return (id)objc_msgSend(result, "stringByAppendingString:");
  }
  return result;
}

- (id)stringFromDouble:(double)a3 forceSuppressMinusSign:(BOOL)a4
{
  [(TSUNumberFormat *)self decimalPlaces];
  return -[TSUNumberFormat stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", a3);
}

- (id)stringFromDouble:(double)a3
{
  [(TSUNumberFormat *)self decimalPlaces];
  return -[TSUNumberFormat stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:](self, "stringFromDouble:decimalPlaces:minimumDecimalPlaces:forceSuppressMinusSign:", a3);
}

- (id)stringFromDouble:(double)a3 minimumDecimalPlaces:(unsigned __int16)a4 forceSuppressMinusSign:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  uint64_t v9 = [(TSUNumberFormat *)self decimalPlaces];
  return [(TSUNumberFormat *)self stringFromDouble:v9 decimalPlaces:v6 minimumDecimalPlaces:v5 forceSuppressMinusSign:a3];
}

- (id)stringFromDouble:(double)a3 minimumDecimalPlaces:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v7 = [(TSUNumberFormat *)self decimalPlaces];
  return [(TSUNumberFormat *)self stringFromDouble:v7 decimalPlaces:v4 minimumDecimalPlaces:0 forceSuppressMinusSign:a3];
}

- (id)stringFromDouble:(double)a3 decimalPlaces:(unsigned __int16)a4 minimumDecimalPlaces:(unsigned __int16)a5
{
  return [(TSUNumberFormat *)self stringFromDouble:a4 decimalPlaces:a5 minimumDecimalPlaces:0 forceSuppressMinusSign:a3];
}

- (id)stringFromDouble:(double)a3 decimalPlaces:(unsigned __int16)a4 minimumDecimalPlaces:(unsigned __int16)a5 forceSuppressMinusSign:(BOOL)a6
{
  BOOL v17 = a6;
  int mValueType = self->mValueType;
  int v13 = [(TSUNumberFormat *)self formatString];
  BOOL v12 = [(TSUNumberFormat *)self currencyCode];
  BOOL v11 = [(TSUNumberFormat *)self hasValidDecimalPlaces];
  HIBYTE(v10) = self->mRequiresFractionReplacement;
  *(_WORD *)((char *)&v10 + 1) = *(_WORD *)&self->mFormatContainsSpecialTokens;
  LOBYTE(v10) = self->mIsCustom;
  HIWORD(v9) = self->mIndexFromRightOfLastDigitPlaceholder;
  WORD2(v9) = *(_WORD *)&self->mNumberOfHashDecimalPlaceholders;
  LODWORD(v9) = *(_DWORD *)&self->mMinimumIntegerWidth;
  return TSUNumberFormatStringFromDouble(mValueType, a4, a5, v17, v13, v12, v11, self->mInterstitialStrings, a3, self->mScaleFactor, self->mInterstitialStringInsertionIndexes, v9, self->mFormatStringRequiresSuppressionOfMinusSign, self->mIsTextFormat, v10, HIWORD(v10), [(TSUNumberFormat *)self showThousandsSeparator], self->mUseAccountingStyle, *(_WORD *)&self->mUseScientificFormattingAutomatically,
           self->mBase,
           self->mBasePlaces,
           self->mBaseUseMinusSign,
           self->mFractionAccuracy);
}

- (id)stringFromString:(id)a3
{
  if (!self->mIsTextFormat)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSUNumberFormat stringFromString:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormat.m"), 1076, @"Attempt to generate a string from a string with a non-text number format!");
  }
  uint64_t v7 = (void *)[MEMORY[0x263F089D8] stringWithString:self->mFormatString];
  [v7 replaceOccurrencesOfString:objc_msgSend(NSString, "stringWithFormat:", @"%C", (unsigned __int16)TSUCustomNumberFormatTextReplacementCharacter), a3, 0, 0, objc_msgSend(v7, "length") withString options range];
  return v7;
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
        LOBYTE(v8) = [(TSUNumberFormat *)self isEqual:a3];
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
  NSUInteger v26 = [(NSString *)self->mFormatString hash] + v3;
  int v25 = self->mDecimalPlaces << 16;
  NSUInteger v23 = [(NSString *)self->mCurrencyCode hash];
  BOOL mUseAccountingStyle = self->mUseAccountingStyle;
  uint64_t mNegativeStyle = self->mNegativeStyle;
  BOOL mShowThousandsSeparator = self->mShowThousandsSeparator;
  BOOL mFormatStringRequiresSuppressionOfMinusSign = self->mFormatStringRequiresSuppressionOfMinusSign;
  uint64_t mFractionAccuracy = self->mFractionAccuracy;
  BOOL mIsCustom = self->mIsCustom;
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
  return v26
       + v23
       + v25
       + mUseAccountingStyle
       + mNegativeStyle
       + mShowThousandsSeparator
       + mFractionAccuracy
       + mFormatStringRequiresSuppressionOfMinusSign
       + mIsCustom
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
    goto LABEL_36;
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
    goto LABEL_36;
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
    || self->mIsCustom != *((unsigned __int8 *)a3 + 85)
    || self->mScaleFactor != *((double *)a3 + 11)
    || self->mFormatStringContainsTabCharacter != *((unsigned __int8 *)a3 + 96)
    || self->mRequiresFractionReplacement != *((unsigned __int8 *)a3 + 101))
  {
    goto LABEL_36;
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
    goto LABEL_36;
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
LABEL_36:
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
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
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
  return (id)objc_msgSend(v4, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", self->mValueType, self->mFormatString, self->mDecimalPlaces, self->mCurrencyCode, self->mUseAccountingStyle, self->mNegativeStyle, self->mScaleFactor, v6, self->mPrefixString, self->mSuffixString, v7, self->mInterstitialStrings, self->mInterstitialStringInsertionIndexes,
               v8,
               self->mFormatName);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[TSUMutableNumberFormat allocWithZone:a3];
  BYTE6(v8) = self->mIsTextFormat;
  *(_DWORD *)((char *)&v8 + 2) = *(_DWORD *)&self->mMinimumIntegerWidth;
  LOWORD(v8) = self->mIndexFromRightOfLastDigitPlaceholder;
  *(_DWORD *)((char *)&v7 + 2) = *(_DWORD *)&self->mBasePlaces;
  LOBYTE(v7) = self->mBase;
  HIDWORD(v6) = self->mFractionAccuracy;
  LOBYTE(v6) = self->mShowThousandsSeparator;
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:](v4, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:prefixString:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", self->mValueType, self->mFormatString, self->mDecimalPlaces, self->mCurrencyCode, self->mUseAccountingStyle, self->mNegativeStyle, self->mScaleFactor, v6, self->mPrefixString, self->mSuffixString, v7, self->mInterstitialStrings, self->mInterstitialStringInsertionIndexes, v8,
           self->mFormatName);
}

- (id)fractionStringFromDouble:(double)a3
{
  return (id)TSUNumberFormatFractionStringFromDouble(self->mFractionAccuracy, a3);
}

- (id)baseStringFromDouble:(double)a3
{
  return TSUNumberFormatBaseStringFromDouble(self->mBase, self->mBasePlaces, self->mBaseUseMinusSign, a3);
}

@end