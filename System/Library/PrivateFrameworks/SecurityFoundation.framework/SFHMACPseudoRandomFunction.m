@interface SFHMACPseudoRandomFunction
+ (BOOL)supportsSecureCoding;
- (SFDigestOperation)digestOperation;
- (SFHMACPseudoRandomFunction)init;
- (SFHMACPseudoRandomFunction)initWithCoder:(id)a3;
- (SFHMACPseudoRandomFunction)initWithDigestOperation:(id)a3;
- (id)generateBytesWithLength:(int64_t)a3 key:(id)a4 error:(id)a5;
- (void)setDigestOperation:(id)a3;
@end

@implementation SFHMACPseudoRandomFunction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFHMACPseudoRandomFunction)init
{
  v3 = objc_alloc_init(_SFSHA256DigestOperation);
  v4 = [(SFHMACPseudoRandomFunction *)self initWithDigestOperation:v3];

  return v4;
}

- (SFHMACPseudoRandomFunction)initWithDigestOperation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFHMACPseudoRandomFunction;
  v6 = [(SFHMACPseudoRandomFunction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)v6->_hmacPseudoRandomFunctionInternal + 1, a3);
  }

  return v7;
}

- (SFHMACPseudoRandomFunction)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFHMACPseudoRandomFunction;
  return [(SFHMACPseudoRandomFunction *)&v4 init];
}

- (id)generateBytesWithLength:(int64_t)a3 key:(id)a4 error:(id)a5
{
  return 0;
}

- (SFDigestOperation)digestOperation
{
  v2 = (void *)[*((id *)self->_hmacPseudoRandomFunctionInternal + 1) copyWithZone:0];
  return (SFDigestOperation *)v2;
}

- (void)setDigestOperation:(id)a3
{
  *((void *)self->_hmacPseudoRandomFunctionInternal + 1) = [a3 copyWithZone:0];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end