@interface MCAnimationPathExpression
+ (id)animationPathWithKey:(id)a3 andExpression:(id)a4;
- (MCAnimationPathExpression)initWithImprint:(id)a3;
- (NSString)expression;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setExpression:(id)a3;
@end

@implementation MCAnimationPathExpression

+ (id)animationPathWithKey:(id)a3 andExpression:(id)a4
{
  id v5 = +[MCAnimationPath animationPathWithKey:a3];
  [v5 setExpression:a4];
  return v5;
}

- (MCAnimationPathExpression)initWithImprint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCAnimationPathExpression;
  v4 = -[MCAnimationPath initWithImprint:](&v6, "initWithImprint:");
  if (v4) {
    v4->mExpression = (NSString *)[a3 objectForKey:@"expression"];
  }
  return v4;
}

- (void)demolish
{
  self->mExpression = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCAnimationPathExpression;
  [(MCAnimationPath *)&v3 demolish];
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)MCAnimationPathExpression;
  id v3 = [(MCAnimationPath *)&v7 imprint];
  v4 = v3;
  mExpression = self->mExpression;
  if (mExpression) {
    [v3 setObject:mExpression forKey:@"expression"];
  }
  return v4;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCAnimationPathExpression;
  -[MCAnimationPath _copySelfToSnapshot:](&v6, "_copySelfToSnapshot:");
  mExpression = self->mExpression;
  if (mExpression) {
    *((void *)a3 + 3) = [(NSString *)mExpression copy];
  }
}

- (NSString)expression
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExpression:(id)a3
{
}

@end