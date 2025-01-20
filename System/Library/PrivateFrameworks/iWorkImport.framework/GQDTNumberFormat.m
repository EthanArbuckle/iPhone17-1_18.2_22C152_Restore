@interface GQDTNumberFormat
+ (BOOL)needToSuppressMinusSignForFormatString:(__CFString *)a3;
+ (const)stateForReading;
+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 suffixString:(__CFString *)a11;
- (BOOL)hasValidDecimalPlaces;
- (BOOL)isCustom;
- (BOOL)isTextFormat;
- (BOOL)showThousandsSeparator;
- (BOOL)useAccountingStyle;
- (GQDTNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 suffixString:(__CFString *)a11 scaleFactor:(double)a12 base:(unsigned __int16)a13 basePlaces:(unsigned __int16)a14 baseUseMinusSign:(BOOL)a15 isCustom:(BOOL)a16 interstitialStrings:(id)a17 interstitialStringInsertionIndexes:(id)a18 indexFromRightOfLastDigitPlaceholder:(unsigned __int16)a19 minimumIntegerWidth:(unsigned __int8)a20 decimalWidth:(unsigned __int8)a21 numberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a22 numberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a23 isTextFormat:(BOOL)a24 formatName:(id)a25;
- (__CFString)createStringFromDouble:(double)a3;
- (id)baseStringFromDouble:(double)a3;
- (id)currencyCode;
- (id)customNumberFormatTokens;
- (id)formatString;
- (id)fractionStringFromDouble:(double)a3;
- (id)numberFormatBySettingNegativeStyle:(int)a3;
- (id)numberFormatBySettingValueType:(int)a3;
- (id)stringFromDouble:(double)a3;
- (int)fractionAccuracy;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (int)valueType;
- (void)dealloc;
- (void)setUseScientificFormattingAutomatically:(BOOL)a3;
@end

@implementation GQDTNumberFormat

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9FFC8;
}

- (void)dealloc
{
  mUid = self->mUid;
  if (mUid) {
    xmlFree(mUid);
  }
  mFormatString = self->mFormatString;
  if (mFormatString) {
    CFRelease(mFormatString);
  }
  mCurrencyCode = self->mCurrencyCode;
  if (mCurrencyCode) {
    CFRelease(mCurrencyCode);
  }

  mSuffixString = self->mSuffixString;
  if (mSuffixString) {
    CFRelease(mSuffixString);
  }
  v7.receiver = self;
  v7.super_class = (Class)GQDTNumberFormat;
  [(GQDTNumberFormat *)&v7 dealloc];
}

- (BOOL)hasValidDecimalPlaces
{
  return self->mDecimalPlaces != (unsigned __int16)word_9CC32;
}

- (id)stringFromDouble:(double)a3
{
  unsigned __int16 mDecimalPlaces = self->mDecimalPlaces;
  if (a3 == 0.0) {
    double v5 = 0.0;
  }
  else {
    double v5 = a3;
  }
  if (![(GQDTNumberFormat *)self hasValidDecimalPlaces]) {
    unsigned __int16 mDecimalPlaces = sub_52CA4(v5);
  }
  double v6 = v5 * self->mScaleFactor;
  if (self->mIsTextFormat)
  {
    CFStringRef v7 = @"#,##0";
    double v8 = v6;
    int v9 = 0;
    int v10 = 1;
    unsigned int v11 = 2;
    unsigned int v12 = 2;
    int v13 = 1;
    goto LABEL_8;
  }
  BOOL mFormatStringRequiresSuppressionOfMinusSign = self->mFormatStringRequiresSuppressionOfMinusSign;
  if (self->mIsCustom && !self->mFormatContainsSpecialTokens)
  {
    id v35 = [(GQDTNumberFormat *)self formatString];
    return sub_53F6C(v35);
  }
  else
  {
    if (self->mInterstitialStrings || self->mMinimumIntegerWidth || self->mDecimalWidth) {
      goto LABEL_17;
    }
    if (self->mRequiresFractionReplacement)
    {
      if (!self->mFormatContainsIntegerToken)
      {
        v33 = (__CFString *)[(NSMutableString *)sub_53F6C([(GQDTNumberFormat *)self formatString]) mutableCopy];
        [(__CFString *)v33 replaceOccurrencesOfString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C", 164), +[GQNumberFormatter currencySymbolForCurrencyCode:self->mCurrencyCode], 0, 0, [(__CFString *)v33 length] withString options range];
        id v55 = [(GQDTNumberFormat *)self fractionStringFromDouble:v6];
        v56 = +[NSString stringWithFormat:@"%C", (unsigned __int16)word_9CC18];
LABEL_80:
        -[__CFString replaceOccurrencesOfString:withString:options:range:](v33, "replaceOccurrencesOfString:withString:options:range:", v56, v55, 0, 0, [(__CFString *)v33 length]);
        return v33;
      }
LABEL_17:
      double v18 = v6;
      if (self->mRequiresFractionReplacement)
      {
        double v19 = trunc(v6);
        if (self->mFormatContainsIntegerToken) {
          double v18 = v19;
        }
        else {
          double v18 = v6;
        }
      }
      v70 = (__CFString *)sub_52F40([(GQDTNumberFormat *)self valueType], (const __CFString *)[(GQDTNumberFormat *)self formatString], !self->mIsCustom, mDecimalPlaces, mDecimalPlaces, [(GQDTNumberFormat *)self showThousandsSeparator], (const __CFString *)[(GQDTNumberFormat *)self currencyCode], v18, mFormatStringRequiresSuppressionOfMinusSign);
      int mMinimumIntegerWidth = self->mMinimumIntegerWidth;
      if (self->mMinimumIntegerWidth || self->mDecimalWidth)
      {
        double v21 = fabs(v18);
        if (v21 >= 1.0) {
          unsigned int v22 = (trunc(log10(v21)) + 1.0);
        }
        else {
          unsigned int v22 = 0;
        }
        if (v22 <= self->mNumberOfNonSpaceIntegerPlaceholderDigits) {
          unsigned int mNumberOfNonSpaceIntegerPlaceholderDigits = self->mNumberOfNonSpaceIntegerPlaceholderDigits;
        }
        else {
          unsigned int mNumberOfNonSpaceIntegerPlaceholderDigits = v22;
        }
        int v24 = mMinimumIntegerWidth - mNumberOfNonSpaceIntegerPlaceholderDigits;
        if (v24 >= 1)
        {
          id v25 = [(__CFString *)v70 mutableCopy];
          unsigned int v26 = [(__CFString *)v70 length];
          unsigned int v27 = self->mNumberOfNonSpaceIntegerPlaceholderDigits;
          if (v22 > v27) {
            unsigned int v27 = v22;
          }
          unsigned int v28 = v26 + ~(v27 + self->mIndexFromRightOfLastDigitPlaceholder);
          if (self->mShowThousandsSeparator)
          {
            double v29 = ceil((double)v27 / (double)sub_52E14(0)) + -1.0;
            int v30 = (int)v29 & ~((int)v29 >> 31);
          }
          else
          {
            int v30 = 0;
          }
          uint64_t v36 = v28 - v30;
          if ((int)v36 >= 0)
          {
            int v37 = 0;
            do
            {
              if ((int)v36 >= (int)[v25 length]) {
                break;
              }
              if ([v25 characterAtIndex:v36] == 48) {
                ++v37;
              }
              objc_msgSend(v25, "replaceCharactersInRange:withString:", v36, 1, @" ");
              if (v37 >= v24) {
                break;
              }
            }
            while ((int)v36-- > 0);
          }
          int mDecimalWidth = self->mDecimalWidth;
          int mNumberOfNonSpaceDecimalPlaceholderDigits = self->mNumberOfNonSpaceDecimalPlaceholderDigits;
          int v34 = mDecimalWidth - mNumberOfNonSpaceDecimalPlaceholderDigits;
          if (mDecimalWidth <= mNumberOfNonSpaceDecimalPlaceholderDigits) {
            goto LABEL_54;
          }
          if (v25)
          {
LABEL_51:
            v41 = (char *)[(__CFString *)v70 length]
                + self->mNumberOfNonSpaceDecimalPlaceholderDigits
                - self->mIndexFromRightOfLastDigitPlaceholder
                + 1;
            uint64_t v42 = v34 + (int)v41;
            uint64_t v43 = (int)v41;
            do
            {
              if ([v25 characterAtIndex:--v42] != 48) {
                break;
              }
              objc_msgSend(v25, "replaceCharactersInRange:withString:", v42, 1, @" ");
            }
            while (v42 > v43);
LABEL_54:
            v33 = v70;
            if (v25) {
              v33 = (__CFString *)v25;
            }
            goto LABEL_57;
          }
LABEL_50:
          id v25 = [(__CFString *)v70 mutableCopy];
          goto LABEL_51;
        }
        int v31 = self->mDecimalWidth;
        int v32 = self->mNumberOfNonSpaceDecimalPlaceholderDigits;
        v33 = v70;
        int v34 = v31 - v32;
        if (v31 > v32) {
          goto LABEL_50;
        }
      }
      else
      {
        v33 = 0;
      }
LABEL_57:
      if (self->mInterstitialStrings)
      {
        if (v33) {
          v44 = v33;
        }
        else {
          v44 = v70;
        }
        v33 = (__CFString *)+[NSMutableString string];
        v69 = +[NSCharacterSet decimalDigitCharacterSet];
        v45 = (char *)[(__CFString *)v44 length];
        NSUInteger v46 = [(NSIndexSet *)self->mInterstitialStringInsertionIndexes firstIndex];
        if ((uint64_t)v45 < 1)
        {
          uint64_t v49 = 0;
        }
        else
        {
          NSUInteger v47 = v46;
          unint64_t v48 = 0;
          uint64_t v49 = 0;
          uint64_t v50 = 0;
          do
          {
            if (v50 == v47 && v47 != 0x7FFFFFFFFFFFFFFFLL)
            {
              [(__CFString *)v33 insertString:[(NSArray *)self->mInterstitialStrings objectAtIndex:v49] atIndex:0];
              NSUInteger v47 = [(NSIndexSet *)self->mInterstitialStringInsertionIndexes indexGreaterThanIndex:v47];
              ++v49;
            }
            unsigned int v51 = [(__CFString *)v44 characterAtIndex:--v45];
            id v52 = [(__CFString *)v70 characterAtIndex:v45];
            [(__CFString *)v33 insertString:+[NSString stringWithFormat:@"%C", v51] atIndex:0];
            if (v48 >= self->mIndexFromRightOfLastDigitPlaceholder) {
              v50 += [(NSCharacterSet *)v69 characterIsMember:v52];
            }
            ++v48;
          }
          while ((uint64_t)v45 > 0);
        }
        if (v49 < (int)[(NSArray *)self->mInterstitialStrings count])
        {
          while (v49 < (int)[(NSArray *)self->mInterstitialStrings count])
            [(__CFString *)v33 insertString:[(NSArray *)self->mInterstitialStrings objectAtIndex:v49++] atIndex:0];
        }
      }
      if (!self->mRequiresFractionReplacement || !self->mFormatContainsIntegerToken) {
        return v33;
      }
      if (v33) {
        v53 = v33;
      }
      else {
        v53 = v70;
      }
      v33 = (__CFString *)[(__CFString *)v53 mutableCopy];
      double v54 = fabs(v6);
      id v55 = [(GQDTNumberFormat *)self fractionStringFromDouble:v54 - floor(v54)];
      v56 = +[NSString stringWithFormat:@"%C", (unsigned __int16)word_9CC18];
      goto LABEL_80;
    }
    int mValueType = self->mValueType;
    if (mValueType == 1)
    {
      if (self->mUseAccountingStyle) {
        return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@\t%@", +[GQNumberFormatter currencySymbolForCurrencyCode:](GQNumberFormatter, "currencySymbolForCurrencyCode:", self->mCurrencyCode), objc_msgSend(objc_msgSend(-[GQDTNumberFormat numberFormatBySettingValueType:](self, "numberFormatBySettingValueType:", 0), "numberFormatBySettingNegativeStyle:", 2), "stringFromDouble:", v6));
      }
      goto LABEL_93;
    }
    if (mValueType != 5)
    {
      if (mValueType == 4)
      {
        return [(GQDTNumberFormat *)self fractionStringFromDouble:v6];
      }
LABEL_93:
      if (self->mIsCustom
        || !self->mUseScientificFormattingAutomatically
        || [(GQDTNumberFormat *)self valueType]
        || (double v67 = fabs(v6), v67 <= 1.0e12) && (v67 >= 0.0000001 || v6 == 0.0))
      {
        if (self->mIgnoreDecimalPlacesForZeroValue && !self->mIsCustom && v6 == 0.0)
        {
          BOOL v58 = mFormatStringRequiresSuppressionOfMinusSign;
          unsigned int v59 = [(GQDTNumberFormat *)self valueType];
          CFStringRef v60 = [(GQDTNumberFormat *)self formatString];
          unsigned int v61 = [(GQDTNumberFormat *)self showThousandsSeparator];
          CFStringRef v14 = [(GQDTNumberFormat *)self currencyCode];
          double v8 = v6;
          int v9 = v59;
          CFStringRef v7 = v60;
          int v10 = 1;
          unsigned int v11 = 0;
          unsigned int v12 = 0;
          int v13 = v61;
          BOOL v15 = v58;
        }
        else
        {
          unsigned int v63 = [(GQDTNumberFormat *)self valueType];
          CFStringRef v64 = [(GQDTNumberFormat *)self formatString];
          BOOL v65 = !self->mIsCustom;
          unsigned int v66 = [(GQDTNumberFormat *)self showThousandsSeparator];
          CFStringRef v14 = [(GQDTNumberFormat *)self currencyCode];
          unsigned int v11 = mDecimalPlaces;
          double v8 = v6;
          int v9 = v63;
          CFStringRef v7 = v64;
          int v10 = v65;
          unsigned int v12 = mDecimalPlaces;
          int v13 = v66;
          BOOL v15 = mFormatStringRequiresSuppressionOfMinusSign;
        }
        goto LABEL_9;
      }
      CFStringRef v7 = @"0E0";
      double v8 = v6;
      int v9 = 3;
      int v10 = 1;
      unsigned int v11 = 0;
      unsigned int v12 = 5;
      int v13 = 0;
LABEL_8:
      CFStringRef v14 = 0;
      BOOL v15 = 0;
LABEL_9:
      return (id)sub_52F40(v9, v7, v10, v11, v12, v13, v14, v8, v15);
    }
    v33 = [(GQDTNumberFormat *)self baseStringFromDouble:v6];
    if (v33) {
      return v33;
    }
    HIDWORD(v68) = -3;
    LOBYTE(v68) = 1;
    v62 = +[GQDTNumberFormat numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:suffixString:](GQDTNumberFormat, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:suffixString:", 0, 0, 0, 0, 0, 0, v68, 0);
    [(GQDTNumberFormat *)v62 setUseScientificFormattingAutomatically:1];
    return [(GQDTNumberFormat *)v62 stringFromDouble:v6];
  }
}

- (__CFString)createStringFromDouble:(double)a3
{
  double v5 = objc_opt_new();
  double v6 = (__CFString *)[(GQDTNumberFormat *)self stringFromDouble:a3];
  if (self->mSuffixString && self->mValueType <= 1u)
  {
    Mutable = CFStringCreateMutable(0, 0);
    CFStringAppend(Mutable, v6);
    CFStringAppend(Mutable, self->mSuffixString);
    CFRelease(v6);
    double v6 = Mutable;
  }
  [v5 drain];
  return v6;
}

- (int)valueType
{
  return self->mValueType;
}

- (BOOL)useAccountingStyle
{
  return self->mUseAccountingStyle;
}

+ (BOOL)needToSuppressMinusSignForFormatString:(__CFString *)a3
{
  id v3 = [(__CFString *)a3 sfu_negativeSubpatternOfNumberFormatPattern];
  return ([v3 isEqualToString:&stru_85630] & 1) == 0
      && objc_msgSend(objc_msgSend(objc_msgSend(v3, "sfu_prefixOfNumberFormatSubpattern"), "sfu_stringByRemovingEscapedCharactersFromNumberFormatPattern"), "rangeOfString:", @"-") == (id)0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(objc_msgSend(objc_msgSend(v3, "sfu_suffixOfNumberFormatSubpattern"), "sfu_stringByRemovingEscapedCharactersFromNumberFormatPattern"), "rangeOfString:", @"-") == (id)0x7FFFFFFFFFFFFFFFLL;
}

+ (id)numberFormatWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 suffixString:(__CFString *)a11
{
  BYTE6(v15) = 0;
  *(_DWORD *)((char *)&v15 + 2) = 0;
  LOWORD(v15) = 0;
  WORD2(v14) = 1;
  LODWORD(v14) = 10;
  HIDWORD(v13) = a10;
  LOBYTE(v13) = a9;
  id v11 = objc_msgSend(objc_alloc((Class)a1), "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", *(void *)&a3, a4, a5, a6, a7, *(void *)&a8, 1.0, v13, a11, v14, 0, 0, v15, 0);
  return v11;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  self->mCurrencyCode = (__CFString *)sub_4340C(a3, qword_A35E8, (xmlChar *)"format-currency-code");
  double v5 = (__CFString *)sub_4340C(a3, qword_A35E8, (xmlChar *)"format-string");
  self->mFormatString = v5;
  if (!v5
    || !sub_42E14(a3, qword_A35E8, (xmlChar *)"format-decimal-places", &self->mDecimalPlaces)
    || !sub_42C34(a3, qword_A35E8, (xmlChar *)"format-use-accounting-style", &self->mUseAccountingStyle))
  {
    uint64_t v13 = 0;
LABEL_10:
    int v6 = 3;
    goto LABEL_11;
  }
  uint64_t v13 = 0;
  if (!sub_42C34(a3, qword_A35E8, (xmlChar *)"format-show-thousands-separator", &self->mShowThousandsSeparator))goto LABEL_10; {
  if (!sub_42E14(a3, qword_A35E8, (xmlChar *)"format-type", &v13))
  }
    goto LABEL_10;
  self->int mValueType = v13;
  if ((sub_42E14(a3, qword_A35E8, (xmlChar *)"format-negative-style", &v13) & 1) == 0) {
    goto LABEL_10;
  }
  self->mNegativeStyle = v13;
  if (!sub_42E14(a3, qword_A35E8, (xmlChar *)"format-fraction-accuracy", &v13)) {
    goto LABEL_10;
  }
  self->mFractionAccuracy = v13;
  int v6 = 1;
LABEL_11:
  self->mIsCustom = sub_42DCC(a3, qword_A35E8, (xmlChar *)"custom", 0);
  sub_433CC(a3, qword_A35E8, (xmlChar *)"scale");
  self->mScaleFactor = v7;
  self->unsigned int mNumberOfNonSpaceIntegerPlaceholderDigits = sub_42F04(a3, qword_A35E8, (xmlChar *)"non-space-integer-placeholders", 0);
  self->int mNumberOfNonSpaceDecimalPlaceholderDigits = sub_42F04(a3, qword_A35E8, (xmlChar *)"non-space-decimal-placeholders", 0);
  self->mIndexFromRightOfLastDigitPlaceholder = sub_42F04(a3, qword_A35E8, (xmlChar *)"last-digit-index", 0);
  if (self->mIsCustom)
  {
    mFormatString = self->mFormatString;
    if (mFormatString)
    {
      int Length = CFStringGetLength(mFormatString);
      if (Length >= 1)
      {
        CFIndex v10 = 0;
        uint64_t v11 = Length;
        while (CFStringGetCharacterAtIndex(self->mFormatString, v10) != (unsigned __int16)word_9CC18)
        {
          if (v11 == ++v10) {
            goto LABEL_19;
          }
        }
        self->mRequiresFractionReplacement = 1;
      }
    }
  }
LABEL_19:
  self->mBase = sub_42F04(a3, qword_A35E8, (xmlChar *)"format-base", 10);
  self->mBasePlaces = sub_42F04(a3, qword_A35E8, (xmlChar *)"format-base-places", 0);
  self->mBaseUsesMinusSign = sub_42DCC(a3, qword_A35E8, (xmlChar *)"format-base-uses-minus-sign", 1u);
  self->mIsTextFormat = sub_42DCC(a3, qword_A35E8, (xmlChar *)"is-text", 0);
  self->int mMinimumIntegerWidth = sub_42F04(a3, qword_A35E8, (xmlChar *)"min-integer-width", 0);
  self->int mDecimalWidth = sub_42F04(a3, qword_A35E8, (xmlChar *)"decimal-width", 0);
  self->mSuffixString = (__CFString *)sub_4340C(a3, qword_A35E8, (xmlChar *)"format-suffix");
  return v6;
}

- (GQDTNumberFormat)initWithValueType:(int)a3 formatString:(id)a4 decimalPlaces:(unsigned __int16)a5 currencyCode:(id)a6 useAccountingStyle:(BOOL)a7 negativeStyle:(int)a8 showThousandsSeparator:(BOOL)a9 fractionAccuracy:(int)a10 suffixString:(__CFString *)a11 scaleFactor:(double)a12 base:(unsigned __int16)a13 basePlaces:(unsigned __int16)a14 baseUseMinusSign:(BOOL)a15 isCustom:(BOOL)a16 interstitialStrings:(id)a17 interstitialStringInsertionIndexes:(id)a18 indexFromRightOfLastDigitPlaceholder:(unsigned __int16)a19 minimumIntegerWidth:(unsigned __int8)a20 decimalWidth:(unsigned __int8)a21 numberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a22 numberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a23 isTextFormat:(BOOL)a24 formatName:(id)a25
{
  BOOL v27 = a7;
  v48.receiver = self;
  unsigned int v28 = a5;
  uint64_t v30 = *(void *)&a3;
  v48.super_class = (Class)GQDTNumberFormat;
  int v31 = [(GQDTNumberFormat *)&v48 init];
  if (!v31) {
    return v31;
  }
  BOOL v46 = v27;
  if (a16)
  {
    v31->mFormatString = (__CFString *)a4;
    v31->BOOL mFormatStringRequiresSuppressionOfMinusSign = 0;
    int v32 = [a4 length];
    if (v32 >= 1)
    {
      uint64_t v33 = 0;
      uint64_t v34 = v32;
      do
      {
        unsigned int v35 = [a4 characterAtIndex:v33];
        if (v35 != 9 && v35 == (unsigned __int16)word_9CC18) {
          v31->mRequiresFractionReplacement = 1;
        }
        ++v33;
      }
      while (v34 != v33);
    }
  }
  else
  {
    if (v27) {
      unsigned int v36 = 2;
    }
    else {
      unsigned int v36 = a8;
    }
    if (v30 != 1) {
      unsigned int v36 = a8;
    }
    if (v30 == 3) {
      uint64_t v37 = 0;
    }
    else {
      uint64_t v37 = v36;
    }
    if (a4) {
      id v38 = +[GQNumberFormatter formatString:a4 transformedForNegativeStyle:v37];
    }
    else {
      id v38 = +[GQNumberFormatter defaultFormatStringForValueType:v30 negativeStyle:v37];
    }
    v31->mFormatString = (__CFString *)v38;
    v31->BOOL mFormatStringRequiresSuppressionOfMinusSign = a8 == 1;
  }
  if (a6) {
    v39 = (__CFString *)a6;
  }
  else {
    v39 = (__CFString *)+[GQNumberFormatter currentLocaleCurrencyCode];
  }
  v31->mCurrencyCode = v39;
  v31->unsigned __int16 mDecimalPlaces = v28;
  v31->int mValueType = v30;
  v31->mNegativeStyle = a8;
  v31->mShowThousandsSeparator = a9;
  v31->mUseAccountingStyle = v46;
  v31->mFractionAccuracy = a10;
  v31->mScaleFactor = a12;
  v31->mIsCustom = a16;
  v31->mInterstitialStrings = (NSArray *)a17;
  v31->mInterstitialStringInsertionIndexes = (NSIndexSet *)a18;
  v31->mIsTextFormat = a24;
  v31->mIndexFromRightOfLastDigitPlaceholder = a19;
  v31->int mMinimumIntegerWidth = a20;
  v31->int mDecimalWidth = a21;
  v31->unsigned int mNumberOfNonSpaceIntegerPlaceholderDigits = a22;
  v31->int mNumberOfNonSpaceDecimalPlaceholderDigits = a23;
  v31->mBase = a13;
  v31->mBasePlaces = a14;
  v31->mBaseUsesMinusSign = a15;
  if (a16)
  {
    id v40 = [(GQDTNumberFormat *)v31 customNumberFormatTokens];
    if (v40
      && (v41 = v40, [v40 count])
      && ([v41 count] != (char *)&dword_0 + 1
       || objc_msgSend(objc_msgSend(v41, "objectAtIndex:", 0), "isSpecialCustomNumberFormatToken")))
    {
      v31->mFormatContainsSpecialTokens = 1;
      if ((int)[v41 count] < 1) {
        goto LABEL_37;
      }
      uint64_t v42 = 0;
      uint64_t v43 = 87;
      char v44 = 1;
      while (!objc_msgSend(objc_msgSend(v41, "objectAtIndex:", v42), "isSpecialCustomNumberFormatTokenOfType:", 1))
      {
        if (++v42 >= (int)[v41 count]) {
          goto LABEL_37;
        }
      }
    }
    else
    {
      char v44 = 0;
      uint64_t v43 = 86;
    }
    *((unsigned char *)&v31->super.isa + v43) = v44;
  }
LABEL_37:
  if (a11)
  {
    v31->mSuffixString = a11;
    CFRetain(a11);
  }
  return v31;
}

- (id)fractionStringFromDouble:(double)a3
{
  double v3 = fabs(a3);
  if (a3 >= 0.0) {
    double v4 = a3;
  }
  else {
    double v4 = v3;
  }
  unsigned int mFractionAccuracy = self->mFractionAccuracy;
  unsigned int v6 = mFractionAccuracy;
  int v7 = mFractionAccuracy;
  if (mFractionAccuracy >= 0xFFFFFFFD)
  {
    unsigned int v6 = *((_DWORD *)&unk_5F000 + (int)(mFractionAccuracy + 3));
    int v7 = 2;
  }
  LODWORD(v8) = 0;
  LODWORD(v9) = 0;
  double v10 = floor(v4);
  double v11 = v4 - v10;
  unsigned int v12 = v6 + 1;
  double v13 = 1.79769313e308;
  do
  {
    double v14 = v11 * (double)v7;
    double v15 = vabdd_f64(v11, round(v14) / (double)v7);
    unsigned int v16 = llround(v14);
    if (v15 >= v13)
    {
      uint64_t v8 = v8;
    }
    else
    {
      LODWORD(v9) = v16;
      uint64_t v8 = v7;
    }
    if (v15 < v13) {
      double v13 = v15;
    }
    ++v7;
  }
  while (v12 != v7);
  if (mFractionAccuracy >= 0xFFFFFFFD)
  {
    int v17 = v8;
    if (v9)
    {
      int v18 = v9;
      int v19 = v8;
      do
      {
        int v17 = v18;
        int v18 = v19 % v18;
        int v19 = v17;
      }
      while (v18);
    }
    if (v17 >= 2)
    {
      LODWORD(v9) = (int)v9 / v17;
      uint64_t v8 = ((int)v8 / v17);
    }
  }
  BOOL v20 = v9 == v8;
  if (v9 == v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v9;
  }
  if (v20) {
    double v10 = v10 + 1.0;
  }
  if (v10 == 0.0)
  {
    if (a3 >= 0.0) {
      uint64_t v9 = v9;
    }
    else {
      uint64_t v9 = -(int)v9;
    }
    if (v9) {
      unsigned int v22 = (__CFString *)CFStringCreateWithFormat(0, 0, @"%d/%d", v9, v8);
    }
    else {
      unsigned int v22 = (__CFString *)CFStringCreateWithFormat(0, 0, @"0");
    }
  }
  else
  {
    if (a3 >= 0.0) {
      double v21 = v10;
    }
    else {
      double v21 = -v10;
    }
    if (v9) {
      unsigned int v22 = (__CFString *)CFStringCreateWithFormat(0, 0, @"%.0f %d/%d", *(void *)&v21, v9, v8);
    }
    else {
      unsigned int v22 = (__CFString *)CFStringCreateWithFormat(0, 0, @"%.0f", *(void *)&v21);
    }
  }
  return v22;
}

- (id)baseStringFromDouble:(double)a3
{
  uint64_t v4 = (uint64_t)a3;
  if ((uint64_t)a3 >= 0) {
    uint64_t v5 = (uint64_t)a3;
  }
  else {
    uint64_t v5 = -v4;
  }
  int mBasePlaces = self->mBasePlaces;
  if (self->mBaseUsesMinusSign)
  {
    unint64_t v7 = (unint64_t)v4 >> 63;
  }
  else
  {
    double v8 = (double)v5;
    LOBYTE(a3) = self->mBase;
    double v9 = log2((double)*(unint64_t *)&a3);
    do
    {
      double v10 = exp2(v9 * (double)mBasePlaces + -1.0);
      if (v4 >= 0) {
        double v10 = v10 + -1.0;
      }
      ++mBasePlaces;
    }
    while (v10 < v8);
    LODWORD(v7) = 0;
    double v11 = -(v8 - v10 * 2.0);
    if (v4 < 0) {
      uint64_t v5 = (uint64_t)v11;
    }
    --mBasePlaces;
  }
  id v12 = objc_alloc_init((Class)NSMutableString);
  uint64_t v13 = 1;
  uint64_t mBase = self->mBase;
  do
  {
    if (mBase == 1)
    {
      LOWORD(v15) = 49;
    }
    else if (mBase == 26)
    {
      int v15 = (int)(v5 / v13) % 26 + 65;
    }
    else
    {
      int v15 = v5 / v13 % mBase;
      if (v15 <= 9) {
        __int16 v16 = 48;
      }
      else {
        __int16 v16 = 55;
      }
      LOWORD(v15) = v16 + v15;
    }
    objc_msgSend(v12, "gqd_insertCharacter:atIndex:", (unsigned __int16)v15, 0);
    uint64_t mBase = self->mBase;
    if (mBase == 1) {
      ++v13;
    }
    else {
      v13 *= mBase;
    }
  }
  while (v13 && v5 / v13 > 0);
  if (mBasePlaces)
  {
    signed int v17 = (mBasePlaces - [v12 length]) << 24;
    if (v17 >= 1)
    {
      int v18 = v17 >> 24;
      if (self->mBase == 26) {
        uint64_t v19 = 65;
      }
      else {
        uint64_t v19 = 48;
      }
      if (v18 <= 1) {
        int v20 = 1;
      }
      else {
        int v20 = v18;
      }
      do
      {
        objc_msgSend(v12, "gqd_insertCharacter:atIndex:", v19, 0);
        --v20;
      }
      while (v20);
    }
  }
  if (v7) {
    objc_msgSend(v12, "gqd_insertCharacter:atIndex:", 45, 0);
  }
  return v12;
}

- (void)setUseScientificFormattingAutomatically:(BOOL)a3
{
  self->mUseScientificFormattingAutomatically = a3;
}

- (id)numberFormatBySettingNegativeStyle:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = [(GQDTNumberFormat *)self valueType];
  id v7 = [(GQDTNumberFormat *)self formatString];
  uint64_t mDecimalPlaces_low = LOWORD(self->mDecimalPlaces);
  id v9 = [(GQDTNumberFormat *)self currencyCode];
  BOOL mUseAccountingStyle = self->mUseAccountingStyle;
  unsigned __int8 v11 = [(GQDTNumberFormat *)self showThousandsSeparator];
  BYTE6(v16) = self->mIsTextFormat;
  WORD2(v16) = *(_WORD *)&self->mNumberOfNonSpaceIntegerPlaceholderDigits;
  WORD1(v16) = *(_WORD *)&self->mMinimumIntegerWidth;
  LOWORD(v16) = self->mIndexFromRightOfLastDigitPlaceholder;
  BYTE5(v15) = self->mIsCustom;
  BYTE4(v15) = 1;
  LODWORD(v15) = 10;
  HIDWORD(v14) = self->mFractionAccuracy;
  LOBYTE(v14) = v11;
  id v12 = objc_msgSend(v5, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", v6, v7, mDecimalPlaces_low, v9, mUseAccountingStyle, v3, self->mScaleFactor, v14, self->mSuffixString, v15, self->mInterstitialStrings, self->mInterstitialStringInsertionIndexes, v16, 0);
  return v12;
}

- (id)numberFormatBySettingValueType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = [(GQDTNumberFormat *)self valueType];
  if ((v3 - 1) <= 1 && v5 == v3)
  {
    id v6 = [(GQDTNumberFormat *)self copy];
    return v6;
  }
  else
  {
    unsigned __int16 mDecimalPlaces = self->mDecimalPlaces;
    id v9 = [(GQDTNumberFormat *)self currencyCode];
    if (v3 == 1)
    {
      unsigned __int16 mDecimalPlaces = +[GQNumberFormatter defaultDecimalPlacesForCurrencyCode:](GQNumberFormatter, "defaultDecimalPlacesForCurrencyCode:", +[GQNumberFormatter currentLocaleCurrencyCode]);
      id v10 = 0;
    }
    else
    {
      id v10 = v9;
    }
    unsigned __int8 v11 = [(GQDTNumberFormat *)self showThousandsSeparator];
    if ((v3 - 1) < 2) {
      char v12 = 1;
    }
    else {
      char v12 = v11;
    }
    uint64_t v13 = objc_opt_class();
    HIDWORD(v14) = self->mFractionAccuracy;
    LOBYTE(v14) = v12;
    return objc_msgSend(v13, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:suffixString:", v3, 0, mDecimalPlaces, v10, self->mUseAccountingStyle, self->mNegativeStyle, v14, self->mSuffixString);
  }
}

- (id)formatString
{
  return self->mFormatString;
}

- (id)currencyCode
{
  return self->mCurrencyCode;
}

- (BOOL)showThousandsSeparator
{
  return self->mShowThousandsSeparator;
}

- (id)customNumberFormatTokens
{
  if (![(GQDTNumberFormat *)self isCustom]) {
    return 0;
  }
  if ([(GQDTNumberFormat *)self isTextFormat])
  {
    id v3 = +[NSMutableArray array];
    id v4 = +[NSMutableString string];
    id v5 = [(GQDTNumberFormat *)self formatString];
    int v6 = [v5 length];
    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = v6;
      do
      {
        unsigned int v9 = [v5 characterAtIndex:v7];
        if (v9 == (unsigned __int16)word_9CC38)
        {
          if ([v4 length]) {
            [v3 addObject:v4];
          }
          objc_msgSend(v3, "addObject:", +[NSMutableString customNumberFormatTokenStringOfType:content:](NSMutableString, "customNumberFormatTokenStringOfType:content:", 5, @"@"));
          id v4 = +[NSMutableString string];
        }
        else
        {
          objc_msgSend(v4, "appendFormat:", @"%C", v9);
        }
        ++v7;
      }
      while (v8 != v7);
    }
    if ([v4 length])
    {
      id v10 = v3;
      id v11 = v4;
LABEL_181:
      [v10 addObject:v11];
      return v3;
    }
    return v3;
  }
  char v12 = +[NSCharacterSet characterSetWithCharactersInString:@"+-,#@0123456789"];
  uint64_t v13 = +[NSCharacterSet characterSetWithCharactersInString:@"#@0123456789"];
  id v3 = +[NSMutableArray array];
  v94 = self;
  id v14 = [(GQDTNumberFormat *)self formatString];
  id v15 = [v14 length];
  unint64_t v16 = (unint64_t)v15;
  signed int v17 = &CGPointZero_ptr;
  if ((int)v15 >= 1)
  {
    v86 = v12;
    unint64_t v18 = 0;
    char v19 = 0;
    char v92 = 0;
    v84 = v13;
    uint64_t v85 = (int)v15;
    while (1)
    {
      uint64_t v20 = (int)v18;
      id v21 = [v14 characterAtIndex:(int)v18];
      unint64_t v22 = (v18 + 1);
      unsigned int v23 = (int)v22 >= (int)v16 ? 0 : [v14 characterAtIndex:(int)v22];
      if (v21 != 46) {
        break;
      }
      char v19 = 1;
LABEL_51:
      unint64_t v18 = v22;
      if ((int)v22 >= (int)v16) {
        goto LABEL_165;
      }
    }
    if (v21 == 39)
    {
      id v24 = [(CGPoint *)(id)v17[38] string];
      id v25 = v24;
      if (v23 == 39)
      {
        [v24 appendString:@"'"];
        unint64_t v18 = (v18 + 2);
        goto LABEL_44;
      }
      unint64_t v18 = (v18 + 1);
      if ((int)v22 >= (int)v16)
      {
LABEL_44:
        if ([v25 length]) {
          [v3 addObject:v25];
        }
LABEL_46:
        unint64_t v22 = v18;
        goto LABEL_51;
      }
      while (1)
      {
        unsigned int v33 = [v14 characterAtIndex:(int)v22];
        unsigned int v34 = v33;
        unint64_t v18 = (v22 + 1);
        if ((int)v18 >= (int)v16)
        {
          if (v33 == 39) {
            goto LABEL_44;
          }
        }
        else
        {
          unsigned int v35 = [v14 characterAtIndex:(int)v18];
          if (v34 == 39)
          {
            if (v35 != 39) {
              goto LABEL_44;
            }
            [v25 appendString:@"'"];
            unint64_t v18 = (v22 + 2);
            goto LABEL_43;
          }
        }
        objc_msgSend(v25, "appendFormat:", @"%C", v34);
LABEL_43:
        LODWORD(v22) = v18;
        if ((int)v18 >= (int)v16) {
          goto LABEL_44;
        }
      }
    }
    if (v21 == (unsigned __int16)word_9CC2A
      || v21 == (unsigned __int16)word_9CC2C
      || v21 == (unsigned __int16)word_9CC2E
      || v21 == (unsigned __int16)word_9CC30)
    {
      double v29 = v17[38];
      uint64_t v30 = +[NSString stringWithFormat:@"%C", v21];
      int v31 = (CGPoint *)v29;
      uint64_t v32 = 4;
    }
    else
    {
      if (v21 == (unsigned __int16)word_9CC18)
      {
        unsigned int v36 = v17[38];
        uint64_t v30 = +[NSString stringWithFormat:@"%d", [(GQDTNumberFormat *)v94 fractionAccuracy]];
        int v31 = (CGPoint *)v36;
        uint64_t v32 = 6;
        goto LABEL_49;
      }
      uint64_t v38 = (v21 - 37);
      if (v38 <= 0x2F)
      {
        if (((1 << (v21 - 37)) & 0x814060000001) != 0)
        {
          [v3 addObject:-[CGPoint customNumberFormatTokenStringOfType:content:]((id)v17[38], "customNumberFormatTokenStringOfType:content:", 0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%C", v21, v21))];
LABEL_56:
          char v92 = 1;
          goto LABEL_51;
        }
        if (v38 == 32)
        {
          [v3 addObject:-[CGPoint customNumberFormatTokenStringOfType:content:]((id)v17[38], "customNumberFormatTokenStringOfType:content:", 0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C", 69))];
          if ((int)v22 < (int)v16)
          {
            uint64_t v39 = (int)v22;
            while (-[NSCharacterSet characterIsMember:](v86, "characterIsMember:", [v14 characterAtIndex:v39]))
            {
              if (v85 == ++v39) {
                return v3;
              }
            }
            char v92 = 1;
            unint64_t v22 = v39;
            goto LABEL_51;
          }
          goto LABEL_56;
        }
      }
      if (v21 != 164)
      {
        if ([(NSCharacterSet *)v86 characterIsMember:v21])
        {
          if ((v19 & 1) == 0)
          {
            int v43 = 0;
            if ((int)v18 < (int)v16)
            {
              BOOL v46 = &CGPointZero_ptr;
              while (1)
              {
                id v44 = [v14 characterAtIndex:v20];
                if (![(NSCharacterSet *)v86 characterIsMember:v44]) {
                  break;
                }
                v43 += [(NSCharacterSet *)v84 characterIsMember:v44];
                if (v85 == ++v20)
                {
                  unint64_t v22 = v16;
                  goto LABEL_94;
                }
              }
              unint64_t v22 = v20;
LABEL_94:
              v45 = v94;
            }
            else
            {
              unint64_t v22 = v18;
              v45 = v94;
              BOOL v46 = &CGPointZero_ptr;
            }
            int v83 = v43;
            id v93 = [(CGPoint *)(id)v46[33] array];
            unsigned int mNumberOfNonSpaceIntegerPlaceholderDigits = v45->mNumberOfNonSpaceIntegerPlaceholderDigits;
            int mMinimumIntegerWidth = v45->mMinimumIntegerWidth;
            int v81 = mMinimumIntegerWidth;
            if (!v45->mMinimumIntegerWidth) {
              int mMinimumIntegerWidth = v45->mNumberOfNonSpaceIntegerPlaceholderDigits;
            }
            int v82 = mMinimumIntegerWidth;
            mInterstitialStringInsertionIndexes = v45->mInterstitialStringInsertionIndexes;
            v53 = [(NSIndexSet *)mInterstitialStringInsertionIndexes firstIndex];
            double v54 = v53;
            unsigned int v80 = mNumberOfNonSpaceIntegerPlaceholderDigits;
            if (mNumberOfNonSpaceIntegerPlaceholderDigits)
            {
              uint64_t v87 = 0;
              id v55 = 0;
              v56 = v53;
              do
              {
                if (mInterstitialStringInsertionIndexes) {
                  BOOL v57 = v56 == (char *)0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  BOOL v57 = 1;
                }
                int v58 = !v57;
                unsigned int v59 = (char *)(v56 - v55);
                BOOL v60 = v56 - v55 <= mNumberOfNonSpaceIntegerPlaceholderDigits;
                if (v56 - v55 >= mNumberOfNonSpaceIntegerPlaceholderDigits) {
                  unsigned int v59 = (char *)mNumberOfNonSpaceIntegerPlaceholderDigits;
                }
                if (v58 != 1) {
                  BOOL v60 = 1;
                }
                BOOL v88 = v60;
                if (v58 == 1) {
                  unsigned int v61 = v59;
                }
                else {
                  unsigned int v61 = (char *)mNumberOfNonSpaceIntegerPlaceholderDigits;
                }
                objc_msgSend(v93, "insertObject:atIndex:", +[NSString customNumberFormatIntegerTokenRepresentedStringWithDigits:separator:digitString:](NSString, "customNumberFormatIntegerTokenRepresentedStringWithDigits:separator:digitString:", v61, -[GQDTNumberFormat showThousandsSeparator](v94, "showThousandsSeparator"), @"0"), 0);
                if (v58)
                {
                  if (v88)
                  {
                    objc_msgSend(v93, "insertObject:atIndex:", -[NSArray objectAtIndex:](v94->mInterstitialStrings, "objectAtIndex:", v87++), 0);
                    double v54 = [(NSIndexSet *)v94->mInterstitialStringInsertionIndexes indexGreaterThanIndex:v56];
                  }
                  else
                  {
                    double v54 = v56;
                    v56 = &v55[(void)v61];
                  }
                }
                else
                {
                  double v54 = v56;
                  v56 = v55;
                }
                mNumberOfNonSpaceIntegerPlaceholderDigits -= v61;
                v62 = v56;
                id v55 = v56;
                v56 = v54;
              }
              while ((int)mNumberOfNonSpaceIntegerPlaceholderDigits > 0);
            }
            else
            {
              v62 = 0;
              uint64_t v87 = 0;
            }
            if (v81)
            {
              unsigned int v63 = v81 - v80;
              CFStringRef v64 = v54;
              signed int v17 = &CGPointZero_ptr;
              if ((int)(v81 - v80) >= 1)
              {
                do
                {
                  if (mInterstitialStringInsertionIndexes) {
                    BOOL v65 = v64 == (char *)0x7FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    BOOL v65 = 1;
                  }
                  int v66 = !v65;
                  uint64_t v67 = v64 - v62;
                  BOOL v68 = v64 - v62 <= v63;
                  if (v64 - v62 >= v63) {
                    uint64_t v67 = v63;
                  }
                  if (v66 != 1) {
                    BOOL v68 = 1;
                  }
                  BOOL v89 = v68;
                  if (v66 == 1) {
                    uint64_t v69 = v67;
                  }
                  else {
                    uint64_t v69 = v63;
                  }
                  objc_msgSend(v93, "insertObject:atIndex:", +[NSString customNumberFormatIntegerTokenRepresentedStringWithDigits:separator:digitString:](NSString, "customNumberFormatIntegerTokenRepresentedStringWithDigits:separator:digitString:", v69, -[GQDTNumberFormat showThousandsSeparator](v94, "showThousandsSeparator"), @"?"), 0);
                  if (v66)
                  {
                    if (v89)
                    {
                      objc_msgSend(v93, "insertObject:atIndex:", -[NSArray objectAtIndex:](v94->mInterstitialStrings, "objectAtIndex:", v87++), 0);
                      double v54 = [(NSIndexSet *)v94->mInterstitialStringInsertionIndexes indexGreaterThanIndex:v64];
                    }
                    else
                    {
                      double v54 = v64;
                      CFStringRef v64 = &v62[v69];
                    }
                  }
                  else
                  {
                    double v54 = v64;
                    CFStringRef v64 = v62;
                  }
                  signed int v17 = &CGPointZero_ptr;
                  v63 -= v69;
                  v62 = v64;
                  CFStringRef v64 = v54;
                }
                while ((int)v63 > 0);
              }
            }
            else
            {
              signed int v17 = &CGPointZero_ptr;
            }
            unsigned int v70 = v83 - v82;
            if (v83 - v82 >= 1)
            {
              do
              {
                if (mInterstitialStringInsertionIndexes) {
                  BOOL v71 = v54 == (char *)0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  BOOL v71 = 1;
                }
                int v72 = !v71;
                v73 = (char *)(v54 - v62);
                BOOL v74 = v54 - v62 <= v70;
                if (v54 - v62 >= v70) {
                  v73 = (char *)v70;
                }
                if (v72 != 1) {
                  BOOL v74 = 1;
                }
                BOOL v90 = v74;
                if (v72 == 1) {
                  unint64_t v75 = (unint64_t)v73;
                }
                else {
                  unint64_t v75 = v70;
                }
                objc_msgSend(v93, "insertObject:atIndex:", +[NSString customNumberFormatIntegerTokenRepresentedStringWithDigits:separator:digitString:](NSString, "customNumberFormatIntegerTokenRepresentedStringWithDigits:separator:digitString:", v75, -[GQDTNumberFormat showThousandsSeparator](v94, "showThousandsSeparator"), @"#"), 0);
                if (v72)
                {
                  if (v90)
                  {
                    objc_msgSend(v93, "insertObject:atIndex:", -[NSArray objectAtIndex:](v94->mInterstitialStrings, "objectAtIndex:", v87++), 0);
                    v76 = [(NSIndexSet *)v94->mInterstitialStringInsertionIndexes indexGreaterThanIndex:v54];
                  }
                  else
                  {
                    v76 = v54;
                    double v54 = &v62[v75];
                  }
                }
                else
                {
                  v76 = v54;
                  double v54 = v62;
                }
                signed int v17 = &CGPointZero_ptr;
                v70 -= v75;
                v62 = v54;
                double v54 = v76;
              }
              while ((int)v70 > 0);
            }
            [v3 addObjectsFromArray:v93];
            char v19 = 0;
            goto LABEL_51;
          }
          int v41 = 0;
          if ((int)v18 < (int)v16)
          {
            while (1)
            {
              id v42 = [v14 characterAtIndex:v20];
              if (![(NSCharacterSet *)v86 characterIsMember:v42]) {
                break;
              }
              v41 += [(NSCharacterSet *)v84 characterIsMember:v42];
              if (v85 == ++v20)
              {
                unint64_t v18 = v16;
                goto LABEL_80;
              }
            }
            unint64_t v18 = v20;
          }
LABEL_80:
          uint64_t mNumberOfNonSpaceDecimalPlaceholderDigits = v94->mNumberOfNonSpaceDecimalPlaceholderDigits;
          unsigned int v48 = v41 - mNumberOfNonSpaceDecimalPlaceholderDigits;
          if (v94->mDecimalWidth) {
            uint64_t v49 = 0;
          }
          else {
            uint64_t v49 = v48;
          }
          if (v94->mDecimalWidth) {
            uint64_t v50 = v48;
          }
          else {
            uint64_t v50 = 0;
          }
          if (v94->mNumberOfNonSpaceDecimalPlaceholderDigits) {
            objc_msgSend(v3, "addObject:", +[NSString customNumberFormatDecimalTokenRepresentedStringWithDigits:digitString:](NSString, "customNumberFormatDecimalTokenRepresentedStringWithDigits:digitString:", mNumberOfNonSpaceDecimalPlaceholderDigits, @"0"));
          }
          signed int v17 = &CGPointZero_ptr;
          if ((int)v50 >= 1) {
            objc_msgSend(v3, "addObject:", +[NSString customNumberFormatDecimalTokenRepresentedStringWithDigits:digitString:](NSString, "customNumberFormatDecimalTokenRepresentedStringWithDigits:digitString:", v50, @"?"));
          }
          if ((int)v49 >= 1) {
            objc_msgSend(v3, "addObject:", +[NSString customNumberFormatDecimalTokenRepresentedStringWithDigits:digitString:](NSString, "customNumberFormatDecimalTokenRepresentedStringWithDigits:digitString:", v49, @"#"));
          }
          char v19 = 1;
          goto LABEL_46;
        }
        id v37 = [(CGPoint *)(id)v17[38] stringWithFormat:@"%C", v21];
LABEL_50:
        [v3 addObject:v37];
        goto LABEL_51;
      }
      id v40 = v17[38];
      uint64_t v30 = [(GQDTNumberFormat *)v94 currencyCode];
      int v31 = (CGPoint *)v40;
      uint64_t v32 = 3;
    }
LABEL_49:
    id v37 = [(CGPoint *)v31 customNumberFormatTokenStringOfType:v32 content:v30];
    goto LABEL_50;
  }
  char v92 = 0;
LABEL_165:
  double mScaleFactor = v94->mScaleFactor;
  if (mScaleFactor != 1.0 && (v92 & 1) == 0)
  {
    if (mScaleFactor == 100.0)
    {
      uint64_t v78 = 37;
    }
    else if (mScaleFactor == 0.01)
    {
      uint64_t v78 = 67;
    }
    else if (mScaleFactor == 0.001)
    {
      uint64_t v78 = 75;
    }
    else if (mScaleFactor == 0.000001)
    {
      uint64_t v78 = 77;
    }
    else if (mScaleFactor == 0.000000001)
    {
      uint64_t v78 = 66;
    }
    else if (mScaleFactor == 1.0e-12)
    {
      uint64_t v78 = 84;
    }
    else
    {
      uint64_t v78 = 0;
    }
    id v11 = [(CGPoint *)(id)v17[38] customNumberFormatTokenStringOfType:0 content:+[NSString stringWithFormat:@"%C", v78]];
    id v10 = v3;
    goto LABEL_181;
  }
  return v3;
}

- (BOOL)isCustom
{
  return self->mIsCustom;
}

- (BOOL)isTextFormat
{
  return self->mIsTextFormat;
}

- (int)fractionAccuracy
{
  return self->mFractionAccuracy;
}

@end