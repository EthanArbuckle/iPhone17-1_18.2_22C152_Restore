@interface TUIHoverIdentifier
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (TUIHoverIdentifier)initWithName:(id)a3;
- (TUIHoverIdentifier)initWithName:(id)a3 identifier:(id)a4;
- (TUIIdentifier)identifier;
- (id)anonymousIdentifier;
- (id)description;
- (unint64_t)hash;
@end

@implementation TUIHoverIdentifier

- (TUIHoverIdentifier)initWithName:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIHoverIdentifier;
  v9 = [(TUIHoverIdentifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

- (TUIHoverIdentifier)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIHoverIdentifier;
  v6 = [(TUIHoverIdentifier *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  name = self->_name;
  v6 = [(TUIIdentifier *)self->_identifier tui_identifierToString];
  id v7 = +[NSString stringWithFormat:@"<%@ name=%@ identifier=%@>", v4, name, v6];

  return v7;
}

- (id)anonymousIdentifier
{
  if (self->_identifier) {
    v2 = self;
  }
  else {
    v2 = [[TUIHoverIdentifier alloc] initWithName:self->_name];
  }

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  id v8 = v7;
  unsigned __int8 v9 = v7 == self;
  if (v7) {
    BOOL v10 = v7 == self;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    name = self->_name;
    if (name == v8->_name || -[NSString isEqualToString:](name, "isEqualToString:"))
    {
      identifier = self->_identifier;
      if (identifier == v8->_identifier) {
        unsigned __int8 v9 = 1;
      }
      else {
        unsigned __int8 v9 = -[TUIIdentifier isEqual:](identifier, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return (unint64_t)[(TUIIdentifier *)self->_identifier hash] ^ v3;
}

- (NSString)name
{
  return self->_name;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end