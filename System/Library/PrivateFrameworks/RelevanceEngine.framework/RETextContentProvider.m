@interface RETextContentProvider
+ (BOOL)supportsSecureCoding;
+ (id)contentProviderFromAttributedString:(id)a3;
+ (id)contentProviderFromClockKitTextProvider:(id)a3;
- (NSString)contentEncodedString;
- (RETextContentProvider)initWithCoder:(id)a3;
- (id)attributedStringRepresentation;
- (id)clockKitTextProviderRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RETextContentProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)contentProviderFromClockKitTextProvider:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v8 = 0;
    goto LABEL_18;
  }
  getCLKDateTextProviderClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [v4 date];
    uint64_t v6 = [v4 calendarUnits];
    v7 = [v4 timeZone];
    v8 = +[REDateContentProvider dateContentProviderWithDate:v5 units:v6 timeZone:v7];

LABEL_17:
    goto LABEL_18;
  }
  getCLKRelativeDateTextProviderClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v3;
    uint64_t v10 = [v9 relativeDateStyle];
    if ((unint64_t)(v10 - 1) > 3) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = qword_21E7EA1D8[v10 - 1];
    }
    v13 = [v9 date];
    +[RERelativeDateContentProvider relativeDateContentProviderWithDate:style:units:](RERelativeDateContentProvider, "relativeDateContentProviderWithDate:style:units:", v13, v11, [v9 calendarUnits]);
    v8 = (REClockKitWrappedContentProvider *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  getCLKSimpleTextProviderClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v3;
    v5 = [v12 text];
    v8 = +[RESimpleTextContentProvider textContentProviderWithText:v5];

    goto LABEL_17;
  }
  getCLKTimeIntervalTextProviderClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v3;
    v5 = [v14 startDate];
    v15 = [v14 endDate];
    v16 = [v14 timeZone];
    v8 = +[RETimeIntervalContentProvider timeIntervalContentProviderWithStartDate:v5 endDate:v15 timeZone:v16];

LABEL_16:
    goto LABEL_17;
  }
  getCLKTimeTextProviderClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v3;
    v5 = [v17 date];
    v15 = [v17 timeZone];
    v8 = +[RETimeContentProvider timeContentProviderWithDate:v5 timeZone:v15];

    goto LABEL_16;
  }
  v19 = RELogForDomain(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    +[RETextContentProvider contentProviderFromClockKitTextProvider:]((uint64_t)v3, v19);
  }

  v8 = [[REClockKitWrappedContentProvider alloc] initWithClockKitTextProvider:v3];
LABEL_18:

  return v8;
}

+ (id)contentProviderFromAttributedString:(id)a3
{
  if (a3)
  {
    id v4 = +[REAttributedTextContentProvider textContentProviderWithAttributedText:](REAttributedTextContentProvider, "textContentProviderWithAttributedText:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (NSString)contentEncodedString
{
  return (NSString *)&stru_26CFA57D0;
}

- (id)attributedStringRepresentation
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3();
  v2 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_26CFA57D0];
  return v2;
}

- (id)clockKitTextProviderRepresentation
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 init];
}

- (void)encodeWithCoder:(id)a3
{
  OUTLINED_FUNCTION_1_4();
  NSRequestConcreteImplementation();
}

- (RETextContentProvider)initWithCoder:(id)a3
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3();
  id v4 = (RETextContentProvider *)objc_alloc_init((Class)objc_opt_class());

  return v4;
}

+ (void)contentProviderFromClockKitTextProvider:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 138412546;
  id v6 = (id)objc_opt_class();
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  id v4 = v6;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "WARNING: Unknown provider of class %@: %@", (uint8_t *)&v5, 0x16u);
}

@end