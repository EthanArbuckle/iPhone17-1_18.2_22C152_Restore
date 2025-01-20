@interface NCNotificationSummaryBuilder
- (BOOL)_includeLeadingNotificationRequest;
- (NCNotificationSummaryBuilder)init;
- (NCNotificationSummaryBuilder)initWithStyle:(unint64_t)a3;
- (NSArray)notificationRequests;
- (NSString)summaryText;
- (id)_buildSummaryText;
- (id)_defaultLocalizedSummaryWithNotificationsCount:(unint64_t)a3;
- (id)_defaultLocalizedSummaryWithNotificationsCount:(unint64_t)a3 arguments:(id)a4;
- (id)_filteredArgumentsArrayWithArguments:(id)a3;
- (id)_formatListWithArguments:(id)a3;
- (id)_formatListWithArguments:(id)a3 truncated:(BOOL)a4 truncatedArgumentsCount:(unint64_t *)a5;
- (id)_localizedSummaryWithFormat:(id)a3 notificationsCount:(unint64_t)a4 arguments:(id)a5;
- (id)_localizedSummaryWithFormats:(id)a3 andCounts:(id)a4;
- (id)description;
- (unint64_t)_summaryNotificationsCount;
- (unint64_t)style;
- (void)_addNotificationRequest:(id)a3;
- (void)_insertString:(id)a3 intoSequence:(id)a4 withCounters:(id)a5;
- (void)_updateSummaryText;
- (void)updateWithNotificationRequests:(id)a3;
@end

@implementation NCNotificationSummaryBuilder

- (NCNotificationSummaryBuilder)init
{
  return [(NCNotificationSummaryBuilder *)self initWithStyle:0];
}

- (NCNotificationSummaryBuilder)initWithStyle:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummaryBuilder;
  result = [(NCNotificationSummaryBuilder *)&v5 init];
  if (result) {
    result->_style = a3;
  }
  return result;
}

- (void)updateWithNotificationRequests:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = (NSMutableArray *)objc_opt_new();
  notificationRequests = self->_notificationRequests;
  self->_notificationRequests = v5;

  v7 = (NSMutableOrderedSet *)objc_opt_new();
  formatStrings = self->_formatStrings;
  self->_formatStrings = v7;

  v9 = (NSMutableDictionary *)objc_opt_new();
  formatStringsCounts = self->_formatStringsCounts;
  self->_formatStringsCounts = v9;

  v11 = (NSMutableOrderedSet *)objc_opt_new();
  arguments = self->_arguments;
  self->_arguments = v11;

  v13 = (NSMutableDictionary *)objc_opt_new();
  argumentsCounts = self->_argumentsCounts;
  self->_argumentsCounts = v13;

  self->_defaultFormatsCount = 0;
  self->_emptyArgumentsCount = 0;
  summaryText = self->_summaryText;
  self->_summaryText = 0;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v4;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        -[NCNotificationSummaryBuilder _addNotificationRequest:](self, "_addNotificationRequest:", *(void *)(*((void *)&v23 + 1) + 8 * v20++), (void)v23);
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  if ([(NCNotificationSummaryBuilder *)self _includeLeadingNotificationRequest])
  {
    leadingNotificationRequest = self->_leadingNotificationRequest;
    self->_leadingNotificationRequest = 0;
  }
  else
  {
    v22 = [v16 firstObject];
    leadingNotificationRequest = self->_leadingNotificationRequest;
    self->_leadingNotificationRequest = v22;
  }

  [(NCNotificationSummaryBuilder *)self _updateSummaryText];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(NCNotificationSummaryBuilder *)self summaryText];
  [v3 appendString:v4 withName:@"summaryText"];

  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_notificationRequests, "count"), @"notificationRequests");
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __43__NCNotificationSummaryBuilder_description__block_invoke;
  v12 = &unk_1E6A91A68;
  id v13 = v3;
  v14 = self;
  id v6 = v3;
  [v6 appendBodySectionWithName:0 multilinePrefix:0 block:&v9];
  v7 = objc_msgSend(v6, "build", v9, v10, v11, v12);

  return v7;
}

void __43__NCNotificationSummaryBuilder_description__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(void *)(a1 + 40) + 24);
  id v4 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
  id v5 = [v3 objectsAtIndexes:v4];
  [v2 appendArraySection:v5 withName:@"formatStrings" skipIfEmpty:0];

  id v6 = *(void **)(a1 + 32);
  v7 = *(void **)(*(void *)(a1 + 40) + 40);
  objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v7, "count"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = [v7 objectsAtIndexes:v9];
  [v6 appendArraySection:v8 withName:@"arguments" skipIfEmpty:0];
}

- (void)_addNotificationRequest:(id)a3
{
  id v8 = a3;
  [(NSMutableArray *)self->_notificationRequests addObject:v8];
  id v4 = [v8 content];
  id v5 = [v4 categorySummaryFormat];

  if (![v5 length]) {
    ++self->_defaultFormatsCount;
  }
  [(NCNotificationSummaryBuilder *)self _insertString:v5 intoSequence:self->_formatStrings withCounters:self->_formatStringsCounts];
  id v6 = [v8 content];
  v7 = [v6 summaryArgument];

  if (![v7 length]) {
    ++self->_emptyArgumentsCount;
  }
  [(NCNotificationSummaryBuilder *)self _insertString:v7 intoSequence:self->_arguments withCounters:self->_argumentsCounts];
}

- (void)_updateSummaryText
{
  v3 = [(NCNotificationSummaryBuilder *)self _buildSummaryText];
  summaryText = self->_summaryText;
  self->_summaryText = v3;
}

- (id)_buildSummaryText
{
  unint64_t v3 = [(NCNotificationSummaryBuilder *)self _summaryNotificationsCount];
  if (v3)
  {
    unint64_t v4 = v3;
    unint64_t v5 = self->_defaultFormatsCount + [(NSMutableOrderedSet *)self->_formatStrings count];
    formatStrings = self->_formatStrings;
    if (v5 == 1)
    {
      v7 = [(NSMutableOrderedSet *)formatStrings firstObject];
      id v8 = [(NCNotificationSummaryBuilder *)self _localizedSummaryWithFormat:v7 notificationsCount:v4 arguments:self->_arguments];
    }
    else
    {
      if (self->_defaultFormatsCount + [(NSMutableOrderedSet *)formatStrings count] < 2
        || [(NSMutableDictionary *)self->_argumentsCounts count])
      {
        if ([(NSMutableOrderedSet *)self->_arguments count] && !self->_emptyArgumentsCount)
        {
          uint64_t v9 = [(NCNotificationSummaryBuilder *)self _defaultLocalizedSummaryWithNotificationsCount:v4 arguments:self->_arguments];
        }
        else
        {
          uint64_t v9 = [(NCNotificationSummaryBuilder *)self _defaultLocalizedSummaryWithNotificationsCount:v4];
        }
      }
      else
      {
        uint64_t v9 = [(NCNotificationSummaryBuilder *)self _localizedSummaryWithFormats:self->_formatStrings andCounts:self->_formatStringsCounts];
      }
      id v8 = (void *)v9;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_includeLeadingNotificationRequest
{
  return self->_style != 0;
}

- (unint64_t)_summaryNotificationsCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  notificationRequests = self->_notificationRequests;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__NCNotificationSummaryBuilder__summaryNotificationsCount__block_invoke;
  v5[3] = &unk_1E6A94030;
  v5[4] = self;
  v5[5] = &v6;
  [(NSMutableArray *)notificationRequests bs_each:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __58__NCNotificationSummaryBuilder__summaryNotificationsCount__block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(*(void *)(a1 + 32) + 8) != a2)
  {
    unint64_t v3 = [a2 content];
    unint64_t v4 = [v3 summaryArgumentCount];

    if (v4 <= 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = v4;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
  }
}

- (id)_defaultLocalizedSummaryWithNotificationsCount:(unint64_t)a3
{
  unint64_t style = self->_style;
  if (style == 1)
  {
    uint64_t v6 = NCUserNotificationsUIKitFrameworkBundle();
    v7 = v6;
    uint64_t v8 = @"DEFAULT_PRIORITY_CATEGORY_SUMMARY_FORMAT";
    goto LABEL_5;
  }
  if (!style)
  {
    uint64_t v6 = NCUserNotificationsUIKitFrameworkBundle();
    v7 = v6;
    uint64_t v8 = @"DEFAULT_CATEGORY_SUMMARY_FORMAT";
LABEL_5:
    uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_1F2F516F8 table:0];

    goto LABEL_7;
  }
  uint64_t v9 = 0;
LABEL_7:
  uint64_t v10 = [(NCNotificationSummaryBuilder *)self _localizedSummaryWithFormat:v9 notificationsCount:a3 arguments:0];

  return v10;
}

- (id)_defaultLocalizedSummaryWithNotificationsCount:(unint64_t)a3 arguments:(id)a4
{
  id v6 = a4;
  unint64_t style = self->_style;
  if (style == 1)
  {
    uint64_t v8 = NCUserNotificationsUIKitFrameworkBundle();
    uint64_t v9 = v8;
    uint64_t v10 = @"DEFAULT_PRIORITY_CATEGORY_SUMMARY_FORMAT_WITH_ARGUMENTS";
    goto LABEL_5;
  }
  if (!style)
  {
    uint64_t v8 = NCUserNotificationsUIKitFrameworkBundle();
    uint64_t v9 = v8;
    uint64_t v10 = @"DEFAULT_CATEGORY_SUMMARY_FORMAT_WITH_ARGUMENTS";
LABEL_5:
    v11 = [v8 localizedStringForKey:v10 value:&stru_1F2F516F8 table:0];

    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:
  v12 = [(NCNotificationSummaryBuilder *)self _localizedSummaryWithFormat:v11 notificationsCount:a3 arguments:v6];

  return v12;
}

- (id)_localizedSummaryWithFormats:(id)a3 andCounts:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v13 = [v7 objectForKeyedSubscript:v12];
        uint64_t v14 = [v13 unsignedIntegerValue];

        if (![(NCNotificationSummaryBuilder *)self _includeLeadingNotificationRequest])
        {
          v15 = [(NCNotificationRequest *)self->_leadingNotificationRequest content];
          id v16 = [v15 categorySummaryFormat];
          unsigned int v17 = [v12 isEqualToString:v16];

          v14 -= v17;
        }
        if (v14)
        {
          uint64_t v18 = [(NCNotificationSummaryBuilder *)self _localizedSummaryWithFormat:v12 notificationsCount:v14 arguments:0];
          [v27 addObject:v18];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }

  unint64_t defaultFormatsCount = self->_defaultFormatsCount;
  if (defaultFormatsCount)
  {
    if (![(NCNotificationSummaryBuilder *)self _includeLeadingNotificationRequest])
    {
      uint64_t v20 = [(NCNotificationRequest *)self->_leadingNotificationRequest content];
      v21 = [v20 categorySummaryFormat];
      uint64_t v22 = [v21 length] == 0;

      defaultFormatsCount -= v22;
    }
    long long v23 = [(NCNotificationSummaryBuilder *)self _defaultLocalizedSummaryWithNotificationsCount:defaultFormatsCount];
    [v27 addObject:v23];
  }
  long long v24 = [(NCNotificationSummaryBuilder *)self _formatListWithArguments:v27];

  return v24;
}

- (id)_localizedSummaryWithFormat:(id)a3 notificationsCount:(unint64_t)a4 arguments:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v31 = 0;
    uint64_t v10 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, @"%u", &v31, a4);
    id v11 = v31;
    v12 = v11;
    if (v10) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    uint64_t v14 = v10;
    if (v13) {
      goto LABEL_37;
    }
  }
  else
  {
    v12 = 0;
    uint64_t v10 = 0;
  }
  if ([v9 count] && self->_emptyArgumentsCount)
  {
    v15 = *MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7C04000, v15, OS_LOG_TYPE_INFO, "Ignoring category format because the group contains mixed notifications with and without arguments", buf, 2u);
    }
    uint64_t v14 = [(NCNotificationSummaryBuilder *)self _defaultLocalizedSummaryWithNotificationsCount:a4];
    goto LABEL_36;
  }
  uint64_t v16 = [(NCNotificationSummaryBuilder *)self _filteredArgumentsArrayWithArguments:v9];
  uint64_t v17 = [(NCNotificationSummaryBuilder *)self _formatListWithArguments:v16];

  if (v8)
  {
    id v30 = 0;
    uint64_t v14 = [NSString localizedStringWithValidatedFormat:v8, @"%u%@", &v30, a4, v17 validFormatSpecifiers error];
    id v18 = v30;

    if (!v14) {
      goto LABEL_23;
    }
  }
  else
  {
    id v18 = 0;
    uint64_t v14 = v10;
    if (!v10) {
      goto LABEL_23;
    }
  }
  if (!v18)
  {
    if (![v9 count])
    {
      uint64_t v19 = *MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
        -[NCNotificationSummaryBuilder _localizedSummaryWithFormat:notificationsCount:arguments:](v19);
      }
      uint64_t v20 = [(NCNotificationSummaryBuilder *)self _defaultLocalizedSummaryWithNotificationsCount:a4];

      uint64_t v10 = (void *)v17;
      v12 = (void *)v16;
      uint64_t v14 = (void *)v20;
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_23:
  *(void *)buf = 0;
  v21 = [(NCNotificationSummaryBuilder *)self _formatListWithArguments:v16 truncated:1 truncatedArgumentsCount:buf];

  if (v8)
  {
    id v28 = 0;
    uint64_t v22 = [NSString localizedStringWithValidatedFormat:v8, @"%u%@%u", &v28, a4, v21, *(void *)buf validFormatSpecifiers error];
    id v23 = v28;

    uint64_t v14 = (void *)v22;
    if (!v22)
    {
LABEL_31:
      long long v25 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
        -[NCNotificationSummaryBuilder _localizedSummaryWithFormat:notificationsCount:arguments:]((uint64_t)v8, v25, v23);
      }
LABEL_33:
      uint64_t v26 = [(NCNotificationSummaryBuilder *)self _defaultLocalizedSummaryWithNotificationsCount:a4];

      uint64_t v14 = (void *)v26;
      goto LABEL_34;
    }
  }
  else
  {
    id v23 = 0;
    if (!v14) {
      goto LABEL_31;
    }
  }
  if (v23) {
    goto LABEL_31;
  }
  if (![v9 count])
  {
    long long v24 = *MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      -[NCNotificationSummaryBuilder _localizedSummaryWithFormat:notificationsCount:arguments:](v24);
    }
    goto LABEL_33;
  }
LABEL_34:

LABEL_35:
  uint64_t v10 = (void *)v17;
  v12 = (void *)v16;
LABEL_36:

LABEL_37:

  return v14;
}

- (id)_formatListWithArguments:(id)a3
{
  return [(NCNotificationSummaryBuilder *)self _formatListWithArguments:a3 truncated:0 truncatedArgumentsCount:0];
}

- (id)_formatListWithArguments:(id)a3 truncated:(BOOL)a4 truncatedArgumentsCount:(unint64_t *)a5
{
  BOOL v6 = a4;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (a5) {
    *a5 = 0;
  }
  if (![v7 count])
  {
    id v9 = &stru_1F2F516F8;
    goto LABEL_16;
  }
  if ([v8 count] == 1)
  {
    id v9 = [v8 objectAtIndexedSubscript:0];
    goto LABEL_16;
  }
  if ([v8 count] == 2)
  {
    uint64_t v10 = NSString;
    id v11 = NCUserNotificationsUIKitFrameworkBundle();
    v12 = [v11 localizedStringForKey:@"CATEGORY_SUMMARY_LIST_TWO_ELEMENTS_FORMAT" value:&stru_1F2F516F8 table:0];
    BOOL v13 = [v8 objectAtIndexedSubscript:0];
    uint64_t v14 = [v8 objectAtIndexedSubscript:1];
    objc_msgSend(v10, "localizedStringWithFormat:", v12, v13, v14, 0);
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    goto LABEL_16;
  }
  if (v6 && (unint64_t)[v8 count] >= 5)
  {
    id v11 = objc_msgSend(v8, "subarrayWithRange:", 0, 3);
    if (a5)
    {
      uint64_t v15 = [v8 count];
      *a5 = v15 - [v11 count];
    }
    uint64_t v16 = NCUserNotificationsUIKitFrameworkBundle();
    uint64_t v17 = [v16 localizedStringForKey:@"CATEGORY_SUMMARY_LIST_SEPARATOR" value:&stru_1F2F516F8 table:0];
    id v9 = [v11 componentsJoinedByString:v17];

    goto LABEL_9;
  }
  id v18 = [v8 lastObject];
  v27[0] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  uint64_t v20 = [v8 arrayByExcludingObjectsInArray:v19];

  v21 = NCUserNotificationsUIKitFrameworkBundle();
  uint64_t v22 = [v21 localizedStringForKey:@"CATEGORY_SUMMARY_LIST_SEPARATOR" value:&stru_1F2F516F8 table:0];
  id v23 = [v20 componentsJoinedByString:v22];

  long long v24 = NCUserNotificationsUIKitFrameworkBundle();
  long long v25 = [v24 localizedStringForKey:@"CATEGORY_SUMMARY_LIST_SEPARATOR_LAST_ELEMENT" value:&stru_1F2F516F8 table:0];
  objc_msgSend(v23, "stringByAppendingFormat:", v25, v18);
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_16:

  return v9;
}

- (id)_filteredArgumentsArrayWithArguments:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F28D60];
  id v5 = a3;
  BOOL v6 = objc_msgSend(v4, "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  id v7 = [v5 objectsAtIndexes:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__NCNotificationSummaryBuilder__filteredArgumentsArrayWithArguments___block_invoke;
  v10[3] = &unk_1E6A93F40;
  v10[4] = self;
  id v8 = objc_msgSend(v7, "bs_filter:", v10);

  return v8;
}

uint64_t __69__NCNotificationSummaryBuilder__filteredArgumentsArrayWithArguments___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  id v5 = [v3 content];
  BOOL v6 = [v5 summaryArgument];
  int v7 = [v6 isEqualToString:v4];

  id v8 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:v4];

  uint64_t v9 = [v8 integerValue];
  if (v9 == 1) {
    return v7 ^ 1u;
  }
  else {
    return 1;
  }
}

- (void)_insertString:(id)a3 intoSequence:(id)a4 withCounters:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([v12 length])
  {
    if ([v7 containsObject:v12]) {
      [v7 removeObject:v12];
    }
    [v7 addObject:v12];
    uint64_t v9 = NSNumber;
    uint64_t v10 = [v8 objectForKeyedSubscript:v12];
    id v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") + 1);
    [v8 setObject:v11 forKeyedSubscript:v12];
  }
}

- (unint64_t)style
{
  return self->_style;
}

- (NSString)summaryText
{
  return self->_summaryText;
}

- (NSArray)notificationRequests
{
  return &self->_notificationRequests->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_argumentsCounts, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_formatStringsCounts, 0);
  objc_storeStrong((id *)&self->_formatStrings, 0);
  objc_storeStrong((id *)&self->_notificationRequests, 0);

  objc_storeStrong((id *)&self->_leadingNotificationRequest, 0);
}

- (void)_localizedSummaryWithFormat:(uint64_t)a1 notificationsCount:(void *)a2 arguments:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  BOOL v6 = [a3 description];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_ERROR, "Ignoring invalid category summary format: \"%{public}@\": %@", (uint8_t *)&v7, 0x16u);
}

- (void)_localizedSummaryWithFormat:(os_log_t)log notificationsCount:arguments:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7C04000, log, OS_LOG_TYPE_ERROR, "Ignoring category summary format because arguments were expected but none were provided", v1, 2u);
}

@end