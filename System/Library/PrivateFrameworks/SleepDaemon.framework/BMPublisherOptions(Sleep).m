@interface BMPublisherOptions(Sleep)
+ (id)hdsp_optionsForDateInterval:()Sleep reversed:;
+ (uint64_t)hdsp_optionsForDateInterval:()Sleep;
@end

@implementation BMPublisherOptions(Sleep)

+ (uint64_t)hdsp_optionsForDateInterval:()Sleep
{
  return objc_msgSend(a1, "hdsp_optionsForDateInterval:reversed:", a3, 0);
}

+ (id)hdsp_optionsForDateInterval:()Sleep reversed:
{
  v5 = (objc_class *)MEMORY[0x263F2A8B0];
  id v6 = a3;
  id v7 = [v5 alloc];
  if (a4)
  {
    v8 = [v6 endDate];
    v9 = [v6 startDate];

    v10 = v7;
    v11 = v8;
    v12 = v9;
    uint64_t v13 = 1;
  }
  else
  {
    v8 = [v6 startDate];
    v9 = [v6 endDate];

    v10 = v7;
    v11 = v8;
    v12 = v9;
    uint64_t v13 = 0;
  }
  v14 = (void *)[v10 initWithStartDate:v11 endDate:v12 maxEvents:0 lastN:0 reversed:v13];

  return v14;
}

@end