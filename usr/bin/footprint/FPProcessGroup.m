@interface FPProcessGroup
- (BOOL)isEqual:(id)a3;
- (NSDictionary)categories;
- (unsigned)categoriesRefcount;
- (void)addProcess:(id)a3;
- (void)setCategories:(id)a3;
- (void)setCategoriesRefcount:(unsigned int)a3;
- (void)setObjects:(id)a3;
@end

@implementation FPProcessGroup

- (BOOL)isEqual:(id)a3
{
  v4 = (FPProcessGroup *)a3;
  if ([(FPProcessGroup *)v4 isMemberOfClass:objc_opt_class()])
  {
    v7.receiver = self;
    v7.super_class = (Class)FPProcessGroup;
    unsigned __int8 v5 = [(FPProcessGroupMinimal *)&v7 isEqual:v4];
  }
  else
  {
    unsigned __int8 v5 = self == v4;
  }

  return v5;
}

- (void)addProcess:(id)a3
{
  id v3 = a3;
  _os_crash();
  __break(1u);
}

- (void)setObjects:(id)a3
{
}

- (NSDictionary)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (unsigned)categoriesRefcount
{
  return self->_categoriesRefcount;
}

- (void)setCategoriesRefcount:(unsigned int)a3
{
  self->_categoriesRefcount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);

  objc_storeStrong((id *)&self->_objects, 0);
}

@end