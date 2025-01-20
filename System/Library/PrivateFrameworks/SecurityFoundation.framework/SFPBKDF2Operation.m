@interface SFPBKDF2Operation
+ (BOOL)supportsSecureCoding;
+ (id)_randomSalt;
+ (int64_t)keySource;
- (NSData)salt;
- (SFPBKDF2Operation)init;
- (SFPBKDF2Operation)initWithCoder:(id)a3;
- (SFPBKDF2Operation)initWithPseudoRandomFunction:(id)a3 iterationCount:(int64_t)a4 salt:(id)a5;
- (SFPseudoRandomFunction)pseudoRandomFunction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deriveKeyWithSpecifier:(id)a3 fromKeySource:(id)a4 error:(id *)a5;
- (int64_t)iterationCount;
- (void)setIterationCount:(int64_t)a3;
- (void)setPseudoRandomFunction:(id)a3;
- (void)setSalt:(id)a3;
@end

@implementation SFPBKDF2Operation

+ (int64_t)keySource
{
  return 0;
}

+ (id)_randomSalt
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPBKDF2Operation)init
{
  v3 = _defaultPseudoRandomFunction();
  v4 = [(id)objc_opt_class() _randomSalt];
  v5 = [(SFPBKDF2Operation *)self initWithPseudoRandomFunction:v3 iterationCount:20 salt:v4];

  return v5;
}

- (SFPBKDF2Operation)initWithPseudoRandomFunction:(id)a3 iterationCount:(int64_t)a4 salt:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SFPBKDF2Operation;
  v11 = [(SFPBKDF2Operation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)v11->_pbkdf2OperationInternal + 2, a3);
    *((void *)v12->_pbkdf2OperationInternal + 1) = a4;
    objc_storeStrong((id *)v12->_pbkdf2OperationInternal + 3, a5);
  }

  return v12;
}

- (SFPBKDF2Operation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFPBKDF2Operation;
  return [(SFPBKDF2Operation *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  pbkdf2OperationInternal = self->_pbkdf2OperationInternal;
  uint64_t v7 = pbkdf2OperationInternal[1];
  uint64_t v6 = pbkdf2OperationInternal[2];
  uint64_t v8 = pbkdf2OperationInternal[3];
  return (id)[v4 initWithPseudoRandomFunction:v6 iterationCount:v7 salt:v8];
}

- (id)deriveKeyWithSpecifier:(id)a3 fromKeySource:(id)a4 error:(id *)a5
{
  return 0;
}

- (int64_t)iterationCount
{
  return *((void *)self->_pbkdf2OperationInternal + 1);
}

- (void)setIterationCount:(int64_t)a3
{
  *((void *)self->_pbkdf2OperationInternal + 1) = a3;
}

- (SFPseudoRandomFunction)pseudoRandomFunction
{
  v2 = (void *)[*((id *)self->_pbkdf2OperationInternal + 2) copyWithZone:0];
  return (SFPseudoRandomFunction *)v2;
}

- (void)setPseudoRandomFunction:(id)a3
{
  *((void *)self->_pbkdf2OperationInternal + 2) = [a3 copyWithZone:0];
  MEMORY[0x1F41817F8]();
}

- (NSData)salt
{
  v2 = (void *)[*((id *)self->_pbkdf2OperationInternal + 3) copy];
  return (NSData *)v2;
}

- (void)setSalt:(id)a3
{
  *((void *)self->_pbkdf2OperationInternal + 3) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end