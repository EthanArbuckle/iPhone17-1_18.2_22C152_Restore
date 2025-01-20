@interface SXWebContentComponentSizer
- (SWLoadingPolicyProvider)loadingPolicyProvider;
- (SXWebContentComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 loadingPolicyProvider:(id)a8;
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
@end

@implementation SXWebContentComponentSizer

- (SXWebContentComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 loadingPolicyProvider:(id)a8
{
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)SXWebContentComponentSizer;
  v16 = [(SXComponentSizer *)&v19 initWithComponent:a3 componentLayout:a4 componentStyle:a5 DOMObjectProvider:a6 layoutOptions:a7];
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_loadingPolicyProvider, a8);
  }

  return v17;
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  id v5 = a4;
  v6 = [(SXWebContentComponentSizer *)self loadingPolicyProvider];
  uint64_t v7 = [v6 loadingPolicy];

  double v8 = 0.0;
  if (v7 != 2)
  {
    [(SXComponentSizer *)self suggestedSize];
    if (v9 == 0.0)
    {
      v10 = [(SXComponentSizer *)self componentLayout];
      [v10 suggestedHeight];
      uint64_t v12 = v11;

      if (v12)
      {
        v13 = [v5 unitConverter];
        v14 = [(SXComponentSizer *)self componentLayout];
        uint64_t v15 = [v14 suggestedHeight];
        objc_msgSend(v13, "convertValueToPoints:", v15, v16);
        double v18 = v17;

        if (v18 >= 20.0) {
          double v19 = v18;
        }
        else {
          double v19 = 20.0;
        }
        v20 = [v5 unitConverter];
        objc_msgSend(v20, "convertValueToPoints:", 0x4059000000000000, 2);
        double v8 = v21;

        if (v19 < v8) {
          double v8 = v19;
        }
      }
      else
      {
        double v8 = 300.0;
      }
    }
    else
    {
      [(SXComponentSizer *)self suggestedSize];
      double v8 = v22;
    }
  }

  return v8;
}

- (SWLoadingPolicyProvider)loadingPolicyProvider
{
  return self->_loadingPolicyProvider;
}

- (void).cxx_destruct
{
}

@end