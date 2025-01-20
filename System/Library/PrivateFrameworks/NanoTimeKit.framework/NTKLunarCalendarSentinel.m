@interface NTKLunarCalendarSentinel
- (NTKLunarCalendarSentinel)init;
- (void)_handleLocaleChange;
@end

@implementation NTKLunarCalendarSentinel

- (NTKLunarCalendarSentinel)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKLunarCalendarSentinel;
  v2 = [(NTKLunarCalendarSentinel *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleLocaleChange name:*MEMORY[0x1E4F1C370] object:0];
    [v3 addObserver:v2 selector:sel__handleLocaleChange name:*MEMORY[0x1E4F256A8] object:0];
  }
  return v2;
}

- (void)_handleLocaleChange
{
}

@end