@interface PhotosSlideTransitionTransitioningDelegate
- (_TtC18PhotosUIFoundationP33_245E59FB3AED492785587A094999446D42PhotosSlideTransitionTransitioningDelegate)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
@end

@implementation PhotosSlideTransitionTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_259D20564();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_259D2063C();

  return v6;
}

- (_TtC18PhotosUIFoundationP33_245E59FB3AED492785587A094999446D42PhotosSlideTransitionTransitioningDelegate)init
{
  return (_TtC18PhotosUIFoundationP33_245E59FB3AED492785587A094999446D42PhotosSlideTransitionTransitioningDelegate *)sub_259D206E8();
}

@end