@interface SCDAPerceptualAudioHash
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (SCDAPerceptualAudioHash)init;
- (SCDAPerceptualAudioHash)initWithBuilder:(id)a3;
- (SCDAPerceptualAudioHash)initWithCoder:(id)a3;
- (SCDAPerceptualAudioHash)initWithData:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCDAPerceptualAudioHash

- (void).cxx_destruct
{
}

- (NSData)data
{
  return self->_data;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SCDAPerceptualAudioHash)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAPerceptualAudioHash::data"];

  v6 = [(SCDAPerceptualAudioHash *)self initWithData:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SCDAPerceptualAudioHash *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(SCDAPerceptualAudioHash *)v4 data];
      data = self->_data;
      BOOL v7 = data == v5 || [(NSData *)data isEqual:v5];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSData *)self->_data hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SCDAPerceptualAudioHash;
  v5 = [(SCDAPerceptualAudioHash *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {data = (%llu bytes)}", v5, -[NSData length](self->_data, "length")];

  return v6;
}

- (id)description
{
  return [(SCDAPerceptualAudioHash *)self _descriptionWithIndent:0];
}

- (SCDAPerceptualAudioHash)initWithData:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__SCDAPerceptualAudioHash_initWithData___block_invoke;
  v8[3] = &unk_2654B75D0;
  id v9 = v4;
  id v5 = v4;
  v6 = [(SCDAPerceptualAudioHash *)self initWithBuilder:v8];

  return v6;
}

uint64_t __40__SCDAPerceptualAudioHash_initWithData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setData:*(void *)(a1 + 32)];
}

- (SCDAPerceptualAudioHash)init
{
  return [(SCDAPerceptualAudioHash *)self initWithBuilder:0];
}

- (SCDAPerceptualAudioHash)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SCDAPerceptualAudioHashMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)SCDAPerceptualAudioHash;
  id v5 = [(SCDAPerceptualAudioHash *)&v12 init];
  v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = [[_SCDAPerceptualAudioHashMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SCDAPerceptualAudioHashMutation *)v7 isDirty])
    {
      objc_super v8 = [(_SCDAPerceptualAudioHashMutation *)v7 getData];
      uint64_t v9 = [v8 copy];
      data = v6->_data;
      v6->_data = (NSData *)v9;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SCDAPerceptualAudioHashMutation *))a3;
  if (v4)
  {
    id v5 = [[_SCDAPerceptualAudioHashMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SCDAPerceptualAudioHashMutation *)v5 isDirty])
    {
      v6 = objc_alloc_init(SCDAPerceptualAudioHash);
      BOOL v7 = [(_SCDAPerceptualAudioHashMutation *)v5 getData];
      uint64_t v8 = [v7 copy];
      data = v6->_data;
      v6->_data = (NSData *)v8;
    }
    else
    {
      v6 = (SCDAPerceptualAudioHash *)[(SCDAPerceptualAudioHash *)self copy];
    }
  }
  else
  {
    v6 = (SCDAPerceptualAudioHash *)[(SCDAPerceptualAudioHash *)self copy];
  }

  return v6;
}

@end