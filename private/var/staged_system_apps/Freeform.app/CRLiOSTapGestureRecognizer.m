@interface CRLiOSTapGestureRecognizer
- (CGPoint)firstTapLocation;
- (int64_t)touchTypeForTap;
- (unint64_t)tapCount;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation CRLiOSTapGestureRecognizer

- (void)reset
{
  self->_tapCount = 0;
  self->_firstTapLocation = CGPointZero;
  self->_savedFirstTapLocation = 0;
  self->_touchTypeForTap = 0;
  v2.receiver = self;
  v2.super_class = (Class)CRLiOSTapGestureRecognizer;
  [(CRLiOSTapGestureRecognizer *)&v2 reset];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 allTouches];
  id v9 = [v8 count];
  id v10 = [(CRLiOSTapGestureRecognizer *)self numberOfTouchesRequired];

  if (v9 <= v10)
  {
    v17.receiver = self;
    v17.super_class = (Class)CRLiOSTapGestureRecognizer;
    [(CRLiOSTapGestureRecognizer *)&v17 touchesBegan:v6 withEvent:v7];
    v13 = [v6 anyObject];
    if (!self->_savedFirstTapLocation)
    {
      v14 = [(CRLiOSTapGestureRecognizer *)self view];
      [(CRLiOSTapGestureRecognizer *)self locationInView:v14];
      self->_firstTapLocation.x = v15;
      self->_firstTapLocation.y = v16;

      self->_savedFirstTapLocation = 1;
    }
    self->_tapCount = (unint64_t)[v13 tapCount];
    self->_touchTypeForTap = (int64_t)[v13 type];
  }
  else
  {
    if ([(CRLiOSTapGestureRecognizer *)self state])
    {
      v11 = self;
      uint64_t v12 = 4;
    }
    else
    {
      v11 = self;
      uint64_t v12 = 5;
    }
    [(CRLiOSTapGestureRecognizer *)v11 setState:v12];
  }
}

- (CGPoint)firstTapLocation
{
  double x = self->_firstTapLocation.x;
  double y = self->_firstTapLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unint64_t)tapCount
{
  return self->_tapCount;
}

- (int64_t)touchTypeForTap
{
  return self->_touchTypeForTap;
}

@end