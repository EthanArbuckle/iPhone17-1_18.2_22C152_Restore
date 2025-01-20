@interface SBSATimerDescription
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)timerDescriptionIdentifier;
- (SBSATimerDescription)initWithTimeInterval:(double)a3;
- (double)timeInterval;
- (id)_equalsBuilder:(id)a3;
- (id)_hashBuilder;
- (id)_initWithIdentifier:(id)a3 timeInterval:(double)a4;
- (id)_mutableDescriptionMissingClosingAngleBracket;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation SBSATimerDescription

- (SBSATimerDescription)initWithTimeInterval:(double)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F29128]);
  v6 = [(SBSATimerDescription *)self _initWithIdentifier:v5 timeInterval:a3];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v3 = [(SBSATimerDescription *)self _equalsBuilder:a3];
  char v4 = [v3 isEqual];

  return v4;
}

- (unint64_t)hash
{
  v2 = [(SBSATimerDescription *)self _hashBuilder];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  v2 = [(SBSATimerDescription *)self _mutableDescriptionMissingClosingAngleBracket];
  [v2 appendString:@">"];
  return (NSString *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  timerDescriptionIdentifier = self->_timerDescriptionIdentifier;
  double timeInterval = self->_timeInterval;
  return (id)[v4 _initWithIdentifier:timerDescriptionIdentifier timeInterval:timeInterval];
}

- (id)_initWithIdentifier:(id)a3 timeInterval:(double)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBSATimerDescription.m", 53, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SBSATimerDescription;
  v9 = [(SBSATimerDescription *)&v13 init];
  v10 = (double *)v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timerDescriptionIdentifier, a3);
    v10[2] = a4;
  }

  return v10;
}

- (id)_equalsBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  timerDescriptionIdentifier = self->_timerDescriptionIdentifier;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__SBSATimerDescription__equalsBuilder___block_invoke;
  v15[3] = &unk_1E6AF9E90;
  id v7 = v4;
  id v16 = v7;
  id v8 = [v5 appendObject:timerDescriptionIdentifier counterpart:v15];
  double timeInterval = self->_timeInterval;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__SBSATimerDescription__equalsBuilder___block_invoke_2;
  v13[3] = &unk_1E6AFD028;
  id v14 = v7;
  id v10 = v7;
  v11 = [v8 appendDouble:v13 counterpart:timeInterval];

  return v11;
}

uint64_t __39__SBSATimerDescription__equalsBuilder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) timerDescriptionIdentifier];
}

uint64_t __39__SBSATimerDescription__equalsBuilder___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) timeInterval];
}

- (id)_hashBuilder
{
  unint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_timerDescriptionIdentifier];
  id v5 = [v4 appendDouble:self->_timeInterval];

  return v5;
}

- (id)_mutableDescriptionMissingClosingAngleBracket
{
  return (id)objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p; timerDescriptionIdentifier: %@; timeInterval: %f>",
               objc_opt_class(),
               self,
               self->_timerDescriptionIdentifier,
               *(void *)&self->_timeInterval);
}

- (NSUUID)timerDescriptionIdentifier
{
  return self->_timerDescriptionIdentifier;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void).cxx_destruct
{
}

@end