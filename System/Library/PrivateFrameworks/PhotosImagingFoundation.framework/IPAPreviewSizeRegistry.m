@interface IPAPreviewSizeRegistry
- (IPAPreviewSizeRegistry)init;
- (IPAPreviewSizeRegistry)initWithName:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)policyForStyle:(unint64_t)a3;
- (id)policyForStyleObject:(id)a3;
- (void)addPolicy:(id)a3;
@end

@implementation IPAPreviewSizeRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@:%p> %@", objc_opt_class(), self, self->_policies];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NSMutableDictionary *)self->_policies allValues];
  v6 = [v5 valueForKey:@"name"];
  v7 = [v3 stringWithFormat:@"<%@:%p> %@", v4, self, v6];

  return v7;
}

- (id)policyForStyleObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_policies objectForKeyedSubscript:v4];
  if (v5)
  {
    v6 = (void *)v5;

    return v6;
  }
  else
  {
    v8 = (IPAPreviewSizeRegistry *)_PFAssertFailHandler();
    return [(IPAPreviewSizeRegistry *)v8 policyForStyle:v10];
  }
}

- (id)policyForStyle:(unint64_t)a3
{
  policies = self->_policies;
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:");
  uint64_t v5 = [(NSMutableDictionary *)policies objectForKeyedSubscript:v4];

  if (v5)
  {
    return v5;
  }
  else
  {
    v7 = (IPAPreviewSizeRegistry *)_PFAssertFailHandler();
    [(IPAPreviewSizeRegistry *)v7 addPolicy:v9];
  }
  return result;
}

- (void)addPolicy:(id)a3
{
  policies = self->_policies;
  id v4 = a3;
  id v5 = [v4 style];
  [(NSMutableDictionary *)policies setObject:v4 forKeyedSubscript:v5];
}

- (IPAPreviewSizeRegistry)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPAPreviewSizeRegistry;
  v6 = [(IPAPreviewSizeRegistry *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    SEL v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    policies = v7->_policies;
    v7->_policies = v8;
  }
  return v7;
}

- (IPAPreviewSizeRegistry)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"%@ not supported for %@: use initWithName:", v5, objc_opt_class() format];

  return 0;
}

@end