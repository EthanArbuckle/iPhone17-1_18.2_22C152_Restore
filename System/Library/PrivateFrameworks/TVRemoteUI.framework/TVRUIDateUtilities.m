@interface TVRUIDateUtilities
+ (id)localizedPlaybackTimeForInterval:(double)a3;
@end

@implementation TVRUIDateUtilities

+ (id)localizedPlaybackTimeForInterval:(double)a3
{
  if (localizedPlaybackTimeForInterval__onceToken != -1) {
    dispatch_once(&localizedPlaybackTimeForInterval__onceToken, &__block_literal_global_16);
  }
  v4 = (void *)localizedPlaybackTimeForInterval__formatter;
  return (id)[v4 stringFromTimeInterval:a3];
}

uint64_t __55__TVRUIDateUtilities_localizedPlaybackTimeForInterval___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08780]);
  v1 = (void *)localizedPlaybackTimeForInterval__formatter;
  localizedPlaybackTimeForInterval__formatter = (uint64_t)v0;

  [(id)localizedPlaybackTimeForInterval__formatter setUnitsStyle:1];
  v2 = (void *)localizedPlaybackTimeForInterval__formatter;
  return [v2 setAllowedUnits:96];
}

@end