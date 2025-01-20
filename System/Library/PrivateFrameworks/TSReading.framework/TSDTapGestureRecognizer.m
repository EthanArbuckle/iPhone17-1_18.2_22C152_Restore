@interface TSDTapGestureRecognizer
- (CGPoint)firstTapLocation;
- (unint64_t)tapCount;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation TSDTapGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "allTouches"), "count") < 2)
  {
    v12.receiver = self;
    v12.super_class = (Class)TSDTapGestureRecognizer;
    [(TSDTapGestureRecognizer *)&v12 touchesBegan:a3 withEvent:a4];
    v9 = (void *)[a3 anyObject];
    if (!self->mSavedFirstTapLocation)
    {
      [(TSDTapGestureRecognizer *)self locationInView:0];
      self->mFirstTapLocation.x = v10;
      self->mFirstTapLocation.y = v11;
      self->mSavedFirstTapLocation = 1;
    }
    self->mTapCount = [v9 tapCount];
  }
  else
  {
    if ([(TSDTapGestureRecognizer *)self state])
    {
      v7 = self;
      uint64_t v8 = 4;
    }
    else
    {
      v7 = self;
      uint64_t v8 = 5;
    }
    [(TSDTapGestureRecognizer *)v7 setState:v8];
  }
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)TSDTapGestureRecognizer;
  [(TSDTapGestureRecognizer *)&v3 reset];
  self->mTapCount = 0;
  self->mFirstTapLocation = (CGPoint)*MEMORY[0x263F00148];
  self->mSavedFirstTapLocation = 0;
}

- (CGPoint)firstTapLocation
{
  double x = self->mFirstTapLocation.x;
  double y = self->mFirstTapLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unint64_t)tapCount
{
  return self->mTapCount;
}

@end