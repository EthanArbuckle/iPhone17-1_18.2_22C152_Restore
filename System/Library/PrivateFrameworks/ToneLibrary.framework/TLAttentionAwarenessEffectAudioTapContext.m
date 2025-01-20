@interface TLAttentionAwarenessEffectAudioTapContext
- (BOOL)isEqual:(id)a3;
- (NSUUID)identifier;
- (TLAttentionAwarenessEffectAudioTapContext)init;
- (TLAttentionAwarenessEffectCoordinator)effectCoordinator;
- (TLAttentionAwarenessEffectProcessor)effectProcessor;
- (id)description;
- (unint64_t)hash;
- (void)setEffectCoordinator:(id)a3;
- (void)setEffectProcessor:(id)a3;
@end

@implementation TLAttentionAwarenessEffectAudioTapContext

- (TLAttentionAwarenessEffectAudioTapContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)TLAttentionAwarenessEffectAudioTapContext;
  v2 = [(TLAttentionAwarenessEffectAudioTapContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;
  }
  return v2;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TLAttentionAwarenessEffectAudioTapContext *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSUUID *)self->_identifier isEqual:v4->_identifier];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  objc_super v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  v7 = [(NSUUID *)self->_identifier UUIDString];
  [v6 appendFormat:@"; identifier = %@", v7];

  [v6 appendString:@">"];

  return v6;
}

- (TLAttentionAwarenessEffectCoordinator)effectCoordinator
{
  return self->_effectCoordinator;
}

- (void)setEffectCoordinator:(id)a3
{
}

- (TLAttentionAwarenessEffectProcessor)effectProcessor
{
  return self->_effectProcessor;
}

- (void)setEffectProcessor:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_effectProcessor, 0);

  objc_storeStrong((id *)&self->_effectCoordinator, 0);
}

@end