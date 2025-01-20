@interface IMAnimationTracker
+ (id)animationTrackerWithCompletion:(id)a3;
- (IMAnimationTracker)initWithCompletion:(id)a3;
- (void)addAnimationWithBlock:(id)a3;
@end

@implementation IMAnimationTracker

- (IMAnimationTracker)initWithCompletion:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMAnimationTracker;
  v5 = [(IMAnimationTracker *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id completion = v5->_completion;
    v5->_id completion = v6;
  }
  return v5;
}

+ (id)animationTrackerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithCompletion:v4];

  return v5;
}

- (void)addAnimationWithBlock:(id)a3
{
  if (a3)
  {
    ++self->_animationCount;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_62844;
    v3[3] = &unk_2C5968;
    v3[4] = self;
    (*((void (**)(id, void *))a3 + 2))(a3, v3);
  }
}

- (void).cxx_destruct
{
}

@end