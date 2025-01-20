@interface NTKDigitalTimeComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)alwaysShowIdealizedTemplateInSwitcher;
- (BOOL)supportsTapAction;
- (Class)richComplicationDisplayViewClassForDevice:(id)a3;
- (id)_templateWithShouldDisplayIdealizeState:(BOOL)a3;
- (id)complicationApplicationIdentifier;
- (id)currentSwitcherTemplate;
- (unint64_t)timelineAnimationBehavior;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
@end

@implementation NTKDigitalTimeComplicationDataSource

- (Class)richComplicationDisplayViewClassForDevice:(id)a3
{
  if ([(CLKCComplicationDataSource *)self family] == 9
    || [(CLKCComplicationDataSource *)self family] == 10)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

- (BOOL)supportsTapAction
{
  return 0;
}

- (unint64_t)timelineAnimationBehavior
{
  return 0;
}

- (id)currentSwitcherTemplate
{
  return [(NTKDigitalTimeComplicationDataSource *)self _templateWithShouldDisplayIdealizeState:1];
}

- (BOOL)alwaysShowIdealizedTemplateInSwitcher
{
  return 1;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v8 = [(NTKDigitalTimeComplicationDataSource *)self _templateWithShouldDisplayIdealizeState:0];
  v5 = (void *)MEMORY[0x1E4F19A10];
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = [v5 entryWithDate:v6 complicationTemplate:v8];

  v4[2](v4, v7);
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
}

- (id)complicationApplicationIdentifier
{
  return 0;
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 45;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return (unint64_t)(a3 - 9) < 2 || *MEMORY[0x1E4F19650] == a3;
}

- (id)_templateWithShouldDisplayIdealizeState:(BOOL)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10 = @"NTKTimerComplicationMetadataShouldDisplayIdealizedStateKey";
  v4 = [NSNumber numberWithBool:a3];
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  if ([(CLKCComplicationDataSource *)self family] == 9)
  {
    v6 = (id *)0x1E4F197C0;
LABEL_7:
    id v8 = [*v6 templateWithMetadata:v5];
    goto LABEL_8;
  }
  if ([(CLKCComplicationDataSource *)self family] == 10)
  {
    v6 = (id *)0x1E4F197E8;
    goto LABEL_7;
  }
  int64_t v7 = [(CLKCComplicationDataSource *)self family];
  if (v7 == *MEMORY[0x1E4F19650])
  {
    v6 = (id *)0x1E4F19760;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_8:

  return v8;
}

@end