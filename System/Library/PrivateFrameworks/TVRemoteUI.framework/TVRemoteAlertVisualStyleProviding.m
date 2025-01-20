@interface TVRemoteAlertVisualStyleProviding
+ (id)visualStyleForIdiom:(int64_t)a3;
@end

@implementation TVRemoteAlertVisualStyleProviding

+ (id)visualStyleForIdiom:(int64_t)a3
{
  v3 = off_2647FFD00;
  if (a3 != 1) {
    v3 = &off_2647FFD08;
  }
  id v4 = objc_alloc_init(*v3);
  return v4;
}

@end