@interface NTKTimelineComplicationController
+ (BOOL)_isLegacy;
- (BOOL)ignoreNewTemplates;
- (CLKComplicationTemplate)alwaysOnTemplate;
- (CLKComplicationTemplate)lockedTemplate;
- (id)activeDisplayTemplateForDisplayWrapper:(id)a3;
- (unint64_t)_animationForTimelineEntryTransitionFrom:(id)a3 to:(id)a4 withAnimationBehavior:(unint64_t)a5;
- (void)_analyticsAppLaunchForTimeTravelDate:(id)a3 timelineEntryDate:(id)a4;
- (void)setIgnoreNewTemplates:(BOOL)a3;
@end

@implementation NTKTimelineComplicationController

+ (BOOL)_isLegacy
{
  return 0;
}

- (unint64_t)_animationForTimelineEntryTransitionFrom:(id)a3 to:(id)a4 withAnimationBehavior:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5 == 1)
  {
    uint64_t v10 = [v7 timelineAnimationGroup];
    if (v10)
    {
      v11 = (void *)v10;
      uint64_t v12 = [v8 timelineAnimationGroup];
      if (v12)
      {
        v13 = (void *)v12;
        v14 = [v7 timelineAnimationGroup];
        v15 = [v8 timelineAnimationGroup];
        char v16 = [v14 isEqualToString:v15];

        if (v16) {
          goto LABEL_3;
        }
      }
      else
      {
      }
    }
LABEL_9:
    v17 = [v7 date];
    v18 = [v8 date];
    unint64_t v9 = NTKComplicationAnimationForDates(v17, v18);

    goto LABEL_10;
  }
  if (a5 == 2) {
    goto LABEL_9;
  }
LABEL_3:
  unint64_t v9 = 0;
LABEL_10:

  return v9;
}

- (void)_analyticsAppLaunchForTimeTravelDate:(id)a3 timelineEntryDate:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [a3 timeIntervalSinceNow];
  v18[0] = @"eventName";
  v18[1] = @"value";
  v19[0] = @"launchtimetraveloffset";
  id v7 = objc_msgSend(NSNumber, "numberWithDouble:");
  v19[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  AnalyticsSendEvent();

  if (v6)
  {
    [v6 timeIntervalSinceNow];
    v16[1] = @"value";
    v17[0] = @"launchtimetravelentryoffset";
    v16[0] = @"eventName";
    unint64_t v9 = objc_msgSend(NSNumber, "numberWithDouble:");
    v17[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    AnalyticsSendEvent();
  }
  v11 = [(NTKComplicationController *)self complicationApplicationIdentifier];
  uint64_t v12 = [@"timetravel.launch." stringByAppendingString:v11];

  v14 = @"eventName";
  v15 = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  AnalyticsSendEvent();
}

- (id)activeDisplayTemplateForDisplayWrapper:(id)a3
{
  v4 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[NTKTimelineComplicationController activeDisplayTemplateForDisplayWrapper:]((uint64_t)self, v4);
  }

  return 0;
}

- (CLKComplicationTemplate)alwaysOnTemplate
{
  return self->_alwaysOnTemplate;
}

- (BOOL)ignoreNewTemplates
{
  return self->_ignoreNewTemplates;
}

- (void)setIgnoreNewTemplates:(BOOL)a3
{
  self->_ignoreNewTemplates = a3;
}

- (CLKComplicationTemplate)lockedTemplate
{
  return self->_lockedTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockedTemplate, 0);

  objc_storeStrong((id *)&self->_alwaysOnTemplate, 0);
}

- (void)activeDisplayTemplateForDisplayWrapper:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "%@: returning nil for activeDisplayTemplate. THIS SHOULD NOT BE CALLED!", (uint8_t *)&v5, 0xCu);
}

@end