@interface MIWBPlist
+ (void)initialize;
- (int)readPlist:(id)a3;
@end

@implementation MIWBPlist

+ (void)initialize
{
  enableMIWBOverride = 2;
}

- (int)readPlist:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MIWBPlist;
  id v4 = a3;
  [(CMITuningPlist *)&v7 readPlist:v4];
  char v5 = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableMIWB", 0, 0, v7.receiver, v7.super_class);

  self->enableMIWB = v5;
  return 0;
}

@end