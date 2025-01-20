@interface OITSUCustomFormatData
+ (id)customFormatData;
- (BOOL)formatContainsIntegerToken;
- (BOOL)isComplexFormat;
- (BOOL)isConditional;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresFractionReplacement;
- (BOOL)showThousandsSeparator;
- (BOOL)useAccountingStyle;
- (NSArray)interstitialStrings;
- (NSIndexSet)interstitialStringInsertionIndexes;
- (NSString)formatString;
- (OITSUCustomFormatData)init;
- (OITSUCustomFormatData)initWithCustomFormatData:(id)a3;
- (double)scaleFactor;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)fractionAccuracy;
- (unint64_t)hash;
- (unsigned)currencyCodeIndex;
- (unsigned)decimalWidth;
- (unsigned)indexFromRightOfLastDigitPlaceholder;
- (unsigned)minimumIntegerWidth;
- (unsigned)numberOfHashDecimalPlaceholders;
- (unsigned)numberOfNonSpaceDecimalPlaceholderDigits;
- (unsigned)numberOfNonSpaceIntegerPlaceholderDigits;
- (unsigned)totalNumberOfDecimalPlaceholdersInFormat;
- (void)p_copySelfTo:(id)a3;
- (void)setCurrencyCodeIndex:(unsigned __int16)a3;
- (void)setDecimalWidth:(unsigned __int8)a3;
- (void)setFormatContainsIntegerToken:(BOOL)a3;
- (void)setFormatString:(id)a3;
- (void)setFractionAccuracy:(int)a3;
- (void)setIndexFromRightOfLastDigitPlaceholder:(unsigned __int8)a3;
- (void)setInterstitialStringInsertionIndexes:(id)a3;
- (void)setInterstitialStrings:(id)a3;
- (void)setIsComplexFormat:(BOOL)a3;
- (void)setIsConditional:(BOOL)a3;
- (void)setMinimumIntegerWidth:(unsigned __int8)a3;
- (void)setNumberOfHashDecimalPlaceholders:(unsigned __int8)a3;
- (void)setNumberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a3;
- (void)setNumberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a3;
- (void)setRequiresFractionReplacement:(BOOL)a3;
- (void)setScaleFactor:(double)a3;
- (void)setShowThousandsSeparator:(BOOL)a3;
- (void)setTotalNumberOfDecimalPlaceholdersInFormat:(unsigned __int8)a3;
- (void)setUseAccountingStyle:(BOOL)a3;
@end

@implementation OITSUCustomFormatData

+ (id)customFormatData
{
  v2 = objc_alloc_init(OITSUCustomFormatData);
  return v2;
}

- (OITSUCustomFormatData)initWithCustomFormatData:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OITSUCustomFormatData;
  v5 = [(OITSUCustomFormatData *)&v7 init];
  if (v5) {
    objc_msgSend(v4, "p_copySelfTo:", v5);
  }

  return v5;
}

- (OITSUCustomFormatData)init
{
  v3.receiver = self;
  v3.super_class = (Class)OITSUCustomFormatData;
  result = [(OITSUCustomFormatData *)&v3 init];
  if (result)
  {
    result->_scaleFactor = 1.0;
    result->_fractionAccuracy = -3;
    *(_WORD *)&result->_showThousandsSeparator = 0;
    result->_formatContainsIntegerToken = 1;
  }
  return result;
}

- (void)p_copySelfTo:(id)a3
{
  id v7 = a3;
  id v4 = [(OITSUCustomFormatData *)self formatString];
  [v7 setFormatString:v4];

  v5 = [(OITSUCustomFormatData *)self interstitialStrings];
  [v7 setInterstitialStrings:v5];

  v6 = [(OITSUCustomFormatData *)self interstitialStringInsertionIndexes];
  [v7 setInterstitialStringInsertionIndexes:v6];

  [(OITSUCustomFormatData *)self scaleFactor];
  objc_msgSend(v7, "setScaleFactor:");
  objc_msgSend(v7, "setFractionAccuracy:", -[OITSUCustomFormatData fractionAccuracy](self, "fractionAccuracy"));
  objc_msgSend(v7, "setMinimumIntegerWidth:", -[OITSUCustomFormatData minimumIntegerWidth](self, "minimumIntegerWidth"));
  objc_msgSend(v7, "setDecimalWidth:", -[OITSUCustomFormatData decimalWidth](self, "decimalWidth"));
  objc_msgSend(v7, "setNumberOfNonSpaceIntegerPlaceholderDigits:", -[OITSUCustomFormatData numberOfNonSpaceIntegerPlaceholderDigits](self, "numberOfNonSpaceIntegerPlaceholderDigits"));
  objc_msgSend(v7, "setNumberOfNonSpaceDecimalPlaceholderDigits:", -[OITSUCustomFormatData numberOfNonSpaceDecimalPlaceholderDigits](self, "numberOfNonSpaceDecimalPlaceholderDigits"));
  objc_msgSend(v7, "setIndexFromRightOfLastDigitPlaceholder:", -[OITSUCustomFormatData indexFromRightOfLastDigitPlaceholder](self, "indexFromRightOfLastDigitPlaceholder"));
  objc_msgSend(v7, "setNumberOfHashDecimalPlaceholders:", -[OITSUCustomFormatData numberOfHashDecimalPlaceholders](self, "numberOfHashDecimalPlaceholders"));
  objc_msgSend(v7, "setTotalNumberOfDecimalPlaceholdersInFormat:", -[OITSUCustomFormatData totalNumberOfDecimalPlaceholdersInFormat](self, "totalNumberOfDecimalPlaceholdersInFormat"));
  objc_msgSend(v7, "setCurrencyCodeIndex:", -[OITSUCustomFormatData currencyCodeIndex](self, "currencyCodeIndex"));
  objc_msgSend(v7, "setShowThousandsSeparator:", -[OITSUCustomFormatData showThousandsSeparator](self, "showThousandsSeparator"));
  objc_msgSend(v7, "setUseAccountingStyle:", -[OITSUCustomFormatData useAccountingStyle](self, "useAccountingStyle"));
  objc_msgSend(v7, "setRequiresFractionReplacement:", -[OITSUCustomFormatData requiresFractionReplacement](self, "requiresFractionReplacement"));
  objc_msgSend(v7, "setIsConditional:", -[OITSUCustomFormatData isConditional](self, "isConditional"));
  objc_msgSend(v7, "setFormatContainsIntegerToken:", -[OITSUCustomFormatData formatContainsIntegerToken](self, "formatContainsIntegerToken"));
  objc_msgSend(v7, "setIsComplexFormat:", -[OITSUCustomFormatData isComplexFormat](self, "isComplexFormat"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(OITSUCustomFormatData *)+[OITSUMutableCustomFormatData allocWithZone:a3] init];
  [(OITSUCustomFormatData *)self p_copySelfTo:v4];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TSUDynamicCast(v5, (uint64_t)v4);

  if (!v6) {
    goto LABEL_30;
  }
  int v7 = [(OITSUCustomFormatData *)self showThousandsSeparator];
  if (v7 != [v6 showThousandsSeparator]) {
    goto LABEL_30;
  }
  int v8 = [(OITSUCustomFormatData *)self useAccountingStyle];
  if (v8 != [v6 useAccountingStyle]) {
    goto LABEL_30;
  }
  int v9 = [(OITSUCustomFormatData *)self requiresFractionReplacement];
  if (v9 != [v6 requiresFractionReplacement]) {
    goto LABEL_30;
  }
  int v10 = [(OITSUCustomFormatData *)self isConditional];
  if (v10 != [v6 isConditional]) {
    goto LABEL_30;
  }
  int v11 = [(OITSUCustomFormatData *)self formatContainsIntegerToken];
  if (v11 != [v6 formatContainsIntegerToken]) {
    goto LABEL_30;
  }
  int v12 = [(OITSUCustomFormatData *)self isComplexFormat];
  if (v12 != [v6 isComplexFormat]) {
    goto LABEL_30;
  }
  int v13 = [(OITSUCustomFormatData *)self fractionAccuracy];
  if (v13 != [v6 fractionAccuracy]) {
    goto LABEL_30;
  }
  int v14 = [(OITSUCustomFormatData *)self minimumIntegerWidth];
  if (v14 != [v6 minimumIntegerWidth]) {
    goto LABEL_30;
  }
  int v15 = [(OITSUCustomFormatData *)self decimalWidth];
  if (v15 != [v6 decimalWidth]) {
    goto LABEL_30;
  }
  int v16 = [(OITSUCustomFormatData *)self numberOfNonSpaceIntegerPlaceholderDigits];
  if (v16 != [v6 numberOfNonSpaceIntegerPlaceholderDigits]) {
    goto LABEL_30;
  }
  int v17 = [(OITSUCustomFormatData *)self numberOfNonSpaceDecimalPlaceholderDigits];
  if (v17 != [v6 numberOfNonSpaceDecimalPlaceholderDigits]) {
    goto LABEL_30;
  }
  int v18 = [(OITSUCustomFormatData *)self indexFromRightOfLastDigitPlaceholder];
  if (v18 != [v6 indexFromRightOfLastDigitPlaceholder]) {
    goto LABEL_30;
  }
  int v19 = [(OITSUCustomFormatData *)self numberOfHashDecimalPlaceholders];
  if (v19 != [v6 numberOfHashDecimalPlaceholders]) {
    goto LABEL_30;
  }
  int v20 = [(OITSUCustomFormatData *)self totalNumberOfDecimalPlaceholdersInFormat];
  if (v20 != [v6 totalNumberOfDecimalPlaceholdersInFormat]) {
    goto LABEL_30;
  }
  [(OITSUCustomFormatData *)self scaleFactor];
  double v22 = v21;
  [v6 scaleFactor];
  if (v22 != v23) {
    goto LABEL_30;
  }
  int v24 = [(OITSUCustomFormatData *)self currencyCodeIndex];
  if (v24 != [v6 currencyCodeIndex]) {
    goto LABEL_30;
  }
  v25 = [(OITSUCustomFormatData *)self formatString];

  if (v25)
  {
    v26 = [(OITSUCustomFormatData *)self formatString];
    v27 = [v6 formatString];
    char v28 = [v26 isEqualToString:v27];

    if ((v28 & 1) == 0) {
      goto LABEL_30;
    }
  }
  else
  {
    v29 = [v6 formatString];

    if (v29) {
      goto LABEL_30;
    }
  }
  v30 = [(OITSUCustomFormatData *)self interstitialStrings];

  if (v30)
  {
    v31 = [(OITSUCustomFormatData *)self interstitialStrings];
    v32 = [v6 interstitialStrings];
    char v33 = [v31 isEqualToArray:v32];

    if ((v33 & 1) == 0) {
      goto LABEL_30;
    }
  }
  else
  {
    v34 = [v6 interstitialStrings];

    if (v34) {
      goto LABEL_30;
    }
  }
  v35 = [(OITSUCustomFormatData *)self interstitialStringInsertionIndexes];

  if (!v35)
  {
    v40 = [v6 interstitialStringInsertionIndexes];

    if (!v40) {
      goto LABEL_28;
    }
LABEL_30:
    BOOL v39 = 0;
    goto LABEL_31;
  }
  v36 = [(OITSUCustomFormatData *)self interstitialStringInsertionIndexes];
  v37 = [v6 interstitialStringInsertionIndexes];
  char v38 = [v36 isEqualToIndexSet:v37];

  if ((v38 & 1) == 0) {
    goto LABEL_30;
  }
LABEL_28:
  BOOL v39 = 1;
LABEL_31:

  return v39;
}

- (unint64_t)hash
{
  v2 = [(OITSUCustomFormatData *)self formatString];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (void)setFormatString:(id)a3
{
}

- (NSArray)interstitialStrings
{
  return self->_interstitialStrings;
}

- (void)setInterstitialStrings:(id)a3
{
}

- (NSIndexSet)interstitialStringInsertionIndexes
{
  return self->_interstitialStringInsertionIndexes;
}

- (void)setInterstitialStringInsertionIndexes:(id)a3
{
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (int)fractionAccuracy
{
  return self->_fractionAccuracy;
}

- (void)setFractionAccuracy:(int)a3
{
  self->_fractionAccuracy = a3;
}

- (unsigned)minimumIntegerWidth
{
  return self->_minimumIntegerWidth;
}

- (void)setMinimumIntegerWidth:(unsigned __int8)a3
{
  self->_minimumIntegerWidth = a3;
}

- (unsigned)decimalWidth
{
  return self->_decimalWidth;
}

- (void)setDecimalWidth:(unsigned __int8)a3
{
  self->_decimalWidth = a3;
}

- (unsigned)numberOfNonSpaceIntegerPlaceholderDigits
{
  return self->_numberOfNonSpaceIntegerPlaceholderDigits;
}

- (void)setNumberOfNonSpaceIntegerPlaceholderDigits:(unsigned __int8)a3
{
  self->_numberOfNonSpaceIntegerPlaceholderDigits = a3;
}

- (unsigned)numberOfNonSpaceDecimalPlaceholderDigits
{
  return self->_numberOfNonSpaceDecimalPlaceholderDigits;
}

- (void)setNumberOfNonSpaceDecimalPlaceholderDigits:(unsigned __int8)a3
{
  self->_numberOfNonSpaceDecimalPlaceholderDigits = a3;
}

- (unsigned)indexFromRightOfLastDigitPlaceholder
{
  return self->_indexFromRightOfLastDigitPlaceholder;
}

- (void)setIndexFromRightOfLastDigitPlaceholder:(unsigned __int8)a3
{
  self->_indexFromRightOfLastDigitPlaceholder = a3;
}

- (unsigned)numberOfHashDecimalPlaceholders
{
  return self->_numberOfHashDecimalPlaceholders;
}

- (void)setNumberOfHashDecimalPlaceholders:(unsigned __int8)a3
{
  self->_numberOfHashDecimalPlaceholders = a3;
}

- (unsigned)totalNumberOfDecimalPlaceholdersInFormat
{
  return self->_totalNumberOfDecimalPlaceholdersInFormat;
}

- (void)setTotalNumberOfDecimalPlaceholdersInFormat:(unsigned __int8)a3
{
  self->_totalNumberOfDecimalPlaceholdersInFormat = a3;
}

- (unsigned)currencyCodeIndex
{
  return self->_currencyCodeIndex;
}

- (void)setCurrencyCodeIndex:(unsigned __int16)a3
{
  self->_currencyCodeIndex = a3;
}

- (BOOL)showThousandsSeparator
{
  return self->_showThousandsSeparator;
}

- (void)setShowThousandsSeparator:(BOOL)a3
{
  self->_showThousandsSeparator = a3;
}

- (BOOL)useAccountingStyle
{
  return self->_useAccountingStyle;
}

- (void)setUseAccountingStyle:(BOOL)a3
{
  self->_useAccountingStyle = a3;
}

- (BOOL)requiresFractionReplacement
{
  return self->_requiresFractionReplacement;
}

- (void)setRequiresFractionReplacement:(BOOL)a3
{
  self->_requiresFractionReplacement = a3;
}

- (BOOL)isConditional
{
  return self->_isConditional;
}

- (void)setIsConditional:(BOOL)a3
{
  self->_isConditional = a3;
}

- (BOOL)formatContainsIntegerToken
{
  return self->_formatContainsIntegerToken;
}

- (void)setFormatContainsIntegerToken:(BOOL)a3
{
  self->_formatContainsIntegerToken = a3;
}

- (BOOL)isComplexFormat
{
  return self->_isComplexFormat;
}

- (void)setIsComplexFormat:(BOOL)a3
{
  self->_isComplexFormat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interstitialStringInsertionIndexes, 0);
  objc_storeStrong((id *)&self->_interstitialStrings, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
}

@end