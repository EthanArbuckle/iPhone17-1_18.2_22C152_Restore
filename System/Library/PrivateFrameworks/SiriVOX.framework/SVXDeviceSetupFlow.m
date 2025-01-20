@interface SVXDeviceSetupFlow
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)scenes;
- (NSString)identifier;
- (SVXDeviceSetupFlow)initWithCoder:(id)a3;
- (SVXDeviceSetupFlow)initWithIdentifier:(id)a3 scenes:(id)a4;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXDeviceSetupFlow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenes, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)scenes
{
  return self->_scenes;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"SVXDeviceSetupFlow::identifier"];
  [v5 encodeObject:self->_scenes forKey:@"SVXDeviceSetupFlow::scenes"];
}

- (SVXDeviceSetupFlow)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupFlow::identifier"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"SVXDeviceSetupFlow::scenes"];

  v10 = [(SVXDeviceSetupFlow *)self initWithIdentifier:v5 scenes:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXDeviceSetupFlow *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(SVXDeviceSetupFlow *)v5 identifier];
      identifier = self->_identifier;
      if (identifier == v6 || [(NSString *)identifier isEqual:v6])
      {
        v8 = [(SVXDeviceSetupFlow *)v5 scenes];
        scenes = self->_scenes;
        BOOL v10 = scenes == v8 || [(NSArray *)scenes isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSArray *)self->_scenes hash] ^ v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SVXDeviceSetupFlow;
  id v5 = [(SVXDeviceSetupFlow *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {identifier = %@, scenes = %@}", v5, self->_identifier, self->_scenes];

  return v6;
}

- (id)description
{
  return [(SVXDeviceSetupFlow *)self _descriptionWithIndent:0];
}

- (SVXDeviceSetupFlow)initWithIdentifier:(id)a3 scenes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SVXDeviceSetupFlow;
  objc_super v8 = [(SVXDeviceSetupFlow *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    scenes = v8->_scenes;
    v8->_scenes = (NSArray *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXDeviceSetupFlowMutation *))a3;
  if (v4)
  {
    id v5 = [[_SVXDeviceSetupFlowMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    id v6 = [(_SVXDeviceSetupFlowMutation *)v5 generate];
  }
  else
  {
    id v6 = (void *)[(SVXDeviceSetupFlow *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  NSUInteger v3 = (void (**)(id, _SVXDeviceSetupFlowMutation *))a3;
  id v4 = objc_alloc_init(_SVXDeviceSetupFlowMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  id v5 = [(_SVXDeviceSetupFlowMutation *)v4 generate];

  return v5;
}

@end