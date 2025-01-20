@interface SASLogging
+ (id)facility;
@end

@implementation SASLogging

+ (id)facility
{
  if (facility_onceToken != -1) {
    dispatch_once(&facility_onceToken, &__block_literal_global);
  }
  v2 = (void *)facility_facility;
  return v2;
}

uint64_t __22__SASLogging_facility__block_invoke()
{
  facility_facility = (uint64_t)os_log_create("com.apple.purplebuddy", "log");
  return MEMORY[0x1F41817F8]();
}

@end