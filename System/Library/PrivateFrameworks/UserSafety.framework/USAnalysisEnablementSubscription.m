@interface USAnalysisEnablementSubscription
- (USAnalysisEnablementSubscription)initWithObserver:(id)a3;
- (void)cancel;
@end

@implementation USAnalysisEnablementSubscription

- (USAnalysisEnablementSubscription)initWithObserver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)USAnalysisEnablementSubscription;
  v6 = [(USAnalysisEnablementSubscription *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_analysisAvailabilityObserver, a3);
  }

  return v7;
}

- (void)cancel
{
}

- (void).cxx_destruct
{
}

@end