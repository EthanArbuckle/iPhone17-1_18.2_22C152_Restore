@interface ICDateFilterTypeSelection
+ (NSDateFormatter)shortDateFormatter;
+ (id)keyPathsForValuesAffectingIsEmpty;
+ (id)keyPathsForValuesAffectingIsValid;
+ (id)relativeRangeStringComponentsForSelectionType:(unint64_t)a3 number:(id)a4;
+ (id)relativeRangeSummaryForSelectionType:(unint64_t)a3 amount:(unint64_t)a4;
+ (id)relativeRangeSummaryForSelectionType:(unint64_t)a3 number:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDateFilterSelection:(id)a3;
- (BOOL)isValid;
- (ICDateFilterTypeSelection)initWithSelectionType:(unint64_t)a3;
- (NSDate)primaryDate;
- (NSDate)secondaryDate;
- (NSDictionary)relativeRangeTimeIntervalOptions;
- (NSNumber)relativeRangeAmount;
- (NSString)primaryDateSummary;
- (NSString)relativeRangeAmountAndTimeInterval;
- (NSString)relativeRangeDateSummary;
- (NSString)relativeRangeLabel;
- (NSString)secondaryDateSummary;
- (double)relativeRangeTimeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)rawFilterValue;
- (id)relativeDateSummary;
- (id)relativeRangeAmountString;
- (id)relativeRangeTimeIntervalString;
- (int64_t)filterType;
- (unint64_t)hash;
- (unint64_t)relativeRangeSelectionType;
- (unint64_t)selectionType;
- (void)setPrimaryDate:(id)a3;
- (void)setRelativeRangeAmount:(id)a3;
- (void)setRelativeRangeSelectionType:(unint64_t)a3;
- (void)setRelativeRangeTimeInterval:(double)a3;
- (void)setSecondaryDate:(id)a3;
- (void)setSelectionType:(unint64_t)a3;
- (void)setSpecificDateRangeFrom:(id)a3 to:(id)a4;
- (void)updateDatesForCurrentSelectionType;
@end

@implementation ICDateFilterTypeSelection

+ (id)relativeRangeSummaryForSelectionType:(unint64_t)a3 amount:(unint64_t)a4
{
  switch(a3)
  {
    case 0uLL:
      a4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Unknown" value:@"Unknown" table:0 allowSiri:1];
      break;
    case 1uLL:
      v5 = NSString;
      v6 = (void *)MEMORY[0x1E4F83770];
      v7 = @"In the Past %lu Hours";
      goto LABEL_8;
    case 2uLL:
      v5 = NSString;
      v6 = (void *)MEMORY[0x1E4F83770];
      v7 = @"In the Past %lu Days";
      goto LABEL_8;
    case 3uLL:
      v5 = NSString;
      v6 = (void *)MEMORY[0x1E4F83770];
      v7 = @"In the Past %lu Weeks";
      goto LABEL_8;
    case 4uLL:
      v5 = NSString;
      v6 = (void *)MEMORY[0x1E4F83770];
      v7 = @"In the Past %lu Months";
      goto LABEL_8;
    case 5uLL:
      v5 = NSString;
      v6 = (void *)MEMORY[0x1E4F83770];
      v7 = @"In the Past %lu Years";
LABEL_8:
      v8 = [v6 localizedFrameworkStringForKey:v7 value:v7 table:0 allowSiri:1];
      a4 = objc_msgSend(v5, "localizedStringWithFormat:", v8, a4);

      break;
    default:
      break;
  }
  return (id)a4;
}

+ (id)relativeRangeSummaryForSelectionType:(unint64_t)a3 number:(id)a4
{
  v5 = (void *)[a4 longValue];
  switch(a3)
  {
    case 0uLL:
      v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Unknown" value:@"Unknown" table:0 allowSiri:1];
      break;
    case 1uLL:
      v6 = NSString;
      v7 = (void *)MEMORY[0x1E4F83770];
      v8 = @"In the Past %lu Hours";
      goto LABEL_8;
    case 2uLL:
      v6 = NSString;
      v7 = (void *)MEMORY[0x1E4F83770];
      v8 = @"In the Past %lu Days";
      goto LABEL_8;
    case 3uLL:
      v6 = NSString;
      v7 = (void *)MEMORY[0x1E4F83770];
      v8 = @"In the Past %lu Weeks";
      goto LABEL_8;
    case 4uLL:
      v6 = NSString;
      v7 = (void *)MEMORY[0x1E4F83770];
      v8 = @"In the Past %lu Months";
      goto LABEL_8;
    case 5uLL:
      v6 = NSString;
      v7 = (void *)MEMORY[0x1E4F83770];
      v8 = @"In the Past %lu Years";
LABEL_8:
      v9 = [v7 localizedFrameworkStringForKey:v8 value:v8 table:0 allowSiri:1];
      v5 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v5);

      break;
    default:
      break;
  }
  return v5;
}

+ (id)relativeRangeStringComponentsForSelectionType:(unint64_t)a3 number:(id)a4
{
  id v5 = a4;
  v6 = +[ICDateFilterTypeSelection relativeRangeSummaryForSelectionType:a3 number:v5];
  v7 = NSString;
  uint64_t v8 = [v5 unsignedIntegerValue];

  v9 = objc_msgSend(v7, "localizedStringWithFormat:", @"%lu", v8);
  v10 = [v6 componentsSeparatedByString:v9];

  return v10;
}

+ (NSDateFormatter)shortDateFormatter
{
  if (shortDateFormatter_shortDateFormatterOnceToken != -1) {
    dispatch_once(&shortDateFormatter_shortDateFormatterOnceToken, &__block_literal_global_15);
  }
  v2 = (void *)shortDateFormatter_shortDateFormatter;
  return (NSDateFormatter *)v2;
}

uint64_t __47__ICDateFilterTypeSelection_shortDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)shortDateFormatter_shortDateFormatter;
  shortDateFormatter_shortDateFormatter = (uint64_t)v0;

  [(id)shortDateFormatter_shortDateFormatter setDateStyle:1];
  v2 = (void *)shortDateFormatter_shortDateFormatter;
  return [v2 setTimeStyle:0];
}

- (ICDateFilterTypeSelection)initWithSelectionType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICDateFilterTypeSelection;
  result = [(ICDateFilterTypeSelection *)&v5 init];
  if (result) {
    result->_selectionType = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = [+[ICDateFilterTypeSelection allocWithZone:](ICDateFilterTypeSelection, "allocWithZone:") initWithSelectionType:[(ICDateFilterTypeSelection *)self selectionType]];
  v6 = [(ICDateFilterTypeSelection *)self primaryDate];
  [(ICDateFilterTypeSelection *)v5 setPrimaryDate:v6];

  v7 = [(ICDateFilterTypeSelection *)self secondaryDate];
  [(ICDateFilterTypeSelection *)v5 setSecondaryDate:v7];

  [(ICDateFilterTypeSelection *)v5 setRelativeRangeSelectionType:[(ICDateFilterTypeSelection *)self relativeRangeSelectionType]];
  uint64_t v8 = [(ICDateFilterTypeSelection *)self relativeRangeAmount];
  v9 = (void *)[v8 copyWithZone:a3];
  [(ICDateFilterTypeSelection *)v5 setRelativeRangeAmount:v9];

  return v5;
}

- (NSDate)primaryDate
{
  unint64_t v3 = [(ICDateFilterTypeSelection *)self selectionType];
  v4 = 0;
  if (v3 <= 0xA && ((1 << v3) & 0x740) != 0) {
    v4 = self->_primaryDate;
  }
  return v4;
}

- (void)setPrimaryDate:(id)a3
{
  objc_storeStrong((id *)&self->_primaryDate, a3);
  [(ICDateFilterTypeSelection *)self updateDatesForCurrentSelectionType];
}

- (void)setRelativeRangeTimeInterval:(double)a3
{
  [(ICDateFilterTypeSelection *)self setSelectionType:7];
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * (unint64_t)a3, 2) <= 0x444444444444444uLL) {
    unint64_t v5 = (unint64_t)(a3 / 60.0);
  }
  else {
    unint64_t v5 = 0;
  }
  if (v5 % 0x3C) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = v5 / 0x3C;
  }
  if (v6 == 24 * ((v6 * (unsigned __int128)0xAAAAAAAAAAAAAABuLL) >> 64)) {
    unint64_t v7 = (v6 * (unsigned __int128)0xAAAAAAAAAAAAAABuLL) >> 64;
  }
  else {
    unint64_t v7 = 0;
  }
  if (v7 % 7) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = v7 / 7;
  }
  if (v7 == 30 * (v7 / 0x1E)) {
    unint64_t v9 = v7 / 0x1E;
  }
  else {
    unint64_t v9 = 0;
  }
  unint64_t v10 = v7 - 365;
  if (v7 >= 0x16D && !(v7 % 0x16D))
  {
    [(ICDateFilterTypeSelection *)self setRelativeRangeSelectionType:5];
    v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v7 / 0x16D];
    [(ICDateFilterTypeSelection *)self setRelativeRangeAmount:v11];

    if (v10 > 0x16C) {
      return;
    }
    v12 = self;
    uint64_t v13 = 5;
LABEL_28:
    [(ICDateFilterTypeSelection *)v12 setSelectionType:v13];
    return;
  }
  if (v9)
  {
    [(ICDateFilterTypeSelection *)self setRelativeRangeSelectionType:4];
    v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v9];
    [(ICDateFilterTypeSelection *)self setRelativeRangeAmount:v14];

    if (v9 == 3)
    {
      v12 = self;
      uint64_t v13 = 4;
    }
    else
    {
      if (v9 != 1) {
        return;
      }
      v12 = self;
      uint64_t v13 = 3;
    }
    goto LABEL_28;
  }
  if (v8)
  {
    [(ICDateFilterTypeSelection *)self setRelativeRangeSelectionType:3];
    v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
    [(ICDateFilterTypeSelection *)self setRelativeRangeAmount:v15];

    if (v8 != 1) {
      return;
    }
    v12 = self;
    uint64_t v13 = 2;
    goto LABEL_28;
  }
  if (v7)
  {
    [(ICDateFilterTypeSelection *)self setRelativeRangeSelectionType:2];
    v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v7];
    [(ICDateFilterTypeSelection *)self setRelativeRangeAmount:v16];

    if (v7 == 2)
    {
      v12 = self;
      uint64_t v13 = 1;
    }
    else
    {
      if (v7 != 1) {
        return;
      }
      v12 = self;
      uint64_t v13 = 0;
    }
    goto LABEL_28;
  }
  [(ICDateFilterTypeSelection *)self setRelativeRangeSelectionType:1];
  id v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v6];
  [(ICDateFilterTypeSelection *)self setRelativeRangeAmount:v17];
}

- (void)setSpecificDateRangeFrom:(id)a3 to:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  unint64_t v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v17 timeIntervalSinceDate:v7];
  double v9 = v8;

  if (v9 == 0.0)
  {
    unint64_t v10 = self;
    uint64_t v11 = 9;
LABEL_3:
    [(ICDateFilterTypeSelection *)v10 setSelectionType:v11];
    v12 = self;
    id v13 = v6;
LABEL_6:
    [(ICDateFilterTypeSelection *)v12 setPrimaryDate:v13];
    goto LABEL_7;
  }
  v14 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v6 timeIntervalSinceDate:v14];
  double v16 = v15;

  if (v16 == 0.0)
  {
    [(ICDateFilterTypeSelection *)self setSelectionType:10];
    v12 = self;
    id v13 = v17;
    goto LABEL_6;
  }
  if (objc_msgSend(v17, "ic_isSameDayAsDate:", v6))
  {
    unint64_t v10 = self;
    uint64_t v11 = 8;
    goto LABEL_3;
  }
  [(ICDateFilterTypeSelection *)self setSelectionType:6];
  [(ICDateFilterTypeSelection *)self setPrimaryDate:v17];
  [(ICDateFilterTypeSelection *)self setSecondaryDate:v6];
LABEL_7:
}

- (NSDate)secondaryDate
{
  [(ICDateFilterTypeSelection *)self selectionType];
  secondaryDate = self->_secondaryDate;
  return secondaryDate;
}

- (void)setSecondaryDate:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_secondaryDate, a3);
  if ([(ICDateFilterTypeSelection *)self selectionType] == 6)
  {
    unint64_t v5 = [(ICDateFilterTypeSelection *)self primaryDate];
    int v6 = objc_msgSend(v7, "ic_isEarlierThanDate:", v5);

    if (v6) {
      [(ICDateFilterTypeSelection *)self setPrimaryDate:v7];
    }
  }
}

- (void)setSelectionType:(unint64_t)a3
{
  self->_selectionType = a3;
  if (a3 < 6)
  {
    [(ICDateFilterTypeSelection *)self setPrimaryDate:0];
LABEL_4:
    [(ICDateFilterTypeSelection *)self setSecondaryDate:0];
    goto LABEL_5;
  }
  if (a3 - 9 < 2) {
    goto LABEL_4;
  }
  if (a3 == 7 && ![(ICDateFilterTypeSelection *)self relativeRangeSelectionType]) {
    self->_relativeRangeSelectionType = 1;
  }
LABEL_5:
  [(ICDateFilterTypeSelection *)self updateDatesForCurrentSelectionType];
}

- (NSNumber)relativeRangeAmount
{
  unint64_t v3 = [(ICDateFilterTypeSelection *)self selectionType];
  v4 = 0;
  switch(v3)
  {
    case 0uLL:
      v4 = (NSNumber *)&unk_1F1F627A8;
      break;
    case 2uLL:
      v4 = (NSNumber *)&unk_1F1F627C0;
      break;
    case 3uLL:
      v4 = (NSNumber *)&unk_1F1F627D8;
      break;
    case 4uLL:
      v4 = (NSNumber *)&unk_1F1F627F0;
      break;
    case 5uLL:
      v4 = (NSNumber *)&unk_1F1F62808;
      break;
    case 7uLL:
      v4 = self->_relativeRangeAmount;
      break;
    default:
      break;
  }
  return v4;
}

- (unint64_t)relativeRangeSelectionType
{
  if ([(ICDateFilterTypeSelection *)self selectionType] == 7) {
    return self->_relativeRangeSelectionType;
  }
  else {
    return 0;
  }
}

- (NSString)primaryDateSummary
{
  switch([(ICDateFilterTypeSelection *)self selectionType])
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      unint64_t v3 = ICLocalizedStringFromICDateFilterSelectionType((void *)[(ICDateFilterTypeSelection *)self selectionType]);
      break;
    case 6uLL:
      v4 = [(id)objc_opt_class() shortDateFormatter];
      unint64_t v5 = [(ICDateFilterTypeSelection *)self primaryDate];
      uint64_t v6 = [v4 stringFromDate:v5];
      goto LABEL_16;
    case 7uLL:
      unint64_t v7 = [(ICDateFilterTypeSelection *)self relativeRangeSelectionType];
      double v8 = [(ICDateFilterTypeSelection *)self relativeRangeAmount];
      unint64_t v3 = +[ICDateFilterTypeSelection relativeRangeSummaryForSelectionType:amount:](ICDateFilterTypeSelection, "relativeRangeSummaryForSelectionType:amount:", v7, (int)[v8 intValue]);

      break;
    case 8uLL:
      double v9 = [(id)objc_opt_class() shortDateFormatter];
      unint64_t v10 = [(ICDateFilterTypeSelection *)self primaryDate];
      v4 = [v9 stringFromDate:v10];

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v12 = NSString;
      id v13 = (void *)MEMORY[0x1E4F83770];
      if (isKindOfClass) {
        v14 = @"Created on %@";
      }
      else {
        v14 = @"Edited on %@";
      }
      goto LABEL_15;
    case 9uLL:
      double v15 = [(id)objc_opt_class() shortDateFormatter];
      double v16 = [(ICDateFilterTypeSelection *)self primaryDate];
      v4 = [v15 stringFromDate:v16];

      objc_opt_class();
      char v17 = objc_opt_isKindOfClass();
      v12 = NSString;
      id v13 = (void *)MEMORY[0x1E4F83770];
      if (v17) {
        v14 = @"Created before %@";
      }
      else {
        v14 = @"Edited before %@";
      }
      goto LABEL_15;
    case 10uLL:
      v18 = [(id)objc_opt_class() shortDateFormatter];
      v19 = [(ICDateFilterTypeSelection *)self primaryDate];
      v4 = [v18 stringFromDate:v19];

      objc_opt_class();
      char v20 = objc_opt_isKindOfClass();
      v12 = NSString;
      id v13 = (void *)MEMORY[0x1E4F83770];
      if (v20) {
        v14 = @"Created after %@";
      }
      else {
        v14 = @"Edited after %@";
      }
LABEL_15:
      unint64_t v5 = [v13 localizedFrameworkStringForKey:v14 value:v14 table:0 allowSiri:1];
      uint64_t v6 = objc_msgSend(v12, "localizedStringWithFormat:", v5, v4);
LABEL_16:
      unint64_t v3 = (void *)v6;

      break;
    default:
      unint64_t v3 = 0;
      break;
  }
  return (NSString *)v3;
}

- (NSString)secondaryDateSummary
{
  unint64_t v3 = [(ICDateFilterTypeSelection *)self secondaryDate];
  if (v3)
  {
    v4 = [(id)objc_opt_class() shortDateFormatter];
    unint64_t v5 = [(ICDateFilterTypeSelection *)self secondaryDate];
    uint64_t v6 = [v4 stringFromDate:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ICDateFilterTypeSelection *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ICDateFilterTypeSelection *)self isEqualToDateFilterSelection:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[ICDateFilterTypeSelection selectionType](self, "selectionType"));
  uint64_t v22 = [v3 hash];
  v4 = [(ICDateFilterTypeSelection *)self primaryDate];
  uint64_t v5 = [v4 hash];
  LOBYTE(v6) = v5;
  if (!v5)
  {
    unint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v6 = [v7 hash];
  }
  double v8 = [(ICDateFilterTypeSelection *)self secondaryDate];
  if (![v8 hash])
  {
    double v9 = [MEMORY[0x1E4F1CA98] null];
    [v9 hash];
  }
  unint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[ICDateFilterTypeSelection relativeRangeSelectionType](self, "relativeRangeSelectionType"));
  [v10 hash];
  uint64_t v11 = [(ICDateFilterTypeSelection *)self relativeRangeAmount];
  if (![v11 hash])
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
    [v19 hash];
  }
  unint64_t v20 = ICHashWithHashKeys(v22, v12, v13, v14, v15, v16, v17, v18, v6);

  return v20;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  unint64_t v4 = [(ICDateFilterTypeSelection *)self selectionType] - 1;
  if (v4 > 9) {
    uint64_t v5 = @"Today";
  }
  else {
    uint64_t v5 = off_1E64A57C8[v4];
  }
  uint64_t v6 = [(ICDateFilterTypeSelection *)self primaryDate];
  unint64_t v7 = [(ICDateFilterTypeSelection *)self secondaryDate];
  double v8 = [(ICDateFilterTypeSelection *)self relativeRangeAmount];
  unint64_t v9 = [(ICDateFilterTypeSelection *)self relativeRangeSelectionType];
  if (v9 - 1 > 4) {
    unint64_t v10 = @"Unknown";
  }
  else {
    unint64_t v10 = off_1E64A57A0[v9 - 1];
  }
  uint64_t v11 = [v3 stringWithFormat:@"%@\n%@ - %@\n%@ %@", v5, v6, v7, v8, v10];

  return v11;
}

- (id)relativeDateSummary
{
  return +[ICDateFilterTypeSelection relativeRangeSummaryForSelectionType:self->_relativeRangeSelectionType number:self->_relativeRangeAmount];
}

- (NSString)relativeRangeLabel
{
  unint64_t v3 = [(ICDateFilterTypeSelection *)self relativeDateSummary];
  unint64_t v4 = [(ICDateFilterTypeSelection *)self relativeRangeAmountString];
  uint64_t v5 = [v3 componentsSeparatedByString:v4];

  uint64_t v6 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  if ([v6 localeIsArabic]) {
    [v5 lastObject];
  }
  else {
  unint64_t v7 = [v5 firstObject];
  }
  double v8 = objc_msgSend(v7, "ic_trimmedString");

  return (NSString *)v8;
}

- (id)relativeRangeTimeIntervalString
{
  unint64_t v3 = [(ICDateFilterTypeSelection *)self relativeDateSummary];
  unint64_t v4 = [(ICDateFilterTypeSelection *)self relativeRangeAmountString];
  uint64_t v5 = [v3 componentsSeparatedByString:v4];

  uint64_t v6 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  if ([v6 localeIsArabic]) {
    [v5 firstObject];
  }
  else {
  unint64_t v7 = [v5 lastObject];
  }
  double v8 = objc_msgSend(v7, "ic_trimmedString");

  return v8;
}

- (NSString)relativeRangeAmountAndTimeInterval
{
  v2 = self;
  unint64_t v3 = [(ICDateFilterTypeSelection *)self relativeRangeAmount];
  int v4 = [v3 intValue];

  uint64_t v5 = [v2 relativeRangeSelectionType];
  if (v4 == 1)
  {
    switch(v5)
    {
      case 0:
        goto LABEL_5;
      case 1:
        uint64_t v6 = (void *)MEMORY[0x1E4F83770];
        unint64_t v7 = @"HOUR_SUMMARY_SINGLE";
        double v8 = @"Hour";
        goto LABEL_10;
      case 2:
        uint64_t v6 = (void *)MEMORY[0x1E4F83770];
        unint64_t v7 = @"DAY_SUMMARY_SINGLE";
        double v8 = @"Day";
        goto LABEL_10;
      case 3:
        uint64_t v6 = (void *)MEMORY[0x1E4F83770];
        unint64_t v7 = @"WEEK_SUMMARY_SINGLE";
        double v8 = @"Week";
        goto LABEL_10;
      case 4:
        uint64_t v6 = (void *)MEMORY[0x1E4F83770];
        unint64_t v7 = @"MONTH_SUMMARY_SINGLE";
        double v8 = @"Month";
        goto LABEL_10;
      case 5:
        uint64_t v6 = (void *)MEMORY[0x1E4F83770];
        unint64_t v7 = @"YEAR_SUMMARY_SINGLE";
        double v8 = @"Year";
        goto LABEL_10;
      default:
        break;
    }
  }
  else
  {
    switch(v5)
    {
      case 0:
LABEL_5:
        uint64_t v6 = (void *)MEMORY[0x1E4F83770];
        unint64_t v7 = @"Unknown";
        double v8 = @"Unknown";
LABEL_10:
        v2 = [v6 localizedFrameworkStringForKey:v7 value:v8 table:0 allowSiri:1];
        break;
      case 1:
        unint64_t v9 = NSString;
        unint64_t v10 = (void *)MEMORY[0x1E4F83770];
        uint64_t v11 = @"%d_HOURS";
        goto LABEL_16;
      case 2:
        unint64_t v9 = NSString;
        unint64_t v10 = (void *)MEMORY[0x1E4F83770];
        uint64_t v11 = @"%d_DAYS";
        goto LABEL_16;
      case 3:
        unint64_t v9 = NSString;
        unint64_t v10 = (void *)MEMORY[0x1E4F83770];
        uint64_t v11 = @"%d_WEEKS";
        goto LABEL_16;
      case 4:
        unint64_t v9 = NSString;
        unint64_t v10 = (void *)MEMORY[0x1E4F83770];
        uint64_t v11 = @"%d_MONTHS";
        goto LABEL_16;
      case 5:
        unint64_t v9 = NSString;
        unint64_t v10 = (void *)MEMORY[0x1E4F83770];
        uint64_t v11 = @"%d_YEARS";
LABEL_16:
        uint64_t v12 = [v10 localizedFrameworkStringForKey:v11 value:v11 table:0 allowSiri:1];
        uint64_t v13 = [v2 relativeRangeAmount];
        v2 = objc_msgSend(v9, "localizedStringWithFormat:", v12, objc_msgSend(v13, "intValue"));

        break;
      default:
        break;
    }
  }
  return (NSString *)v2;
}

- (id)relativeRangeAmountString
{
  return (id)objc_msgSend(NSString, "localizedStringWithFormat:", @"%lu", -[NSNumber unsignedIntegerValue](self->_relativeRangeAmount, "unsignedIntegerValue"));
}

- (NSDictionary)relativeRangeTimeIntervalOptions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  for (uint64_t i = 1; i != 6; ++i)
  {
    uint64_t v5 = [(ICDateFilterTypeSelection *)self relativeRangeAmount];
    uint64_t v6 = +[ICDateFilterTypeSelection relativeRangeStringComponentsForSelectionType:i number:v5];

    unint64_t v7 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    if ([v7 localeIsArabic]) {
      [v6 firstObject];
    }
    else {
    double v8 = [v6 lastObject];
    }
    unint64_t v9 = objc_msgSend(v8, "ic_trimmedString");

    unint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInt:i];
    [v3 setObject:v9 forKeyedSubscript:v10];
  }
  return (NSDictionary *)v3;
}

- (int64_t)filterType
{
  return -1;
}

- (id)rawFilterValue
{
  unint64_t v2 = [(ICDateFilterTypeSelection *)self selectionType];
  if (v2 - 1 > 9) {
    return @"Today";
  }
  else {
    return off_1E64A57C8[v2 - 1];
  }
}

- (BOOL)isValid
{
  switch([(ICDateFilterTypeSelection *)self selectionType])
  {
    case 6uLL:
      id v3 = [(ICDateFilterTypeSelection *)self primaryDate];
      if (!v3) {
        goto LABEL_12;
      }
      uint64_t v5 = [(ICDateFilterTypeSelection *)self secondaryDate];
      if (v5)
      {
        uint64_t v6 = [(ICDateFilterTypeSelection *)self primaryDate];
        unint64_t v7 = [(ICDateFilterTypeSelection *)self secondaryDate];
        if (objc_msgSend(v6, "ic_isEarlierThanDate:", v7))
        {
          char v4 = 1;
        }
        else
        {
          unint64_t v9 = [(ICDateFilterTypeSelection *)self primaryDate];
          unint64_t v10 = [(ICDateFilterTypeSelection *)self secondaryDate];
          char v4 = [v9 isEqualToDate:v10];
        }
      }
      else
      {
        char v4 = 0;
      }
      goto LABEL_16;
    case 7uLL:
      id v3 = [(ICDateFilterTypeSelection *)self relativeRangeAmount];
      if (!v3) {
        goto LABEL_12;
      }
      uint64_t v5 = [(ICDateFilterTypeSelection *)self relativeRangeAmount];
      char v4 = [v5 integerValue] > 0;
LABEL_16:

      goto LABEL_17;
    case 8uLL:
      id v3 = [(ICDateFilterTypeSelection *)self primaryDate];
      if (v3)
      {
        double v8 = [(ICDateFilterTypeSelection *)self secondaryDate];
        char v4 = v8 != 0;
      }
      else
      {
LABEL_12:
        char v4 = 0;
      }
      goto LABEL_17;
    case 9uLL:
    case 10uLL:
      id v3 = [(ICDateFilterTypeSelection *)self primaryDate];
      char v4 = v3 != 0;
LABEL_17:

      break;
    default:
      char v4 = 1;
      break;
  }
  return v4;
}

+ (id)keyPathsForValuesAffectingIsValid
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"selectionType", @"primaryDate", @"secondaryDate", @"relativeRangeAmount", 0);
}

- (BOOL)isEmpty
{
  switch([(ICDateFilterTypeSelection *)self selectionType])
  {
    case 6uLL:
    case 8uLL:
      id v3 = [(ICDateFilterTypeSelection *)self primaryDate];
      if (v3)
      {
        char v4 = [(ICDateFilterTypeSelection *)self secondaryDate];
        BOOL v5 = v4 == 0;
      }
      else
      {
        BOOL v5 = 1;
      }
      goto LABEL_9;
    case 7uLL:
      uint64_t v6 = [(ICDateFilterTypeSelection *)self relativeRangeAmount];
      goto LABEL_7;
    case 9uLL:
    case 10uLL:
      uint64_t v6 = [(ICDateFilterTypeSelection *)self primaryDate];
LABEL_7:
      id v3 = (void *)v6;
      BOOL v5 = v6 == 0;
LABEL_9:

      break;
    default:
      BOOL v5 = 0;
      break;
  }
  return v5;
}

+ (id)keyPathsForValuesAffectingIsEmpty
{
  unint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = NSStringFromSelector(sel_selectionType);
  char v4 = NSStringFromSelector(sel_primaryDate);
  BOOL v5 = NSStringFromSelector(sel_secondaryDate);
  uint64_t v6 = NSStringFromSelector(sel_relativeRangeAmount);
  unint64_t v7 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, 0);

  return v7;
}

- (BOOL)isEqualToDateFilterSelection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICDateFilterTypeSelection *)self selectionType];
  if (v5 == [v4 selectionType])
  {
    uint64_t v6 = [(ICDateFilterTypeSelection *)self primaryDate];
    unint64_t v7 = [v4 primaryDate];
    double v8 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v6) {
      unint64_t v9 = 0;
    }
    else {
      unint64_t v9 = v6;
    }
    uint64_t v10 = v9;
    if (v8 == v7) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v7;
    }
    unint64_t v12 = v11;
    if (v10 | v12)
    {
      uint64_t v13 = (void *)v12;
      if (v10) {
        BOOL v14 = v12 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14) {
        goto LABEL_40;
      }
      int v15 = [(id)v10 isEqual:v12];

      if (!v15)
      {
        char v22 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    uint64_t v10 = [(ICDateFilterTypeSelection *)self secondaryDate];
    uint64_t v13 = [v4 secondaryDate];
    if (v8 == (void *)v10) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = (void *)v10;
    }
    uint64_t v17 = v16;
    if (v8 == v13) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = v13;
    }
    unint64_t v19 = v18;
    if (!(v17 | v19)) {
      goto LABEL_29;
    }
    unint64_t v20 = (void *)v19;
    if (v17) {
      BOOL v21 = v19 == 0;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21)
    {
      char v22 = 0;
LABEL_44:

      goto LABEL_45;
    }
    int v23 = [(id)v17 isEqual:v19];

    if (v23)
    {
LABEL_29:
      unint64_t v24 = [(ICDateFilterTypeSelection *)self relativeRangeSelectionType];
      if (v24 == [v4 relativeRangeSelectionType])
      {
        uint64_t v17 = [(ICDateFilterTypeSelection *)self relativeRangeAmount];
        unint64_t v20 = [v4 relativeRangeAmount];
        if (v8 == (void *)v17) {
          v25 = 0;
        }
        else {
          v25 = (void *)v17;
        }
        unint64_t v26 = v25;
        if (v8 == v20) {
          v27 = 0;
        }
        else {
          v27 = v20;
        }
        unint64_t v28 = v27;
        v29 = (void *)v28;
        if (v26 | v28)
        {
          char v22 = 0;
          if (v26 && v28) {
            char v22 = [(id)v26 isEqual:v28];
          }
        }
        else
        {
          char v22 = 1;
        }

        goto LABEL_44;
      }
    }
LABEL_40:
    char v22 = 0;
LABEL_45:

    goto LABEL_46;
  }
  char v22 = 0;
LABEL_47:

  return v22;
}

- (void)updateDatesForCurrentSelectionType
{
  switch([(ICDateFilterTypeSelection *)self selectionType])
  {
    case 6uLL:
      id v3 = [(ICDateFilterTypeSelection *)self primaryDate];
      id v4 = [(ICDateFilterTypeSelection *)self secondaryDate];
      int v5 = objc_msgSend(v3, "ic_isLaterThanDate:", v4);

      if (v5)
      {
        uint64_t v6 = [(ICDateFilterTypeSelection *)self primaryDate];
        secondaryDate = self->_secondaryDate;
        self->_secondaryDate = v6;
        goto LABEL_10;
      }
      return;
    case 8uLL:
      unint64_t v9 = [(ICDateFilterTypeSelection *)self primaryDate];
      objc_msgSend(v9, "ic_startOfDay");
      uint64_t v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
      primaryDate = self->_primaryDate;
      self->_primaryDate = v10;

      BOOL v14 = [(ICDateFilterTypeSelection *)self primaryDate];
      double v8 = [(NSDate *)v14 ic_endOfDay];
      uint64_t v12 = 32;
      goto LABEL_9;
    case 9uLL:
      BOOL v14 = [(ICDateFilterTypeSelection *)self primaryDate];
      double v8 = [(NSDate *)v14 ic_startOfDay];
      goto LABEL_8;
    case 10uLL:
      BOOL v14 = [(ICDateFilterTypeSelection *)self primaryDate];
      double v8 = [(NSDate *)v14 ic_endOfDay];
LABEL_8:
      uint64_t v12 = 24;
LABEL_9:
      uint64_t v13 = *(Class *)((char *)&self->super.super.isa + v12);
      *(Class *)((char *)&self->super.super.isa + v12) = v8;

      secondaryDate = v14;
LABEL_10:

      break;
    default:
      return;
  }
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (void)setRelativeRangeAmount:(id)a3
{
}

- (void)setRelativeRangeSelectionType:(unint64_t)a3
{
  self->_relativeRangeSelectionType = a3;
}

- (double)relativeRangeTimeInterval
{
  return self->_relativeRangeTimeInterval;
}

- (NSString)relativeRangeDateSummary
{
  return self->_relativeRangeDateSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeRangeDateSummary, 0);
  objc_storeStrong((id *)&self->_relativeRangeAmount, 0);
  objc_storeStrong((id *)&self->_secondaryDate, 0);
  objc_storeStrong((id *)&self->_primaryDate, 0);
}

@end