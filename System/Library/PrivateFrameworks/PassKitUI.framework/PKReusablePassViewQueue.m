@interface PKReusablePassViewQueue
- (PKReusablePassViewQueue)initWithCount:(unint64_t)a3;
- (id)dequeueReusablePassView;
- (void)enqueueReusablePassView:(id)a3;
@end

@implementation PKReusablePassViewQueue

- (PKReusablePassViewQueue)initWithCount:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKReusablePassViewQueue;
  v4 = [(PKReusablePassViewQueue *)&v9 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:a3];
    passViews = v4->_passViews;
    v4->_passViews = (NSMutableSet *)v5;

    for (; a3; --a3)
    {
      v7 = [[PKPassView alloc] initWithPass:0];
      [(NSMutableSet *)v4->_passViews addObject:v7];
    }
  }
  return v4;
}

- (id)dequeueReusablePassView
{
  v3 = [(NSMutableSet *)self->_passViews anyObject];
  if (v3) {
    [(NSMutableSet *)self->_passViews removeObject:v3];
  }

  return v3;
}

- (void)enqueueReusablePassView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end