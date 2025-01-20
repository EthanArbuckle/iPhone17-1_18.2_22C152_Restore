@interface TIPinyinDisambiguationCandidate
+ (BOOL)supportsSecureCoding;
+ (id)candidateWithPinyinSyllable:(id)a3;
+ (int)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGeneratedByChoosePinyin;
- (TIPinyinDisambiguationCandidate)initWithCandidateResultSetCoder:(id)a3;
- (TIPinyinDisambiguationCandidate)initWithCoder:(id)a3;
- (TIPinyinDisambiguationCandidate)initWithPinyinSyllable:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)label;
- (unint64_t)hash;
- (void)encodeWithCandidateResultSetCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGeneratedByChoosePinyin:(BOOL)a3;
- (void)setLabel:(id)a3;
@end

@implementation TIPinyinDisambiguationCandidate

- (void).cxx_destruct
{
}

- (void)setGeneratedByChoosePinyin:(BOOL)a3
{
  self->_generatedByChoosePinyin = a3;
}

- (BOOL)isGeneratedByChoosePinyin
{
  return self->_generatedByChoosePinyin;
}

- (void)setLabel:(id)a3
{
}

- (id)label
{
  return self->_label;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TIPinyinDisambiguationCandidate;
  id v4 = a3;
  [(TIKeyboardCandidateSingle *)&v6 encodeWithCandidateResultSetCoder:v4];
  v5 = [(TIPinyinDisambiguationCandidate *)self label];
  [v4 encodeString:v5];
}

- (TIPinyinDisambiguationCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIPinyinDisambiguationCandidate;
  v5 = [(TIKeyboardCandidateSingle *)&v10 initWithCandidateResultSetCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeString];
    uint64_t v7 = [v6 copy];
    label = v5->_label;
    v5->_label = (NSString *)v7;
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(TIPinyinDisambiguationCandidate *)self label];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_super v6 = [(TIPinyinDisambiguationCandidate *)self label];
    uint64_t v7 = [v5 label];
    if ([v6 isEqualToString:v7])
    {
      BOOL v8 = [(TIPinyinDisambiguationCandidate *)self isGeneratedByChoosePinyin];
      int v9 = v8 ^ [v5 isGeneratedByChoosePinyin] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TIPinyinDisambiguationCandidate;
  [(TIKeyboardCandidateSingle *)&v6 encodeWithCoder:v4];
  label = self->_label;
  if (label) {
    [v4 encodeObject:label forKey:@"label"];
  }
  [v4 encodeBool:self->_generatedByChoosePinyin forKey:@"generatedByChoosePinyin"];
}

- (TIPinyinDisambiguationCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIPinyinDisambiguationCandidate;
  id v5 = [(TIKeyboardCandidateSingle *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    uint64_t v7 = [v6 copy];
    label = v5->_label;
    v5->_label = (NSString *)v7;

    v5->_generatedByChoosePinyin = [v4 decodeBoolForKey:@"generatedByChoosePinyin"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TIPinyinDisambiguationCandidate;
  id v5 = -[TIKeyboardCandidateSingle copyWithZone:](&v10, sel_copyWithZone_);
  if (v5)
  {
    objc_super v6 = [(TIPinyinDisambiguationCandidate *)self label];
    uint64_t v7 = [v6 copyWithZone:a3];
    BOOL v8 = (void *)v5[29];
    v5[29] = v7;

    *((unsigned char *)v5 + 224) = self->_generatedByChoosePinyin;
  }
  return v5;
}

- (TIPinyinDisambiguationCandidate)initWithPinyinSyllable:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIPinyinDisambiguationCandidate;
  id v5 = [(TIKeyboardCandidateSingle *)&v9 initWithCandidate:&stru_1EDBDCE38 forInput:&stru_1EDBDCE38];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;
  }
  return v5;
}

+ (int)type
{
  return 3;
}

+ (id)candidateWithPinyinSyllable:(id)a3
{
  id v3 = a3;
  id v4 = [[TIPinyinDisambiguationCandidate alloc] initWithPinyinSyllable:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end