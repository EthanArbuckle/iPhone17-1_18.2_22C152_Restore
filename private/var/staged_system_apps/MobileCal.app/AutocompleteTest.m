@interface AutocompleteTest
- (void)handleDidBeginAutocompleteSearchNotification:(id)a3;
- (void)handleDidShowAutocompleteResultsNotification:(id)a3;
- (void)runTest;
@end

@implementation AutocompleteTest

- (void)runTest
{
  v3 = [(id)objc_opt_class() testName];
  v4 = [(ApplicationTest *)self application];
  v5 = [(ApplicationTest *)self options];
  v6 = [v5 objectForKeyedSubscript:@"testEventName"];

  [v4 rootNavigationController];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10011F410;
  v11[3] = &unk_1001D2EB8;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = self;
  id v14 = v4;
  id v15 = v3;
  id v16 = v6;
  id v7 = v6;
  id v8 = v3;
  id v9 = v4;
  id v10 = v12;
  [v10 showAddEventAnimated:0 completion:v11];
}

- (void)handleDidBeginAutocompleteSearchNotification:(id)a3
{
  id v6 = [(id)objc_opt_class() testName];
  v4 = [(ApplicationTest *)self application];
  [v4 finishedSubTest:@"SearchThrottleDelay" forTest:v6];

  v5 = [(ApplicationTest *)self application];
  [v5 startedSubTest:@"Search" forTest:v6];
}

- (void)handleDidShowAutocompleteResultsNotification:(id)a3
{
  v4 = [(id)objc_opt_class() testName];
  v5 = [(ApplicationTest *)self application];
  [v5 finishedSubTest:@"Search" forTest:v4];

  id v6 = [(ApplicationTest *)self application];
  [v6 startedSubTest:@"CellDisplay" forTest:v4];

  id v7 = [(ApplicationTest *)self application];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10011F68C;
  v9[3] = &unk_1001D28A8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 installCACommitCompletionBlock:v9];
}

@end