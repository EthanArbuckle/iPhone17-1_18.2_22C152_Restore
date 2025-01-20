@interface SCDAAdvertisementContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)contextData;
- (SCDAAdvertisementContext)init;
- (SCDAAdvertisementContext)initWithBuilder:(id)a3;
- (SCDAAdvertisementContext)initWithCoder:(id)a3;
- (SCDAAdvertisementContext)initWithGeneration:(unint64_t)a3 contextData:(id)a4 contextFetchDelay:(double)a5;
- (double)contextFetchDelay;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)generation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCDAAdvertisementContext

- (void).cxx_destruct
{
}

- (double)contextFetchDelay
{
  return self->_contextFetchDelay;
}

- (NSData)contextData
{
  return self->_contextData;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t generation = self->_generation;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedLongLong:generation];
  [v6 encodeObject:v7 forKey:@"SCDAAdvertisementContext::generation"];

  [v6 encodeObject:self->_contextData forKey:@"SCDAAdvertisementContext::contextData"];
  id v8 = [NSNumber numberWithDouble:self->_contextFetchDelay];
  [v6 encodeObject:v8 forKey:@"SCDAAdvertisementContext::contextFetchDelay"];
}

- (SCDAAdvertisementContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAAdvertisementContext::generation"];
  uint64_t v6 = [v5 unsignedLongLongValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAAdvertisementContext::contextData"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SCDAAdvertisementContext::contextFetchDelay"];

  [v8 doubleValue];
  double v10 = v9;

  v11 = [(SCDAAdvertisementContext *)self initWithGeneration:v6 contextData:v7 contextFetchDelay:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SCDAAdvertisementContext *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t generation = self->_generation;
      if (generation == [(SCDAAdvertisementContext *)v5 generation]
        && (double contextFetchDelay = self->_contextFetchDelay,
            [(SCDAAdvertisementContext *)v5 contextFetchDelay],
            contextFetchDelay == v8))
      {
        v11 = [(SCDAAdvertisementContext *)v5 contextData];
        contextData = self->_contextData;
        BOOL v9 = contextData == v11 || [(NSData *)contextData isEqual:v11];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedLongLong:self->_generation];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(NSData *)self->_contextData hash] ^ v4;
  uint64_t v6 = [NSNumber numberWithDouble:self->_contextFetchDelay];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SCDAAdvertisementContext;
  uint64_t v5 = [(SCDAAdvertisementContext *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {unint64_t generation = %llu, contextData = (%llu bytes), contextFetchDelay = %f}", v5, self->_generation, -[NSData length](self->_contextData, "length"), *(void *)&self->_contextFetchDelay];

  return v6;
}

- (id)description
{
  return [(SCDAAdvertisementContext *)self _descriptionWithIndent:0];
}

- (SCDAAdvertisementContext)initWithGeneration:(unint64_t)a3 contextData:(id)a4 contextFetchDelay:(double)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__SCDAAdvertisementContext_initWithGeneration_contextData_contextFetchDelay___block_invoke;
  v12[3] = &unk_2654B7810;
  id v13 = v8;
  unint64_t v14 = a3;
  double v15 = a5;
  id v9 = v8;
  double v10 = [(SCDAAdvertisementContext *)self initWithBuilder:v12];

  return v10;
}

void __77__SCDAAdvertisementContext_initWithGeneration_contextData_contextFetchDelay___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setGeneration:v3];
  [v4 setContextData:*(void *)(a1 + 32)];
  [v4 setContextFetchDelay:*(double *)(a1 + 48)];
}

- (SCDAAdvertisementContext)init
{
  return [(SCDAAdvertisementContext *)self initWithBuilder:0];
}

- (SCDAAdvertisementContext)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SCDAAdvertisementContextMutation *))a3;
  v13.receiver = self;
  v13.super_class = (Class)SCDAAdvertisementContext;
  uint64_t v5 = [(SCDAAdvertisementContext *)&v13 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_SCDAAdvertisementContextMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SCDAAdvertisementContextMutation *)v7 isDirty])
    {
      v6->_unint64_t generation = [(_SCDAAdvertisementContextMutation *)v7 getGeneration];
      id v8 = [(_SCDAAdvertisementContextMutation *)v7 getContextData];
      uint64_t v9 = [v8 copy];
      contextData = v6->_contextData;
      v6->_contextData = (NSData *)v9;

      [(_SCDAAdvertisementContextMutation *)v7 getContextFetchDelay];
      v6->_double contextFetchDelay = v11;
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
  id v4 = (void (**)(id, _SCDAAdvertisementContextMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_SCDAAdvertisementContextMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SCDAAdvertisementContextMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(SCDAAdvertisementContext);
      v6->_unint64_t generation = [(_SCDAAdvertisementContextMutation *)v5 getGeneration];
      unint64_t v7 = [(_SCDAAdvertisementContextMutation *)v5 getContextData];
      uint64_t v8 = [v7 copy];
      contextData = v6->_contextData;
      v6->_contextData = (NSData *)v8;

      [(_SCDAAdvertisementContextMutation *)v5 getContextFetchDelay];
      v6->_double contextFetchDelay = v10;
    }
    else
    {
      uint64_t v6 = (SCDAAdvertisementContext *)[(SCDAAdvertisementContext *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (SCDAAdvertisementContext *)[(SCDAAdvertisementContext *)self copy];
  }

  return v6;
}

@end