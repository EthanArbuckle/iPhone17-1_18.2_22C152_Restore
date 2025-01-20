@interface TICandidatesOfferedEvent
+ (BOOL)supportsSecureCoding;
- (TIAutocorrectionList)candidates;
- (TICandidatesOfferedEvent)initWithCandidates:(id)a3 keyboardState:(id)a4;
- (TICandidatesOfferedEvent)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TICandidatesOfferedEvent

- (void).cxx_destruct
{
}

- (TIAutocorrectionList)candidates
{
  return self->_candidates;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TICandidatesOfferedEvent;
  id v4 = a3;
  [(TIUserAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidates, @"candidates", v5.receiver, v5.super_class);
}

- (TICandidatesOfferedEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TICandidatesOfferedEvent;
  objc_super v5 = [(TIUserAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidates"];
    candidates = v5->_candidates;
    v5->_candidates = (TIAutocorrectionList *)v6;

    [(TIUserAction *)v5 setActionType:5];
  }

  return v5;
}

- (TICandidatesOfferedEvent)initWithCandidates:(id)a3 keyboardState:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TICandidatesOfferedEvent;
  v8 = [(TIUserAction *)&v11 initWithTIKeyboardState:a4];
  objc_super v9 = v8;
  if (v8)
  {
    [(TIUserAction *)v8 setActionType:5];
    objc_storeStrong((id *)&v9->_candidates, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end