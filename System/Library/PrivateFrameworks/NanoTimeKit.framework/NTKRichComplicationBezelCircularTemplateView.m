@interface NTKRichComplicationBezelCircularTemplateView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (Class)_circularViewClassFromFromTemplate:(id)a3;
- (id)_bezelTextProviderFromTemplate:(id)a3;
- (id)_circularTemplateFromTemplate:(id)a3;
@end

@implementation NTKRichComplicationBezelCircularTemplateView

- (Class)_circularViewClassFromFromTemplate:(id)a3
{
  v3 = [a3 circularTemplate];
  id v4 = NTKComplicationDisplayClassForTemplateAndFamily(v3, 10);

  return (Class)v4;
}

- (id)_bezelTextProviderFromTemplate:(id)a3
{
  return (id)[a3 textProvider];
}

- (id)_circularTemplateFromTemplate:(id)a3
{
  return (id)[a3 circularTemplate];
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [v4 circularTemplate];
    id v6 = NTKComplicationDisplayClassForTemplateAndFamily(v5, 10);

    BOOL v7 = v6 != 0;
    if (!v6)
    {
      v8 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [v4 circularTemplate];
        int v11 = 138412546;
        id v12 = v4;
        __int16 v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Failed to handle template %@ because there is not associated view for the circular template: %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 9;
}

@end