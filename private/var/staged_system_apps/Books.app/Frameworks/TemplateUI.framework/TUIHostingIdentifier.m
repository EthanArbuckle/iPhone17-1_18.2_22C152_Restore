@interface TUIHostingIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToType:(id)a3 identifier:(id)a4 parameters:(id)a5 modelIdentifier:(id)a6;
- (NSObject)parameters;
- (NSString)identifier;
- (NSString)type;
- (TUIHostingIdentifier)identifierWithoutModelIdentifier;
- (TUIHostingIdentifier)initWithType:(id)a3 identifier:(id)a4;
- (TUIHostingIdentifier)initWithType:(id)a3 identifier:(id)a4 parameters:(id)a5 modelIdentifier:(id)a6;
- (TUIIdentifier)modelIdentifier;
- (id)description;
- (unint64_t)hash;
@end

@implementation TUIHostingIdentifier

- (TUIHostingIdentifier)initWithType:(id)a3 identifier:(id)a4
{
  return [(TUIHostingIdentifier *)self initWithType:a3 identifier:a4 parameters:0 modelIdentifier:0];
}

- (TUIHostingIdentifier)initWithType:(id)a3 identifier:(id)a4 parameters:(id)a5 modelIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TUIHostingIdentifier;
  v15 = [(TUIHostingIdentifier *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_type, a3);
    objc_storeStrong((id *)&v16->_identifier, a4);
    objc_storeStrong((id *)&v16->_parameters, a5);
    objc_storeStrong((id *)&v16->_modelIdentifier, a6);
  }

  return v16;
}

- (TUIHostingIdentifier)identifierWithoutModelIdentifier
{
  if (self->_modelIdentifier) {
    v2 = [[TUIHostingIdentifier alloc] initWithType:self->_type identifier:self->_identifier parameters:self->_parameters modelIdentifier:0];
  }
  else {
    v2 = self;
  }

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    type = self->_type;
    if ((type == (NSString *)v7[1] || -[NSString isEqualToString:](type, "isEqualToString:"))
      && ((identifier = self->_identifier, identifier == (NSString *)v7[2])
       || -[NSString isEqualToString:](identifier, "isEqualToString:"))
      && ((parameters = self->_parameters, parameters == v7[4])
       || -[NSObject isEqual:](parameters, "isEqual:")))
    {
      modelIdentifier = self->_modelIdentifier;
      if (modelIdentifier == (TUIIdentifier *)v7[3]) {
        unsigned __int8 v6 = 1;
      }
      else {
        unsigned __int8 v6 = -[TUIIdentifier isEqual:](modelIdentifier, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToType:(id)a3 identifier:(id)a4 parameters:(id)a5 modelIdentifier:(id)a6
{
  v10 = (NSString *)a3;
  id v11 = (NSString *)a4;
  id v12 = a5;
  id v13 = (TUIIdentifier *)a6;
  type = self->_type;
  if ((type == v10 || [(NSString *)type isEqualToString:v10])
    && ((identifier = self->_identifier, identifier == v11)
     || [(NSString *)identifier isEqualToString:v11])
    && ((parameters = self->_parameters, parameters == v12)
     || [parameters isEqual:v12]))
  {
    modelIdentifier = self->_modelIdentifier;
    if (modelIdentifier == v13) {
      unsigned __int8 v18 = 1;
    }
    else {
      unsigned __int8 v18 = [(TUIIdentifier *)modelIdentifier isEqual:v13];
    }
  }
  else
  {
    unsigned __int8 v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_type hash];
  return [(NSString *)self->_identifier hash] ^ v3;
}

- (id)description
{
  NSUInteger v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  type = self->_type;
  identifier = self->_identifier;
  v7 = [(TUIIdentifier *)self->_modelIdentifier tui_identifierToString];
  v8 = +[NSString stringWithFormat:@"<%@ type='%@' identifier='%@' modelIdentifier='%@'>", v4, type, identifier, v7];

  return v8;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (TUIIdentifier)modelIdentifier
{
  return self->_modelIdentifier;
}

- (NSObject)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end