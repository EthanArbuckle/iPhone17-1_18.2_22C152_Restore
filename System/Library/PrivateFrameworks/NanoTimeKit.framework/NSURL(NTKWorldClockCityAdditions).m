@interface NSURL(NTKWorldClockCityAdditions)
+ (id)nwcCurrentLocationURLForLatitude:()NTKWorldClockCityAdditions longitude:;
+ (id)nwcCurrentLocationURLForLocation:()NTKWorldClockCityAdditions;
+ (uint64_t)nwcCurrentLocationURL;
@end

@implementation NSURL(NTKWorldClockCityAdditions)

+ (uint64_t)nwcCurrentLocationURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"nwc://curLoc"];
}

+ (id)nwcCurrentLocationURLForLatitude:()NTKWorldClockCityAdditions longitude:
{
  v3 = NSString;
  v4 = objc_msgSend(NSNumber, "numberWithDouble:");
  v5 = [v4 stringValue];
  v6 = [NSNumber numberWithDouble:a2];
  v7 = [v6 stringValue];
  v8 = [v3 stringWithFormat:@"%@/%@/%@", @"nwc://curLoc", v5, v7];

  v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];

  return v9;
}

+ (id)nwcCurrentLocationURLForLocation:()NTKWorldClockCityAdditions
{
  id v3 = a3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1E4F1CB10];
  if (v3)
  {
    [v3 coordinate];
    double v7 = v6;
    [v4 coordinate];
    objc_msgSend(v5, "nwcCurrentLocationURLForLatitude:longitude:", v7);
  }
  else
  {
    [MEMORY[0x1E4F1CB10] nwcCurrentLocationURL];
  v8 = };

  return v8;
}

@end