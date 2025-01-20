@interface TRISystemDimensions(ServerFactory)
+ (id)fullSystemDimensions:()ServerFactory;
@end

@implementation TRISystemDimensions(ServerFactory)

+ (id)fullSystemDimensions:()ServerFactory
{
  v3 = (void *)MEMORY[0x1E4FB0620];
  id v4 = a3;
  v5 = [v3 systemDimensions];
  BOOL v6 = +[TRIUserAdjustableSettings getExperimentOptOut:v4];

  [v5 setExperimentOptOutStatus:v6];
  return v5;
}

@end