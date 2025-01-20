@interface SSReminderResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (id)bundleId;
+ (id)stringWithCompletionDate:(id)a3 dueDate:(id)a4 modificationDate:(id)a5;
- (BOOL)isAllDay;
- (BOOL)isCompleted;
- (BOOL)isFlagged;
- (BOOL)isRecurring;
- (NSArray)hashtags;
- (NSDate)completionDate;
- (NSDate)dueDate;
- (NSDate)modificationDate;
- (NSString)note;
- (NSString)reminder;
- (SSReminderResultBuilder)initWithResult:(id)a3;
- (id)buildDescriptions;
- (id)buildInlineCardSection;
- (id)buildTitle;
- (void)setCompletionDate:(id)a3;
- (void)setDueDate:(id)a3;
- (void)setHashtags:(id)a3;
- (void)setIsAllDay:(BOOL)a3;
- (void)setIsCompleted:(BOOL)a3;
- (void)setIsFlagged:(BOOL)a3;
- (void)setIsRecurring:(BOOL)a3;
- (void)setModificationDate:(id)a3;
- (void)setNote:(id)a3;
- (void)setReminder:(id)a3;
@end

@implementation SSReminderResultBuilder

+ (id)bundleId
{
  return @"com.apple.reminders";
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (id)stringWithCompletionDate:(id)a3 dueDate:(id)a4 modificationDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v7)
  {
    v11 = +[SSDateFormatManager dateCompletedStringFormat];
    v12 = v7;
  }
  else if (v8)
  {
    v11 = +[SSDateFormatManager dateDueStringFormat];
    v12 = v8;
  }
  else
  {
    if (!v9)
    {
      v11 = 0;
      id v13 = 0;
      goto LABEL_10;
    }
    v11 = +[SSDateFormatManager dateModifiedStringFormat];
    v12 = v10;
  }
  id v13 = v12;
  if (v11)
  {
    v14 = +[SSDateFormatManager shortDateTimeFormatter];
    v15 = [v14 stringFromDate:v13];

    v16 = [NSString stringWithValidatedFormat:v11, @"%@", 0, v15 validFormatSpecifiers error];

    goto LABEL_11;
  }
LABEL_10:
  v16 = 0;
LABEL_11:

  return v16;
}

- (SSReminderResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SSReminderResultBuilder;
  v5 = [(SSResultBuilder *)&v17 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22C00] withType:objc_opt_class()];
    [(SSReminderResultBuilder *)v5 setCompletionDate:v6];

    id v7 = [v4 valueForAttribute:*MEMORY[0x1E4F22D30] withType:objc_opt_class()];
    [(SSReminderResultBuilder *)v5 setDueDate:v7];

    id v8 = [v4 valueForAttribute:*MEMORY[0x1E4F22C48] withType:objc_opt_class()];
    [(SSReminderResultBuilder *)v5 setModificationDate:v8];

    id v9 = [v4 valueForAttribute:*MEMORY[0x1E4F23658] withType:objc_opt_class()];
    [(SSReminderResultBuilder *)v5 setReminder:v9];

    v10 = [v4 valueForAttribute:*MEMORY[0x1E4F22BF8] withType:objc_opt_class()];
    [(SSReminderResultBuilder *)v5 setNote:v10];

    v11 = [v4 valueForAttribute:*MEMORY[0x1E4F22FF8] withType:objc_opt_class()];
    [(SSReminderResultBuilder *)v5 setHashtags:v11];

    v12 = [v4 valueForAttribute:*MEMORY[0x1E4F23078] withType:objc_opt_class()];
    -[SSReminderResultBuilder setIsAllDay:](v5, "setIsAllDay:", [v12 BOOLValue]);

    id v13 = [v4 valueForAttribute:*MEMORY[0x1E4F234E8] withType:objc_opt_class()];
    -[SSReminderResultBuilder setIsFlagged:](v5, "setIsFlagged:", [v13 BOOLValue]);

    v14 = [v4 valueForAttribute:*MEMORY[0x1E4F234F0] withType:objc_opt_class()];
    -[SSReminderResultBuilder setIsRecurring:](v5, "setIsRecurring:", [v14 BOOLValue]);

    v15 = [(SSReminderResultBuilder *)v5 completionDate];
    [(SSReminderResultBuilder *)v5 setIsCompleted:v15 != 0];
  }
  return v5;
}

- (id)buildInlineCardSection
{
  v8.receiver = self;
  v8.super_class = (Class)SSReminderResultBuilder;
  v3 = [(SSResultBuilder *)&v8 buildInlineCardSection];
  if ([(SSReminderResultBuilder *)self isFlagged] && SSSnippetModernizationEnabled())
  {
    id v4 = objc_opt_new();
    [v4 setSymbolName:@"flag.fill"];
    v5 = objc_opt_new();
    [v3 setTrailingTopText:v5];

    v6 = [v3 trailingTopText];
    [v6 setGlyph:v4];
  }
  return v3;
}

- (id)buildTitle
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (SSSnippetModernizationEnabled())
  {
    v3 = objc_opt_new();
    id v4 = (void *)MEMORY[0x1E4F9A0E0];
    v5 = [(SSReminderResultBuilder *)self reminder];
    v6 = [v4 textWithString:v5];
    v14[0] = v6;
    id v7 = objc_opt_new();
    v14[1] = v7;
    objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    [v3 setFormattedTextPieces:v8];

    BOOL v9 = [(SSReminderResultBuilder *)self isCompleted];
    v10 = [v3 formattedTextPieces];
    v11 = [v10 objectAtIndexedSubscript:1];
    [v11 setIsEmphasized:v9];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SSReminderResultBuilder;
    v3 = [(SSResultBuilder *)&v13 buildTitle];
  }
  return v3;
}

- (id)buildDescriptions
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (SSSnippetModernizationEnabled())
  {
    v3 = objc_opt_new();
    id v4 = [(SSReminderResultBuilder *)self note];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E4F9A378];
      id v7 = [(SSReminderResultBuilder *)self note];
      objc_super v8 = [v6 textWithString:v7];
      [v3 addObject:v8];
    }
    BOOL v9 = objc_opt_new();
    v10 = [(SSReminderResultBuilder *)self dueDate];

    if (v10)
    {
      v11 = [(SSReminderResultBuilder *)self dueDate];
      v12 = +[SSDateFormatManager shortDateTimeStringFromDate:v11 isAllDay:[(SSReminderResultBuilder *)self isAllDay] showAllDayString:0];

      if ([(SSReminderResultBuilder *)self isRecurring])
      {
        uint64_t v13 = [NSString stringWithFormat:@"%@, ", v12];

        v12 = (void *)v13;
      }
      v14 = [(SSReminderResultBuilder *)self dueDate];
      [v14 timeIntervalSinceNow];
      if (v15 >= 0.0) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = [(SSReminderResultBuilder *)self isCompleted] ^ 1;
      }

      v23 = [MEMORY[0x1E4F9A0E0] textWithString:v12];
      [v23 setTextColor:v16];
      [v9 addObject:v23];
      if ([(SSReminderResultBuilder *)self isRecurring])
      {
        v24 = objc_opt_new();
        [v24 setIsTemplate:1];
        [v24 setSymbolName:@"repeat"];
        v25 = objc_opt_new();
        [v25 setGlyph:v24];
        [v25 setTextColor:v16];
        [v9 addObject:v25];
      }
    }
    v19 = objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v26 = [(SSReminderResultBuilder *)self hashtags];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [NSString stringWithFormat:@"#%@", *(void *)(*((void *)&v41 + 1) + 8 * i)];
          [v19 addObject:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v28);
    }

    if ([v19 count])
    {
      uint64_t v32 = [v9 count];
      v33 = &stru_1F1824018;
      if (v32) {
        v33 = @" ";
      }
      v34 = v33;
      v35 = [v19 componentsJoinedByString:@" "];
      v36 = [(__CFString *)v34 stringByAppendingString:v35];

      v37 = [MEMORY[0x1E4F9A0E0] textWithString:v36];
      [v9 addObject:v37];
    }
    if ([v9 count])
    {
      v38 = objc_opt_new();
      [v38 setFormattedTextPieces:v9];
      [v3 addObject:v38];
    }
    if ([v3 count]) {
      v39 = v3;
    }
    else {
      v39 = 0;
    }
    id v22 = v39;
  }
  else
  {
    objc_super v17 = (void *)MEMORY[0x1E4F9A378];
    v18 = objc_opt_class();
    v3 = [(SSReminderResultBuilder *)self completionDate];
    BOOL v9 = [(SSReminderResultBuilder *)self dueDate];
    v19 = [(SSReminderResultBuilder *)self modificationDate];
    v20 = [v18 stringWithCompletionDate:v3 dueDate:v9 modificationDate:v19];
    v21 = [v17 textWithString:v20];
    v45 = v21;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  }
  return v22;
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (void)setCompletionDate:(id)a3
{
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (NSString)reminder
{
  return self->_reminder;
}

- (void)setReminder:(id)a3
{
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (NSArray)hashtags
{
  return self->_hashtags;
}

- (void)setHashtags:(id)a3
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

- (BOOL)isFlagged
{
  return self->_isFlagged;
}

- (void)setIsFlagged:(BOOL)a3
{
  self->_isFlagged = a3;
}

- (BOOL)isRecurring
{
  return self->_isRecurring;
}

- (void)setIsRecurring:(BOOL)a3
{
  self->_isRecurring = a3;
}

- (BOOL)isCompleted
{
  return self->_isCompleted;
}

- (void)setIsCompleted:(BOOL)a3
{
  self->_isCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashtags, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_reminder, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_completionDate, 0);
}

@end