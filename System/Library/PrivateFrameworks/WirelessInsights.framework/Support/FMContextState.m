@interface FMContextState
- (FMContextState)initWithStartTime:(id)a3;
- (NSDate)startTime;
- (void)setStartTime:(id)a3;
@end

@implementation FMContextState

- (FMContextState)initWithStartTime:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMContextState;
  v5 = [(FMContextState *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(FMContextState *)v5 setStartTime:v4];
    v7 = v6;
  }

  return v6;
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end