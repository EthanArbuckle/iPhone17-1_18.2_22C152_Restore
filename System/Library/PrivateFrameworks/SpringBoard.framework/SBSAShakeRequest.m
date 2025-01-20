@interface SBSAShakeRequest
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SBSAShakeRequest)initWithParticipantIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)participantIdentifier;
- (unint64_t)hash;
@end

@implementation SBSAShakeRequest

- (SBSAShakeRequest)initWithParticipantIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAShakeRequest;
  v5 = [(SBSAShakeRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id participantIdentifier = v5->_participantIdentifier;
    v5->_id participantIdentifier = (id)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id participantIdentifier = self->_participantIdentifier;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __28__SBSAShakeRequest_isEqual___block_invoke;
  v11[3] = &unk_1E6AF9E90;
  id v12 = v4;
  id v7 = v4;
  v8 = [v5 appendObject:participantIdentifier counterpart:v11];
  char v9 = [v8 isEqual];

  return v9;
}

uint64_t __28__SBSAShakeRequest_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) participantIdentifier];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_participantIdentifier];
  unint64_t v5 = [v4 hash];

  return v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; participantIdentifier: %@>",
                       objc_opt_class(),
                       self,
                       self->_participantIdentifier);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id participantIdentifier = self->_participantIdentifier;
  return (id)[v4 initWithParticipantIdentifier:participantIdentifier];
}

- (id)participantIdentifier
{
  return self->_participantIdentifier;
}

- (void).cxx_destruct
{
}

@end