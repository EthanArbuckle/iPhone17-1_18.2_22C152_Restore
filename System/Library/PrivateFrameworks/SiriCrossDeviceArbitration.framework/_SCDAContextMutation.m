@interface _SCDAContextMutation
- (BOOL)isDirty;
- (_SCDAContextMutation)initWithBase:(id)a3;
- (id)getOverrideState;
- (id)getPerceptualAudioHash;
- (int64_t)getActivationSource;
- (unint64_t)getActivationExpirationTime;
- (unint64_t)getTimestamp;
- (void)setActivationExpirationTime:(unint64_t)a3;
- (void)setActivationSource:(int64_t)a3;
- (void)setOverrideState:(id)a3;
- (void)setPerceptualAudioHash:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation _SCDAContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideState, 0);
  objc_storeStrong((id *)&self->_perceptualAudioHash, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setActivationExpirationTime:(unint64_t)a3
{
  self->_activationExpirationTime = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (unint64_t)getActivationExpirationTime
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0) {
    return self->_activationExpirationTime;
  }
  else {
    return [(SCDAContext *)self->_base activationExpirationTime];
  }
}

- (void)setActivationSource:(int64_t)a3
{
  self->_activationSource = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (int64_t)getActivationSource
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
    return self->_activationSource;
  }
  else {
    return [(SCDAContext *)self->_base activationSource];
  }
}

- (void)setOverrideState:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getOverrideState
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_overrideState;
  }
  else
  {
    v2 = [(SCDAContext *)self->_base overrideState];
  }
  return v2;
}

- (void)setPerceptualAudioHash:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getPerceptualAudioHash
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_perceptualAudioHash;
  }
  else
  {
    v2 = [(SCDAContext *)self->_base perceptualAudioHash];
  }
  return v2;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getTimestamp
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_timestamp;
  }
  else {
    return [(SCDAContext *)self->_base timestamp];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_SCDAContextMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SCDAContextMutation;
  v6 = [(_SCDAContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end