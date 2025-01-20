@interface TSUMutableNumberFormat
- (void)p_copyIVarsFromNumberFormat:(id)a3;
- (void)setBase:(unsigned __int8)a3;
- (void)setBasePlaces:(unsigned __int16)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDecimalPlaces:(unsigned __int16)a3;
- (void)setFractionAccuracy:(int)a3;
- (void)setNegativeStyle:(int)a3;
- (void)setNilValueForKey:(id)a3;
- (void)setPrefixString:(id)a3;
- (void)setShowThousandsSeparator:(BOOL)a3;
- (void)setSuffixString:(id)a3;
- (void)setUseAccountingStyle:(BOOL)a3;
- (void)setValueType:(int)a3;
@end

@implementation TSUMutableNumberFormat

- (void)p_copyIVarsFromNumberFormat:(id)a3
{
  if (a3 == self)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSUMutableNumberFormat p_copyIVarsFromNumberFormat:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormat.m"), 1562, @"It's not safe to copy an object onto itself");
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

- (void)setValueType:(int)a3
{
  if (self->super.mValueType == a3) {
    return;
  }
  uint64_t v3 = *(void *)&a3;
  if (a3 == 1)
  {
    [(TSUMutableNumberFormat *)self willChangeValueForKey:@"decimalPlaces"];
    [(TSUMutableNumberFormat *)self willChangeValueForKey:@"currencyCode"];
  }
  else if ((a3 - 1) > 1)
  {
    int v5 = 0;
    goto LABEL_7;
  }
  [(TSUMutableNumberFormat *)self willChangeValueForKey:@"showThousandsSeparator"];
  int v5 = 1;
LABEL_7:
  [(TSUMutableNumberFormat *)self p_copyIVarsFromNumberFormat:[(TSUNumberFormat *)self numberFormatBySettingValueType:v3]];
  if (v3 == 1)
  {
    [(TSUMutableNumberFormat *)self didChangeValueForKey:@"decimalPlaces"];
    [(TSUMutableNumberFormat *)self didChangeValueForKey:@"currencyCode"];
  }
  if (v5)
  {
    [(TSUMutableNumberFormat *)self didChangeValueForKey:@"showThousandsSeparator"];
  }
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
  id v4 = [(TSUNumberFormat *)self numberFormatBySettingNegativeStyle:*(void *)&a3];
  [(TSUMutableNumberFormat *)self p_copyIVarsFromNumberFormat:v4];
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
  id v4 = [(TSUNumberFormat *)self numberFormatBySettingUseAccountingStyle:a3];
  [(TSUMutableNumberFormat *)self p_copyIVarsFromNumberFormat:v4];
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
    int v5 = +[TSUNumberFormatter currentLocaleCurrencyCode];
    uint64_t v6 = @"currencyCode";
  }
  else if ([a3 isEqualToString:@"prefixString"])
  {
    int v5 = &stru_26D4F03D0;
    uint64_t v6 = @"prefixString";
  }
  else
  {
    if (![a3 isEqualToString:@"suffixString"])
    {
      v7.receiver = self;
      v7.super_class = (Class)TSUMutableNumberFormat;
      [(TSUMutableNumberFormat *)&v7 setNilValueForKey:a3];
      return;
    }
    int v5 = &stru_26D4F03D0;
    uint64_t v6 = @"suffixString";
  }
  [(TSUMutableNumberFormat *)self setValue:v5 forKey:v6];
}

@end