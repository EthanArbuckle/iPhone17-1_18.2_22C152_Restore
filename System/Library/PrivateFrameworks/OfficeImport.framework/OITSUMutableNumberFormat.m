@interface OITSUMutableNumberFormat
- (void)p_copyIVarsFromNumberFormat:(id)a3;
- (void)setBase:(unsigned __int8)a3;
- (void)setBasePlaces:(unsigned __int16)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setCustomFormatKey:(id)a3;
- (void)setDecimalPlaces:(unsigned __int16)a3;
- (void)setFractionAccuracy:(int)a3;
- (void)setNegativeStyle:(int)a3;
- (void)setNilValueForKey:(id)a3;
- (void)setPrefixString:(id)a3;
- (void)setShowThousandsSeparator:(BOOL)a3;
- (void)setSuffixString:(id)a3;
- (void)setUseAccountingStyle:(BOOL)a3;
@end

@implementation OITSUMutableNumberFormat

- (void)p_copyIVarsFromNumberFormat:(id)a3
{
  if (a3 == self)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"-[OITSUMutableNumberFormat p_copyIVarsFromNumberFormat:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"], 1133, 0, "It's not safe to copy an object onto itself");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  self->super.mValueType = *((_DWORD *)a3 + 2);

  self->super.mFormatString = (NSString *)*((id *)a3 + 2);
  self->super.mDecimalPlaces = *((_WORD *)a3 + 12);

  self->super.mCurrencyCode = (NSString *)*((id *)a3 + 4);
  self->super.mUseAccountingStyle = *((unsigned char *)a3 + 40);
  self->super.mNegativeStyle = *((_DWORD *)a3 + 11);
  self->super.mShowThousandsSeparator = *((unsigned char *)a3 + 48);
  self->super.mFractionAccuracy = *((_DWORD *)a3 + 13);
  self->super.mFormatStringRequiresSuppressionOfMinusSign = *((unsigned char *)a3 + 56);
  self->super.mUseScientificFormattingAutomatically = *((unsigned char *)a3 + 57);
  self->super.mIgnoreDecimalPlacesForZeroValue = *((unsigned char *)a3 + 58);

  self->super.mPrefixString = (NSString *)*((id *)a3 + 8);
  self->super.mSuffixString = (NSString *)*((id *)a3 + 9);
  self->super.mBase = *((unsigned char *)a3 + 80);
  self->super.mBasePlaces = *((_WORD *)a3 + 41);
  self->super.mBaseUseMinusSign = *((unsigned char *)a3 + 84);
  self->super.mIsCustom = *((unsigned char *)a3 + 85);
  self->super.mCustomFormatKey = (NSUUID *)*((id *)a3 + 17);
  self->super.mScaleFactor = *((double *)a3 + 11);
  self->super.mFormatStringContainsTabCharacter = *((unsigned char *)a3 + 96);
  self->super.mFormatContainsSpecialTokens = *((unsigned char *)a3 + 97);
  self->super.mFormatContainsIntegerToken = *((unsigned char *)a3 + 98);
  self->super.mNumberOfHashDecimalPlaceholders = *((unsigned char *)a3 + 99);
  self->super.mTotalNumberOfDecimalPlaceholdersInFormat = *((unsigned char *)a3 + 100);
  self->super.mRequiresFractionReplacement = *((unsigned char *)a3 + 101);

  self->super.mInterstitialStrings = (NSArray *)*((id *)a3 + 13);
  self->super.mInterstitialStringInsertionIndexes = (NSIndexSet *)*((id *)a3 + 14);
  self->super.mIndexFromRightOfLastDigitPlaceholder = *((_WORD *)a3 + 60);
  self->super.mIsTextFormat = *((unsigned char *)a3 + 122);
  self->super.mMinimumIntegerWidth = *((unsigned char *)a3 + 123);
  self->super.mDecimalWidth = *((unsigned char *)a3 + 124);
  self->super.mNumberOfNonSpaceIntegerPlaceholderDigits = *((unsigned char *)a3 + 125);
  self->super.mNumberOfNonSpaceDecimalPlaceholderDigits = *((unsigned char *)a3 + 126);

  self->super.mFormatName = (NSString *)*((id *)a3 + 16);
}

- (void)setDecimalPlaces:(unsigned __int16)a3
{
  self->super.mDecimalPlaces = a3;
}

- (void)setPrefixString:(id)a3
{
  mPrefixString = self->super.mPrefixString;
  if (mPrefixString != a3)
  {

    self->super.mPrefixString = (NSString *)[a3 copy];
  }
}

- (void)setSuffixString:(id)a3
{
  mSuffixString = self->super.mSuffixString;
  if (mSuffixString != a3)
  {

    self->super.mSuffixString = (NSString *)[a3 copy];
  }
}

- (void)setCurrencyCode:(id)a3
{
  mCurrencyCode = self->super.mCurrencyCode;
  if (mCurrencyCode != a3)
  {

    self->super.mCurrencyCode = (NSString *)[a3 copy];
  }
}

- (void)setNegativeStyle:(int)a3
{
  id v4 = [(OITSUNumberFormat *)self numberFormatBySettingNegativeStyle:*(void *)&a3];
  [(OITSUMutableNumberFormat *)self p_copyIVarsFromNumberFormat:v4];
}

- (void)setShowThousandsSeparator:(BOOL)a3
{
  self->super.mShowThousandsSeparator = a3;
}

- (void)setFractionAccuracy:(int)a3
{
  self->super.mFractionAccuracy = a3;
}

- (void)setUseAccountingStyle:(BOOL)a3
{
  id v4 = [(OITSUNumberFormat *)self numberFormatBySettingUseAccountingStyle:a3];
  [(OITSUMutableNumberFormat *)self p_copyIVarsFromNumberFormat:v4];
}

- (void)setBase:(unsigned __int8)a3
{
  self->super.mBase = a3;
}

- (void)setBasePlaces:(unsigned __int16)a3
{
  self->super.mBasePlaces = a3;
}

- (void)setNilValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"currencyCode"])
  {
    uint64_t v5 = [NSString stringWithUTF8String:"-[OITSUMutableNumberFormat setNilValueForKey:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormat.m"], 1230, 0, "We require a locale to set the currencyCode properly, don't set it to nil.");
    +[OITSUAssertionHandler logBacktraceThrottled];
    v6 = (__CFString *)objc_msgSend(+[OITSULocale currentLocale](OITSULocale, "currentLocale"), "currencyCode");
    v7 = @"currencyCode";
  }
  else if ([a3 isEqualToString:@"prefixString"])
  {
    v6 = &stru_26EBF24D8;
    v7 = @"prefixString";
  }
  else
  {
    if (![a3 isEqualToString:@"suffixString"])
    {
      v8.receiver = self;
      v8.super_class = (Class)OITSUMutableNumberFormat;
      [(OITSUMutableNumberFormat *)&v8 setNilValueForKey:a3];
      return;
    }
    v6 = &stru_26EBF24D8;
    v7 = @"suffixString";
  }
  [(OITSUMutableNumberFormat *)self setValue:v6 forKey:v7];
}

- (void)setCustomFormatKey:(id)a3
{
  mCustomFormatKey = self->super.mCustomFormatKey;
  if (mCustomFormatKey != a3)
  {

    self->super.mCustomFormatKey = (NSUUID *)a3;
  }
}

@end