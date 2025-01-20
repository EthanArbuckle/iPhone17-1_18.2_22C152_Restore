@interface SSCalendarResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
+ (id)bundleId;
+ (id)stringWithStartDate:(id)a3 endDate:(id)a4 isAllDay:(BOOL)a5;
- (BOOL)isAllDay;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)calendarName;
- (NSString)delegateCalendarName;
- (NSString)eventIdentifier;
- (NSString)eventName;
- (NSString)location;
- (SSCalendarResultBuilder)initWithResult:(id)a3;
- (id)buildBackgroundColor;
- (id)buildCompactCardSection;
- (id)buildInlineCardSection;
- (id)buildThumbnail;
- (id)buildTitle;
- (void)setCalendarName:(id)a3;
- (void)setDelegateCalendarName:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setEventIdentifier:(id)a3;
- (void)setEventName:(id)a3;
- (void)setIsAllDay:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation SSCalendarResultBuilder

+ (id)bundleId
{
  return @"com.apple.mobilecal";
}

+ (BOOL)supportsResult:(id)a3
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SSCalendarResultBuilder;
  if (objc_msgSendSuper2(&v8, sel_supportsResult_, v4))
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v4 applicationBundleIdentifier];
    char v5 = [v6 isEqualToString:@"com.apple.iCal"];
  }
  return v5;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (id)stringWithStartDate:(id)a3 endDate:(id)a4 isAllDay:(BOOL)a5
{
  char v5 = +[SSDateFormatManager stringsFromDate:a3 toDate:a4 isAllDay:a5];
  v6 = [v5 componentsJoinedByString:@" · "];

  return v6;
}

- (SSCalendarResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SSCalendarResultBuilder;
  char v5 = [(SSResultBuilder *)&v20 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F235A8] withType:objc_opt_class()];
    [(SSCalendarResultBuilder *)v5 setStartDate:v6];

    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F22D58] withType:objc_opt_class()];
    [(SSCalendarResultBuilder *)v5 setEndDate:v7];

    objc_super v8 = [v4 valueForAttribute:*MEMORY[0x1E4F22C28] withType:objc_opt_class()];
    [(SSCalendarResultBuilder *)v5 setCalendarName:v8];

    v9 = [v4 valueForAttribute:*MEMORY[0x1E4F22B70] withType:objc_opt_class()];
    [(SSCalendarResultBuilder *)v5 setDelegateCalendarName:v9];

    v10 = [v4 valueForAttribute:*MEMORY[0x1E4F23078] withType:objc_opt_class()];
    -[SSCalendarResultBuilder setIsAllDay:](v5, "setIsAllDay:", [v10 BOOLValue]);

    v11 = [v4 valueForAttribute:*MEMORY[0x1E4F23658] withType:objc_opt_class()];
    [(SSCalendarResultBuilder *)v5 setEventName:v11];

    v12 = [v4 valueForAttribute:*MEMORY[0x1E4F23160] withType:objc_opt_class()];
    [(SSCalendarResultBuilder *)v5 setLocation:v12];

    v13 = [(SSCalendarResultBuilder *)v5 location];
    v14 = [(SSCalendarResultBuilder *)v5 location];
    v15 = objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\n+", @" ", 1024, 0, objc_msgSend(v14, "length"));
    [(SSCalendarResultBuilder *)v5 setLocation:v15];

    if (isMacOS())
    {
      v16 = [v4 valueForAttribute:*MEMORY[0x1E4F23020] withType:objc_opt_class()];
      [(SSCalendarResultBuilder *)v5 setEventIdentifier:v16];
    }
    else
    {
      v16 = [v4 identifier];
      v17 = [v16 componentsSeparatedByString:@"."];
      v18 = [v17 firstObject];
      [(SSCalendarResultBuilder *)v5 setEventIdentifier:v18];
    }
  }

  return v5;
}

- (id)buildInlineCardSection
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(SSCalendarResultBuilder *)self location];
  if (v4 && SSSnippetModernizationEnabled()) {
    [v3 addObject:v4];
  }
  if (SSSnippetModernizationEnabled()) {
    char v5 = isMacOS();
  }
  else {
    char v5 = 0;
  }
  v6 = [(SSCalendarResultBuilder *)self startDate];
  if (!v6)
  {
    v9 = 0;
    if (!v4) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  v7 = objc_opt_class();
  objc_super v8 = [(SSCalendarResultBuilder *)self endDate];
  v9 = objc_msgSend(v7, "stringWithStartDate:endDate:isAllDay:", v6, v8, -[SSCalendarResultBuilder isAllDay](self, "isAllDay"));
  if ((v5 & 1) == 0)
  {
    [v3 addObject:v9];

    v9 = 0;
  }

  if (v4)
  {
LABEL_13:
    if ((SSSnippetModernizationEnabled() & 1) == 0) {
      [v3 addObject:v4];
    }
  }
LABEL_15:
  v10 = objc_opt_new();
  if ((v5 & 1) == 0)
  {
    v11 = [(SSCalendarResultBuilder *)self calendarName];
    v12 = [(SSCalendarResultBuilder *)self delegateCalendarName];
    if (v12) {
      [v10 addObject:v12];
    }
    if (v11) {
      [v10 addObject:v11];
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)SSCalendarResultBuilder;
  v13 = [(SSResultBuilder *)&v31 buildInlineCardSection];
  if ([v9 length])
  {
    v14 = [MEMORY[0x1E4F9A0E0] textWithString:v9];
    [v13 setSecondaryTitle:v14];
  }
  else
  {
    [v13 setSecondaryTitle:0];
  }
  v15 = [v13 title];
  [v15 setMaxLines:1];

  v16 = [v13 secondaryTitle];
  [v13 setIsSecondaryTitleDetached:v16 != 0];

  if ([v3 count])
  {
    v17 = [(id)objc_opt_class() richTextsFromStrings:v3];
    [v13 setDescriptions:v17];
  }
  else
  {
    [v13 setDescriptions:0];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v18 = objc_msgSend(v13, "descriptions", 0);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * i) setMaxLines:1];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v20);
  }

  if ((SSSnippetModernizationEnabled() & 1) != 0 || ![v10 count])
  {
    [v13 setFootnote:0];
  }
  else
  {
    v23 = (void *)MEMORY[0x1E4F9A378];
    v24 = [v10 componentsJoinedByString:@" — "];
    v25 = [v23 textWithString:v24];
    [v13 setFootnote:v25];
  }
  return v13;
}

- (id)buildBackgroundColor
{
  v3 = [(SSCalendarResultBuilder *)self eventIdentifier];

  if (v3)
  {
    id v4 = objc_opt_new();
    char v5 = [(SSCalendarResultBuilder *)self eventIdentifier];
    [v4 setEventIdentifier:v5];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SSCalendarResultBuilder;
    id v4 = [(SSResultBuilder *)&v7 buildBackgroundColor];
  }
  return v4;
}

- (id)buildCompactCardSection
{
  v3 = objc_opt_new();
  id v4 = [(SSCalendarResultBuilder *)self startDate];
  if (v4)
  {
    char v5 = [(SSCalendarResultBuilder *)self endDate];
    v6 = +[SSDateFormatManager stringsFromDate:v4 toDate:v5 isAllDay:[(SSCalendarResultBuilder *)self isAllDay]];

    [v3 addObjectsFromArray:v6];
  }
  objc_super v7 = [(SSCalendarResultBuilder *)self location];
  if (v7) {
    [v3 addObject:v7];
  }
  v11.receiver = self;
  v11.super_class = (Class)SSCalendarResultBuilder;
  objc_super v8 = [(SSResultBuilder *)&v11 buildCompactCardSection];
  v9 = [(id)objc_opt_class() richTextsFromStrings:v3];
  [v8 setDescriptions:v9];

  return v8;
}

- (id)buildThumbnail
{
  v3 = [(SSCalendarResultBuilder *)self startDate];
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F99F10]) initWithDate:v3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SSCalendarResultBuilder;
    uint64_t v4 = [(SSResultBuilder *)&v7 buildThumbnail];
  }
  char v5 = (void *)v4;

  return v5;
}

- (id)buildTitle
{
  v10.receiver = self;
  v10.super_class = (Class)SSCalendarResultBuilder;
  v2 = [(SSResultBuilder *)&v10 buildTitle];
  uint64_t v3 = [v2 text];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    char v5 = [v2 formattedTextPieces];

    if (!v5)
    {
      v6 = objc_opt_class();
      objc_super v7 = [v2 text];
      objc_super v8 = [v6 whiteSpaceCondensedStringForString:v7];
      [v2 setText:v8];
    }
  }
  return v2;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)calendarName
{
  return self->_calendarName;
}

- (void)setCalendarName:(id)a3
{
}

- (NSString)delegateCalendarName
{
  return self->_delegateCalendarName;
}

- (void)setDelegateCalendarName:(id)a3
{
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (void)setIsAllDay:(BOOL)a3
{
  self->_isAllDay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_delegateCalendarName, 0);
  objc_storeStrong((id *)&self->_calendarName, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end