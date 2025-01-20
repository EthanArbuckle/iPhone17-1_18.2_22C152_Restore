@interface DMDConfigurationSourceController
- (CATSerialOperationQueue)queue;
- (DMDConfigurationSourceController)initWithConfigurationSource:(id)a3 delegate:(id)a4;
- (DMDConfigurationSourceControllerDelegate)delegate;
- (DMDConfigurationSourceRepresentation)source;
- (DMFConfigurationSource)configurationSource;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)organizationIdentifier;
- (id)debugDescription;
- (id)description;
- (void)eventsForSourceDidChange:(id)a3;
- (void)reportEvents;
- (void)reportEventsTimeout;
- (void)reportStatus;
- (void)reportStatusTimeout;
- (void)resolveAssetWithContext:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSource:(id)a3;
- (void)statusForSourceDidChange:(id)a3;
- (void)updateStatusChangeListener;
- (void)updateWithConfigurationSource:(id)a3;
@end

@implementation DMDConfigurationSourceController

- (DMDConfigurationSourceController)initWithConfigurationSource:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"DMDConfigurationSourceController.m", 36, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];
  }
  v9 = [v7 identifier];

  if (!v9)
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"DMDConfigurationSourceController.m", 37, @"Invalid parameter not satisfying: %@", @"source.identifier" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)DMDConfigurationSourceController;
  v10 = [(DMDConfigurationSourceController *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 identifier];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
    uint64_t v13 = objc_opt_new();
    queue = v10->_queue;
    v10->_queue = (CATSerialOperationQueue *)v13;

    [(DMDConfigurationSourceController *)v10 updateWithConfigurationSource:v7];
  }

  return v10;
}

- (id)description
{
  v5[0] = @"identifier";
  v5[1] = @"displayName";
  v2 = +[NSArray arrayWithObjects:v5 count:2];
  v3 = DMFObjectDescriptionWithProperties();

  return v3;
}

- (id)debugDescription
{
  v5[0] = @"source";
  v5[1] = @"queue";
  v2 = +[NSArray arrayWithObjects:v5 count:2];
  v3 = DMFObjectDescriptionWithProperties();

  return v3;
}

- (NSString)organizationIdentifier
{
  v2 = [(DMDConfigurationSourceController *)self source];
  v3 = [v2 organizationIdentifier];

  return (NSString *)v3;
}

- (NSString)displayName
{
  v2 = [(DMDConfigurationSourceController *)self source];
  v3 = [v2 displayName];

  return (NSString *)v3;
}

- (void)updateWithConfigurationSource:(id)a3
{
  id v10 = a3;
  v5 = [(DMDConfigurationSourceController *)self identifier];
  v6 = [v10 identifier];
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"DMDConfigurationSourceController.m", 75, @"Invalid parameter not satisfying: %@", @"[self.identifier isEqualToString:source.identifier]" object file lineNumber description];
  }
  id v8 = [[DMDConfigurationSourceRepresentation alloc] initWithConfigurationSource:v10];
  [(DMDConfigurationSourceController *)self setSource:v8];

  [(DMDConfigurationSourceController *)self updateStatusChangeListener];
  [(DMDConfigurationSourceController *)self statusForSourceDidChange:0];
}

- (DMFConfigurationSource)configurationSource
{
  v3 = objc_opt_new();
  v4 = [(DMDConfigurationSourceController *)self source];
  v5 = [v4 identifier];
  [v3 setIdentifier:v5];

  v6 = [(DMDConfigurationSourceController *)self source];
  unsigned __int8 v7 = [v6 displayName];
  [v3 setDisplayName:v7];

  id v8 = [(DMDConfigurationSourceController *)self source];
  v9 = [v8 machServiceName];
  [v3 setMachServiceName:v9];

  id v10 = [(DMDConfigurationSourceController *)self source];
  uint64_t v11 = [v10 reportingRequirements];
  [v3 setReportingRequirements:v11];

  return (DMFConfigurationSource *)v3;
}

- (void)updateStatusChangeListener
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"statusForSourceDidChange:" name:@"DMDConfigurationSourceStatusDidChange" object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"eventsForSourceDidChange:" name:@"DMDConfigurationSourceEventsDidChange" object:0];
}

- (void)statusForSourceDidChange:(id)a3
{
  id v14 = a3;
  if (+[NSThread isMainThread])
  {
    if (v14) {
      [v14 object];
    }
    else {
    id v5 = [(DMDConfigurationSourceController *)self organizationIdentifier];
    }
    v6 = [(DMDConfigurationSourceController *)self organizationIdentifier];
    unsigned int v7 = [v6 isEqualToString:v5];

    if (v7)
    {
      id v8 = [(DMDConfigurationSourceController *)self source];
      v9 = [v8 reportingRequirements];

      double v10 = 10.0;
      double v11 = 3.0;
      if (v9)
      {
        [v9 updateCoalescenceInterval];
        if (v12 > DMFReportingRequirementsUpdateCoalescenceIntervalDefault)
        {
          [v9 updateCoalescenceInterval];
          double v11 = v13;
          double v10 = v13;
        }
      }
      +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"reportStatus" object:0];
      [(DMDConfigurationSourceController *)self performSelector:"reportStatus" withObject:0 afterDelay:v11];
      if (v10 > v11) {
        [(DMDConfigurationSourceController *)self performSelector:"reportStatusTimeout" withObject:0 afterDelay:v10];
      }
    }
  }
  else
  {
    [(DMDConfigurationSourceController *)self performSelectorOnMainThread:a2 withObject:v14 waitUntilDone:0];
  }
}

- (void)reportStatusTimeout
{
}

- (void)reportStatus
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"reportStatusTimeout" object:0];
  v3 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000823B4(self);
  }

  v4 = [(DMDConfigurationSourceTaskOperation *)[DMDConfigurationSourceStatusUpdateOperation alloc] initWithController:self];
  [(DMDConfigurationSourceTaskOperation *)v4 setController:self];
  id v5 = [(DMDConfigurationSourceController *)self queue];
  [v5 addOperation:v4];
}

- (void)eventsForSourceDidChange:(id)a3
{
  id v14 = a3;
  if (+[NSThread isMainThread])
  {
    if (v14) {
      [v14 object];
    }
    else {
    id v5 = [(DMDConfigurationSourceController *)self organizationIdentifier];
    }
    v6 = [(DMDConfigurationSourceController *)self organizationIdentifier];
    unsigned int v7 = [v6 isEqualToString:v5];

    if (v7)
    {
      id v8 = [(DMDConfigurationSourceController *)self source];
      v9 = [v8 reportingRequirements];

      double v10 = 10.0;
      double v11 = 3.0;
      if (v9)
      {
        [v9 updateCoalescenceInterval];
        if (v12 > DMFReportingRequirementsUpdateCoalescenceIntervalDefault)
        {
          [v9 updateCoalescenceInterval];
          double v11 = v13;
          double v10 = v13;
        }
      }
      +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"reportEvents" object:0];
      [(DMDConfigurationSourceController *)self performSelector:"reportEvents" withObject:0 afterDelay:3.0];
      if (v10 > v11) {
        [(DMDConfigurationSourceController *)self performSelector:"reportEventsTimeout" withObject:0 afterDelay:10.0];
      }
    }
  }
  else
  {
    [(DMDConfigurationSourceController *)self performSelectorOnMainThread:a2 withObject:v14 waitUntilDone:0];
  }
}

- (void)reportEventsTimeout
{
}

- (void)reportEvents
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"reportEventsTimeout" object:0];
  v3 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10008243C(self);
  }

  v4 = [(DMDConfigurationSourceTaskOperation *)[DMDConfigurationSourceEventsOperation alloc] initWithController:self];
  [(DMDConfigurationSourceTaskOperation *)v4 setController:self];
  id v5 = [(DMDConfigurationSourceController *)self queue];
  [v5 addOperation:v4];
}

- (void)resolveAssetWithContext:(id)a3
{
  id v4 = a3;
  v6 = [(DMDConfigurationSourceTaskOperation *)[DMDConfigurationSourceAssetResolveOperation alloc] initWithController:self];
  [(DMDConfigurationSourceAssetResolveOperation *)v6 setContext:v4];

  id v5 = [(DMDConfigurationSourceController *)self queue];
  [v5 addOperation:v6];
}

- (DMDConfigurationSourceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DMDConfigurationSourceControllerDelegate *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CATSerialOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (DMDConfigurationSourceRepresentation)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end