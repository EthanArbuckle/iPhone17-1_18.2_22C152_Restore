@interface ArrayHash
- (ArrayHash)initWithArray:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)array;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation ArrayHash

- (ArrayHash)initWithArray:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ArrayHash;
  v4 = [(ArrayHash *)&v6 init];
  if (v4) {
    v4->_array = (NSArray *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ArrayHash;
  [(ArrayHash *)&v3 dealloc];
}

- (unint64_t)hash
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  array = self->_array;
  id v3 = [(NSArray *)array countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(array);
      }
      v5 += (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * i) hash];
    }
    id v4 = [(NSArray *)array countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  v7 = [(ArrayHash *)self array];
  id v8 = [a3 array];

  return [(NSArray *)v7 isEqual:v8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(NSArray *)self->_array copyWithZone:a3];
  return v5;
}

- (NSArray)array
{
  return self->_array;
}

@end