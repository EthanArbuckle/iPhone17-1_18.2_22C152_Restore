@interface SXBookmarkManager
- (NSMutableDictionary)applicators;
- (SXBookmarkManager)init;
- (void)applyBookmark:(id)a3;
- (void)registerApplicator:(id)a3 bookmarkType:(Class)a4;
@end

@implementation SXBookmarkManager

- (SXBookmarkManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXBookmarkManager;
  v2 = [(SXBookmarkManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    applicators = v2->_applicators;
    v2->_applicators = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)registerApplicator:(id)a3 bookmarkType:(Class)a4
{
  if (a3 && a4)
  {
    id v6 = a3;
    id v8 = [(SXBookmarkManager *)self applicators];
    v7 = NSStringFromClass(a4);
    [v8 setObject:v6 forKey:v7];
  }
}

- (void)applyBookmark:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(SXBookmarkManager *)self applicators];
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = [v5 objectForKey:v7];

    [v8 applyBookmark:v4];
  }
}

- (NSMutableDictionary)applicators
{
  return self->_applicators;
}

- (void).cxx_destruct
{
}

@end