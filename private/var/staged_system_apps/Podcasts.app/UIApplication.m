@interface UIApplication
+ (id)sharedPlaybackController;
+ (void)setSharedPlaybackController:(id)a3;
@end

@implementation UIApplication

+ (id)sharedPlaybackController
{
  return (id)qword_10061AC90;
}

+ (void)setSharedPlaybackController:(id)a3
{
  id v4 = (id)qword_10061AC90;
  qword_10061AC90 = (uint64_t)a3;
  id v3 = a3;
}

@end