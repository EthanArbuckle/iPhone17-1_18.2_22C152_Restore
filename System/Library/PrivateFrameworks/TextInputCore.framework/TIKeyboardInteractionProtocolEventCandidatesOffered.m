@interface TIKeyboardInteractionProtocolEventCandidatesOffered
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (TIAutocorrectionList)candidates;
- (TIKeyboardInteractionProtocolEventCandidatesOffered)initWithCandidatesOffered:(id)a3 keyboardState:(id)a4;
- (TIKeyboardInteractionProtocolEventCandidatesOffered)initWithCoder:(id)a3;
- (void)adjustSourceMaskForCandidate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)sendTo:(id)a3;
@end

@implementation TIKeyboardInteractionProtocolEventCandidatesOffered

- (void).cxx_destruct
{
}

- (TIAutocorrectionList)candidates
{
  return self->_candidates;
}

- (NSString)description
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = [(TIAutocorrectionList *)self->_candidates corrections];
  uint64_t v5 = [v4 autocorrection];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(TIAutocorrectionList *)self->_candidates corrections];
    v8 = [v7 autocorrection];
    v9 = [v8 candidate];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      v11 = [(TIAutocorrectionList *)self->_candidates corrections];
      v12 = [v11 autocorrection];
      v13 = [v12 candidate];
      [v3 appendString:v13];

      [v3 appendString:@": "];
    }
  }
  else
  {
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v14 = [(TIAutocorrectionList *)self->_candidates predictions];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v22 + 1) + 8 * i) candidate];
        [v3 appendString:v19];

        [v3 appendString:@" "];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  v20 = [NSString stringWithFormat:@"<Candidates Offered: %@>", v3];

  return (NSString *)v20;
}

- (void)sendTo:(id)a3
{
  candidates = self->_candidates;
  id v5 = a3;
  id v6 = [(TIKeyboardInteractionProtocolBase *)self keyboardState];
  [v5 candidatesOffered:candidates keyboardState:v6];
}

- (void)adjustSourceMaskForCandidate:(id)a3
{
  id v10 = a3;
  int v3 = [v10 usageTrackingMask];
  unsigned int v4 = [v10 sourceMask];
  if ((v3 & 0x40000) != 0) {
    int v5 = 0x20000;
  }
  else {
    int v5 = 0x8000;
  }
  unsigned int v6 = v5 | v4 & 0xFFFFFFFE;
  if ((v3 & 0x40000) != 0) {
    int v7 = 0x40000;
  }
  else {
    int v7 = 0x10000;
  }
  if ((v4 & 1) == 0) {
    unsigned int v6 = v4;
  }
  unsigned int v8 = v6 & 0xFFFFFFFD | v7;
  if ((v6 & 2) != 0) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v6;
  }
  [v10 setSourceMask:v9];
}

- (TIKeyboardInteractionProtocolEventCandidatesOffered)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardInteractionProtocolEventCandidatesOffered;
  int v5 = [(TIKeyboardInteractionProtocolBase *)&v20 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidates"];
    candidates = v5->_candidates;
    v5->_candidates = (TIAutocorrectionList *)v6;
  }
  unsigned int v8 = [(TIAutocorrectionList *)v5->_candidates corrections];
  uint64_t v9 = [v8 autocorrection];
  [(TIKeyboardInteractionProtocolEventCandidatesOffered *)v5 adjustSourceMaskForCandidate:v9];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = [(TIAutocorrectionList *)v5->_candidates predictions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        [(TIKeyboardInteractionProtocolEventCandidatesOffered *)v5 adjustSourceMaskForCandidate:*(void *)(*((void *)&v16 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInteractionProtocolEventCandidatesOffered;
  id v4 = a3;
  [(TIKeyboardInteractionProtocolBase *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidates, @"candidates", v5.receiver, v5.super_class);
}

- (TIKeyboardInteractionProtocolEventCandidatesOffered)initWithCandidatesOffered:(id)a3 keyboardState:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInteractionProtocolEventCandidatesOffered;
  unsigned int v8 = [(TIKeyboardInteractionProtocolBase *)&v11 initWithKeyboardState:a4];
  uint64_t v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_candidates, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end