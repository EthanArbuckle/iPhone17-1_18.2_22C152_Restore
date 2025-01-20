@interface UIAlertController
+ (id)crl_alertControllerWithError:(id)a3;
+ (id)crl_alertControllerWithError:(id)a3 preferredStyle:(int64_t)a4 additionalActions:(id)a5 usesOKButton:(BOOL)a6 completion:(id)a7;
+ (id)crl_alertControllerWithError:(id)a3 preferredStyle:(int64_t)a4 completion:(id)a5;
+ (id)crl_progressAlertControllerWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5 progress:(id)a6;
- (NSArray)crl_actions;
- (UIViewController)crl_contentViewController;
- (void)crl_addSimpleOKButtonWithHandler:(id)a3;
- (void)crl_dismissWithAction:(id)a3;
- (void)crl_setActions:(id)a3;
- (void)crl_setContentViewController:(id)a3;
- (void)p_didPresentErrorWithRecovery:(BOOL)a3 contextInfo:(void *)a4;
@end

@implementation UIAlertController

- (NSArray)crl_actions
{
  return [(UIAlertController *)self actions];
}

- (void)crl_setActions:(id)a3
{
}

- (UIViewController)crl_contentViewController
{
  return (UIViewController *)[(UIAlertController *)self contentViewController];
}

- (void)crl_setContentViewController:(id)a3
{
}

- (void)crl_dismissWithAction:(id)a3
{
}

+ (id)crl_alertControllerWithError:(id)a3
{
  return [a1 crl_alertControllerWithError:a3 preferredStyle:1 completion:0];
}

+ (id)crl_alertControllerWithError:(id)a3 preferredStyle:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 localizedRecoveryOptions];
  BOOL v11 = [v10 count] == 0;

  v12 = [a1 crl_alertControllerWithError:v9 preferredStyle:a4 additionalActions:0 usesOKButton:v11 completion:v8];

  return v12;
}

+ (id)crl_alertControllerWithError:(id)a3 preferredStyle:(int64_t)a4 additionalActions:(id)a5 usesOKButton:(BOOL)a6 completion:(id)a7
{
  BOOL v46 = a6;
  id v11 = a3;
  id v43 = a5;
  id v50 = a7;
  v12 = [v11 crl_localizedAlertTitle];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    [v11 localizedDescription:v43];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v15 = v14;

  v16 = [v11 crl_localizedAlertMessage];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [v11 localizedFailureReason];
  }
  id v19 = v18;

  v47 = v15;
  int64_t v44 = a4;
  v45 = v19;
  v20 = [a1 alertControllerWithTitle:v15 message:v19 preferredStyle:a4];
  [v20 crl_updateWithInternalTimestampAndError:v11];
  v49 = [v11 recoveryAttempter];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v51 = v11;
  id obj = [v11 localizedRecoveryOptions];
  id v21 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = 0;
    uint64_t v24 = *(void *)v64;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v64 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_100096FC4;
        v58[3] = &unk_1014D1268;
        v58[4] = v49;
        id v27 = v51;
        v62 = (char *)i + v23;
        id v59 = v27;
        v60 = v20;
        id v61 = v50;
        v28 = +[UIAlertAction actionWithTitle:v26 style:0 handler:v58];
        [v20 addAction:v28];
      }
      id v22 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
      v23 += (uint64_t)i;
    }
    while (v22);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v29 = v43;
  id v30 = [v29 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v55;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v55 != v32) {
          objc_enumerationMutation(v29);
        }
        [v20 addAction:*(void *)(*((void *)&v54 + 1) + 8 * (void)j) v43];
      }
      id v31 = [v29 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v31);
  }

  BOOL v34 = v44 == 1 && v46;
  v35 = +[NSBundle mainBundle];
  v36 = v35;
  if (v46) {
    CFStringRef v37 = @"OK";
  }
  else {
    CFStringRef v37 = @"Cancel";
  }
  v38 = [v35 localizedStringForKey:v37 value:0 table:0];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100097034;
  v52[3] = &unk_1014D1290;
  id v53 = v50;
  id v39 = v50;
  v40 = +[UIAlertAction actionWithTitle:v38 style:!v34 handler:v52];

  [v20 addAction:v40];
  if (v46) {
    [v20 setPreferredAction:v40];
  }
  id v41 = v20;

  return v41;
}

- (void)p_didPresentErrorWithRecovery:(BOOL)a3 contextInfo:(void *)a4
{
  byte_1016A8F94 = a3;
}

- (void)crl_addSimpleOKButtonWithHandler:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"OK" value:0 table:0];
  id v7 = +[UIAlertAction actionWithTitle:v6 style:1 handler:v4];

  [(UIAlertController *)self addAction:v7];
}

+ (id)crl_progressAlertControllerWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5 progress:(id)a6
{
  id v8 = a4;
  if (a3)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;
    if (v8)
    {
LABEL_3:
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v8 = v13;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_6:
  id v14 = a6;
  id v15 = sub_100644038(v9, v11, v12, (uint64_t)v8, a5, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v15;
}

@end