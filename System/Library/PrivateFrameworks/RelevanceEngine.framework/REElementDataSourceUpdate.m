@interface REElementDataSourceUpdate
+ (id)insertElement:(id)a3 inSection:(id)a4;
+ (id)refreshElement:(id)a3 inSection:(id)a4;
+ (id)reloadElement:(id)a3 inSection:(id)a4;
+ (id)removeElement:(id)a3 inSection:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)section;
- (REElement)element;
- (REElementDataSourceUpdate)initWithElement:(id)a3 section:(id)a4 updateType:(unint64_t)a5;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation REElementDataSourceUpdate

- (REElementDataSourceUpdate)initWithElement:(id)a3 section:(id)a4 updateType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REElementDataSourceUpdate;
  v11 = [(REElementDataSourceUpdate *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_element, a3);
    objc_storeStrong((id *)&v12->_section, a4);
    v12->_type = a5;
  }

  return v12;
}

+ (id)reloadElement:(id)a3 inSection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithElement:v6 section:v5 updateType:0];

  return v7;
}

+ (id)insertElement:(id)a3 inSection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithElement:v6 section:v5 updateType:2];

  return v7;
}

+ (id)removeElement:(id)a3 inSection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithElement:v6 section:v5 updateType:1];

  return v7;
}

+ (id)refreshElement:(id)a3 inSection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithElement:v6 section:v5 updateType:4];

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(REElement *)self->_element hash];
  NSUInteger v4 = [(NSString *)self->_section hash] ^ v3;
  id v5 = [NSNumber numberWithUnsignedInteger:self->_type];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(REElement *)self->_element isEqual:v5[1]]
      && [(NSString *)self->_section isEqualToString:v5[3]]
      && self->_type == v5[2];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (REElement)element
{
  return self->_element;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)section
{
  return self->_section;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end