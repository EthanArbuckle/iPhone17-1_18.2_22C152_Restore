@interface _UIDynamicButtonDeliveryTable
- (id)gestureRecognizers;
@end

@implementation _UIDynamicButtonDeliveryTable

- (id)gestureRecognizers
{
  if (a1)
  {
    v2 = objc_opt_new();
    [v2 unionSet:a1[1]];
    [v2 unionSet:a1[2]];
    [v2 unionSet:a1[3]];
    [v2 unionSet:a1[4]];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicButton, 0);
  objc_storeStrong((id *)&self->_cancellingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_endingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_updatingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_beginningGestureRecognizers, 0);
}

@end