@interface BCViewPropertyAnimatorCounter
- (id)animationDidEnd;
- (int64_t)animationCount;
- (void)animate:(id)a3;
- (void)animate:(id)a3 afterDelay:(double)a4;
- (void)setAnimationCount:(int64_t)a3;
- (void)setAnimationDidEnd:(id)a3;
@end

@implementation BCViewPropertyAnimatorCounter

- (void)animate:(id)a3
{
}

- (void)animate:(id)a3 afterDelay:(double)a4
{
  id v6 = a3;
  [v6 setUserInteractionEnabled:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_A3348;
  v7[3] = &unk_2C4EE0;
  v7[4] = self;
  [v6 addCompletion:v7];
  [(BCViewPropertyAnimatorCounter *)self setAnimationCount:(char *)[(BCViewPropertyAnimatorCounter *)self animationCount] + 1];
  [v6 addAnimations:&stru_2C81A0];
  [v6 startAnimationAfterDelay:a4];
}

- (int64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(int64_t)a3
{
  self->_animationCount = a3;
}

- (id)animationDidEnd
{
  return self->_animationDidEnd;
}

- (void)setAnimationDidEnd:(id)a3
{
}

- (void).cxx_destruct
{
}

@end