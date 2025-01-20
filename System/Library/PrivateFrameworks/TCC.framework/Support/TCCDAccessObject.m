@interface TCCDAccessObject
- (TCCDAccessIndirectObject)indirectObject;
- (TCCDAccessObject)initWithService:(id)a3 indirectObject:(id)a4;
- (TCCDService)serviceObject;
- (id)description;
- (void)setIndirectObject:(id)a3;
- (void)setServiceObject:(id)a3;
@end

@implementation TCCDAccessObject

- (TCCDAccessObject)initWithService:(id)a3 indirectObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TCCDAccessObject;
  v8 = [(TCCDAccessObject *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(TCCDAccessObject *)v8 setServiceObject:v6];
    [(TCCDAccessObject *)v9 setIndirectObject:v7];
  }

  return v9;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v4 = [(TCCDAccessObject *)self serviceObject];
  v5 = [v4 name];
  [v3 appendFormat:@"S:%@", v5];

  id v6 = [(TCCDAccessObject *)self indirectObject];
  id v7 = +[TCCDAccessIndirectObject unusedIndirectObject];

  if (v6 != v7)
  {
    v8 = [(TCCDAccessObject *)self indirectObject];
    v9 = [v8 description];
    [v3 appendFormat:@", IO:%@", v9];
  }
  id v10 = [v3 copy];

  return v10;
}

- (TCCDService)serviceObject
{
  return (TCCDService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceObject:(id)a3
{
}

- (TCCDAccessIndirectObject)indirectObject
{
  return (TCCDAccessIndirectObject *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIndirectObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indirectObject, 0);
  objc_storeStrong((id *)&self->_serviceObject, 0);
}

@end