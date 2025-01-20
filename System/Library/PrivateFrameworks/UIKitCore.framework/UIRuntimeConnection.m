@interface UIRuntimeConnection
- (NSString)label;
- (UIRuntimeConnection)initWithCoder:(id)a3;
- (id)destination;
- (id)source;
- (void)encodeWithCoder:(id)a3;
- (void)setDestination:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation UIRuntimeConnection

- (id)destination
{
  return self->_destination;
}

- (id)source
{
  return self->_source;
}

- (NSString)label
{
  return self->_label;
}

- (UIRuntimeConnection)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UIRuntimeConnection *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UILabel"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"UISource"];
    id source = v5->_source;
    v5->_id source = (id)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"UIDestination"];
    id destination = v5->_destination;
    v5->_id destination = (id)v10;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_destination, 0);
  objc_storeStrong(&self->_source, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  label = self->_label;
  id v8 = v4;
  if (label)
  {
    [v4 encodeObject:label forKey:@"UILabel"];
    id v4 = v8;
  }
  id source = self->_source;
  if (source)
  {
    [v8 encodeObject:source forKey:@"UISource"];
    id v4 = v8;
  }
  id destination = self->_destination;
  if (destination)
  {
    [v8 encodeObject:destination forKey:@"UIDestination"];
    id v4 = v8;
  }
}

- (void)setSource:(id)a3
{
}

- (void)setDestination:(id)a3
{
}

- (void)setLabel:(id)a3
{
}

@end