@interface SXBookmarkActionActivityProvider
- (id)activityGroupForAction:(id)a3;
- (id)initWithBookmarkManager:(id *)a1;
@end

@implementation SXBookmarkActionActivityProvider

- (id)initWithBookmarkManager:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)SXBookmarkActionActivityProvider;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (id)activityGroupForAction:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [[SXActionActivityGroup alloc] initWithTitle:0];
    v6 = [SXBlockActionActivity alloc];
    objc_super v7 = SXBundle();
    v8 = [v7 localizedStringForKey:@"Open" value:&stru_26D5311C0 table:0];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __59__SXBookmarkActionActivityProvider_activityGroupForAction___block_invoke;
    v14 = &unk_2646512B0;
    v15 = self;
    id v16 = v4;
    v9 = [(SXBlockActionActivity *)v6 initWithLabel:v8 type:0 block:&v11];
    -[SXActionActivityGroup addActivity:](v5, "addActivity:", v9, v11, v12, v13, v14, v15);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __59__SXBookmarkActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[1];
  }
  v2 = *(void **)(a1 + 40);
  v3 = v1;
  id v4 = [v2 bookmark];
  [v3 applyBookmark:v4];
}

- (void).cxx_destruct
{
}

@end