@interface SBSAPulseRequest
- (BOOL)isEqual:(id)a3;
- (NSCopying)participantIdentifier;
- (NSString)description;
- (SBSAPulseRequest)initWithParticipantIdentifier:(id)a3 pulseStyle:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)pulseStyle;
- (unint64_t)hash;
@end

@implementation SBSAPulseRequest

- (SBSAPulseRequest)initWithParticipantIdentifier:(id)a3 pulseStyle:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSAPulseRequest;
  v7 = [(SBSAPulseRequest *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    participantIdentifier = v7->_participantIdentifier;
    v7->_participantIdentifier = (NSCopying *)v8;

    v7->_pulseStyle = a4;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t pulseStyle = self->_pulseStyle;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __28__SBSAPulseRequest_isEqual___block_invoke;
  v19[3] = &unk_1E6AF9660;
  id v7 = v4;
  id v20 = v7;
  uint64_t v8 = [v5 appendInteger:pulseStyle counterpart:v19];
  participantIdentifier = self->_participantIdentifier;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __28__SBSAPulseRequest_isEqual___block_invoke_2;
  v17 = &unk_1E6AF9E90;
  id v18 = v7;
  id v10 = v7;
  objc_super v11 = [v8 appendObject:participantIdentifier counterpart:&v14];
  char v12 = objc_msgSend(v11, "isEqual", v14, v15, v16, v17);

  return v12;
}

uint64_t __28__SBSAPulseRequest_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pulseStyle];
}

uint64_t __28__SBSAPulseRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) participantIdentifier];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendInteger:self->_pulseStyle];
  v5 = [v4 appendObject:self->_participantIdentifier];
  unint64_t v6 = [v5 hash];

  return v6;
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
  participantIdentifier = self->_participantIdentifier;
  return (id)[v4 initWithParticipantIdentifier:participantIdentifier];
}

- (NSCopying)participantIdentifier
{
  return self->_participantIdentifier;
}

- (int64_t)pulseStyle
{
  return self->_pulseStyle;
}

- (void).cxx_destruct
{
}

@end