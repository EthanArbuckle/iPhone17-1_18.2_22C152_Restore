@interface TICorrectionCandidates
+ (BOOL)supportsSecureCoding;
- (BOOL)autocorrectionBlocked;
- (NSArray)alternateCorrections;
- (TICorrectionCandidates)initWithAutocorrection:(id)a3 alternateCorrections:(id)a4;
- (TICorrectionCandidates)initWithAutocorrection:(id)a3 alternateCorrections:(id)a4 autocorrectionBlocked:(BOOL)a5;
- (TICorrectionCandidates)initWithCoder:(id)a3;
- (TIKeyboardCandidate)autocorrection;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TICorrectionCandidates

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateCorrections, 0);

  objc_storeStrong((id *)&self->_autocorrection, 0);
}

- (BOOL)autocorrectionBlocked
{
  return self->_autocorrectionBlocked;
}

- (NSArray)alternateCorrections
{
  return self->_alternateCorrections;
}

- (TIKeyboardCandidate)autocorrection
{
  return self->_autocorrection;
}

- (id)description
{
  v2 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p autocorrection=%@ alternate=%@", objc_opt_class(), self, self->_autocorrection, self->_alternateCorrections];
  [v2 appendFormat:@">"];

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  autocorrection = self->_autocorrection;
  id v7 = v4;
  if (autocorrection)
  {
    [v4 encodeObject:autocorrection forKey:@"autocorrection"];
    id v4 = v7;
  }
  alternateCorrections = self->_alternateCorrections;
  if (alternateCorrections)
  {
    [v7 encodeObject:alternateCorrections forKey:@"alternateCorrections"];
    id v4 = v7;
  }
}

- (TICorrectionCandidates)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TICorrectionCandidates;
  v5 = [(TICorrectionCandidates *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autocorrection"];
    autocorrection = v5->_autocorrection;
    v5->_autocorrection = (TIKeyboardCandidate *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"alternateCorrections"];
    alternateCorrections = v5->_alternateCorrections;
    v5->_alternateCorrections = (NSArray *)v11;
  }
  return v5;
}

- (TICorrectionCandidates)initWithAutocorrection:(id)a3 alternateCorrections:(id)a4 autocorrectionBlocked:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TICorrectionCandidates;
  uint64_t v11 = [(TICorrectionCandidates *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_autocorrection, a3);
    uint64_t v13 = [v10 copy];
    alternateCorrections = v12->_alternateCorrections;
    v12->_alternateCorrections = (NSArray *)v13;

    v12->_autocorrectionBlocked = a5;
  }

  return v12;
}

- (TICorrectionCandidates)initWithAutocorrection:(id)a3 alternateCorrections:(id)a4
{
  return [(TICorrectionCandidates *)self initWithAutocorrection:a3 alternateCorrections:a4 autocorrectionBlocked:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end