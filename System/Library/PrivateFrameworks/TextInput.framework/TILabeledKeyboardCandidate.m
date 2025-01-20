@interface TILabeledKeyboardCandidate
+ (BOOL)supportsSecureCoding;
+ (int)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTransliterationCandidate;
- (NSString)label;
- (TILabeledKeyboardCandidate)initWithCandidate:(id)a3 forInput:(id)a4 label:(id)a5;
- (TILabeledKeyboardCandidate)initWithCandidate:(id)a3 forInput:(id)a4 label:(id)a5 transliterationType:(int64_t)a6;
- (TILabeledKeyboardCandidate)initWithCandidateResultSetCoder:(id)a3;
- (TILabeledKeyboardCandidate)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCandidateResultSetCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation TILabeledKeyboardCandidate

- (void).cxx_destruct
{
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TILabeledKeyboardCandidate;
  id v4 = a3;
  [(TIKeyboardCandidateSingle *)&v6 encodeWithCandidateResultSetCoder:v4];
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  else {
    label = &stru_1EDBDCE38;
  }
  objc_msgSend(v4, "encodeString:", label, v6.receiver, v6.super_class);
  [v4 encodeByte:LOBYTE(self->_transliterationType)];
}

- (TILabeledKeyboardCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TILabeledKeyboardCandidate;
  v5 = [(TIKeyboardCandidateSingle *)&v10 initWithCandidateResultSetCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeString];
    uint64_t v7 = [v6 copy];
    label = v5->_label;
    v5->_label = (NSString *)v7;

    v5->_transliterationType = [v4 decodeByte];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v8.receiver = self;
    v8.super_class = (Class)TILabeledKeyboardCandidate;
    if ([(TIKeyboardCandidate *)&v8 isEqual:v5]) {
      BOOL v6 = self->_transliterationType == v5[28];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isTransliterationCandidate
{
  return self->_transliterationType != 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TILabeledKeyboardCandidate;
  [(TIKeyboardCandidateSingle *)&v7 encodeWithCoder:v4];
  label = self->_label;
  if (label) {
    [v4 encodeObject:label forKey:@"label"];
  }
  int64_t transliterationType = self->_transliterationType;
  if (transliterationType) {
    [v4 encodeInt:transliterationType forKey:@"transliterationType"];
  }
}

- (TILabeledKeyboardCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TILabeledKeyboardCandidate;
  v5 = [(TIKeyboardCandidateSingle *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_int64_t transliterationType = (int)[v4 decodeIntForKey:@"transliterationType"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TILabeledKeyboardCandidate;
  id v4 = [(TIKeyboardCandidateSingle *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 30, self->_label);
    v5[28] = self->_transliterationType;
  }
  return v5;
}

- (TILabeledKeyboardCandidate)initWithCandidate:(id)a3 forInput:(id)a4 label:(id)a5 transliterationType:(int64_t)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TILabeledKeyboardCandidate;
  v12 = [(TIKeyboardCandidateSingle *)&v15 initWithCandidate:a3 forInput:a4];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_label, a5);
    v13->_int64_t transliterationType = a6;
  }

  return v13;
}

- (TILabeledKeyboardCandidate)initWithCandidate:(id)a3 forInput:(id)a4 label:(id)a5
{
  return [(TILabeledKeyboardCandidate *)self initWithCandidate:a3 forInput:a4 label:a5 transliterationType:0];
}

+ (int)type
{
  return 11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end