@interface UIApplication
+ (id)sharePlayTogetherObjCViewModel;
+ (void)setSharePlayTogetherObjCViewModel:(id)a3;
@end

@implementation UIApplication

+ (id)sharePlayTogetherObjCViewModel
{
  return (id)qword_101129430;
}

+ (void)setSharePlayTogetherObjCViewModel:(id)a3
{
  v3 = (void *)qword_101129430;
  qword_101129430 = (uint64_t)a3;
  id v4 = a3;

  id v5 = [self defaultCenter];
  id v6 = v5;
  if (qword_101097978 != -1)
  {
    swift_once();
    id v5 = v6;
  }
  [v5 postNotificationName:qword_101128EE8 object:0];
}

@end