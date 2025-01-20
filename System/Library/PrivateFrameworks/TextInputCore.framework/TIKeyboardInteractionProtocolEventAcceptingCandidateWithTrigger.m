@interface TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger
+ (BOOL)supportsSecureCoding;
- (NSString)candidateAcceptedTrigger;
- (NSString)description;
- (TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger)initWithCandidateAcceptedTrigger:(id)a3;
- (TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)sendTo:(id)a3;
@end

@implementation TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger

- (void).cxx_destruct
{
}

- (NSString)candidateAcceptedTrigger
{
  return self->_candidateAcceptedTrigger;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<Accepting Candidate With Trigger: %@>", self->_candidateAcceptedTrigger];
}

- (void)sendTo:(id)a3
{
}

- (TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger;
  v5 = [(TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidateAcceptedTrigger"];
    candidateAcceptedTrigger = v5->_candidateAcceptedTrigger;
    v5->_candidateAcceptedTrigger = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger)initWithCandidateAcceptedTrigger:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger;
  uint64_t v6 = [(TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_candidateAcceptedTrigger, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end