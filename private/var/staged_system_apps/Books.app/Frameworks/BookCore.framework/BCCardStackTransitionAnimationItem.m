@interface BCCardStackTransitionAnimationItem
- (BCCardStackTransitionAnimationItem)initWithKey:(id)a3;
- (NSString)key;
@end

@implementation BCCardStackTransitionAnimationItem

- (BCCardStackTransitionAnimationItem)initWithKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCCardStackTransitionAnimationItem;
  v6 = [(BCCardStackTransitionAnimationItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_key, a3);
  }

  return v7;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

@end