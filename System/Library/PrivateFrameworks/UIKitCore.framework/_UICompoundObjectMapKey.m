@interface _UICompoundObjectMapKey
+ (id)keyWithObject:(id)a3 andProperty:(id)a4;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _UICompoundObjectMapKey

- (unint64_t)hash
{
  id object = self->_object;
  return (unint64_t)object + [(NSString *)self->_property hash];
}

- (BOOL)isEqual:(id)a3
{
  return self->_object == (id)*((void *)a3 + 1)
      && [(NSString *)self->_property isEqualToString:*((void *)a3 + 2)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong(&self->_object, 0);
}

+ (id)keyWithObject:(id)a3 andProperty:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v5;
  id v9 = v5;

  v10 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [MEMORY[0x1E4F4F718] descriptionForObject:self->_object];
  id v5 = [v3 stringWithFormat:@"%@.%@", v4, self->_property];

  return v5;
}

@end