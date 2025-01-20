@interface PKInk
+ (BOOL)crl_isSixChannelBlendingUsedByInkType:(id)a3;
@end

@implementation PKInk

+ (BOOL)crl_isSixChannelBlendingUsedByInkType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:PKInkTypeMarker]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:PKInkTypeWatercolor];
  }

  return v4;
}

@end