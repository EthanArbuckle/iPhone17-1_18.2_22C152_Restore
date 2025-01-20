@interface MTResultsChangeWrapper
- (BOOL)isEqual:(id)a3;
- (MTResultsChangeWrapper)initWithObject:(id)a3;
- (NSCopying)object;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setObject:(id)a3;
@end

@implementation MTResultsChangeWrapper

- (MTResultsChangeWrapper)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTResultsChangeWrapper;
  v5 = [(MTResultsChangeWrapper *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MTResultsChangeWrapper *)v5 setObject:v4];
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MTResultsChangeWrapper alloc];
  v5 = [(MTResultsChangeWrapper *)self object];
  v6 = [(MTResultsChangeWrapper *)v4 initWithObject:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(MTResultsChangeWrapper *)self object];
    v7 = [v5 object];

    unsigned __int8 v8 = [v6 isEqual:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(MTResultsChangeWrapper *)self object];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSCopying)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end