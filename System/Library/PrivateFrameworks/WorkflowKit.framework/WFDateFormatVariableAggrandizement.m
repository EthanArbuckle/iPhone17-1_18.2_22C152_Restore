@interface WFDateFormatVariableAggrandizement
- (BOOL)includesTimeForISO8601;
- (NSString)customDateFormat;
- (NSString)dateStyle;
- (NSString)relativeDateStyle;
- (NSString)timeStyle;
- (WFDateFormatVariableAggrandizement)initWithCustomDateFormat:(id)a3;
- (WFDateFormatVariableAggrandizement)initWithDateStyle:(id)a3 timeStyle:(id)a4 relativeDateStyle:(id)a5;
- (WFDateFormatVariableAggrandizement)initWithDateStyle:(id)a3 timeStyle:(id)a4 relativeDateStyle:(id)a5 customDateFormat:(id)a6 includesTimeForISO8601:(BOOL)a7;
- (WFDateFormatVariableAggrandizement)initWithISO8601DateStyleAndTime:(BOOL)a3;
- (WFDateFormatVariableAggrandizement)initWithRFC2822DateStyle;
- (WFDateFormatVariableAggrandizement)initWithRelativeDateStyle:(id)a3 timeStyle:(id)a4;
- (WFDateFormatVariableAggrandizement)initWithRelativeTimeStyle;
- (id)processedContentClasses:(id)a3;
- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4;
@end

@implementation WFDateFormatVariableAggrandizement

- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__WFDateFormatVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke;
  v4[3] = &unk_1E65569B8;
  v4[4] = self;
  [a3 transformItemsUsingBlock:v4 completionHandler:a4];
}

void __81__WFDateFormatVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__WFDateFormatVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_2;
  v8[3] = &unk_1E6556990;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  id v7 = a2;
  [v7 getObjectRepresentation:v8 forClass:objc_opt_class()];
}

void __81__WFDateFormatVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v16 = a2;
  id v6 = a4;
  id v7 = [v16 date];
  if (v7
    || ([MEMORY[0x1E4F1C9A8] currentCalendar],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 dateFromComponents:v16],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7))
  {
    id v9 = [*(id *)(a1 + 32) dateStyle];
    v10 = [*(id *)(a1 + 32) timeStyle];
    v11 = [*(id *)(a1 + 32) relativeDateStyle];
    v12 = [*(id *)(a1 + 32) customDateFormat];
    uint64_t v13 = [*(id *)(a1 + 32) includesTimeForISO8601];
    v14 = [v16 timeZone];
    v15 = objc_msgSend(v7, "wf_formattedStringWithDateStyle:timeStyle:relativeDateStyle:customDateFormat:includeTimeForISO8601:timeZone:locale:", v9, v10, v11, v12, v13, v14, 0);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)processedContentClasses:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v4 = objc_opt_class();
  return (id)[v3 orderedSetWithObject:v4];
}

- (BOOL)includesTimeForISO8601
{
  v2 = [(WFVariableAggrandizement *)self dictionary];
  v3 = [v2 objectForKey:@"WFISO8601IncludeTime"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)customDateFormat
{
  v2 = [(WFVariableAggrandizement *)self dictionary];
  v3 = [v2 objectForKey:@"WFDateFormat"];

  return (NSString *)v3;
}

- (NSString)relativeDateStyle
{
  v2 = [(WFVariableAggrandizement *)self dictionary];
  v3 = [v2 objectForKey:@"WFRelativeDateFormatStyle"];

  return (NSString *)v3;
}

- (NSString)timeStyle
{
  v2 = [(WFVariableAggrandizement *)self dictionary];
  v3 = [v2 objectForKey:@"WFTimeFormatStyle"];

  return (NSString *)v3;
}

- (NSString)dateStyle
{
  v2 = [(WFVariableAggrandizement *)self dictionary];
  v3 = [v2 objectForKey:@"WFDateFormatStyle"];

  return (NSString *)v3;
}

- (WFDateFormatVariableAggrandizement)initWithCustomDateFormat:(id)a3
{
  return [(WFDateFormatVariableAggrandizement *)self initWithDateStyle:*MEMORY[0x1E4F5AB18] timeStyle:0 relativeDateStyle:0 customDateFormat:a3 includesTimeForISO8601:0];
}

- (WFDateFormatVariableAggrandizement)initWithRFC2822DateStyle
{
  return [(WFDateFormatVariableAggrandizement *)self initWithDateStyle:*MEMORY[0x1E4F5AB28] timeStyle:0 relativeDateStyle:0];
}

- (WFDateFormatVariableAggrandizement)initWithISO8601DateStyleAndTime:(BOOL)a3
{
  return [(WFDateFormatVariableAggrandizement *)self initWithDateStyle:*MEMORY[0x1E4F5AB20] timeStyle:0 relativeDateStyle:0 customDateFormat:0 includesTimeForISO8601:a3];
}

- (WFDateFormatVariableAggrandizement)initWithRelativeTimeStyle
{
  return [(WFDateFormatVariableAggrandizement *)self initWithDateStyle:0 timeStyle:*MEMORY[0x1E4F5AB30] relativeDateStyle:0];
}

- (WFDateFormatVariableAggrandizement)initWithRelativeDateStyle:(id)a3 timeStyle:(id)a4
{
  return [(WFDateFormatVariableAggrandizement *)self initWithDateStyle:*MEMORY[0x1E4F5AB30] timeStyle:a4 relativeDateStyle:a3 customDateFormat:0 includesTimeForISO8601:0];
}

- (WFDateFormatVariableAggrandizement)initWithDateStyle:(id)a3 timeStyle:(id)a4 relativeDateStyle:(id)a5
{
  return [(WFDateFormatVariableAggrandizement *)self initWithDateStyle:a3 timeStyle:a4 relativeDateStyle:a5 customDateFormat:0 includesTimeForISO8601:0];
}

- (WFDateFormatVariableAggrandizement)initWithDateStyle:(id)a3 timeStyle:(id)a4 relativeDateStyle:(id)a5 customDateFormat:(id)a6 includesTimeForISO8601:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_opt_new();
  [v16 setValue:v15 forKey:@"WFDateFormatStyle"];

  [v16 setValue:v14 forKey:@"WFTimeFormatStyle"];
  [v16 setValue:v13 forKey:@"WFRelativeDateFormatStyle"];

  [v16 setValue:v12 forKey:@"WFDateFormat"];
  v17 = [NSNumber numberWithBool:v7];
  [v16 setValue:v17 forKey:@"WFISO8601IncludeTime"];

  v18 = [(WFVariableAggrandizement *)self initWithDictionary:v16];
  return v18;
}

@end