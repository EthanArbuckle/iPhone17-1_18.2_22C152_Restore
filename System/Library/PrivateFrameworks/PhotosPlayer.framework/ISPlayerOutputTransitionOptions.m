@interface ISPlayerOutputTransitionOptions
- (ISPlayerOutputTransitionOptions)init;
- (double)transitionDuration;
- (id)description;
- (void)setTransitionDuration:(double)a3;
@end

@implementation ISPlayerOutputTransitionOptions

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)ISPlayerOutputTransitionOptions;
  v3 = [(ISPlayerOutputTransitionOptions *)&v6 description];
  v4 = objc_msgSend(v3, "stringByAppendingFormat:", @"\n\t\tduration:\t%f", *(void *)&self->_transitionDuration);

  return v4;
}

- (ISPlayerOutputTransitionOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)ISPlayerOutputTransitionOptions;
  result = [(ISPlayerOutputTransitionOptions *)&v3 init];
  if (result) {
    result->_transitionDuration = 0.0;
  }
  return result;
}

@end