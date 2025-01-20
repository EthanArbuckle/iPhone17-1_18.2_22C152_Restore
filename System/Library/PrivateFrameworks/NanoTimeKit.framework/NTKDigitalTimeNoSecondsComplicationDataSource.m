@interface NTKDigitalTimeNoSecondsComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
- (id)_templateWithShouldDisplayIdealizeState:(BOOL)a3;
@end

@implementation NTKDigitalTimeNoSecondsComplicationDataSource

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 57;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return *MEMORY[0x1E4F19650] == a3;
}

- (id)_templateWithShouldDisplayIdealizeState:(BOOL)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"NTKTimerComplicationMetadataShouldDisplayIdealizedStateKey";
  v4 = [NSNumber numberWithBool:a3];
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  int64_t v6 = [(CLKCComplicationDataSource *)self family];
  if (v6 == *MEMORY[0x1E4F19650])
  {
    v7 = [MEMORY[0x1E4F19768] templateWithMetadata:v5];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end