@interface SXCloseActionActivityProvider
- (id)activityGroupForAction:(id)a3;
- (id)initWithViewControllerPresenting:(void *)a3 handler:;
@end

@implementation SXCloseActionActivityProvider

- (id)initWithViewControllerPresenting:(void *)a3 handler:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SXCloseActionActivityProvider;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (id)activityGroupForAction:(id)a3
{
  v4 = [[SXActionActivityGroup alloc] initWithTitle:0];
  v5 = [SXBlockActionActivity alloc];
  id v6 = SXBundle();
  id v7 = [v6 localizedStringForKey:@"Close" value:&stru_26D5311C0 table:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__SXCloseActionActivityProvider_activityGroupForAction___block_invoke;
  v10[3] = &unk_264651B28;
  v10[4] = self;
  v8 = [(SXBlockActionActivity *)v5 initWithLabel:v7 type:0 block:v10];
  [(SXActionActivityGroup *)v4 addActivity:v8];

  return v4;
}

void __56__SXCloseActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[2];
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  v4 = v1;
  [v4 handleCloseActionOnPresenter:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_viewControllerPresenting, 0);
}

@end