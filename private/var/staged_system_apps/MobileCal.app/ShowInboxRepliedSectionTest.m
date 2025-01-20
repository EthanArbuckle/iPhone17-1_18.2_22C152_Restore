@interface ShowInboxRepliedSectionTest
- (void)runTest;
@end

@implementation ShowInboxRepliedSectionTest

- (void)runTest
{
  v3 = [(ApplicationTest *)self application];
  v4 = [v3 rootNavigationController];
  id v5 = [v4 resetToYearView];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1000F99F8;
  v16 = sub_1000F9A08;
  id v17 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F9A10;
  v9[3] = &unk_1001D5400;
  v9[4] = self;
  v11 = &v12;
  id v6 = v3;
  id v10 = v6;
  uint64_t v7 = [v4 showInboxAnimated:1 completion:v9];
  v8 = (void *)v13[5];
  v13[5] = v7;

  _Block_object_dispose(&v12, 8);
}

@end