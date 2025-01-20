@interface MCAnimationPath
+ (id)animationPathWithKey:(id)a3;
- (BOOL)isSnapshot;
- (BOOL)isTriggered;
- (MCAnimationPath)initWithImprint:(id)a3;
- (NSString)key;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setIsTriggered:(BOOL)a3;
- (void)setKey:(id)a3;
@end

@implementation MCAnimationPath

+ (id)animationPathWithKey:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setKey:a3];
  return v4;
}

- (MCAnimationPath)initWithImprint:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MCAnimationPath;
  id v4 = -[MCObjectLight initWithImprint:](&v7, "initWithImprint:");
  if (v4)
  {
    v4->mKey = (NSString *)[a3 objectForKey:@"key"];
    id v5 = [a3 objectForKey:@"isTriggered"];
    if (v5) {
      LOBYTE(v5) = [v5 BOOLValue];
    }
    v4->mIsTriggered = (char)v5;
  }
  return v4;
}

- (void)demolish
{
  self->mKey = 0;
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)MCAnimationPath;
  id v3 = [(MCObjectLight *)&v7 imprint];
  id v4 = v3;
  mKey = self->mKey;
  if (mKey) {
    [v3 setObject:mKey forKey:@"key"];
  }
  if (self->mIsTriggered) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"isTriggered");
  }
  return v4;
}

- (void)_copySelfToSnapshot:(id)a3
{
  mKey = self->mKey;
  if (mKey) {
    *((void *)a3 + 2) = [(NSString *)mKey copy];
  }
  *((unsigned char *)a3 + 8) = self->mIsTriggered;
  *((unsigned char *)a3 + 9) = 1;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKey:(id)a3
{
}

- (BOOL)isTriggered
{
  return self->mIsTriggered;
}

- (void)setIsTriggered:(BOOL)a3
{
  self->mIsTriggered = a3;
}

- (BOOL)isSnapshot
{
  return self->mIsSnapshot;
}

@end