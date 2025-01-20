@interface SCLUnlockHistoryItemFormatter
- (NSDateComponentsFormatter)componentsFormatter;
- (NSDateFormatter)dateFormatter;
- (NSLocale)locale;
- (SCLUnlockHistoryItemFormatter)init;
- (UIColor)color;
- (UIColor)highlightColor;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)durationStringForHistoryItem:(id)a3;
- (id)fontDescriptor;
- (id)localizedStringWithTimeString:(id)a3 durationString:(id)a4;
- (id)stringForObjectValue:(id)a3;
- (id)timeStringForHistoryItem:(id)a3;
- (void)setColor:(id)a3;
- (void)setComponentsFormatter:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setLocale:(id)a3;
@end

@implementation SCLUnlockHistoryItemFormatter

- (SCLUnlockHistoryItemFormatter)init
{
  v14.receiver = self;
  v14.super_class = (Class)SCLUnlockHistoryItemFormatter;
  v2 = [(SCLUnlockHistoryItemFormatter *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F1C550] orangeColor];
    highlightColor = v2->_highlightColor;
    v2->_highlightColor = (UIColor *)v3;

    uint64_t v5 = [MEMORY[0x263F1C550] tableCellGrayTextColor];
    color = v2->_color;
    v2->_color = (UIColor *)v5;

    uint64_t v7 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v7;

    v9 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v9;

    [(NSDateFormatter *)v2->_dateFormatter setDateStyle:0];
    [(NSDateFormatter *)v2->_dateFormatter setTimeStyle:1];
    v11 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x263F08780]);
    componentsFormatter = v2->_componentsFormatter;
    v2->_componentsFormatter = v11;

    [(NSDateComponentsFormatter *)v2->_componentsFormatter setUnitsStyle:2];
    [(NSDateComponentsFormatter *)v2->_componentsFormatter setAllowedUnits:192];
    [(NSDateComponentsFormatter *)v2->_componentsFormatter setMaximumUnitCount:1];
  }
  return v2;
}

- (id)localizedStringWithTimeString:(id)a3 durationString:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"UNLOCK_HISTORY_LIST_FORMAT" value:&stru_26E283B80 table:@"SettingsFormatters"];

  v10 = [NSString localizedStringWithValidatedFormat:v9, @"%@%@", 0, v7, v6 validFormatSpecifiers error];

  return v10;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SCLUnlockHistoryItemFormatter *)self timeStringForHistoryItem:v4];
    id v6 = [(SCLUnlockHistoryItemFormatter *)self durationStringForHistoryItem:v4];
    id v7 = [(SCLUnlockHistoryItemFormatter *)self localizedStringWithTimeString:v5 durationString:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(SCLUnlockHistoryItemFormatter *)self timeStringForHistoryItem:v6];
    v23 = [(SCLUnlockHistoryItemFormatter *)self durationStringForHistoryItem:v6];
    v9 = -[SCLUnlockHistoryItemFormatter localizedStringWithTimeString:durationString:](self, "localizedStringWithTimeString:durationString:", v8);
    v22 = [(SCLUnlockHistoryItemFormatter *)self fontDescriptor];
    v10 = objc_msgSend(MEMORY[0x263F81708], "fontWithDescriptor:size:", 0.0);
    uint64_t v21 = *MEMORY[0x263F81500];
    v24[0] = *MEMORY[0x263F81500];
    v11 = [(SCLUnlockHistoryItemFormatter *)self color];
    v24[1] = *MEMORY[0x263F814F0];
    v25[0] = v11;
    v25[1] = v10;
    v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    v13 = (void *)[v12 mutableCopy];

    if (v7) {
      [v13 addEntriesFromDictionary:v7];
    }
    objc_super v14 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v9 attributes:v13];
    uint64_t v15 = [v9 rangeOfString:v8];
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v17 = v15;
      uint64_t v18 = v16;
      v19 = [(SCLUnlockHistoryItemFormatter *)self highlightColor];
      objc_msgSend(v14, "addAttribute:value:range:", v21, v19, v17, v18);
    }
  }
  else
  {
    objc_super v14 = 0;
  }

  return v14;
}

- (id)fontDescriptor
{
  return (id)[MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D260]];
}

- (id)timeStringForHistoryItem:(id)a3
{
  dateFormatter = self->_dateFormatter;
  id v5 = a3;
  id v6 = [v5 calendar];
  [(NSDateFormatter *)dateFormatter setCalendar:v6];

  id v7 = self->_dateFormatter;
  v8 = [v5 timeZone];
  [(NSDateFormatter *)v7 setTimeZone:v8];

  v9 = self->_dateFormatter;
  v10 = [v5 unlockedInterval];

  v11 = [v10 startDate];
  v12 = [(NSDateFormatter *)v9 stringFromDate:v11];

  return v12;
}

- (id)durationStringForHistoryItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 unlockedInterval];
  id v6 = [v5 startDate];

  id v7 = [v4 unlockedInterval];
  v8 = [v7 endDate];

  v9 = [v4 calendar];

  v10 = [v9 components:192 fromDate:v6 toDate:v8 options:0];

  v11 = [(NSDateComponentsFormatter *)self->_componentsFormatter stringFromDateComponents:v10];

  return v11;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (NSDateComponentsFormatter)componentsFormatter
{
  return self->_componentsFormatter;
}

- (void)setComponentsFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentsFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end