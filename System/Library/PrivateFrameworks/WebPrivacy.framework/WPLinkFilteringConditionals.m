@interface WPLinkFilteringConditionals
- (NSMutableArray)paths;
- (NSMutableSet)domains;
- (WPLinkFilteringConditionals)init;
- (void)setDomains:(id)a3;
- (void)setPaths:(id)a3;
@end

@implementation WPLinkFilteringConditionals

- (WPLinkFilteringConditionals)init
{
  v9.receiver = self;
  v9.super_class = (Class)WPLinkFilteringConditionals;
  v2 = [(WPLinkFilteringConditionals *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    domains = v2->_domains;
    v2->_domains = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    paths = v2->_paths;
    v2->_paths = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (NSMutableSet)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
}

- (NSMutableArray)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);

  objc_storeStrong((id *)&self->_domains, 0);
}

@end