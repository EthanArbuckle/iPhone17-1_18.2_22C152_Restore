@interface WBSDontSaveMarker
+ (id)dontSaveMarker;
@end

@implementation WBSDontSaveMarker

+ (id)dontSaveMarker
{
  return @"Passwords not saved";
}

@end