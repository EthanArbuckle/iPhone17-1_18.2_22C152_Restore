@interface TUICursorAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (TUICursorAccessory)init;
- (TUICursorAccessory)initWithCoder:(id)a3;
- (TUICursorAccessory)initWithIdentifier:(id)a3 actionHandler:(id)a4;
- (id)actionHandler;
- (id)additionalComponents;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionHandler:(id)a3;
@end

@implementation TUICursorAccessory

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setActionHandler:(id)a3
{
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  v2 = [(TUICursorAccessory *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)TUICursorAccessory;
  unint64_t v3 = [(TUICursorAccessory *)&v8 description];
  v4 = [(TUICursorAccessory *)self additionalComponents];
  if ([v4 count])
  {
    v5 = [v4 componentsJoinedByString:@", "];
    uint64_t v6 = [v3 stringByAppendingFormat:@" %@", v5];

    unint64_t v3 = (void *)v6;
  }

  return v3;
}

- (id)additionalComponents
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = NSString;
  v5 = [(TUICursorAccessory *)self identifier];
  uint64_t v6 = [v4 stringWithFormat:@"identifier = %@", v5];
  [v3 addObject:v6];

  v7 = [(TUICursorAccessory *)self actionHandler];

  if (v7)
  {
    objc_super v8 = NSString;
    v9 = [(TUICursorAccessory *)self actionHandler];
    v10 = _Block_copy(v9);
    v11 = [v8 stringWithFormat:@"actionHandler = %@", v10];
    [v3 addObject:v11];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TUICursorAccessory *)a3;
  v5 = v4;
  if (v4) {
    BOOL v6 = self == v4 || [(NSString *)self->_identifier isEqualToString:v4->_identifier];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(TUICursorAccessory *)self identifier];
  [v4 encodeObject:v5 forKey:@"TUIndentifierCodingKey"];
}

- (TUICursorAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUICursorAccessory;
  id v5 = [(TUICursorAccessory *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TUIndentifierCodingKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (TUICursorAccessory)initWithIdentifier:(id)a3 actionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TUICursorAccessory;
  objc_super v8 = [(TUICursorAccessory *)&v15 init];
  if (v8)
  {
    if (v6)
    {
      uint64_t v9 = [v6 copy];
      identifier = v8->_identifier;
      v8->_identifier = (NSString *)v9;
    }
    else
    {
      v11 = NSString;
      identifier = [MEMORY[0x1E4F29128] UUID];
      uint64_t v12 = [v11 stringWithFormat:@"com.apple.action.cursoraccessory.%@", identifier];
      v13 = v8->_identifier;
      v8->_identifier = (NSString *)v12;
    }
    [(TUICursorAccessory *)v8 setActionHandler:v7];
  }

  return v8;
}

- (TUICursorAccessory)init
{
  return [(TUICursorAccessory *)self initWithIdentifier:0 actionHandler:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end