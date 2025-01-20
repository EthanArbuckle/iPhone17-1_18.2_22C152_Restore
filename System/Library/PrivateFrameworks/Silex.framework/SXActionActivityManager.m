@interface SXActionActivityManager
- (NSMutableDictionary)activityProviders;
- (SXActionActivityManager)init;
- (id)activityGroupForAction:(id)a3;
- (id)activityGroupForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
- (id)activityProviderForAction:(id)a3;
- (id)previewActivityForAction:(id)a3;
- (id)previewActivityForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
- (void)registerActionActivityProvider:(id)a3 actionType:(id)a4;
@end

@implementation SXActionActivityManager

- (SXActionActivityManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXActionActivityManager;
  v2 = [(SXActionActivityManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    activityProviders = v2->_activityProviders;
    v2->_activityProviders = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)registerActionActivityProvider:(id)a3 actionType:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(SXActionActivityManager *)self activityProviders];
    [v8 setObject:v7 forKey:v6];
  }
}

- (id)activityGroupForAction:(id)a3
{
  return -[SXActionActivityManager activityGroupForAction:sourceView:sourceRect:](self, "activityGroupForAction:sourceView:sourceRect:", a3, 0, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
}

- (id)activityGroupForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  id v12 = a3;
  v13 = [(SXActionActivityManager *)self activityProviderForAction:v12];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v13, "activityGroupForAction:sourceView:sourceRect:", v12, v11, x, y, width, height);
  }
  else {
  v14 = [v13 activityGroupForAction:v12];
  }

  return v14;
}

- (id)previewActivityForAction:(id)a3
{
  return -[SXActionActivityManager previewActivityForAction:sourceView:sourceRect:](self, "previewActivityForAction:sourceView:sourceRect:", a3, 0, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
}

- (id)previewActivityForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  v13 = [(SXActionActivityManager *)self activityProviderForAction:v11];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = objc_msgSend(v13, "previewActivityForAction:sourceView:sourceRect:", v11, v12, x, y, width, height);
LABEL_5:
    v15 = (void *)v14;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = [v13 previewActivityForAction:v11];
    goto LABEL_5;
  }
  v15 = 0;
LABEL_7:

  return v15;
}

- (id)activityProviderForAction:(id)a3
{
  uint64_t v5 = [a3 type];
  id v6 = (void *)v5;
  id v7 = 0;
  if (a3 && v5)
  {
    id v8 = [(SXActionActivityManager *)self activityProviders];
    id v7 = [v8 objectForKey:v6];
  }
  return v7;
}

- (NSMutableDictionary)activityProviders
{
  return self->_activityProviders;
}

- (void).cxx_destruct
{
}

@end