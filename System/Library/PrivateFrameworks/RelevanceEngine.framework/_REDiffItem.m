@interface _REDiffItem
+ (id)itemWithObject:(id)a3 index:(unint64_t)a4 comparator:(id)a5 hashGenerator:(id)a6;
- (BOOL)isEqual:(id)a3;
- (id)comparator;
- (id)hashGenerator;
- (id)object;
- (unint64_t)hash;
- (unint64_t)index;
@end

@implementation _REDiffItem

+ (id)itemWithObject:(id)a3 index:(unint64_t)a4 comparator:(id)a5 hashGenerator:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  v12 = objc_alloc_init(_REDiffItem);
  id object = v12->_object;
  v12->_id object = v9;
  id v14 = v9;

  v12->_index = a4;
  uint64_t v15 = MEMORY[0x223C31700](v11);

  id comparator = v12->_comparator;
  v12->_id comparator = (id)v15;

  uint64_t v17 = MEMORY[0x223C31700](v10);
  id hashGenerator = v12->_hashGenerator;
  v12->_id hashGenerator = (id)v17;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REDiffItem *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(_REDiffItem *)v4 object];
      char v6 = (*((uint64_t (**)(void))self->_comparator + 2))();
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return (*((uint64_t (**)(id, id))self->_hashGenerator + 2))(self->_hashGenerator, self->_object);
}

- (id)object
{
  return self->_object;
}

- (unint64_t)index
{
  return self->_index;
}

- (id)comparator
{
  return self->_comparator;
}

- (id)hashGenerator
{
  return self->_hashGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hashGenerator, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong(&self->_object, 0);
}

@end