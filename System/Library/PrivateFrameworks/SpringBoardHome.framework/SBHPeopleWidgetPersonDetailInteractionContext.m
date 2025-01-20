@interface SBHPeopleWidgetPersonDetailInteractionContext
- (BSInvalidatable)sourceIconView;
- (CGRect)homeScreenContentFrame;
- (NSURL)personURL;
- (SBHPeopleWidgetPersonDetailInteractionContext)initWithPersonURL:(id)a3 sourceIconView:(id)a4 referenceIconView:(id)a5 containerViewController:(id)a6 containerView:(id)a7 homeScreenContentView:(id)a8 homeScreenContentFrame:(CGRect)a9;
- (SBIconView)referenceIconView;
- (UIView)containerView;
- (UIView)homeScreenContentView;
- (UIViewController)containerViewController;
@end

@implementation SBHPeopleWidgetPersonDetailInteractionContext

- (SBHPeopleWidgetPersonDetailInteractionContext)initWithPersonURL:(id)a3 sourceIconView:(id)a4 referenceIconView:(id)a5 containerViewController:(id)a6 containerView:(id)a7 homeScreenContentView:(id)a8 homeScreenContentFrame:(CGRect)a9
{
  CGFloat height = a9.size.height;
  CGFloat width = a9.size.width;
  CGFloat y = a9.origin.y;
  CGFloat x = a9.origin.x;
  id v19 = a3;
  id v28 = a4;
  id v27 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  v29.receiver = self;
  v29.super_class = (Class)SBHPeopleWidgetPersonDetailInteractionContext;
  v23 = [(SBHPeopleWidgetPersonDetailInteractionContext *)&v29 init];
  if (v23)
  {
    uint64_t v24 = objc_msgSend(v19, "copy", v27, v28);
    personURL = v23->_personURL;
    v23->_personURL = (NSURL *)v24;

    objc_storeStrong((id *)&v23->_sourceIconView, a4);
    objc_storeStrong((id *)&v23->_referenceIconView, a5);
    objc_storeStrong((id *)&v23->_containerViewController, a6);
    objc_storeStrong((id *)&v23->_containerView, a7);
    objc_storeStrong((id *)&v23->_homeScreenContentView, a8);
    v23->_homeScreenContentFrame.origin.CGFloat x = x;
    v23->_homeScreenContentFrame.origin.CGFloat y = y;
    v23->_homeScreenContentFrame.size.CGFloat width = width;
    v23->_homeScreenContentFrame.size.CGFloat height = height;
  }

  return v23;
}

- (NSURL)personURL
{
  return self->_personURL;
}

- (BSInvalidatable)sourceIconView
{
  return self->_sourceIconView;
}

- (SBIconView)referenceIconView
{
  return self->_referenceIconView;
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)homeScreenContentView
{
  return self->_homeScreenContentView;
}

- (CGRect)homeScreenContentFrame
{
  double x = self->_homeScreenContentFrame.origin.x;
  double y = self->_homeScreenContentFrame.origin.y;
  double width = self->_homeScreenContentFrame.size.width;
  double height = self->_homeScreenContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenContentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_referenceIconView, 0);
  objc_storeStrong((id *)&self->_sourceIconView, 0);
  objc_storeStrong((id *)&self->_personURL, 0);
}

@end