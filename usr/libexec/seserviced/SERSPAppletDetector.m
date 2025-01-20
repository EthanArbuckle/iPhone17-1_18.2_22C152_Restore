@interface SERSPAppletDetector
+ (BOOL)isSPApplet:(id)a3;
@end

@implementation SERSPAppletDetector

+ (BOOL)isSPApplet:(id)a3
{
  v3 = +[SESTLV simpleTLVsWithData:a3];
  v4 = [v3 firstObject];

  v5 = [v4 value];
  v6 = +[SESTLV TLVsWithData:v5];

  v7 = [v6 filter:&stru_10040D8F8];
  v8 = [v7 firstObject];
  v9 = [v8 value];
  BOOL v10 = v9 != 0;

  return v10;
}

@end