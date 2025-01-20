@interface _NAUINamedViewConstraints
- (NSArray)constraints;
- (NSString)name;
- (_NAUINamedViewConstraints)initWithName:(id)a3 constraints:(id)a4 stalenessToken:(id)a5;
- (id)stalenessToken;
@end

@implementation _NAUINamedViewConstraints

- (_NAUINamedViewConstraints)initWithName:(id)a3 constraints:(id)a4 stalenessToken:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_NAUINamedViewConstraints;
  v12 = [(_NAUINamedViewConstraints *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_constraints, a4);
    if (v11)
    {
      id v14 = v11;
    }
    else
    {
      id v14 = [MEMORY[0x263EFF9D0] null];
    }
    id stalenessToken = v13->_stalenessToken;
    v13->_id stalenessToken = v14;
  }
  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (id)stalenessToken
{
  return self->_stalenessToken;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stalenessToken, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end