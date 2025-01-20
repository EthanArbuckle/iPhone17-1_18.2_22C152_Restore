@interface TUILogicalScrollAnchor
- (TUILogicalScrollAnchor)initWithPosition:(unint64_t)a3 identifier:(id)a4;
- (id)description;
- (id)identifier;
- (unint64_t)position;
@end

@implementation TUILogicalScrollAnchor

- (TUILogicalScrollAnchor)initWithPosition:(unint64_t)a3 identifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TUILogicalScrollAnchor;
  v8 = [(TUILogicalScrollAnchor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_position = a3;
    objc_storeStrong(&v8->_identifier, a4);
  }

  return v9;
}

- (id)description
{
  v3 = [&off_266368 objectAtIndexedSubscript:self->_position];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = +[NSString stringWithFormat:@"<%@ position=%@ identifier=%@>", v5, v3, self->_identifier];

  return v6;
}

- (unint64_t)position
{
  return self->_position;
}

- (id)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end