@interface SASActivationCondition
- (AFPreferences)preferences;
- (BOOL)buttonTriggerStateActive;
- (NSDictionary)analyticsContext;
- (NSString)uiPresentationIdentifier;
- (SASActivationRequest)request;
- (SASSiriPocketStateManager)pocketStateManager;
- (SASSystemState)systemState;
- (UAFAssetUtilities)assetUtilities;
- (int64_t)presentationIdentifier;
- (int64_t)requestState;
- (void)setAnalyticsContext:(id)a3;
- (void)setAssetUtilities:(id)a3;
- (void)setButtonTriggerStateActive:(BOOL)a3;
- (void)setPocketStateManager:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setPresentationIdentifier:(int64_t)a3;
- (void)setRequest:(id)a3;
- (void)setRequestState:(int64_t)a3;
- (void)setSystemState:(id)a3;
- (void)setUiPresentationIdentifier:(id)a3;
@end

@implementation SASActivationCondition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUtilities, 0);
  objc_storeStrong((id *)&self->_analyticsContext, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setSystemState:(id)a3
{
}

- (void)setRequestState:(int64_t)a3
{
  self->_requestState = a3;
}

- (void)setRequest:(id)a3
{
}

- (void)setPresentationIdentifier:(int64_t)a3
{
  self->_presentationIdentifier = a3;
}

- (void)setPreferences:(id)a3
{
}

- (void)setPocketStateManager:(id)a3
{
}

- (void)setButtonTriggerStateActive:(BOOL)a3
{
  self->_buttonTriggerStateActive = a3;
}

- (void)setAssetUtilities:(id)a3
{
}

- (NSString)uiPresentationIdentifier
{
  return self->_uiPresentationIdentifier;
}

- (SASSystemState)systemState
{
  return self->_systemState;
}

- (SASActivationRequest)request
{
  return self->_request;
}

- (int64_t)requestState
{
  return self->_requestState;
}

- (AFPreferences)preferences
{
  return self->_preferences;
}

- (SASSiriPocketStateManager)pocketStateManager
{
  return self->_pocketStateManager;
}

- (BOOL)buttonTriggerStateActive
{
  return self->_buttonTriggerStateActive;
}

- (UAFAssetUtilities)assetUtilities
{
  return self->_assetUtilities;
}

- (NSDictionary)analyticsContext
{
  return self->_analyticsContext;
}

- (void)setAnalyticsContext:(id)a3
{
}

- (int64_t)presentationIdentifier
{
  return self->_presentationIdentifier;
}

- (void)setUiPresentationIdentifier:(id)a3
{
  self->_uiPresentationIdentifier = (NSString *)a3;
}

@end