@interface MTInstagramShareUtil
+ (id)createSocialPostUIImageWithShareModel:(id)a3;
- (MTInstagramShareUtil)init;
@end

@implementation MTInstagramShareUtil

+ (id)createSocialPostUIImageWithShareModel:(id)a3
{
  id v3 = a3;
  v4 = (void *)sub_1003A5290(v3);

  return v4;
}

- (MTInstagramShareUtil)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MTInstagramShareUtil *)&v3 init];
}

@end