@interface PKPaymentSheetExperiment
- (BOOL)isAA;
- (BOOL)isTaggedForAllowInAppPaymentFailureRetry;
- (BOOL)isTaggedForHideDoubleClickToPay;
- (BOOL)isTaggedForLineItemsInMainPaymentSheet;
- (BOOL)shouldAllowInAppPaymentFailureRetry;
- (BOOL)shouldHideDoubleClickToPay;
- (BOOL)shouldShowLineItemsInMainPaymentSheet;
- (double)timeIntervalToShowDoubleClickToPay;
- (id)namespaceName;
@end

@implementation PKPaymentSheetExperiment

- (id)namespaceName
{
  return @"WALLET_APP_ECOM_PAYMENT_SHEET";
}

- (BOOL)isAA
{
  return [(PKExperiment *)self BOOLeanForFactor:@"AA"];
}

- (BOOL)isTaggedForHideDoubleClickToPay
{
  if (PKExperimentationOverrideEnabled())
  {
    return PKExperimentationOverrideHideDoubleClickToPayEnabled();
  }
  else
  {
    return [(PKExperiment *)self isTaggedForFactor:@"hideDoubleClickToPay"];
  }
}

- (BOOL)shouldHideDoubleClickToPay
{
  if (PKExperimentationOverrideEnabled())
  {
    return PKExperimentationOverrideHideDoubleClickToPayEnabled();
  }
  else
  {
    return [(PKExperiment *)self BOOLeanForFactor:@"hideDoubleClickToPay"];
  }
}

- (double)timeIntervalToShowDoubleClickToPay
{
  if (PKExperimentationOverrideEnabled())
  {
    v3 = PKExperimentationOverrideHideDoubleClickToPaySecondsEnabled();
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    v3 = [(PKExperiment *)self metadataForFactor:@"hideDoubleClickToPay"];
    v6 = [v3 objectForKeyedSubscript:@"showAfterSeconds"];
    [v6 doubleValue];
    double v5 = v7;
  }
  return v5;
}

- (BOOL)isTaggedForAllowInAppPaymentFailureRetry
{
  if (PKExperimentationOverrideEnabled())
  {
    return PKExperimentationOverrideAllowInAppPaymentFailureRetryEnabled();
  }
  else
  {
    return [(PKExperiment *)self isTaggedForFactor:@"allowInAppPaymentFailureRetry"];
  }
}

- (BOOL)shouldAllowInAppPaymentFailureRetry
{
  if (PKExperimentationOverrideEnabled())
  {
    return PKExperimentationOverrideAllowInAppPaymentFailureRetryEnabled();
  }
  else
  {
    return [(PKExperiment *)self BOOLeanForFactor:@"allowInAppPaymentFailureRetry"];
  }
}

- (BOOL)isTaggedForLineItemsInMainPaymentSheet
{
  if (PKExperimentationOverrideEnabled())
  {
    return PKExperimentationOverrideShowLineItemsInMainPaymentSheetEnabled();
  }
  else
  {
    return [(PKExperiment *)self isTaggedForFactor:@"showLineItemsInMainSheet"];
  }
}

- (BOOL)shouldShowLineItemsInMainPaymentSheet
{
  if (PKExperimentationOverrideEnabled())
  {
    return PKExperimentationOverrideShowLineItemsInMainPaymentSheetEnabled();
  }
  else
  {
    return [(PKExperiment *)self BOOLeanForFactor:@"showLineItemsInMainSheet"];
  }
}

@end