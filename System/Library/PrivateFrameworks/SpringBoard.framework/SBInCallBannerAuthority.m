@interface SBInCallBannerAuthority
- (BNConsideringDelegate)delegate;
- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4;
- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5;
- (void)mayChangeDecisionForResponsiblePresentable:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBInCallBannerAuthority

- (void)mayChangeDecisionForResponsiblePresentable:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained bannerAuthority:self mayChangeDecisionForResponsiblePresentable:v5];
}

- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  id v6 = a4;
  v7 = +[SBInCallBannerPresentableViewController requesterIdentifier];
  v8 = [v6 lastObject];

  if (a5) {
    *a5 = v8;
  }
  v9 = [v8 requesterIdentifier];
  int v10 = [v9 isEqualToString:v7];

  if (v10)
  {
    if (objc_opt_respondsToSelector()) {
      int64_t v11 = [v8 isCallConnected] - 1;
    }
    else {
      int64_t v11 = -1;
    }
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[SBInCallBannerPresentableViewController requesterIdentifier];
  v8 = [v6 requesterIdentifier];

  if ([v8 isEqualToString:v7])
  {
    int64_t v9 = -1;
  }
  else
  {
    int v10 = [v5 requesterIdentifier];
    int64_t v9 = [v10 isEqualToString:v7] << 63 >> 63;
  }
  return v9;
}

- (BNConsideringDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BNConsideringDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end