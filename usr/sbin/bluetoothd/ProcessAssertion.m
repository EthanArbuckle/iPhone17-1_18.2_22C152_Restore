@interface ProcessAssertion
- (id)description;
- (unint64_t)secondsLeft;
- (void)setSecondsLeft:(unint64_t)a3;
@end

@implementation ProcessAssertion

- (id)description
{
  v3 = [(ProcessAssertion *)self name];
  v4 = +[NSString stringWithFormat:@"%@ - %lus", v3, [(ProcessAssertion *)self secondsLeft]];

  return v4;
}

- (unint64_t)secondsLeft
{
  return self->_secondsLeft;
}

- (void)setSecondsLeft:(unint64_t)a3
{
  self->_secondsLeft = a3;
}

@end