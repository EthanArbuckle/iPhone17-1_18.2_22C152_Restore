@interface UISplitViewController
- (BOOL)shouldSnapshot;
- (void)mf_setColumn:(int64_t)a3 visible:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
@end

@implementation UISplitViewController

- (void)mf_setColumn:(int64_t)a3 visible:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  v11 = v10;
  if (v6)
  {
    if (v7) {
      [(UISplitViewController *)self showColumn:a3];
    }
    else {
      [(UISplitViewController *)self hideColumn:a3];
    }
    v13 = [(UISplitViewController *)self transitionCoordinator];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100225A88;
    v21[3] = &unk_100606330;
    v14 = v11;
    v22 = v14;
    unsigned __int8 v15 = [v13 animateAlongsideTransition:&stru_10060E238 completion:v21];

    if (v14) {
      char v16 = v15;
    }
    else {
      char v16 = 1;
    }
    if ((v16 & 1) == 0) {
      v14[2](v14, 1);
    }
    v12 = v22;
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000577F4;
    v17[3] = &unk_10060E260;
    BOOL v20 = v7;
    v17[4] = self;
    int64_t v19 = a3;
    v18 = (void (**)(id, uint64_t))v10;
    +[UIView performWithoutAnimation:v17];
    v12 = v18;
  }
}

- (BOOL)shouldSnapshot
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(UISplitViewController *)self viewControllers];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    int v5 = 1;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v5 &= [*(id *)(*((void *)&v8 + 1) + 8 * i) shouldSnapshot];
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

@end