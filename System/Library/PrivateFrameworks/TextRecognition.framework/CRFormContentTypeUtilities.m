@interface CRFormContentTypeUtilities
+ (BOOL)contentTypeIsAddressComponent:(unint64_t)a3;
+ (BOOL)contentTypeIsAutoFillable:(unint64_t)a3;
+ (BOOL)contentTypeIsBirthdayComponent:(unint64_t)a3;
+ (BOOL)contentTypeIsComponentType:(unint64_t)a3 previousType:(unint64_t)a4 nextType:(unint64_t)a5;
+ (BOOL)contentTypeIsCreditCardComponent:(unint64_t)a3;
+ (BOOL)contentTypeIsDateComponent:(unint64_t)a3;
+ (BOOL)contentTypeIsStartOfAutofillContext:(unint64_t)a3 previousType:(unint64_t)a4 nextType:(unint64_t)a5;
+ (BOOL)contentTypeIsTelephoneComponent:(unint64_t)a3;
+ (BOOL)shouldAssignTextContentTypeForField:(id)a3 updateExternalFields:(BOOL)a4 allowOverride:(BOOL)a5 allowAllDetectionSources:(BOOL)a6;
+ (id)shortStringFromContentType:(unint64_t)a3;
+ (id)stringFromContentType:(unint64_t)a3;
+ (unint64_t)contentTypeFromString:(id)a3;
@end

@implementation CRFormContentTypeUtilities

+ (id)stringFromContentType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = getFormContentTypes();
  if ([v4 count] <= a3)
  {
    v7 = CROSLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v11 = 134217984;
      unint64_t v12 = a3;
      _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_FAULT, "Invalid text content type: %lu", (uint8_t *)&v11, 0xCu);
    }

    v5 = v4;
    unint64_t v6 = 0;
  }
  else
  {
    v5 = v4;
    unint64_t v6 = a3;
  }
  v8 = [v5 objectAtIndexedSubscript:v6];
  v9 = [v8 objectForKeyedSubscript:@"string"];

  return v9;
}

+ (id)shortStringFromContentType:(unint64_t)a3
{
  v3 = [a1 stringFromContentType:a3];
  v4 = [v3 stringByReplacingOccurrencesOfString:@"CRFormContentType" withString:&stru_1F38EED68];

  return v4;
}

+ (BOOL)contentTypeIsAutoFillable:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = getFormContentTypes();
  if ([v4 count] <= a3)
  {
    v8 = CROSLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v10 = 134217984;
      unint64_t v11 = a3;
      _os_log_impl(&dword_1DD733000, v8, OS_LOG_TYPE_FAULT, "Invalid text content type: %lu", (uint8_t *)&v10, 0xCu);
    }

    char v7 = 0;
  }
  else
  {
    v5 = [v4 objectAtIndexedSubscript:a3];
    unint64_t v6 = [v5 objectForKeyedSubscript:@"autoFillable"];
    char v7 = [v6 BOOLValue];
  }
  return v7;
}

+ (unint64_t)contentTypeFromString:(id)a3
{
  id v3 = a3;
  if (qword_1EB58CC08 != -1) {
    dispatch_once(&qword_1EB58CC08, &__block_literal_global_21);
  }
  v4 = [(id)_MergedGlobals_22 objectForKeyedSubscript:v3];
  if (v4
    || (v5 = (void *)_MergedGlobals_22,
        [@"CRFormContentType" stringByAppendingString:v3],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:v6],
        v4 = objc_claimAutoreleasedReturnValue(),
        v6,
        v4))
  {
    unint64_t v7 = [v4 unsignedIntegerValue];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

void __52__CRFormContentTypeUtilities_contentTypeFromString___block_invoke()
{
  v0 = objc_opt_new();
  getFormContentTypes();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 count])
  {
    unint64_t v1 = 0;
    do
    {
      v2 = [NSNumber numberWithUnsignedInteger:v1];
      id v3 = [v6 objectAtIndexedSubscript:v1];
      v4 = [v3 objectForKeyedSubscript:@"string"];
      [v0 setObject:v2 forKeyedSubscript:v4];

      ++v1;
    }
    while (v1 < [v6 count]);
  }
  v5 = (void *)_MergedGlobals_22;
  _MergedGlobals_22 = (uint64_t)v0;
}

+ (BOOL)shouldAssignTextContentTypeForField:(id)a3 updateExternalFields:(BOOL)a4 allowOverride:(BOOL)a5 allowAllDetectionSources:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 fieldSource];
  BOOL v11 = v10 == 1 || v6;
  if (v6 && v10 != 1) {
    BOOL v11 = [v9 fieldSource] == 2 || objc_msgSend(v9, "fieldSource") == 3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v8 || (objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_30;
    }
    if (a5) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (!a5)
  {
    if ([v9 textContentType]) {
      LOBYTE(v11) = 0;
    }
    if (v11 || !v8) {
      goto LABEL_31;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_30;
    }
LABEL_23:
    if ([v9 textContentType]) {
      goto LABEL_30;
    }
    goto LABEL_24;
  }
  if (!v11 && v8)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_30;
    }
LABEL_24:
    if ([v9 fieldType] == 1)
    {
      if ([v9 fieldSource] == 4 || objc_msgSend(v9, "fieldSource") == 5)
      {
        LOBYTE(v11) = 1;
        goto LABEL_31;
      }
      if ([v9 fieldSource] == 7)
      {
        uint64_t v12 = [v9 fieldValue];
        LOBYTE(v11) = [v12 length] != 0;

        goto LABEL_31;
      }
    }
LABEL_30:
    LOBYTE(v11) = 0;
  }
LABEL_31:

  return v11;
}

+ (BOOL)contentTypeIsStartOfAutofillContext:(unint64_t)a3 previousType:(unint64_t)a4 nextType:(unint64_t)a5
{
  return a3 < 2
      || +[CRFormContentTypeUtilities contentTypeIsComponentType:previousType:nextType:](CRFormContentTypeUtilities, "contentTypeIsComponentType:previousType:nextType:");
}

+ (BOOL)contentTypeIsComponentType:(unint64_t)a3 previousType:(unint64_t)a4 nextType:(unint64_t)a5
{
  return +[CRFormContentTypeUtilities contentTypeIsAddressComponent:](CRFormContentTypeUtilities, "contentTypeIsAddressComponent:")&& !+[CRFormContentTypeUtilities contentTypeIsAddressComponent:](CRFormContentTypeUtilities, "contentTypeIsAddressComponent:", a4)&& !+[CRFormContentTypeUtilities contentTypeIsAddressComponent:](CRFormContentTypeUtilities, "contentTypeIsAddressComponent:", a5)|| +[CRFormContentTypeUtilities contentTypeIsTelephoneComponent:](CRFormContentTypeUtilities, "contentTypeIsTelephoneComponent:", a3)&& !+[CRFormContentTypeUtilities contentTypeIsTelephoneComponent:](CRFormContentTypeUtilities, "contentTypeIsTelephoneComponent:", a4)&& !+[CRFormContentTypeUtilities contentTypeIsTelephoneComponent:](
            CRFormContentTypeUtilities,
            "contentTypeIsTelephoneComponent:",
            a5)
      || +[CRFormContentTypeUtilities contentTypeIsCreditCardComponent:](CRFormContentTypeUtilities, "contentTypeIsCreditCardComponent:", a3)&& !+[CRFormContentTypeUtilities contentTypeIsCreditCardComponent:](CRFormContentTypeUtilities, "contentTypeIsCreditCardComponent:", a4)&& !+[CRFormContentTypeUtilities contentTypeIsCreditCardComponent:a5];
}

+ (BOOL)contentTypeIsAddressComponent:(unint64_t)a3
{
  return (a3 < 0x15) & (0x1BE000u >> a3);
}

+ (BOOL)contentTypeIsTelephoneComponent:(unint64_t)a3
{
  return (a3 < 0x32) & (0x3A80000000000uLL >> a3);
}

+ (BOOL)contentTypeIsCreditCardComponent:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 0x20
      || (a3 & 0xFFFFFFFFFFFFFFFCLL) == 24
      || a3 == 28
      || (a3 & 0xFFFFFFFFFFFFFFFELL) == 30
      || a3 == 29;
}

+ (BOOL)contentTypeIsBirthdayComponent:(unint64_t)a3
{
  return a3 - 37 < 4;
}

+ (BOOL)contentTypeIsDateComponent:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFCLL) == 52;
}

@end