@interface TITextAnimationCandidate
+ (BOOL)supportsSecureCoding;
+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 forTextEffectName:(id)a5;
+ (int)type;
- (BOOL)isEqual:(id)a3;
- (NSString)textEffectName;
- (TITextAnimationCandidate)initWithCandidateResultSetCoder:(id)a3;
- (TITextAnimationCandidate)initWithCandidateWithCandidate:(id)a3 forInput:(id)a4 forTextEffectName:(id)a5;
- (TITextAnimationCandidate)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)candidateProperty;
- (void)encodeWithCandidateResultSetCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TITextAnimationCandidate

- (void).cxx_destruct
{
}

- (NSString)textEffectName
{
  return self->_textEffectName;
}

- (id)description
{
  v3 = NSString;
  v4 = [(TIKeyboardCandidateSingle *)self candidate];
  v5 = [(TIKeyboardCandidateSingle *)self input];
  v6 = [(TITextAnimationCandidate *)self textEffectName];
  v7 = [v3 stringWithFormat:@"<TITextAnimationCandidate: candidate %@, input %@, textEffectName %@>", v4, v5, v6];

  return v7;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TITextAnimationCandidate;
  id v4 = a3;
  [(TIKeyboardCandidateSingle *)&v6 encodeWithCandidateResultSetCoder:v4];
  v5 = [(TITextAnimationCandidate *)self textEffectName];
  [v4 encodeString:v5];
}

- (TITextAnimationCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TITextAnimationCandidate;
  v5 = [(TIKeyboardCandidateSingle *)&v10 initWithCandidateResultSetCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeString];
    uint64_t v7 = [v6 copy];
    textEffectName = v5->_textEffectName;
    v5->_textEffectName = (NSString *)v7;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (textEffectName = self->_textEffectName,
        [v4 textEffectName],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        LODWORD(textEffectName) = [(NSString *)textEffectName isEqualToString:v6],
        v6,
        textEffectName))
  {
    v9.receiver = self;
    v9.super_class = (Class)TITextAnimationCandidate;
    BOOL v7 = [(TIKeyboardCandidate *)&v9 isEqual:v4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TITextAnimationCandidate;
  [(TIKeyboardCandidateSingle *)&v6 encodeWithCoder:v4];
  textEffectName = self->_textEffectName;
  if (textEffectName) {
    [v4 encodeObject:textEffectName forKey:@"textEffectName"];
  }
}

- (TITextAnimationCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITextAnimationCandidate;
  v5 = [(TIKeyboardCandidateSingle *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textEffectName"];
    textEffectName = v5->_textEffectName;
    v5->_textEffectName = (NSString *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TITextAnimationCandidate;
  v5 = -[TIKeyboardCandidateSingle copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_textEffectName copyWithZone:a3];
    BOOL v7 = (void *)v5[28];
    v5[28] = v6;
  }
  return v5;
}

- (unint64_t)candidateProperty
{
  return 4;
}

- (TITextAnimationCandidate)initWithCandidateWithCandidate:(id)a3 forInput:(id)a4 forTextEffectName:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TITextAnimationCandidate;
  objc_super v10 = [(TIKeyboardCandidateSingle *)&v13 initWithCandidate:a3 forInput:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_textEffectName, a5);
  }

  return v11;
}

+ (int)type
{
  return 9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 forTextEffectName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithCandidateWithCandidate:v10 forInput:v9 forTextEffectName:v8];

  return v11;
}

@end