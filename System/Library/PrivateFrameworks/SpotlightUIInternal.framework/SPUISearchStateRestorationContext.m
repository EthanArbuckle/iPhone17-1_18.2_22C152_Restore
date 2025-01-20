@interface SPUISearchStateRestorationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)wantsGo;
- (NSArray)viewControllerContexts;
- (SPUIResultsViewStateRestorationContext)searchViewContext;
- (SPUISearchStateRestorationContext)initWithCoder:(id)a3;
- (double)timeAtDismissal;
- (void)encodeWithCoder:(id)a3;
- (void)setSearchViewContext:(id)a3;
- (void)setTimeAtDismissal:(double)a3;
- (void)setViewControllerContexts:(id)a3;
- (void)setWantsGo:(BOOL)a3;
@end

@implementation SPUISearchStateRestorationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPUISearchStateRestorationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SPUISearchStateRestorationContext;
  v5 = [(SPUISearchStateRestorationContext *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"viewControllerContexts"];
    viewControllerContexts = v5->_viewControllerContexts;
    v5->_viewControllerContexts = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchViewContext"];
    searchViewContext = v5->_searchViewContext;
    v5->_searchViewContext = (SPUIResultsViewStateRestorationContext *)v12;

    [v4 decodeDoubleForKey:@"timeAtDismissal"];
    v5->_timeAtDismissal = v14;
    v5->_wantsGo = [v4 decodeBoolForKey:@"wantsGo"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  viewControllerContexts = self->_viewControllerContexts;
  id v5 = a3;
  [v5 encodeObject:viewControllerContexts forKey:@"viewControllerContexts"];
  [v5 encodeObject:self->_searchViewContext forKey:@"searchViewContext"];
  [v5 encodeDouble:@"timeAtDismissal" forKey:self->_timeAtDismissal];
  [v5 encodeBool:self->_wantsGo forKey:@"wantsGo"];
}

- (SPUIResultsViewStateRestorationContext)searchViewContext
{
  return (SPUIResultsViewStateRestorationContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSearchViewContext:(id)a3
{
}

- (double)timeAtDismissal
{
  return self->_timeAtDismissal;
}

- (void)setTimeAtDismissal:(double)a3
{
  self->_timeAtDismissal = a3;
}

- (NSArray)viewControllerContexts
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setViewControllerContexts:(id)a3
{
}

- (BOOL)wantsGo
{
  return self->_wantsGo;
}

- (void)setWantsGo:(BOOL)a3
{
  self->_wantsGo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerContexts, 0);
  objc_storeStrong((id *)&self->_searchViewContext, 0);
}

@end