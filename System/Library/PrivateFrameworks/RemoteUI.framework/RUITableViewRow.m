@interface RUITableViewRow
+ (id)_formatterForDateYMD;
+ (id)_formatterForMonthAndDay;
+ (id)_formatterForShortDate;
+ (id)_formatterForYearAndMonth;
+ (id)_timeZoneAdjustedDateFromDate:(id)a3;
+ (void)initialize;
+ (void)resetLocale;
- (BOOL)_hasSubLabel;
- (BOOL)_matchesSearchTermComponent:(id)a3;
- (BOOL)configured;
- (BOOL)indentWhileEditing;
- (BOOL)isCopyable;
- (BOOL)isEditingEnabled;
- (BOOL)isFocused;
- (BOOL)isSelected;
- (BOOL)isShowingProgressIndicator;
- (BOOL)loadAccessoryImage;
- (BOOL)matchesSearchTerm:(id)a3;
- (BOOL)rowInvalid;
- (BOOL)rowSupportsLoadingIndicator;
- (BOOL)setSelectPageRowValue:(id)a3;
- (BOOL)showAlternateDetailLabel;
- (BOOL)supportsAutomaticSelection;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)wantsInlineActivityIndicator;
- (Class)tableCellClass;
- (NSData)data;
- (NSData)htmlSubLabelData;
- (NSDate)date;
- (NSDate)dateMax;
- (NSDate)dateMin;
- (NSDictionary)deleteAction;
- (NSMutableSet)searchTerms;
- (NSString)copyText;
- (NSString)description;
- (RUIDetailButtonElement)detailButton;
- (RUIPage)linkedPage;
- (RUITableView)tableView;
- (RUITableViewRowDelegate)delegate;
- (RUITextFieldChangeObserver)textFieldChangeObserver;
- (UIControl)control;
- (UIView)pickerView;
- (double)height;
- (float)rowHeightWithMax:(float)a3 peggedHeight:(float)a4 tableView:(id)a5 indexPath:(id)a6;
- (id)_cellSelectionStyleNumber;
- (id)_checkmarkAccessoryViewWithSelected:(BOOL)a3;
- (id)_datePickerFormatter;
- (id)copyTextFromCopyableAttribute;
- (id)dateFormatterCalendarIdentifier;
- (id)image:(id)a3 size:(CGSize)a4;
- (id)newConfiguredDatePicker;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)radioGroupSelectedColor;
- (id)selectOptions;
- (id)tableCell;
- (id)textColorForAttributeName:(id)a3;
- (id)textColorForAttributeName:(id)a3 defaultColorString:(id)a4;
- (id)viewForElementIdentifier:(id)a3;
- (int64_t)alignment;
- (int64_t)datePickerMode;
- (int64_t)datePickerStyle;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (int64_t)selectedRow;
- (int64_t)tableCellStyle;
- (void)_addDoneButtonToTextField:(id)a3;
- (void)_datePickerChanged:(id)a3;
- (void)_doneButtonTapped;
- (void)_drawCustomImage:(BOOL)a3;
- (void)_setBackgroundColor;
- (void)_switchFlipped:(id)a3;
- (void)_updateCellSelectionStyle;
- (void)_updateContentForDisabledState;
- (void)_updateDetailLabel;
- (void)_updateTextColors;
- (void)accessoryImageLoaded;
- (void)activateDatePicker;
- (void)clearCachedHeight;
- (void)configureAccessiblityWithTarget:(id)a3;
- (void)dealloc;
- (void)detailLabelActivatedLinkFromCell:(id)a3 completion:(id)a4;
- (void)parseBadge;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)populatePostbackDictionary:(id)a3;
- (void)reportInternalRenderEvent;
- (void)setAlignment:(int64_t)a3;
- (void)setAttributes:(id)a3;
- (void)setBadgeInTableCell:(id)a3;
- (void)setConfigured:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateMax:(id)a3;
- (void)setDateMin:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteAction:(id)a3;
- (void)setDetailAndPlaceholderText;
- (void)setDetailButton:(id)a3;
- (void)setEditableTextFieldValue:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFocused:(BOOL)a3;
- (void)setHeight:(double)a3;
- (void)setHtmlSubLabelData:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setLinkedPage:(id)a3;
- (void)setPickerView:(id)a3;
- (void)setRowInvalid:(BOOL)a3;
- (void)setSearchTerms:(id)a3;
- (void)setSection:(id)a3;
- (void)setSelectRowValue:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedRowTextColor;
- (void)setShowAlternateDetailLabel:(BOOL)a3;
- (void)setShowingProgressIndicator:(BOOL)a3;
- (void)setSourceXMLElement:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTextFieldChangeObserver:(id)a3;
- (void)setValueFromString:(id)a3;
- (void)setValueFromString:(id)a3 notify:(BOOL)a4;
- (void)setupDatePickerWithCell:(id)a3;
- (void)startActivityIndicator;
- (void)stopActivityIndicator;
- (void)switchCanceled;
- (void)tableCell;
- (void)textFieldEditingDidEnd:(id)a3;
- (void)webContainerView:(id)a3 didClickLinkWithURL:(id)a4;
@end

@implementation RUITableViewRow

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:a1 selector:sel_resetLocale name:*MEMORY[0x263EFF458] object:0];
  }
}

+ (id)_timeZoneAdjustedDateFromDate:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFFA18];
  id v4 = a3;
  v5 = [v3 systemTimeZone];
  v6 = objc_msgSend(v4, "dateByAddingTimeInterval:", (double)objc_msgSend(v5, "secondsFromGMT"));

  return v6;
}

+ (id)_formatterForDateYMD
{
  v2 = (void *)gYMDDateFormatter;
  if (!gYMDDateFormatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08790]);
    id v4 = (void *)gYMDDateFormatter;
    gYMDDateFormatter = (uint64_t)v3;

    [(id)gYMDDateFormatter setDateFormat:@"yyyy-MM-dd"];
    v5 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
    [(id)gYMDDateFormatter setTimeZone:v5];
    id v6 = objc_alloc(MEMORY[0x263EFF8F0]);
    v7 = (void *)[v6 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    [v7 setTimeZone:v5];
    [(id)gYMDDateFormatter setCalendar:v7];

    v2 = (void *)gYMDDateFormatter;
  }
  return v2;
}

+ (id)_formatterForShortDate
{
  id v3 = (void *)gShortDateFormatter;
  if (!gShortDateFormatter)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08790]);
    v5 = (void *)gShortDateFormatter;
    gShortDateFormatter = (uint64_t)v4;

    id v6 = [a1 _formatterForDateYMD];
    v7 = (void *)gShortDateFormatter;
    v8 = [v6 calendar];
    [v7 setCalendar:v8];

    v9 = (void *)gShortDateFormatter;
    v10 = [v6 timeZone];
    [v9 setTimeZone:v10];

    [(id)gShortDateFormatter setDateStyle:1];
    [(id)gShortDateFormatter setTimeStyle:0];
    v11 = (void *)gShortDateFormatter;
    v12 = [MEMORY[0x263EFF8F0] currentCalendar];
    [v11 setCalendar:v12];

    id v3 = (void *)gShortDateFormatter;
  }
  return v3;
}

+ (id)_formatterForMonthAndDay
{
  id v3 = (void *)gMonthAndDayFormatter;
  if (!gMonthAndDayFormatter)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08790]);
    v5 = (void *)gMonthAndDayFormatter;
    gMonthAndDayFormatter = (uint64_t)v4;

    id v6 = [a1 _formatterForDateYMD];
    v7 = (void *)gMonthAndDayFormatter;
    v8 = [v6 calendar];
    [v7 setCalendar:v8];

    v9 = (void *)gMonthAndDayFormatter;
    v10 = [v6 timeZone];
    [v9 setTimeZone:v10];

    v11 = (void *)gMonthAndDayFormatter;
    v12 = (void *)MEMORY[0x263F08790];
    v13 = [MEMORY[0x263EFF960] currentLocale];
    v14 = [v12 dateFormatFromTemplate:@"d-MMMM" options:0 locale:v13];
    [v11 setDateFormat:v14];

    id v3 = (void *)gMonthAndDayFormatter;
  }
  return v3;
}

- (void)setSourceXMLElement:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RUITableViewRow;
  [(RUIElement *)&v4 setSourceXMLElement:a3];
  [(RUITableViewRow *)self parseBadge];
}

+ (id)_formatterForYearAndMonth
{
  id v3 = (void *)gYearAndMonthFormatter;
  if (!gYearAndMonthFormatter)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08790]);
    v5 = (void *)gYearAndMonthFormatter;
    gYearAndMonthFormatter = (uint64_t)v4;

    id v6 = [a1 _formatterForDateYMD];
    v7 = (void *)gYearAndMonthFormatter;
    v8 = [v6 calendar];
    [v7 setCalendar:v8];

    v9 = (void *)gYearAndMonthFormatter;
    v10 = [v6 timeZone];
    [v9 setTimeZone:v10];

    v11 = (void *)gYearAndMonthFormatter;
    v12 = (void *)MEMORY[0x263F08790];
    v13 = [MEMORY[0x263EFF960] currentLocale];
    v14 = [v12 dateFormatFromTemplate:@"MM/yyyy" options:0 locale:v13];
    [v11 setDateFormat:v14];

    id v3 = (void *)gYearAndMonthFormatter;
  }
  return v3;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(RUITableViewRow *)self detailButton];
  id v6 = [v5 identifier];
  int v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    v8 = [(RUITableViewRow *)self tableCell];
    v9 = [v8 accessoryView];
  }
  else
  {
    v10 = [(RUIElement *)self identifier];
    int v11 = [v10 isEqualToString:v4];

    if (v11)
    {
      v9 = [(RUITableViewRow *)self tableCell];
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)_datePickerFormatter
{
  datePickerFormatter = self->_datePickerFormatter;
  if (!datePickerFormatter)
  {
    int64_t datePickerMode = self->_datePickerMode;
    if (datePickerMode == 4)
    {
      uint64_t v5 = [(id)objc_opt_class() _formatterForYearAndMonth];
    }
    else
    {
      if (datePickerMode == 4270) {
        [(id)objc_opt_class() _formatterForMonthAndDay];
      }
      else {
      uint64_t v5 = [(id)objc_opt_class() _formatterForShortDate];
      }
    }
    id v6 = (NSDateFormatter *)v5;
    int v7 = [(RUITableViewRow *)self dateFormatterCalendarIdentifier];
    if (v7)
    {
      v8 = (NSDateFormatter *)[(NSDateFormatter *)v6 copy];

      v9 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:v7];
      [(NSDateFormatter *)v8 setCalendar:v9];

      id v6 = v8;
    }
    v10 = self->_datePickerFormatter;
    self->_datePickerFormatter = v6;

    datePickerFormatter = self->_datePickerFormatter;
  }
  return datePickerFormatter;
}

+ (void)resetLocale
{
  v2 = (void *)gYMDDateFormatter;
  gYMDDateFormatter = 0;

  id v3 = (void *)gShortDateFormatter;
  gShortDateFormatter = 0;

  id v4 = (void *)gMonthAndDayFormatter;
  gMonthAndDayFormatter = 0;

  uint64_t v5 = (void *)gYearAndMonthFormatter;
  gYearAndMonthFormatter = 0;
}

- (void)setAttributes:(id)a3
{
  v20 = self;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [&unk_26C557FF0 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(&unk_26C557FF0);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v9 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, v20);

        if (v9)
        {
          v10 = [v3 objectForKeyedSubscript:v8];
          int v11 = [v10 stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
          [v3 setObject:v11 forKeyedSubscript:v8];
        }
      }
      uint64_t v5 = [&unk_26C557FF0 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }
  v12 = objc_msgSend(v22, "objectForKeyedSubscript:", @"mode", v20);
  v13 = [v12 lowercaseString];

  if ([v13 isEqualToString:@"monthandday"])
  {
    uint64_t v14 = 4270;
    v15 = v21;
  }
  else
  {
    v15 = v21;
    if ([v13 isEqualToString:@"yearandmonth"]) {
      uint64_t v14 = 4;
    }
    else {
      uint64_t v14 = 1;
    }
  }
  v15[24] = v14;
  v16 = [v22 objectForKeyedSubscript:@"style"];
  v17 = [v16 lowercaseString];

  if ([v17 isEqualToString:@"compact"])
  {
    uint64_t v18 = 2;
  }
  else if ([v17 isEqualToString:@"wheels"])
  {
    uint64_t v18 = 1;
  }
  else
  {
    uint64_t v18 = 3;
  }
  v15[25] = v18;
  v19 = (void *)v15[20];
  v15[20] = 0;

  v23.receiver = v15;
  v23.super_class = (Class)RUITableViewRow;
  [(RUIElement *)&v23 setAttributes:v3];
}

- (BOOL)_hasSubLabel
{
  id v3 = [(RUIElement *)self attributes];
  uint64_t v4 = [v3 objectForKey:@"subLabel"];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [(RUITableViewRow *)self htmlSubLabelData];
    BOOL v5 = [v6 length] != 0;
  }
  return v5;
}

- (id)dateFormatterCalendarIdentifier
{
  v2 = [(RUIElement *)self attributes];
  id v3 = [v2 objectForKeyedSubscript:@"calendar"];

  if (v3 && ![v3 caseInsensitiveCompare:@"gregorian"]) {
    id v4 = (id)*MEMORY[0x263EFF3F8];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)textColorForAttributeName:(id)a3 defaultColorString:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F825C8];
  id v7 = a4;
  id v8 = a3;
  v9 = [(RUIElement *)self attributes];
  v10 = [v9 objectForKey:v8];

  int v11 = objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v7);

  v12 = objc_msgSend(v6, "_remoteUI_colorWithString:defaultColor:", v10, v11);

  return v12;
}

- (id)textColorForAttributeName:(id)a3
{
  id v4 = (void *)MEMORY[0x263F825C8];
  id v5 = a3;
  uint64_t v6 = [(RUIElement *)self attributes];
  id v7 = [v6 objectForKey:v5];

  id v8 = objc_msgSend(v4, "_remoteUI_colorWithString:", v7);

  return v8;
}

- (id)radioGroupSelectedColor
{
  id v3 = [(RUIElement *)self attributes];
  id v4 = [v3 objectForKey:@"radioGroupSelectedColor"];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F825C8];
    uint64_t v6 = [(RUIElement *)self attributes];
    id v7 = [v6 objectForKey:@"radioGroupSelectedColor"];
    id v8 = objc_msgSend(v5, "_remoteUI_colorWithString:", v7);
  }
  else
  {
    uint64_t v6 = [(RUIElement *)self style];
    id v8 = [v6 radioGroupSelectedColor];
  }

  return v8;
}

- (void)configureAccessiblityWithTarget:(id)a3
{
  id v4 = a3;
  id v5 = [(RUIElement *)self attributes];
  uint64_t v6 = [v5 objectForKey:@"class"];

  if ([v6 isEqualToString:@"editableText"])
  {
    uint64_t v7 = [(RemoteUITableViewCell *)self->_tableCell editableTextField];

    id v4 = (id)v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)RUITableViewRow;
  [(RUIElement *)&v8 configureAccessiblityWithTarget:v4];
}

- (void)_updateTextColors
{
  id v3 = [(RUIElement *)self attributes];
  id v42 = [v3 objectForKey:@"class"];

  if ([(RUITableViewRow *)self isFocused])
  {
    id v4 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
    id v5 = [(RUIElement *)self style];
    uint64_t v6 = [v5 focusedRowTextColor];
    [v4 setTextColor:v6];

    uint64_t v7 = [(RUIElement *)self style];
    uint64_t v8 = [v7 focusedRowTextColor];
LABEL_7:
    uint64_t v14 = (void *)v8;
    uint64_t v18 = [(UITableViewCell *)self->_tableCell ruiEditableTextField];
    [v18 setTextColor:v14];

    goto LABEL_8;
  }
  v9 = [(RUIElement *)self attributes];
  v10 = [v9 objectForKeyedSubscript:@"labelColor"];

  if (!v10)
  {
    v15 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
    v16 = [(RUIElement *)self style];
    v17 = [v16 labelRowTextColor];
    [v15 setTextColor:v17];

    uint64_t v7 = [(RUIElement *)self style];
    uint64_t v8 = [v7 labelRowTextColor];
    goto LABEL_7;
  }
  int v11 = [(RUIElement *)self attributes];
  v12 = [v11 objectForKey:@"labelColor"];
  uint64_t v13 = [v12 length];

  uint64_t v7 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
  if (v13)
  {
    uint64_t v14 = [(RUITableViewRow *)self textColorForAttributeName:@"labelColor"];
    [v7 setTextColor:v14];
  }
  else
  {
    uint64_t v14 = [(RUIElement *)self style];
    v36 = [v14 labelRowTextColor];
    [v7 setTextColor:v36];
  }
LABEL_8:

  if ([(RUITableViewRow *)self _hasSubLabel])
  {
    v19 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
    v20 = [(UITableViewCell *)self->_tableCell ruiValueLabel];
    v21 = [(RUIElement *)self attributes];
    id v22 = [v21 objectForKeyedSubscript:@"subLabel"];

    if (v22)
    {
      if ([(RUITableViewRow *)self isFocused])
      {
        objc_super v23 = [(RUIElement *)self style];
        long long v24 = [v23 focusedRowTextColor];
        [v19 setTextColor:v24];
      }
      else
      {
        objc_super v23 = [(RUITableViewRow *)self textColorForAttributeName:@"subLabelColor" defaultColorString:@"secondaryLabelColor"];
        [v19 setTextColor:v23];
      }
    }
    v30 = [(RUIElement *)self attributes];
    v31 = [v30 objectForKeyedSubscript:@"detailLabel"];

    if (!v31) {
      goto LABEL_25;
    }
    if ([(RUITableViewRow *)self isFocused]) {
      goto LABEL_23;
    }
    goto LABEL_18;
  }
  if (([v42 isEqualToString:@"link"] & 1) != 0
    || ([v42 isEqualToString:@"label"] & 1) != 0
    || [v42 isEqualToString:@"button"])
  {
    long long v25 = [(RUIElement *)self attributes];
    long long v26 = [v25 objectForKey:@"detailLabel"];

    if (v26)
    {
      long long v27 = [(RUIElement *)self attributes];
      v19 = [v27 objectForKey:@"detailLinkURL"];

      if (v19)
      {
LABEL_26:

        goto LABEL_27;
      }
      BOOL v28 = [(RUITableViewRow *)self isFocused];
      v20 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
      if (v28)
      {
LABEL_23:
        uint64_t v29 = [(RUIElement *)self style];
        v32 = [v29 focusedRowTextColor];
        [v20 setTextColor:v32];

        goto LABEL_24;
      }
LABEL_18:
      uint64_t v29 = [(RUITableViewRow *)self textColorForAttributeName:@"detailLabelColor" defaultColorString:@"secondaryLabelColor"];
      [v20 setTextColor:v29];
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
  }
LABEL_27:
  if (-[RUIElement enabled](self, "enabled") && [v42 isEqualToString:@"button"])
  {
    v33 = [(RUIElement *)self attributes];
    uint64_t v34 = [v33 objectForKey:@"accessory"];
    if (v34)
    {
      v35 = (void *)v34;
LABEL_37:

      goto LABEL_38;
    }
    v35 = [(RUIElement *)self attributes];
    uint64_t v37 = [v35 objectForKey:@"detailLabel"];
    if (v37)
    {
      v38 = (void *)v37;
LABEL_36:

      goto LABEL_37;
    }
    v38 = [(RUIElement *)self attributes];
    v39 = [v38 objectForKey:@"subLabel"];
    if (v39)
    {

      goto LABEL_36;
    }
    v40 = [(RUIElement *)self attributes];
    v41 = [v40 objectForKey:@"placeholder"];

    if (!v41)
    {
      v33 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
      v35 = [(RUIElement *)self style];
      v38 = [v35 buttonRowTextColor];
      [v33 setTextColor:v38];
      goto LABEL_36;
    }
  }
LABEL_38:
}

- (void)_updateContentForDisabledState
{
  BOOL v3 = [(RUIElement *)self enabled];
  id v4 = [(RUIElement *)self attributes];
  id v20 = [v4 objectForKey:@"class"];

  if ([v20 isEqualToString:@"editableText"])
  {
    id v5 = [(UITableViewCell *)self->_tableCell ruiEditableTextField];
    [v5 setEnabled:v3];

    uint64_t v6 = [(UITableViewCell *)self->_tableCell ruiEditableTextField];
    uint64_t v7 = v6;
    double v8 = 0.5;
    if (v3) {
      double v8 = 1.0;
    }
    [v6 setAlpha:v8];
  }
  v9 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
  [v9 setEnabled:v3];

  v10 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
  int v11 = [(UITableViewCell *)self->_tableCell ruiValueLabel];
  [v11 setEnabled:v3];
  v12 = [(RUIElement *)self attributes];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"subLabel"];
  if (v13)
  {
  }
  else
  {
    uint64_t v14 = [(RUIElement *)self attributes];
    v15 = [v14 objectForKeyedSubscript:@"detailLabel"];

    if (!v15) {
      goto LABEL_9;
    }
  }
  [v10 setEnabled:v3];
LABEL_9:
  [(UISwitch *)self->_switchControl setEnabled:v3];
  [(RUITableViewRow *)self _updateCellSelectionStyle];
  v16 = [(UITableViewCell *)self->_tableCell ruiImageView];
  [v16 setEnabled:v3];

  v17 = [(UITableViewCell *)self->_tableCell ruiImageView];
  uint64_t v18 = v17;
  double v19 = 0.5;
  if (v3) {
    double v19 = 1.0;
  }
  [v17 setAlpha:v19];

  [(RUITableViewRow *)self _updateTextColors];
}

- (void)_updateCellSelectionStyle
{
  BOOL v3 = [(RUIElement *)self enabled];
  id v4 = [(RUIElement *)self attributes];
  id v23 = [v4 objectForKey:@"class"];

  id v5 = [(RUITableViewRow *)self tableView];
  uint64_t v6 = [v5 tableView];
  if ([v6 allowsMultipleSelectionDuringEditing])
  {
    uint64_t v7 = [(RUITableViewRow *)self tableView];
    double v8 = [v7 tableView];
    int v9 = [v8 isEditing];

    if ((v9 & v3) != 0) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {

    uint64_t v10 = 0;
  }
  int v11 = [(RUIElement *)self attributes];
  v12 = [v11 objectForKeyedSubscript:@"editing"];

  if (v12)
  {
    uint64_t v13 = [(RUIElement *)self attributes];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"editing"];
    uint64_t v15 = [v14 BOOLValue];
    v16 = [(RUITableViewRow *)self tableCell];
    [v16 setEditing:v15];
  }
  if (!v3
    || ([v23 isEqualToString:@"editableText"] & 1) != 0
    || ([v23 isEqualToString:@"numberPicker"] & 1) != 0
    || ([v23 isEqualToString:@"switch"] & 1) != 0)
  {
    goto LABEL_19;
  }
  if (![v23 isEqualToString:@"label"])
  {
    if ([v23 isEqualToString:@"htmlLabel"]) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  v17 = [(RUIElement *)self attributes];
  uint64_t v18 = [v17 objectForKeyedSubscript:@"radioGroup"];
  if (!v18)
  {

    goto LABEL_19;
  }
  double v19 = (void *)v18;
  char v20 = [v23 isEqualToString:@"htmlLabel"];

  if ((v20 & 1) == 0) {
LABEL_17:
  }
    uint64_t v10 = 3;
LABEL_19:
  v21 = [(RUITableViewRow *)self _cellSelectionStyleNumber];
  id v22 = v21;
  if (v21) {
    uint64_t v10 = [v21 integerValue];
  }
  [(RemoteUITableViewCell *)self->_tableCell setSelectionStyle:v10];
}

- (id)_cellSelectionStyleNumber
{
  v2 = [(RUIElement *)self attributes];
  BOOL v3 = [v2 objectForKeyedSubscript:@"selectionStyle"];

  if (v3)
  {
    id v4 = [&unk_26C557F98 objectForKeyedSubscript:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setAlignment:(int64_t)a3
{
  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    id v4 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
    objc_msgSend(v4, "setTextAlignment:", -[RUITableViewRow alignment](self, "alignment"));

    if ([(RUITableViewRow *)self tableCellStyle] == 3)
    {
      id v5 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
      objc_msgSend(v5, "setTextAlignment:", -[RUITableViewRow alignment](self, "alignment"));
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RUITableViewRow;
  [(RUIElement *)&v4 setEnabled:a3];
  if (self->_tableCell) {
    [(RUITableViewRow *)self _updateContentForDisabledState];
  }
}

- (void)setRowInvalid:(BOOL)a3
{
  BOOL v3 = a3;
  self->_rowInvalid = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    tableCell = self->_tableCell;
    [(RemoteUITableViewCell *)tableCell setRowInvalid:v3];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    BOOL v3 = a3;
    self->_selected = a3;
    if (a3) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = [(RUITableViewRow *)self tableCell];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v8 = [(RUIElement *)self attributes];
      int v9 = [v8 objectForKey:@"radioGroupSelectedColor"];

      uint64_t v10 = [(RUITableViewRow *)self tableCell];
      int v11 = v10;
      if (v9)
      {
        v12 = [(RUITableViewRow *)self radioGroupSelectedColor];
        [v11 _setRemoteUIAccessoryType:v5 withColor:v12];
      }
      else
      {
        [v10 setRemoteUIAccessoryType:v5];
      }
    }
    else
    {
      int v11 = [(RUITableViewRow *)self tableCell];
      [v11 setAccessoryType:v5];
    }

    if (v3) {
      [(RUITableViewRow *)self radioGroupSelectedColor];
    }
    else {
    id v40 = [(RUITableViewRow *)self textColorForAttributeName:@"labelColor" defaultColorString:@"labelColor"];
    }
    uint64_t v13 = [(RUITableViewRow *)self tableCell];
    uint64_t v14 = [v13 ruiTextLabel];
    [v14 setTextColor:v40];

    uint64_t v15 = [(RUIElement *)self attributes];
    v16 = [v15 objectForKey:@"radioGroupSelectedColor"];

    if (v16)
    {
      v17 = [(RUITableViewRow *)self tableCell];
      uint64_t v18 = [v17 ruiDetailTextLabel];
      [v18 setTextColor:v40];
    }
    double v19 = [(RUIElement *)self attributes];
    char v20 = [v19 objectForKey:@"accessory"];

    if ([v20 length] && objc_msgSend(v20, "isEqualToString:", @"checkmark.circle"))
    {
      v21 = [(RUITableViewRow *)self tableCell];
      objc_opt_class();
      char v22 = objc_opt_isKindOfClass();

      if (v22)
      {
        id v23 = [(RUITableViewRow *)self tableCell];
        [v23 setRemoteUIAccessoryType:0];
      }
      long long v24 = [(RUITableViewRow *)self _checkmarkAccessoryViewWithSelected:v3];
      [(RemoteUITableViewCell *)self->_tableCell setRemoteUIAccessoryView:v24];
    }
    long long v25 = [(RUIElement *)self attributes];
    long long v26 = [v25 objectForKey:@"borderColor"];

    if (v26)
    {
      if (v3) {
        objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v26);
      }
      else {
      long long v27 = [MEMORY[0x263F825C8] clearColor];
      }
      BOOL v28 = [(RemoteUITableViewCell *)self->_tableCell layer];
      [v28 setCornerRadius:8.0];

      uint64_t v29 = [(RemoteUITableViewCell *)self->_tableCell layer];
      [v29 setMasksToBounds:1];

      v30 = [(RemoteUITableViewCell *)self->_tableCell layer];
      id v31 = v27;
      objc_msgSend(v30, "setBorderColor:", objc_msgSend(v31, "CGColor"));

      v32 = [(RemoteUITableViewCell *)self->_tableCell layer];
      [v32 setBorderWidth:3.0];

      v33 = [(RemoteUITableViewCell *)self->_tableCell layer];
      objc_msgSend(v33, "setShadowOffset:", 2.0, 3.0);

      id v34 = [MEMORY[0x263F825C8] lightGrayColor];
      uint64_t v35 = [v34 CGColor];
      v36 = [(RemoteUITableViewCell *)self->_tableCell layer];
      [v36 setShadowColor:v35];

      uint64_t v37 = [(RemoteUITableViewCell *)self->_tableCell layer];
      LODWORD(v38) = 1050253722;
      [v37 setShadowOpacity:v38];

      v39 = [(RemoteUITableViewCell *)self->_tableCell layer];
      [v39 setShadowRadius:8.0];
    }
    [(RUITableViewRow *)self _drawCustomImage:v3];
  }
}

- (void)setFocused:(BOOL)a3
{
  if (self->_focused != a3)
  {
    self->_focused = a3;
    [(RUITableViewRow *)self _updateTextColors];
  }
}

- (RUITableView)tableView
{
  v2 = [(RUITableViewRow *)self section];
  BOOL v3 = [v2 parent];

  return (RUITableView *)v3;
}

- (BOOL)wantsInlineActivityIndicator
{
  if (![(RUITableViewRow *)self rowSupportsLoadingIndicator]) {
    return 0;
  }
  BOOL v3 = [(RUIElement *)self attributes];
  objc_super v4 = [v3 objectForKeyedSubscript:@"shouldShowLoadingIndicator"];

  if (v4)
  {
    char v5 = [v4 BOOLValue];
  }
  else
  {
    uint64_t v6 = [(RUITableViewRow *)self tableView];
    uint64_t v7 = [v6 page];
    double v8 = [v7 activityIndicatorStyle];
    char v5 = [v8 isEqualToString:@"activeElement"];
  }
  return v5;
}

- (void)setShowingProgressIndicator:(BOOL)a3
{
  if (self->_showingProgressIndicator != a3)
  {
    BOOL v3 = a3;
    self->_showingProgressIndicator = a3;
    char v5 = [(RUITableViewRow *)self tableCell];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = [(RUITableViewRow *)self tableCell];
      [v7 setActivityIndicatorVisible:self->_showingProgressIndicator];

      id v10 = [(RUIElement *)self pageElement];
      double v8 = [v10 page];
      int v9 = [v8 view];
      [v9 setUserInteractionEnabled:!v3];
    }
  }
}

- (Class)tableCellClass
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_super v4 = (void *)[WeakRetained tableCellClassForTableViewRow:self];

  if (v4)
  {
    id v5 = v4;
    goto LABEL_17;
  }
  uint64_t v6 = [(RUIElement *)self attributes];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"detailLabel"];
  if (v7)
  {
    double v8 = [(RUIElement *)self attributes];
    int v9 = [v8 objectForKeyedSubscript:@"subLabel"];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  int v11 = [(RUITableViewRow *)self htmlSubLabelData];
  uint64_t v12 = [v11 length];

  uint64_t v13 = [(RUIElement *)self attributes];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"subLabelNumberOfLines"];

  uint64_t v15 = [(RUIElement *)self attributes];
  v16 = [v15 objectForKeyedSubscript:@"modernRow"];
  int v17 = [v16 BOOLValue];

  if (!v17)
  {
    if (v14 | v12) {
      int v18 = 1;
    }
    else {
      int v18 = v10;
    }
    if (v18 == 1)
    {
      double v19 = [(RUIElement *)self style];
      char v20 = +[RUIStyle osloStyle];
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
    else
    {
      v21 = [(RUIElement *)self attributes];
      char v22 = [v21 objectForKeyedSubscript:@"class"];
      if ([v22 isEqualToString:@"linkedOption"])
      {
      }
      else
      {
        id v23 = [(RUIElement *)self attributes];
        long long v24 = [v23 objectForKeyedSubscript:@"class"];
        int v25 = [v24 isEqualToString:@"selectPage"];

        if (!v25)
        {
          long long v27 = [(RUIElement *)self attributes];
          uint64_t v28 = [v27 objectForKey:@"detailLinkURL"];
          if (v28)
          {
            uint64_t v29 = (void *)v28;
            v30 = [(RUIElement *)self attributes];
            id v31 = [v30 objectForKey:@"customDetailLink"];
            int v32 = [v31 isEqualToString:@"true"];

            if (v32) {
              goto LABEL_16;
            }
          }
          else
          {
          }
          v33 = [(RUIElement *)self attributes];
          id v34 = [v33 objectForKey:@"reducedImagePaddings"];
          [v34 isEqualToString:@"true"];
        }
      }
    }
  }
LABEL_16:
  objc_opt_class();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
  return (Class)v5;
}

- (int64_t)tableCellStyle
{
  BOOL v3 = [(RUIElement *)self attributes];
  objc_super v4 = [v3 objectForKey:@"class"];

  if (([v4 isEqualToString:@"editableText"] & 1) == 0
    && ([v4 isEqualToString:@"numberPicker"] & 1) == 0)
  {
    uint64_t v6 = [(RUIElement *)self attributes];
    uint64_t v7 = [v6 objectForKey:@"subLabel"];
    if (v7)
    {
      double v8 = (void *)v7;
      int v9 = [(RUIElement *)self attributes];
      BOOL v10 = [v9 objectForKey:@"detailLabel"];

      if (!v10)
      {
        int64_t v5 = 3;
        goto LABEL_15;
      }
    }
    else
    {
    }
    int v11 = [(RUIElement *)self attributes];
    uint64_t v12 = [v11 objectForKey:@"detailLabel"];
    if (!v12)
    {
      uint64_t v12 = [(RUIElement *)self attributes];
      uint64_t v13 = [v12 objectForKey:@"placeholder"];
      if (!v13
        && ([v4 isEqualToString:@"datePicker"] & 1) == 0
        && ([v4 isEqualToString:@"select"] & 1) == 0)
      {
        char v15 = [v4 isEqualToString:@"selectPage"];

        if ((v15 & 1) == 0)
        {
          int64_t v5 = 0;
          goto LABEL_15;
        }
        goto LABEL_14;
      }
    }
LABEL_14:
    int64_t v5 = 1;
    goto LABEL_15;
  }
  int64_t v5 = 1000;
LABEL_15:

  return v5;
}

- (id)image:(id)a3 size:(CGSize)a4
{
  id v4 = a3;
  return v4;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(RUIElement *)self attributes];
  id v19 = [v5 objectForKeyedSubscript:@"imageTintColor"];

  if (v19)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:");
    uint64_t v7 = [(UITableViewCell *)self->_tableCell ruiImageView];
    [v7 setTintColor:v6];
  }
  else
  {
    uint64_t v6 = 0;
  }
  double v8 = [(RUIElement *)self attributes];
  int v9 = [v8 objectForKeyedSubscript:@"imagePadding"];
  uint64_t v10 = [v9 integerValue];

  -[RemoteUITableViewCell setImage:padding:tintColor:](self->_tableCell, "setImage:padding:tintColor:", v4, v6, (double)v10, (double)v10, (double)v10, (double)v10);
  int v11 = [(RUIElement *)self attributes];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"imageBackgroundColor"];

  if (v12)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v12);
    uint64_t v14 = [(UITableViewCell *)self->_tableCell ruiImageView];
    [v14 setBackgroundColor:v13];
  }
  char v15 = [(RUIElement *)self attributes];
  v16 = [v15 objectForKeyedSubscript:@"imageCornerRadius"];
  uint64_t v17 = [v16 integerValue];

  int v18 = [(UITableViewCell *)self->_tableCell ruiImageView];
  [v18 _setCornerRadius:(double)v17];

  [(RemoteUITableViewCell *)self->_tableCell setNeedsLayout];
}

- (void)setImageSize:(CGSize)a3
{
}

- (UIControl)control
{
  BOOL v3 = [(RUIElement *)self attributes];
  id v4 = [v3 objectForKeyedSubscript:@"class"];

  if ([v4 isEqualToString:@"switch"])
  {
    int64_t v5 = self->_switchControl;
LABEL_8:
    uint64_t v6 = v5;
    goto LABEL_9;
  }
  if ([v4 isEqual:@"datePicker"])
  {
    int64_t v5 = [(RUITableViewRow *)self pickerView];
    goto LABEL_8;
  }
  if (([v4 isEqualToString:@"editableText"] & 1) != 0
    || [v4 isEqualToString:@"numberPicker"])
  {
    int64_t v5 = [(UITableViewCell *)self->_tableCell ruiEditableTextField];
    goto LABEL_8;
  }
  uint64_t v6 = 0;
LABEL_9:

  return (UIControl *)v6;
}

- (void)accessoryImageLoaded
{
  double v13 = -1.0;
  BOOL v3 = [(RUIElement *)self URLAttributeForImageName:@"accessoryImage" getScale:&v13];
  if (v3)
  {
    id v4 = +[RUIImageLoader sharedImageLoader];
    uint64_t v5 = [v4 imageForURL:v3 loadIfAbsent:0];
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x263F827E8] imageWithCGImage:v5 scale:0 orientation:v13];
      tableCell = self->_tableCell;
      double v8 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v6];
      [(RemoteUITableViewCell *)tableCell setAccessoryView:v8];
    }
    int v9 = [v4 notificationCenter];
    uint64_t v10 = RUIImageLoaderDidLoadImageNotification;
    int v11 = [v3 absoluteString];
    uint64_t v12 = [(__CFString *)v10 stringByAppendingString:v11];
    [v9 removeObserver:self name:v12 object:0];
  }
}

- (BOOL)loadAccessoryImage
{
  BOOL v3 = [(RUIElement *)self attributes];
  id v4 = [v3 objectForKeyedSubscript:@"accessorySystemImage"];

  if (v4)
  {
    uint64_t v5 = [(RUIElement *)self attributes];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"accessorySymbolRenderingMode"];
    uint64_t v7 = [(RUIElement *)self systemImageNamed:v4 symbolRenderingMode:v6];

    double v8 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v7];
    int v9 = [(RUIElement *)self attributes];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"accessoryTintColor"];

    if (v10)
    {
      int v11 = objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v10);
      [v8 setTintColor:v11];
    }
    [(RemoteUITableViewCell *)self->_tableCell setAccessoryView:v8];

    BOOL v12 = 1;
  }
  else
  {
    double v22 = -1.0;
    double v13 = [(RUIElement *)self URLAttributeForImageName:@"accessoryImage" getScale:&v22];
    BOOL v12 = v13 != 0;
    if (v13)
    {
      uint64_t v14 = +[RUIImageLoader sharedImageLoader];
      uint64_t v15 = [v14 imageForURL:v13 loadIfAbsent:1];
      if (v15)
      {
        v16 = [MEMORY[0x263F827E8] imageWithCGImage:v15 scale:0 orientation:v22];
        tableCell = self->_tableCell;
        int v18 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v16];
        [(RemoteUITableViewCell *)tableCell setAccessoryView:v18];
      }
      else
      {
        v16 = [v14 notificationCenter];
        id v19 = RUIImageLoaderDidLoadImageNotification;
        int v18 = [v13 absoluteString];
        char v20 = [(__CFString *)v19 stringByAppendingString:v18];
        [v16 addObserver:self selector:sel_accessoryImageLoaded name:v20 object:0];
      }
    }
  }
  return v12;
}

- (id)tableCell
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  if (self->_tableCell) {
    goto LABEL_154;
  }
  BOOL v3 = [(RUIElement *)self attributes];
  v134 = [v3 objectForKey:@"class"];

  id v4 = (RemoteUITableViewCell *)objc_msgSend(objc_alloc(-[RUITableViewRow tableCellClass](self, "tableCellClass")), "initWithStyle:reuseIdentifier:", -[RUITableViewRow tableCellStyle](self, "tableCellStyle"), 0);
  tableCell = self->_tableCell;
  self->_tableCell = v4;

  [(RUITableViewRow *)self setBadgeInTableCell:self->_tableCell];
  uint64_t v6 = v134;
  if (([v134 isEqualToString:@"editableText"] & 1) != 0
    || [v134 isEqualToString:@"numberPicker"])
  {
    uint64_t v7 = [(UITableViewCell *)self->_tableCell ruiEditableTextField];
    double v8 = [(RUIElement *)self attributes];
    int v9 = [v8 objectForKey:@"placeholder"];
    [v7 setPlaceholder:v9];

    uint64_t v10 = [(RUIElement *)self attributes];
    int v11 = [v10 objectForKey:@"value"];

    if (!v11)
    {
      BOOL v12 = [(RUIElement *)self attributes];
      double v13 = [v12 objectForKey:@"clientValue"];

      if ([v13 isEqualToString:@"phoneNumber"]
        && ([MEMORY[0x263F82670] currentDevice],
            uint64_t v14 = objc_claimAutoreleasedReturnValue(),
            uint64_t v15 = [v14 userInterfaceIdiom],
            v14,
            !v15))
      {
        uint64_t v137 = 0;
        v138 = &v137;
        uint64_t v139 = 0x2020000000;
        id v34 = (uint64_t (*)(void))getCTSettingCopyMyPhoneNumberSymbolLoc_ptr;
        v140 = getCTSettingCopyMyPhoneNumberSymbolLoc_ptr;
        if (!getCTSettingCopyMyPhoneNumberSymbolLoc_ptr)
        {
          *(void *)&long long buf = MEMORY[0x263EF8330];
          *((void *)&buf + 1) = 3221225472;
          v142 = __getCTSettingCopyMyPhoneNumberSymbolLoc_block_invoke;
          v143 = &unk_264211600;
          v144 = &v137;
          __getCTSettingCopyMyPhoneNumberSymbolLoc_block_invoke((uint64_t)&buf);
          id v34 = (uint64_t (*)(void))v138[3];
        }
        _Block_object_dispose(&v137, 8);
        if (!v34) {
          -[RUITableViewRow tableCell]();
        }
        int v11 = (void *)v34();
      }
      else
      {
        int v11 = 0;
      }
    }
    [(RUITableViewRow *)self setEditableTextFieldValue:v11];
    v16 = [(RemoteUITableViewCell *)self->_tableCell editableTextField];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [v16 addTarget:WeakRetained action:sel_textFieldStartedEditing_ forEvents:0x10000];

    int v18 = [(RemoteUITableViewCell *)self->_tableCell editableTextField];
    [v18 addTarget:self action:sel_textFieldEditingDidEnd_ forControlEvents:0x40000];

    id v19 = [(UITableViewCell *)self->_tableCell ruiEditableTextField];
    [v19 setDelegate:self];
    char v20 = [(RUIElement *)self attributes];
    v21 = [v20 objectForKey:@"keyboardType"];

    if ([v21 isEqualToString:@"email"])
    {
      [v19 setKeyboardType:7];
    }
    else
    {
      if (![v21 isEqualToString:@"url"])
      {
        if ([v21 isEqualToString:@"asciiCapable"])
        {
          [v19 setKeyboardType:1];
        }
        else if ([v21 isEqualToString:@"numbersAndPunctuation"])
        {
          [v19 setKeyboardType:2];
          [(RUITableViewRow *)self _addDoneButtonToTextField:v19];
        }
        else if ([v21 isEqualToString:@"numberPad"])
        {
          [v19 setKeyboardType:4];
          [(RUITableViewRow *)self _addDoneButtonToTextField:v19];
        }
        else if ([v21 isEqualToString:@"phonePad"])
        {
          [v19 setKeyboardType:5];
          [(RUITableViewRow *)self _addDoneButtonToTextField:v19];
        }
        else if ([v21 isEqualToString:@"namePhonePad"])
        {
          [v19 setKeyboardType:6];
        }
        else if ([v21 isEqualToString:@"decimalPad"])
        {
          [v19 setKeyboardType:8];
          [(RUITableViewRow *)self _addDoneButtonToTextField:v19];
        }
        int v22 = 0;
LABEL_62:
        v45 = [(RUIElement *)self attributes];
        v46 = [v45 objectForKey:@"autocapitalizationType"];

        if ([v46 isEqualToString:@"none"])
        {
          uint64_t v47 = 0;
        }
        else if ([v46 isEqualToString:@"words"])
        {
          uint64_t v47 = 1;
        }
        else if ([v46 isEqualToString:@"sentences"])
        {
          uint64_t v47 = 2;
        }
        else
        {
          if (![v46 isEqualToString:@"allCharacters"]) {
            goto LABEL_71;
          }
          uint64_t v47 = 3;
        }
        [v19 setAutocapitalizationType:v47];
LABEL_71:
        v48 = [(RUIElement *)self attributes];
        v49 = [v48 objectForKey:@"secure"];
        int v50 = [v49 BOOLValue];

        if (v50)
        {
          [v19 setSecureTextEntry:1];
        }
        else if (!v22)
        {
LABEL_75:
          v51 = [(RUIElement *)self attributes];
          v52 = [v51 objectForKey:@"disableAutocorrection"];
          int v53 = [v52 BOOLValue];

          if (v53)
          {
            [v19 setAutocorrectionType:1];
            [v19 setShortcutConversionType:1];
          }
          v54 = [(RUIElement *)self attributes];
          v55 = [v54 objectForKey:@"disableAutocapitalization"];

          if (v55)
          {
            NSLog(&cfstr_WarningRemoteu.isa);
            if ([v55 BOOLValue]) {
              [v19 setAutocapitalizationType:0];
            }
          }
          v56 = [(RUIElement *)self attributes];
          v57 = [v56 objectForKey:@"suffix"];

          if ([v57 length])
          {
            v58 = [(RUITableViewRow *)self textColorForAttributeName:@"suffixColor"];
            [v19 _setSuffix:v57 withColor:v58];
          }
          v59 = [(UITableViewCell *)self->_tableCell ruiEditableTextField];
          v60 = [(RUITableViewRow *)self textColorForAttributeName:@"textColor"];
          [v59 setTextColor:v60];

          goto LABEL_83;
        }
        [v19 setAutocapitalizationType:0];
        [v19 setAutocorrectionType:1];
        goto LABEL_75;
      }
      [v19 setKeyboardType:3];
    }
    int v22 = 1;
    goto LABEL_62;
  }
  if ([v134 isEqualToString:@"switch"])
  {
    if (+[RUIPlatform isAppleTV])
    {
      if (_isInternalInstall())
      {
        id v23 = _RUILoggingFacility();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_2144F2000, v23, OS_LOG_TYPE_DEFAULT, "AppleTV does not support switchRow", (uint8_t *)&buf, 2u);
        }
      }
    }
    else if (!self->_switchControl)
    {
      id v24 = objc_alloc(MEMORY[0x263F82C40]);
      int v25 = (UISwitch *)objc_msgSend(v24, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      switchControl = self->_switchControl;
      self->_switchControl = v25;

      [(UISwitch *)self->_switchControl addTarget:self action:sel__switchFlipped_ forControlEvents:4096];
    }
    [(RemoteUITableViewCell *)self->_tableCell setRemoteUIAccessoryView:self->_switchControl];
    long long v27 = [(RUIElement *)self attributes];
    uint64_t v28 = [v27 objectForKey:@"on"];
    if ([v28 BOOLValue])
    {
    }
    else
    {
      id v31 = [(RUIElement *)self attributes];
      int v32 = [v31 objectForKey:@"value"];
      int v33 = [v32 BOOLValue];

      if (!v33)
      {
LABEL_34:
        self->_switchValue = [(UISwitch *)self->_switchControl isOn];
        goto LABEL_83;
      }
    }
    [(UISwitch *)self->_switchControl setOn:1];
    goto LABEL_34;
  }
  if ([v134 isEqualToString:@"datePicker"])
  {
    [(RUITableViewRow *)self setupDatePickerWithCell:self->_tableCell];
    goto LABEL_83;
  }
  if ([v134 isEqualToString:@"select"])
  {
    uint64_t v29 = [(RUIElement *)self attributes];
    v30 = [v29 objectForKey:@"value"];
    [(RUITableViewRow *)self setSelectRowValue:v30];

LABEL_52:
    goto LABEL_83;
  }
  if ([v134 hasPrefix:@"html"] && -[NSData length](self->_data, "length"))
  {
    if (([v134 isEqualToString:@"htmlLabel"] & 1) == 0)
    {
      uint64_t v35 = [(RemoteUITableViewCell *)self->_tableCell webContainerView];
      v36 = [v35 webView];
      [v36 setUserInteractionEnabled:0];

      uint64_t v6 = v134;
    }
    if ([v6 isEqualToString:@"htmlLink"])
    {
      uint64_t v37 = [(RemoteUITableViewCell *)self->_tableCell contentView];
      [v37 setUserInteractionEnabled:0];
    }
    double v38 = self->_tableCell;
    data = self->_data;
    uint64_t v29 = [(RUIElement *)self sourceURL];
    [(RemoteUITableViewCell *)v38 setHTMLData:data sourceURL:v29 delegate:self];
    goto LABEL_52;
  }
  if ([v134 isEqualToString:@"linkedOption"])
  {
    uint64_t v29 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
    [v29 setLineBreakMode:0];
    [v29 setNumberOfLines:0];
    goto LABEL_52;
  }
  if ([v134 isEqualToString:@"selectPage"])
  {
    id v40 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
    [v40 setLineBreakMode:0];
    [v40 setNumberOfLines:0];
    v41 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
    [v41 setLineBreakMode:0];
    [v41 setNumberOfLines:0];
    id v42 = [(RUIElement *)self attributes];
    v43 = [v42 objectForKeyedSubscript:@"align"];

    if (v43)
    {
      v44 = self->_tableCell;
      [(RemoteUITableViewCell *)v44 setDetailTextAlignment:+[RUIParser textAlignmentForString:v43]];
    }
    [(RUITableViewRow *)self setDetailAndPlaceholderText];
  }
LABEL_83:
  v61 = [(RUIElement *)self attributes];
  v133 = [v61 objectForKey:@"label"];

  if ([v133 length])
  {
    v62 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
    [v62 setText:v133];

    v63 = [(RUIElement *)self attributes];
    v64 = [v63 objectForKeyedSubscript:@"labelNumberOfLines"];

    if (v64)
    {
      uint64_t v65 = [v64 integerValue];
      v66 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
      [v66 setNumberOfLines:v65];
    }
    v67 = [(RUIElement *)self attributes];
    v68 = [v67 objectForKeyedSubscript:@"labelTextStyle"];
    v69 = [(RUIElement *)self textStyleWithString:v68];

    if (v69)
    {
      v70 = [MEMORY[0x263F81708] preferredFontForTextStyle:v69];
      v71 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
      [v71 setFont:v70];

      v72 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
      [v72 setAdjustsFontForContentSizeCategory:1];
    }
  }
  v73 = [(RUIElement *)self attributes];
  v74 = [v73 objectForKey:@"indentation"];

  if ([v74 length])
  {
    [(RemoteUITableViewCell *)self->_tableCell setIndentationLevel:1];
    v75 = self->_tableCell;
    [v74 floatValue];
    [(RemoteUITableViewCell *)v75 setIndentationWidth:v76];
  }
  v77 = [(RemoteUITableViewCell *)self->_tableCell textLabel];
  objc_msgSend(v77, "setTextAlignment:", -[RUITableViewRow alignment](self, "alignment"));

  if ([(RUITableViewRow *)self alignment] && [(RUITableViewRow *)self tableCellStyle] == 3)
  {
    v78 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
    objc_msgSend(v78, "setTextAlignment:", -[RUITableViewRow alignment](self, "alignment"));
  }
  v79 = [(RUIElement *)self attributes];
  v80 = [v79 objectForKey:@"subLabel"];
  if ([v80 length])
  {
  }
  else
  {
    v81 = [(RUITableViewRow *)self htmlSubLabelData];
    uint64_t v82 = [v81 length];

    if (!v82) {
      goto LABEL_116;
    }
  }
  v83 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
  v84 = [(UITableViewCell *)self->_tableCell ruiValueLabel];
  v85 = [(RUIElement *)self attributes];
  v86 = [v85 objectForKey:@"subLabel"];

  v87 = [(RUIElement *)self attributes];
  v88 = [v87 objectForKey:@"detailLabel"];

  v89 = self->_tableCell;
  v90 = [(RUITableViewRow *)self htmlSubLabelData];
  v91 = [(RUIElement *)self sourceURL];
  [(RemoteUITableViewCell *)v89 setHTMLSubLabelData:v90 sourceURL:v91 delegate:self];

  if ([v86 length])
  {
    [v83 setText:v86];
    v92 = [(RUIElement *)self attributes];
    v93 = [v92 objectForKeyedSubscript:@"subLabelNumberOfLines"];

    if (v93) {
      objc_msgSend(v83, "setNumberOfLines:", objc_msgSend(v93, "integerValue"));
    }
    v94 = [(RUIElement *)self attributes];
    v95 = [v94 objectForKeyedSubscript:@"subLabelTextStyle"];
    v96 = [(RUIElement *)self textStyleWithString:v95];

    if (v96)
    {
      v97 = [MEMORY[0x263F81708] preferredFontForTextStyle:v96];
      [v83 setFont:v97];

      [v83 setAdjustsFontForContentSizeCategory:1];
    }
  }
  if ([v88 length])
  {
    [v84 setText:v88];
    v98 = [(RUITableViewRow *)self textColorForAttributeName:@"detailLabelColor"];
    [v84 setTextColor:v98];
  }
  v99 = [(RUIElement *)self style];
  v100 = +[RUIStyle osloStyle];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v101 = [(RUIElement *)self attributes];
    v102 = [v101 objectForKeyedSubscript:@"detailLabel"];
    BOOL v103 = v102 == 0;

    if (!v103)
    {
      if ([v88 length])
      {
        v104 = [(RUIElement *)self attributes];
        v105 = [v104 objectForKey:@"detailLinkURL"];

        if (v105)
        {
          objc_initWeak((id *)&buf, self);
          v106 = self->_tableCell;
          v135[0] = MEMORY[0x263EF8330];
          v135[1] = 3221225472;
          v135[2] = __28__RUITableViewRow_tableCell__block_invoke;
          v135[3] = &unk_264212500;
          objc_copyWeak(&v136, (id *)&buf);
          [(RemoteUITableViewCell *)v106 setDetailLinkText:v88 handler:v135];
          objc_destroyWeak(&v136);
          objc_destroyWeak((id *)&buf);
        }
        else
        {
          [v83 setText:v88];
        }
      }
      if ([v86 length]) {
        [v84 setText:v86];
      }
    }
  }
  else
  {
  }
LABEL_116:
  [(RUITableViewRow *)self _updateDetailLabel];
  v107 = [(RUIElement *)self attributes];
  v108 = [v107 objectForKey:@"invalid"];
  int v109 = [v108 BOOLValue];

  if (v109)
  {
    self->_rowInvalid = 1;
  }
  else if (!self->_rowInvalid)
  {
    goto LABEL_120;
  }
  [(RemoteUITableViewCell *)self->_tableCell setRowInvalid:1];
LABEL_120:
  v110 = [(RUIElement *)self attributes];
  v111 = [v110 objectForKey:@"accessory"];

  v112 = [(RUITableViewRow *)self detailButton];

  if (!v112)
  {
    if (([v111 isEqualToString:@"disclosure"] & 1) != 0
      || [v134 isEqualToString:@"selectPage"])
    {
      [(RemoteUITableViewCell *)self->_tableCell setRemoteUIAccessoryType:1];
    }
    else if ([v111 isEqualToString:@"detailDisclosure"])
    {
      [(RemoteUITableViewCell *)self->_tableCell setRemoteUIAccessoryType:2];
    }
    else if ([v111 isEqualToString:@"checkmark"])
    {
      [(RemoteUITableViewCell *)self->_tableCell setRemoteUIAccessoryType:3];
    }
    else if ([v111 isEqualToString:@"none"])
    {
      [(RemoteUITableViewCell *)self->_tableCell setRemoteUIAccessoryType:0];
    }
    else if ([v111 isEqualToString:@"spinner"])
    {
      [(RemoteUITableViewCell *)self->_tableCell setActivityIndicatorVisible:1];
    }
    goto LABEL_137;
  }
  if ([v111 length] && _isInternalInstall())
  {
    v113 = _RUILoggingFacility();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v134;
      _os_log_impl(&dword_2144F2000, v113, OS_LOG_TYPE_DEFAULT, "%@ has a detail button and an accessory. Ignoring accessory.", (uint8_t *)&buf, 0xCu);
    }
  }
  v114 = [(RUITableViewRow *)self detailButton];
  if ([v114 visibility] == 1)
  {
  }
  else
  {
    v115 = [(RUITableViewRow *)self detailButton];
    BOOL v116 = [v115 visibility] == 0;

    if (!v116) {
      goto LABEL_133;
    }
  }
  [(RemoteUITableViewCell *)self->_tableCell setEditingAccessoryType:4];
LABEL_133:
  v117 = [(RUITableViewRow *)self detailButton];
  if ([v117 visibility] == 2)
  {

LABEL_136:
    [(RemoteUITableViewCell *)self->_tableCell setAccessoryType:4];
    goto LABEL_137;
  }
  v118 = [(RUITableViewRow *)self detailButton];
  BOOL v119 = [v118 visibility] == 0;

  if (v119) {
    goto LABEL_136;
  }
LABEL_137:
  if ([(RUITableViewRow *)self isSelected])
  {
    [(RemoteUITableViewCell *)self->_tableCell setRemoteUIAccessoryType:3];
    v120 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
    v121 = [(RUIElement *)self style];
    v122 = [v121 radioGroupSelectedColor];
    [v120 setTextColor:v122];
  }
  if ([v111 isEqualToString:@"checkmark.circle"])
  {
    [(RemoteUITableViewCell *)self->_tableCell setRemoteUIAccessoryType:0];
    v123 = [(RUITableViewRow *)self _checkmarkAccessoryViewWithSelected:[(RUITableViewRow *)self isSelected]];
    [(RemoteUITableViewCell *)self->_tableCell setRemoteUIAccessoryView:v123];
  }
  if ([(RUIElement *)self loadImage]) {
    [(RemoteUITableViewCell *)self->_tableCell setClipsContents:1];
  }
  [(RUITableViewRow *)self loadAccessoryImage];
  v124 = [(RUIElement *)self attributes];
  v125 = [v124 objectForKey:@"firstResponder"];

  if ([v125 BOOLValue])
  {
    if (([v134 isEqualToString:@"editableText"] & 1) != 0
      || ([v134 isEqualToString:@"numberPicker"] & 1) != 0
      || ([v134 isEqualToString:@"select"] & 1) != 0
      || [v134 isEqualToString:@"datePicker"])
    {
      id v126 = objc_loadWeakRetained((id *)&self->_delegate);
      [v126 rowIsFirstResponder:self];
    }
    else
    {
      NSLog(&cfstr_WarningFirstre.isa, v134);
    }
  }
  v127 = [(RUIElement *)self attributes];
  v128 = [v127 objectForKey:@"forceFullSizeDetailLabel"];

  if ([v128 BOOLValue]) {
    [(RemoteUITableViewCell *)self->_tableCell setForceFullSizeDetailLabel:1];
  }
  v129 = [(RUIElement *)self attributes];
  v130 = [v129 objectForKey:@"leftAlignDetailLabel"];

  if ([v130 BOOLValue]) {
    [(RemoteUITableViewCell *)self->_tableCell setLeftAlignDetailLabel:1];
  }
  [(RUITableViewRow *)self _updateContentForDisabledState];

LABEL_154:
  [(RUITableViewRow *)self setSelectedRowTextColor];
  [(RUITableViewRow *)self _drawCustomImage:[(RUITableViewRow *)self isSelected]];
  [(RUITableViewRow *)self _setBackgroundColor];
  [(RUITableViewRow *)self _updateDetailLabel];
  v131 = self->_tableCell;
  return v131;
}

void __28__RUITableViewRow_tableCell__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained detailLabelActivatedLinkFromCell:v6 completion:v5];
}

- (void)_updateDetailLabel
{
  BOOL v3 = [(RUIElement *)self attributes];
  id v4 = [v3 objectForKey:@"class"];

  if (([v4 isEqualToString:@"link"] & 1) != 0
    || ([v4 isEqualToString:@"label"] & 1) != 0
    || [v4 isEqualToString:@"button"])
  {
    id v5 = [(RUIElement *)self attributes];
    id v6 = [v5 objectForKey:@"detailLabel"];

    if (v6)
    {
      uint64_t v7 = [(RUIElement *)self attributes];
      double v8 = [v7 objectForKey:@"detailLabel"];

      int v9 = [(RUIElement *)self attributes];
      uint64_t v10 = [v9 objectForKeyedSubscript:@"alternateDetailLabel"];

      if (-[RUITableViewRow showAlternateDetailLabel](self, "showAlternateDetailLabel") && [v10 length])
      {
        id v11 = v10;

        double v8 = v11;
      }
      if ([v8 length])
      {
        BOOL v12 = [(RUIElement *)self attributes];
        double v13 = [v12 objectForKey:@"detailLinkURL"];

        if (v13)
        {
          objc_initWeak(&location, self);
          tableCell = self->_tableCell;
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __37__RUITableViewRow__updateDetailLabel__block_invoke;
          v16[3] = &unk_264212500;
          objc_copyWeak(&v17, &location);
          [(RemoteUITableViewCell *)tableCell setDetailLinkText:v8 handler:v16];
          objc_destroyWeak(&v17);
          objc_destroyWeak(&location);
        }
        else
        {
          uint64_t v15 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
          [v15 setText:v8];
        }
      }
    }
  }
}

void __37__RUITableViewRow__updateDetailLabel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained detailLabelActivatedLinkFromCell:v6 completion:v5];
}

- (id)newConfiguredDatePicker
{
  BOOL v3 = [(RUITableViewRow *)self dateFormatterCalendarIdentifier];
  if (v3) {
    [MEMORY[0x263EFF8F0] calendarWithIdentifier:v3];
  }
  else {
  id v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  }
  id v5 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  [v4 setTimeZone:v5];

  id v6 = objc_alloc(MEMORY[0x263F82650]);
  uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v7 setCalendar:v4];
  double v8 = +[RUITableViewRow _formatterForDateYMD];
  int v9 = [v8 timeZone];
  [v7 setTimeZone:v9];

  [v7 setAutoresizingMask:10];
  [v7 addTarget:self action:sel__datePickerChanged_ forControlEvents:4096];
  objc_msgSend(v7, "setDatePickerMode:", -[RUITableViewRow datePickerMode](self, "datePickerMode"));
  uint64_t v10 = [(RUITableViewRow *)self date];
  if (!v10)
  {
    id v11 = [MEMORY[0x263EFF910] date];
    uint64_t v10 = +[RUITableViewRow _timeZoneAdjustedDateFromDate:v11];
  }
  BOOL v12 = [v7 calendar];
  double v13 = [v12 components:30 fromDate:v10];

  [v13 setHour:0];
  [v13 setMinute:0];
  [v13 setSecond:0];
  uint64_t v14 = [v7 calendar];
  uint64_t v15 = [v14 dateFromComponents:v13];

  v16 = [(RUITableViewRow *)self dateMin];
  [v7 setMinimumDate:v16];

  id v17 = [(RUITableViewRow *)self dateMax];
  [v7 setMaximumDate:v17];

  [v7 setDate:v15 animated:0];
  return v7;
}

- (void)setupDatePickerWithCell:(id)a3
{
  id v21 = a3;
  id v4 = [(RUIElement *)self attributes];
  id v5 = [v4 objectForKey:@"value"];

  id v6 = [(RUIElement *)self attributes];
  uint64_t v7 = [v6 objectForKey:@"minValue"];

  double v8 = [(RUIElement *)self attributes];
  int v9 = [v8 objectForKey:@"maxValue"];

  if ([v5 length])
  {
    uint64_t v10 = +[RUITableViewRow _formatterForDateYMD];
    [v10 dateFromString:v5];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263EFF910] date];
    +[RUITableViewRow _timeZoneAdjustedDateFromDate:v10];
  id v11 = };
  [(RUITableViewRow *)self setDate:v11];

  if ([v7 length])
  {
    BOOL v12 = +[RUITableViewRow _formatterForDateYMD];
    double v13 = [v12 dateFromString:v7];
    [(RUITableViewRow *)self setDateMin:v13];
  }
  if ([v9 length])
  {
    if ([v9 isEqualToString:@"today"])
    {
      uint64_t v14 = [MEMORY[0x263EFF910] date];
      [(RUITableViewRow *)self setDateMax:v14];
    }
    else
    {
      uint64_t v14 = +[RUITableViewRow _formatterForDateYMD];
      uint64_t v15 = [v14 dateFromString:v9];
      [(RUITableViewRow *)self setDateMax:v15];
    }
  }
  if ([(RUITableViewRow *)self datePickerStyle] == 2)
  {
    v16 = [v21 ruiDetailTextLabel];
    [v16 setHidden:1];

    id v17 = [(RUITableViewRow *)self newConfiguredDatePicker];
    [v17 setUserInteractionEnabled:0];
    [(RUITableViewRow *)self setPickerView:v17];
    [v21 setRemoteUIAccessoryView:v17];
  }
  else
  {
    int v18 = [(RUIElement *)self attributes];
    id v17 = [v18 objectForKey:@"placeholder"];

    id v19 = v17;
    if (!v17)
    {
      int v18 = [(RUITableViewRow *)self _datePickerFormatter];
      id v19 = [v18 stringFromDate:self->_date];
    }
    char v20 = [v21 ruiDetailTextLabel];
    [v20 setText:v19];

    if (!v17)
    {
    }
  }
}

- (void)activateDatePicker
{
  BOOL v3 = [(RUITableViewRow *)self pickerView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(RUITableViewRow *)self pickerView];
    unint64_t v5 = [v6 datePickerMode];
    if (v5 <= 3) {
      [v6 _compactStyleSetActiveComponent:qword_214612850[v5]];
    }
  }
}

- (void)_addDoneButtonToTextField:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F82D70];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonTapped];
  double v8 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  v10[0] = v8;
  v10[1] = v7;
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  [v6 setItems:v9];

  [v6 sizeToFit];
  [v5 setInputAccessoryView:v6];
}

- (void)_doneButtonTapped
{
  id v2 = [(RemoteUITableViewCell *)self->_tableCell editableTextField];
  [v2 resignFirstResponder];
}

- (void)setDetailAndPlaceholderText
{
  BOOL v3 = [(RUIElement *)self attributes];
  id v10 = [v3 objectForKey:@"detailLabel"];

  id v4 = [(RUIElement *)self attributes];
  id v5 = [v4 objectForKey:@"placeholder"];

  id v6 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
  if ([v10 length])
  {
    [v6 setText:v10];
    id v7 = [(RUIElement *)self style];
    uint64_t v8 = [v7 selectPageDetailTextColor];
  }
  else
  {
    if (![v5 length]) {
      goto LABEL_6;
    }
    [v6 setText:v5];
    id v7 = objc_alloc_init(MEMORY[0x263F82CF0]);
    uint64_t v8 = [v7 _placeholderColor];
  }
  int v9 = (void *)v8;
  [v6 setTextColor:v8];

LABEL_6:
}

- (BOOL)_matchesSearchTermComponent:(id)a3
{
  id v4 = a3;
  id v5 = [(RUITableViewRow *)self searchTerms];

  if (v5)
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    id v6 = [(RUITableViewRow *)self searchTerms];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __47__RUITableViewRow__matchesSearchTermComponent___block_invoke;
    v17[3] = &unk_264212528;
    id v18 = v4;
    id v19 = &v20;
    [v6 enumerateObjectsUsingBlock:v17];

    char v7 = *((unsigned char *)v21 + 24) != 0;
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    uint64_t v8 = [(RUIElement *)self attributes];
    int v9 = [v8 objectForKeyedSubscript:@"label"];
    char v10 = [v9 localizedStandardContainsString:v4];

    if ((v10 & 1) != 0
      || ([(RUIElement *)self attributes],
          id v11 = objc_claimAutoreleasedReturnValue(),
          [v11 objectForKeyedSubscript:@"subLabel"],
          BOOL v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v12 localizedStandardContainsString:v4],
          v12,
          v11,
          (v13 & 1) != 0))
    {
      char v7 = 1;
    }
    else
    {
      uint64_t v14 = [(RUIElement *)self attributes];
      uint64_t v15 = [v14 objectForKeyedSubscript:@"detailLabel"];
      char v7 = [v15 localizedStandardContainsString:v4];
    }
  }

  return v7;
}

uint64_t __47__RUITableViewRow__matchesSearchTermComponent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 localizedStandardContainsString:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)matchesSearchTerm:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__RUITableViewRow_matchesSearchTerm___block_invoke;
  v8[3] = &unk_264212550;
  v8[4] = self;
  v8[5] = &v9;
  [v6 enumerateObjectsUsingBlock:v8];
  LOBYTE(self) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)self;
}

uint64_t __37__RUITableViewRow_matchesSearchTerm___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t result = [*(id *)(a1 + 32) _matchesSearchTermComponent:a2];
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  else
  {
    uint64_t result = 0;
  }
  *(unsigned char *)(v2 + 24) = result;
  return result;
}

- (void)setSelectedRowTextColor
{
  BOOL v3 = [(RUIElement *)self attributes];
  id v4 = [v3 objectForKeyedSubscript:@"class"];
  int v5 = [v4 isEqualToString:@"selectPage"];

  if (v5)
  {
    id v6 = [(RUIElement *)self style];
    id v11 = [v6 selectPageDetailTextColor];

    char v7 = [(RUIElement *)self attributes];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"selectPageRowColor"];

    if (v8)
    {
      uint64_t v9 = [(RUITableViewRow *)self textColorForAttributeName:@"selectPageRowColor"];

      id v11 = (id)v9;
    }
    char v10 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
    [v10 setTextColor:v11];
  }
}

- (void)setSelectRowValue:(id)a3
{
  id v4 = a3;
  self->_selectedRow = -1;
  id v14 = v4;
  if ([v4 length] && -[NSMutableArray count](self->_selectOptions, "count"))
  {
    int64_t v5 = 0;
    while (1)
    {
      id v6 = [(NSMutableArray *)self->_selectOptions objectAtIndex:v5];
      char v7 = [v6 value];
      int v8 = [v7 isEqualToString:v14];

      if (v8) {
        break;
      }

      if ([(NSMutableArray *)self->_selectOptions count] <= (unint64_t)++v5) {
        goto LABEL_8;
      }
    }
    self->_selectedRow = v5;
    uint64_t v9 = [v6 label];
    char v10 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
    [v10 setText:v9];
  }
LABEL_8:
  if (self->_selectedRow < 0)
  {
    id v11 = [(RUIElement *)self attributes];
    char v12 = [v11 objectForKey:@"placeholder"];
    char v13 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
    [v13 setText:v12];
  }
}

- (BOOL)setSelectPageRowValue:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  int64_t v5 = [(RUITableViewRow *)self selectOptions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        char v10 = [v9 value];
        int v11 = [v4 isEqualToString:v10];

        if (v11)
        {
          id v34 = v5;
          char v12 = [(RUIElement *)self attributes];
          char v13 = (void *)[v12 mutableCopy];

          id v14 = [v9 value];
          [v13 setObject:v14 forKeyedSubscript:@"value"];

          uint64_t v15 = [v9 label];
          [v13 setObject:v15 forKeyedSubscript:@"detailLabel"];

          v16 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
          id v17 = [v9 label];
          [v16 setText:v17];

          int v33 = v13;
          [(RUITableViewRow *)self setAttributes:v13];
          id v18 = [(RUITableViewRow *)self linkedPage];
          id v19 = [v18 tableViewOM];
          uint64_t v20 = [v19 sections];
          id v21 = [v20 firstObject];

          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          int v32 = v21;
          uint64_t v22 = [v21 rows];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v36 != v25) {
                  objc_enumerationMutation(v22);
                }
                long long v27 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                uint64_t v28 = [v27 attributes];
                uint64_t v29 = [v28 objectForKeyedSubscript:@"value"];
                uint64_t v30 = [v29 isEqualToString:v4];

                [v27 setSelected:v30];
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v24);
          }

          LOBYTE(v6) = 1;
          int64_t v5 = v34;
          goto LABEL_18;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v6;
}

- (void)setValueFromString:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(RUIElement *)self attributes];
  int v8 = [v7 objectForKey:@"class"];

  if ([v8 isEqualToString:@"editableText"])
  {
    uint64_t v9 = [(UITableViewCell *)self->_tableCell ruiEditableTextField];
    char v10 = [v9 text];
    char v11 = [v10 isEqualToString:v6];

    if (v11) {
      goto LABEL_17;
    }
    char v12 = [(UITableViewCell *)self->_tableCell ruiEditableTextField];
    [v12 setText:v6];

    goto LABEL_15;
  }
  if ([v8 isEqualToString:@"switch"])
  {
    int v13 = [(UISwitch *)self->_switchControl isOn];
    if (v13 == [v6 BOOLValue]) {
      goto LABEL_17;
    }
    -[UISwitch setOn:](self->_switchControl, "setOn:", [v6 BOOLValue]);
    goto LABEL_15;
  }
  if (![v8 isEqualToString:@"datePicker"])
  {
    if ([v8 isEqualToString:@"select"])
    {
      [(RUITableViewRow *)self setSelectRowValue:v6];
      goto LABEL_15;
    }
    if ([v8 isEqualToString:@"selectPage"])
    {
      if ([(RUITableViewRow *)self setSelectPageRowValue:v6])
      {
LABEL_15:
        if (v4)
        {
LABEL_16:
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained rowDidChange:self action:1];

          goto LABEL_17;
        }
        goto LABEL_17;
      }
      if (!_isInternalInstall()) {
        goto LABEL_17;
      }
      id v19 = _RUILoggingFacility();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      int v23 = 138412290;
      id v24 = v6;
      uint64_t v20 = "Warning: No selectPageRow linkedOption found with value '%@'";
    }
    else
    {
      if (!_isInternalInstall()) {
        goto LABEL_17;
      }
      id v19 = _RUILoggingFacility();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      int v23 = 138412290;
      id v24 = v8;
      uint64_t v20 = "Warning: Attempt to set value on row with class '%@' which is not settable";
    }
    id v21 = v19;
    uint32_t v22 = 12;
    goto LABEL_30;
  }
  if (![v6 length])
  {
    if (!_isInternalInstall()) {
      goto LABEL_17;
    }
    id v19 = _RUILoggingFacility();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      uint64_t v20 = "Warning: Ignoring empty date value";
      id v21 = v19;
      uint32_t v22 = 2;
LABEL_30:
      _os_log_impl(&dword_2144F2000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v23, v22);
    }
LABEL_31:

    goto LABEL_17;
  }
  id v14 = +[RUITableViewRow _formatterForDateYMD];
  uint64_t v15 = [v14 dateFromString:v6];

  v16 = [(RUITableViewRow *)self date];
  int v17 = [v16 isEqual:v15];

  if (!v17)
  {
    [(RUITableViewRow *)self setDate:v15];

    if (!v4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

LABEL_17:
}

- (void)setValueFromString:(id)a3
{
}

- (BOOL)supportsAutomaticSelection
{
  uint64_t v2 = [(RUIElement *)self attributes];
  BOOL v3 = [v2 objectForKey:@"class"];

  if ([v3 isEqualToString:@"datePicker"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"select"];
  }

  return v4;
}

- (void)populatePostbackDictionary:(id)a3
{
  id v25 = a3;
  char v4 = [(RUIElement *)self attributes];
  int64_t v5 = [v4 objectForKey:@"postback"];

  if (![v5 length])
  {
    id v6 = [(RUIElement *)self attributes];
    uint64_t v7 = [v6 objectForKey:@"id"];

    int64_t v5 = (void *)v7;
  }
  id v8 = [(RUITableViewRow *)self tableCell];
  if ([v5 length])
  {
    uint64_t v9 = [(RUIElement *)self attributes];
    char v10 = [v9 objectForKey:@"class"];

    if (([v10 isEqualToString:@"editableText"] & 1) != 0
      || [v10 isEqualToString:@"numberPicker"])
    {
      char v11 = [(UITableViewCell *)self->_tableCell ruiEditableTextField];
      char v12 = [v11 text];

      if (v12) {
        int v13 = v12;
      }
      else {
        int v13 = &stru_26C545B50;
      }
      [v25 setValue:v13 forKey:v5];

      goto LABEL_10;
    }
    if ([v10 isEqualToString:@"switch"])
    {
      uint32_t v22 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_switchControl, "isOn"));
      [v25 setValue:v22 forKey:v5];
LABEL_35:

      goto LABEL_10;
    }
    if ([v10 isEqualToString:@"datePicker"])
    {
      [v25 setValue:self->_date forKey:v5];
LABEL_10:

      goto LABEL_11;
    }
    if ([v10 isEqualToString:@"select"])
    {
      if (self->_selectedRow < 0) {
        goto LABEL_10;
      }
      uint32_t v22 = -[NSMutableArray objectAtIndex:](self->_selectOptions, "objectAtIndex:");
      uint64_t v23 = [v22 value];
    }
    else
    {
      if (![v10 isEqualToString:@"selectPage"]) {
        goto LABEL_10;
      }
      uint32_t v22 = [(RUIElement *)self attributes];
      uint64_t v23 = [v22 objectForKeyedSubscript:@"value"];
    }
    id v24 = (void *)v23;
    [v25 setValue:v23 forKey:v5];

    goto LABEL_35;
  }
LABEL_11:
  id v14 = [(RUIElement *)self attributes];
  uint64_t v15 = [v14 objectForKey:@"radioGroup"];

  if ([v15 length]
    && [(RemoteUITableViewCell *)self->_tableCell remoteUIAccessoryType] == 3)
  {
    v16 = [(RUIElement *)self attributes];
    int v17 = [v16 objectForKey:@"value"];

    if ([v17 length]) {
      [v25 setValue:v17 forKey:v15];
    }
  }
  id v18 = [(RUIElement *)self attributes];
  id v19 = [v18 objectForKey:@"accessory"];

  if ([v15 length]
    && [v19 isEqualToString:@"checkmark.circle"]
    && [(RUITableViewRow *)self isSelected])
  {
    uint64_t v20 = [(RUIElement *)self attributes];
    id v21 = [v20 objectForKey:@"value"];

    if ([v21 length]) {
      [v25 setValue:v21 forKey:v15];
    }
  }
}

- (id)selectOptions
{
  selectOptions = self->_selectOptions;
  if (!selectOptions)
  {
    char v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    int64_t v5 = self->_selectOptions;
    self->_selectOptions = v4;

    selectOptions = self->_selectOptions;
  }
  return selectOptions;
}

- (BOOL)isCopyable
{
  BOOL v3 = [(RUIElement *)self attributes];
  char v4 = [v3 objectForKeyedSubscript:@"isCopyable"];

  int64_t v5 = [(RUIElement *)self attributes];
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"isCopyable"];
    BOOL v8 = [(NSString *)v7 BOOLValue];
  }
  else
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:@"copyableAttribute"];

    if (v9) {
      return 1;
    }
    char v11 = [(RUIElement *)self attributes];
    id v6 = [v11 objectForKey:@"class"];

    if (![v6 isEqualToString:@"label"])
    {
      BOOL v8 = 0;
      goto LABEL_4;
    }
    uint64_t v7 = [(RUITableViewRow *)self copyText];
    BOOL v8 = v7 != 0;
  }

LABEL_4:
  return v8;
}

- (NSString)copyText
{
  id v3 = [(RUITableViewRow *)self copyTextFromCopyableAttribute];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    int64_t v5 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
    id v6 = [(UITableViewCell *)self->_tableCell ruiValueLabel];
    uint64_t v7 = [v6 text];

    if (!v7)
    {
      uint64_t v7 = [v5 text];
      if (!v7)
      {
        BOOL v8 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
        uint64_t v7 = [v8 text];
      }
    }
    id v4 = v7;
  }
  return (NSString *)v4;
}

- (id)copyTextFromCopyableAttribute
{
  id v3 = [(RUIElement *)self attributes];
  id v4 = [v3 objectForKey:@"copyableAttribute"];

  int64_t v5 = [(RUIElement *)self attributes];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RUITableViewRow;
  [(RUIElement *)&v4 dealloc];
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(RUIElement *)self attributes];
  id v6 = [v5 objectForKeyedSubscript:@"class"];
  uint64_t v7 = [(RUIElement *)self attributes];
  BOOL v8 = [v7 objectForKeyedSubscript:@"label"];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p, rowClass: '%@', label: '%@'>", v4, self, v6, v8];

  return (NSString *)v9;
}

- (void)startActivityIndicator
{
  if ([(RUITableViewRow *)self wantsInlineActivityIndicator])
  {
    [(RUITableViewRow *)self setShowingProgressIndicator:1];
  }
}

- (void)stopActivityIndicator
{
}

- (void)setDate:(id)a3
{
  int64_t v5 = (NSDate *)a3;
  if (self->_date != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)&self->_date, a3);
    id v6 = [(RUITableViewRow *)self _datePickerFormatter];
    uint64_t v7 = [v6 stringFromDate:self->_date];
    BOOL v8 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
    [v8 setText:v7];

    int64_t v5 = v9;
  }
}

- (void)_datePickerChanged:(id)a3
{
  uint64_t v4 = [a3 date];
  [(RUITableViewRow *)self setDate:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained rowDidChange:self action:1];
}

- (double)height
{
  double height = self->_height;
  if (height <= 0.0)
  {
    id v3 = [(RUIElement *)self attributes];
    uint64_t v4 = [v3 objectForKey:@"height"];
    [v4 floatValue];
    double height = v5;
  }
  return height;
}

- (float)rowHeightWithMax:(float)a3 peggedHeight:(float)a4 tableView:(id)a5 indexPath:(id)a6
{
  id v9 = a5;
  char v10 = [(RUIElement *)self attributes];
  char v11 = [v10 objectForKeyedSubscript:@"class"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_2;
  }
  id v14 = [(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
  char IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  [(RUITableViewRow *)self height];
  double v17 = v16;
  if (v16 > 0.0 && (IsAccessibilityContentSizeCategory & 1) == 0)
  {
    float v13 = v16;
    goto LABEL_22;
  }
  if ([v11 hasPrefix:@"html"])
  {
    id v18 = [(RUITableViewRow *)self tableCell];
    [(RemoteUITableViewCell *)self->_tableCell frame];
    if (v19 < 44.0) {
      -[RemoteUITableViewCell setFrame:](self->_tableCell, "setFrame:");
    }
    p_cachedSize = &self->_cachedSize;
    double width = self->_cachedSize.width;
    [(RemoteUITableViewCell *)self->_tableCell webViewWidth];
    if (width != v22 || (double height = self->_cachedSize.height, height == 0.0))
    {
      id v24 = [(RemoteUITableViewCell *)self->_tableCell webContainerView];
      [(RemoteUITableViewCell *)self->_tableCell webViewWidth];
      objc_msgSend(v24, "heightForWidth:");
      self->_cachedSize.double height = v25 + 1.0 + 16.0;

      double height = self->_cachedSize.height;
      if (height > a3)
      {
        double height = a4;
        self->_cachedSize.double height = a4;
        if (a3 > 0.0)
        {
          long long v26 = [(RemoteUITableViewCell *)self->_tableCell webContainerView];
          long long v27 = [v26 webView];
          uint64_t v28 = [v27 _scrollView];
          [v28 setBounces:1];

          uint64_t v29 = [(RemoteUITableViewCell *)self->_tableCell webContainerView];
          uint64_t v30 = [v29 webView];
          id v31 = [v30 _scrollView];
          [v31 setScrollEnabled:1];

          double height = p_cachedSize->height;
        }
      }
    }
    double v12 = fmax(height, 44.0);
    goto LABEL_3;
  }
  if ([v11 isEqualToString:@"linkedOption"]
    || [v11 isEqualToString:@"selectPage"])
  {
    [(RemoteUITableViewCell *)self->_tableCell height];
    double v17 = v32;
  }
  else
  {
    long long v35 = [(RUITableViewRow *)self tableCell];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v17 = *MEMORY[0x263F839B8];
    }
    else
    {
      if (IsAccessibilityContentSizeCategory)
      {
LABEL_2:
        double v12 = *MEMORY[0x263F839B8];
LABEL_3:
        float v13 = v12;
        goto LABEL_22;
      }
      long long v37 = [(RUITableViewRow *)self tableCell];
      long long v38 = [v37 textLabel];
      if ([v38 numberOfLines] == 1)
      {
        long long v39 = [(RUITableViewRow *)self tableCell];
        long long v40 = [v39 detailTextLabel];
        BOOL v41 = [v40 numberOfLines] != 1;
      }
      else
      {
        BOOL v41 = 1;
      }

      int64_t v42 = [(RUITableViewRow *)self tableCellStyle];
      if (v41 || v42 == 3)
      {
        v43 = [v9 readableContentGuide];
        [v43 layoutFrame];
        double v45 = v44;

        v46 = [(RemoteUITableViewCell *)self->_tableCell contentView];
        [v46 layoutMargins];
        double v48 = v47;
        v49 = [(RemoteUITableViewCell *)self->_tableCell contentView];
        [v49 layoutMargins];
        double v51 = v45 - (v48 + v50);

        v52 = [(UITableViewCell *)self->_tableCell ruiImageView];
        int v53 = [v52 image];

        if (v53)
        {
          v54 = [(UITableViewCell *)self->_tableCell ruiImageView];
          [v54 size];
          double v51 = v51 - v55;
        }
        v56 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
        v57 = [(UITableViewCell *)self->_tableCell ruiTextLabel];
        objc_msgSend(v56, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v57, "numberOfLines"), 0.0, 0.0, v51, 1.79769313e308);
        double v59 = v58;

        v60 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
        objc_msgSend(v60, "sizeThatFits:", v51, 1.79769313e308);
        double v62 = v61;

        double v63 = v59 + v62 + 23.0;
        v64 = [(RUITableViewRow *)self tableCell];
        uint64_t v65 = [v64 ruiDetailTextLabel];
        v66 = [v65 text];
        uint64_t v67 = [v66 length];

        if (v67) {
          double v17 = v63 + -1.5;
        }
        else {
          double v17 = v63;
        }
      }
    }
  }
  if (v17 > 44.0)
  {
    float v33 = v17;
    float v13 = v33;
  }
  else
  {
    float v13 = -1.0;
  }
LABEL_22:

  return v13;
}

- (void)clearCachedHeight
{
  self->_cachedSize = (CGSize)*MEMORY[0x263F001B0];
}

- (void)_switchFlipped:(id)a3
{
  if (self->_switchValue != [(UISwitch *)self->_switchControl isOn])
  {
    self->_switchValue = [(UISwitch *)self->_switchControl isOn];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained rowDidChange:self action:2];
  }
}

- (void)switchCanceled
{
  BOOL v2 = !self->_switchValue;
  self->_switchValue ^= 1u;
  [(UISwitch *)self->_switchControl setOn:v2];
}

- (BOOL)rowSupportsLoadingIndicator
{
  id v3 = [(RUIElement *)self attributes];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"class"];

  if (([v4 isEqualToString:@"link"] & 1) != 0
    || ([v4 isEqualToString:@"switch"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(RUITableViewRow *)self detailButton];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (BOOL)indentWhileEditing
{
  BOOL v2 = [(RUIElement *)self attributes];
  id v3 = [v2 objectForKeyedSubscript:@"indentWhileEditing"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isEditingEnabled
{
  BOOL v2 = [(RUIElement *)self attributes];
  id v3 = [v2 objectForKeyedSubscript:@"editingEnabled"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  if ([(NSMutableArray *)self->_selectOptions count] > (unint64_t)a4)
  {
    uint64_t v7 = [(NSMutableArray *)self->_selectOptions objectAtIndex:a4];
    BOOL v8 = [v7 label];
    id v9 = [(UITableViewCell *)self->_tableCell ruiDetailTextLabel];
    [v9 setText:v8];

    self->_selectedRow = a4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained rowDidChange:self action:1];
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  if ([(NSMutableArray *)self->_selectOptions count] <= (unint64_t)a4)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v7 = [(NSMutableArray *)self->_selectOptions objectAtIndex:a4];
    BOOL v8 = [v7 label];
  }
  return v8;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return [(NSMutableArray *)self->_selectOptions count];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained rowDidEndEditing:self];

  return 1;
}

- (void)setEditableTextFieldValue:(id)a3
{
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v5 = [(UITableViewCell *)self->_tableCell ruiEditableTextField];
  id v6 = [v5 text];
  uint64_t v7 = objc_msgSend(WeakRetained, "textFieldRow:changeCharactersInRange:replacementString:", self, 0, objc_msgSend(v6, "length"), v13);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [(UITableViewCell *)self->_tableCell ruiEditableTextField];
    id v9 = v8;
    id v10 = v7;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    BOOL v8 = [(UITableViewCell *)self->_tableCell ruiEditableTextField];
    id v9 = v8;
    if (isKindOfClass)
    {
      double v12 = [v7 firstObject];
      [v9 setText:v12];

      goto LABEL_7;
    }
    id v10 = v13;
  }
  [v8 setText:v10];
LABEL_7:
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v12 = objc_msgSend(WeakRetained, "textFieldRow:changeCharactersInRange:replacementString:", self, location, length, v10);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v9 text];
    id v14 = objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", location, length, v10);

    char v15 = [v12 isEqualToString:v14];
    if ((v15 & 1) == 0) {
      [v9 setText:v12];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 count])
    {
      double v16 = [v12 objectAtIndex:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        [v9 setText:v16];
        if ((unint64_t)[v12 count] >= 2)
        {
          id v18 = [v12 objectAtIndex:1];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v19 = (int)[v18 intValue];
            if ((unint64_t)[v12 count] < 3)
            {
              uint64_t v21 = 0;
            }
            else
            {
              uint64_t v24 = v19;
              uint64_t v20 = [v12 objectAtIndex:2];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v21 = (int)[v20 intValue];
              }
              else {
                uint64_t v21 = 0;
              }

              uint64_t v19 = v24;
            }
            objc_msgSend(v9, "setSelectionRange:", v19, v21);
          }
        }
      }

      char v15 = isKindOfClass ^ 1;
    }
    else
    {
      char v15 = 1;
    }
  }
  id v22 = objc_loadWeakRetained((id *)&self->_delegate);
  [v22 rowDidChange:self action:1];

  return v15 & 1;
}

- (void)textFieldEditingDidEnd:(id)a3
{
  p_textFieldChangeObserver = &self->_textFieldChangeObserver;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textFieldChangeObserver);
  [WeakRetained textFieldEditingDidEnd:v4];
}

- (void)detailLabelActivatedLinkFromCell:(id)a3 completion:(id)a4
{
  id v10 = a4;
  BOOL v5 = [(RUIElement *)self attributes];
  id v6 = [v5 objectForKey:@"detailLinkURL"];

  if (v6)
  {
    uint64_t v7 = [(RUIElement *)self attributes];
    BOOL v8 = (void *)[v7 mutableCopy];

    [v8 setObject:v6 forKeyedSubscript:@"url"];
    id v9 = [[RUIElement alloc] initWithAttributes:v8 parent:self];
    [(RUIElement *)self performAction:2 forElement:v9 completion:v10];
  }
}

- (void)webContainerView:(id)a3 didClickLinkWithURL:(id)a4
{
  id v5 = a4;
  id v6 = [(RUIElement *)self attributes];
  id v9 = (id)[v6 mutableCopy];

  uint64_t v7 = [v5 absoluteString];

  [v9 setObject:v7 forKeyedSubscript:@"url"];
  BOOL v8 = [[RUIElement alloc] initWithAttributes:v9 parent:self];
  [(RUIElement *)self performAction:2 forElement:v8 completion:0];
}

- (id)_checkmarkAccessoryViewWithSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F81708] defaultFontForTextStyle:*MEMORY[0x263F83570]];
  id v6 = [MEMORY[0x263F82818] configurationWithFont:v5];
  if (v3) {
    uint64_t v7 = @"checkmark.circle.fill";
  }
  else {
    uint64_t v7 = @"circle";
  }
  BOOL v8 = [MEMORY[0x263F827E8] systemImageNamed:v7 withConfiguration:v6];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v8];
  id v10 = [(RUIElement *)self attributes];
  char v11 = [v10 objectForKey:@"checkedColor"];

  if (v11)
  {
    if (v3) {
      objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v11);
    }
    else {
    double v12 = [MEMORY[0x263F825C8] lightGrayColor];
    }
    [v9 setTintColor:v12];
  }
  return v9;
}

- (void)_drawCustomImage:(BOOL)a3
{
  BOOL v65 = a3;
  v69[2] = *MEMORY[0x263EF8340];
  id v4 = [(RUIElement *)self attributes];
  uint64_t v5 = [v4 objectForKey:@"imageText"];

  id v6 = [(RUIElement *)self attributes];
  uint64_t v7 = [v6 objectForKey:@"lightImageTextColor"];

  BOOL v8 = [(RUIElement *)self attributes];
  id v9 = [v8 objectForKey:@"darkImageTextColor"];

  id v10 = [(RUIElement *)self attributes];
  uint64_t v67 = [v10 objectForKey:@"selectedLightImageTextColor"];

  char v11 = [(RUIElement *)self attributes];
  double v12 = [v11 objectForKey:@"selectedDarkImageTextColor"];

  id v13 = [(RUIElement *)self attributes];
  id v14 = [v13 objectForKey:@"darkBackgroundColor"];

  char v15 = [(RUIElement *)self attributes];
  uint64_t v16 = [v15 objectForKey:@"lightBackgroundColor"];

  double v17 = [(RUIElement *)self attributes];
  id v18 = [v17 objectForKey:@"selectedDarkColor"];

  uint64_t v19 = [(RUIElement *)self attributes];
  uint64_t v20 = [v19 objectForKey:@"selectedLightColor"];

  uint64_t v21 = (void *)v20;
  id v22 = (void *)v16;
  uint64_t v23 = (void *)v5;
  if (v5 || v7 || v9 || v14 || v16 || v18 || v21 || v67 || v12)
  {
    double v63 = v14;
    double v59 = v21;
    if (v21) {
      objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:");
    }
    else {
    v64 = [MEMORY[0x263F825C8] systemBlueColor];
    }
    if (v16) {
      objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v16);
    }
    else {
    uint64_t v24 = [MEMORY[0x263F825C8] systemLightGrayColor];
    }
    if (v67) {
      objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v67);
    }
    else {
    double v25 = [MEMORY[0x263F825C8] whiteColor];
    }
    double v61 = v7;
    double v62 = v18;
    double v58 = v22;
    if (v7) {
      objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v7);
    }
    else {
    long long v26 = [MEMORY[0x263F825C8] blackColor];
    }
    long long v27 = [MEMORY[0x263F82DA0] _currentTraitCollection];
    uint64_t v28 = [v27 userInterfaceStyle];

    v60 = v12;
    if (v28 == 2)
    {
      if (v62)
      {
        uint64_t v29 = objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:");

        v64 = (void *)v29;
      }
      if (v14)
      {
        uint64_t v30 = objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:");

        uint64_t v24 = (void *)v30;
      }
      if (v12)
      {
        uint64_t v31 = objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v12);

        double v25 = (void *)v31;
      }
      if (v9) {
        objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v9);
      }
      else {
      uint64_t v33 = [MEMORY[0x263F825C8] whiteColor];
      }

      double v32 = (void *)v33;
    }
    else
    {
      double v32 = v26;
    }
    v56 = v32;
    v57 = v25;
    if (v65) {
      id v34 = v64;
    }
    else {
      id v34 = v24;
    }
    if (v65) {
      long long v35 = v25;
    }
    else {
      long long v35 = v32;
    }
    long long v36 = (void *)MEMORY[0x263F81708];
    id v37 = v35;
    id v38 = v34;
    v66 = [v36 systemFontOfSize:17.0];
    uint64_t v39 = *MEMORY[0x263F81500];
    v68[0] = *MEMORY[0x263F814F0];
    v68[1] = v39;
    v69[0] = v66;
    v69[1] = v37;
    long long v40 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
    BOOL v41 = v23;
    objc_msgSend(v23, "boundingRectWithSize:options:attributes:context:", 1, v40, 0, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    double v43 = v42;
    double v45 = v44;
    v46 = [MEMORY[0x263F82B60] mainScreen];
    [v46 scale];
    CGFloat v48 = v47;
    v70.double width = 77.0;
    v70.double height = 40.0;
    UIGraphicsBeginImageContextWithOptions(v70, 0, v48);

    v49 = [(RemoteUITableViewCell *)self->_tableCell imageView];
    double v50 = [v49 image];
    objc_msgSend(v50, "drawInRect:", 0.0, 0.0, 77.0, 40.0);

    CurrentContext = UIGraphicsGetCurrentContext();
    [v38 setFill];

    v71.origin.x = 0.0;
    v71.origin.y = 0.0;
    v71.size.double width = 77.0;
    v71.size.double height = 40.0;
    CGContextFillRect(CurrentContext, v71);
    uint64_t v23 = v41;
    objc_msgSend(v41, "drawAtPoint:withAttributes:", v40, 38.5 - v43 * 0.5, 20.0 - v45 * 0.5);
    v52 = UIGraphicsGetImageFromCurrentImageContext();
    int v53 = [(RemoteUITableViewCell *)self->_tableCell imageView];
    [v53 setImage:v52];

    v54 = [(RemoteUITableViewCell *)self->_tableCell imageView];
    [v54 _setCornerRadius:8.0];

    double v55 = [(RemoteUITableViewCell *)self->_tableCell imageView];

    [v55 setClipsToBounds:1];
    UIGraphicsEndImageContext();

    uint64_t v7 = v61;
    uint64_t v21 = v59;
    double v12 = v60;
    id v18 = v62;
    id v14 = v63;
    id v22 = v58;
  }
}

- (void)_setBackgroundColor
{
  BOOL v3 = [(RUIElement *)self attributes];
  id v6 = [v3 objectForKeyedSubscript:@"backgroundColor"];

  id v4 = v6;
  if (v6)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v6);
    [(RemoteUITableViewCell *)self->_tableCell setBackgroundColor:v5];

    id v4 = v6;
  }
}

- (RUITableViewRowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUITableViewRowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)rowInvalid
{
  return self->_rowInvalid;
}

- (NSDictionary)deleteAction
{
  return self->_deleteAction;
}

- (void)setDeleteAction:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSData)htmlSubLabelData
{
  return self->_htmlSubLabelData;
}

- (void)setHtmlSubLabelData:(id)a3
{
}

- (int64_t)selectedRow
{
  return self->_selectedRow;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDate)dateMin
{
  return self->_dateMin;
}

- (void)setDateMin:(id)a3
{
}

- (NSDate)dateMax
{
  return self->_dateMax;
}

- (void)setDateMax:(id)a3
{
}

- (int64_t)datePickerMode
{
  return self->_datePickerMode;
}

- (int64_t)datePickerStyle
{
  return self->_datePickerStyle;
}

- (UIView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
}

- (void)setHeight:(double)a3
{
  self->_double height = a3;
}

- (BOOL)configured
{
  return self->_configured;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (BOOL)isShowingProgressIndicator
{
  return self->_showingProgressIndicator;
}

- (RUITextFieldChangeObserver)textFieldChangeObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textFieldChangeObserver);
  return (RUITextFieldChangeObserver *)WeakRetained;
}

- (void)setTextFieldChangeObserver:(id)a3
{
}

- (RUIPage)linkedPage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkedPage);
  return (RUIPage *)WeakRetained;
}

- (void)setLinkedPage:(id)a3
{
}

- (RUIDetailButtonElement)detailButton
{
  return self->_detailButton;
}

- (void)setDetailButton:(id)a3
{
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (BOOL)showAlternateDetailLabel
{
  return self->_showAlternateDetailLabel;
}

- (void)setShowAlternateDetailLabel:(BOOL)a3
{
  self->_showAlternateDetailLabel = a3;
}

- (NSMutableSet)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
}

- (void)setSection:(id)a3
{
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_section);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_detailButton, 0);
  objc_destroyWeak((id *)&self->_linkedPage);
  objc_destroyWeak((id *)&self->_textFieldChangeObserver);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_htmlSubLabelData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_datePickerFormatter, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_deleteAction, 0);
  objc_storeStrong((id *)&self->_switchControl, 0);
  objc_storeStrong((id *)&self->_dateMin, 0);
  objc_storeStrong((id *)&self->_dateMax, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_selectOptions, 0);
  objc_storeStrong((id *)&self->_tableCell, 0);
}

- (void)parseBadge
{
  BOOL v2 = self;
  RUITableViewRow.parseBadge()();
}

- (void)setBadgeInTableCell:(id)a3
{
  id v4 = (UITableViewCell *)a3;
  uint64_t v5 = self;
  RUITableViewRow.setBadge(in:)(v4);
}

- (void)reportInternalRenderEvent
{
  BOOL v2 = self;
  RUITableViewRow.reportInternalRenderEvent()();
}

- (void)tableCell
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"CFStringRef RUICTSettingCopyMyPhoneNumber()"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RUITableViewRow.m", 50, @"%s", dlerror());

  __break(1u);
}

@end