@interface REElementBlockAction
- (BOOL)isEqual:(id)a3;
- (REElementBlockAction)initWithAction:(id)a3;
- (id)action;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_performWithContext:(id)a3;
@end

@implementation REElementBlockAction

- (REElementBlockAction)initWithAction:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REElementBlockAction;
  v5 = [(REElementBlockAction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id action = v5->_action;
    v5->_id action = (id)v6;
  }
  return v5;
}

- (void)_performWithContext:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)REElementBlockAction;
  id v4 = [(REElementBlockAction *)&v8 copy];
  uint64_t v5 = [self->_action copy];
  uint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (unint64_t)hash
{
  return [self->_action hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[3] == self->_action;

  return v5;
}

- (id)action
{
  return self->_action;
}

- (void).cxx_destruct
{
}

@end