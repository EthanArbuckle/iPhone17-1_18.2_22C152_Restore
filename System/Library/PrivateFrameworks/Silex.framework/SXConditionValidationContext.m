@interface SXConditionValidationContext
- (BOOL)isBundleSubscriber;
- (BOOL)isBundleTrialEligible;
- (BOOL)isChannelSubscriber;
- (BOOL)testing;
- (CGSize)viewportSize;
- (NSSet)conditionKeys;
- (NSString)contentSizeCategory;
- (SXConditionValidationContext)initWithLayoutOptions:(id)a3;
- (SXLayoutOptions)layoutOptions;
- (double)contentScaleFactor;
- (int64_t)horizontalSizeClass;
- (int64_t)offerUpsellScenario;
- (int64_t)subscriptionActivationEligibility;
- (int64_t)userInterfaceStyle;
- (int64_t)verticalSizeClass;
- (unint64_t)newsletterSubscriptionStatus;
- (unint64_t)numberOfColumns;
- (unint64_t)viewingLocation;
@end

@implementation SXConditionValidationContext

- (SXConditionValidationContext)initWithLayoutOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXConditionValidationContext;
  v6 = [(SXConditionValidationContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_layoutOptions, a3);
  }

  return v7;
}

- (unint64_t)numberOfColumns
{
  v2 = [(SXLayoutOptions *)self->_layoutOptions columnLayout];
  unint64_t v3 = [v2 numberOfColumns];

  return v3;
}

- (NSString)contentSizeCategory
{
  return [(SXLayoutOptions *)self->_layoutOptions contentSizeCategory];
}

- (int64_t)horizontalSizeClass
{
  v2 = [(SXLayoutOptions *)self->_layoutOptions traitCollection];
  int64_t v3 = [v2 horizontalSizeClass];

  return v3;
}

- (int64_t)verticalSizeClass
{
  v2 = [(SXLayoutOptions *)self->_layoutOptions traitCollection];
  int64_t v3 = [v2 verticalSizeClass];

  return v3;
}

- (CGSize)viewportSize
{
  [(SXLayoutOptions *)self->_layoutOptions viewportSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)testing
{
  return [(SXLayoutOptions *)self->_layoutOptions testing];
}

- (unint64_t)viewingLocation
{
  return [(SXLayoutOptions *)self->_layoutOptions viewingLocation];
}

- (BOOL)isBundleSubscriber
{
  return [(SXLayoutOptions *)self->_layoutOptions bundleSubscriptionStatus] == 1;
}

- (BOOL)isBundleTrialEligible
{
  return [(SXLayoutOptions *)self->_layoutOptions bundleSubscriptionStatus] == 3;
}

- (BOOL)isChannelSubscriber
{
  return [(SXLayoutOptions *)self->_layoutOptions channelSubscriptionStatus] == 1;
}

- (int64_t)userInterfaceStyle
{
  double v2 = [(SXLayoutOptions *)self->_layoutOptions traitCollection];
  int64_t v3 = [v2 userInterfaceStyle];

  return v3;
}

- (double)contentScaleFactor
{
  [(SXLayoutOptions *)self->_layoutOptions contentScaleFactor];
  return result;
}

- (unint64_t)newsletterSubscriptionStatus
{
  return [(SXLayoutOptions *)self->_layoutOptions newsletterSubscriptionStatus];
}

- (int64_t)offerUpsellScenario
{
  return [(SXLayoutOptions *)self->_layoutOptions offerUpsellScenario];
}

- (int64_t)subscriptionActivationEligibility
{
  return [(SXLayoutOptions *)self->_layoutOptions subscriptionActivationEligibility];
}

- (NSSet)conditionKeys
{
  return [(SXLayoutOptions *)self->_layoutOptions conditionKeys];
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void).cxx_destruct
{
}

@end