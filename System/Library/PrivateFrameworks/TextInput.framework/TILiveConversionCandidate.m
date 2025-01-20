@interface TILiveConversionCandidate
+ (BOOL)supportsSecureCoding;
+ (int)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInlineCandidate;
- (BOOL)isPartialCandidate;
- (TILiveConversionCandidate)initWithCandidateResultSetCoder:(id)a3;
- (TILiveConversionCandidate)initWithCoder:(id)a3;
- (TILiveConversionCandidate)initWithSurface:(id)a3 input:(id)a4 candidate:(id)a5 mecabraCandidatePointerValue:(id)a6;
- (id)candidate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)label;
- (unint64_t)hash;
- (void)encodeWithCandidateResultSetCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInlineCandidate:(BOOL)a3;
- (void)setPartialCandidate:(BOOL)a3;
@end

@implementation TILiveConversionCandidate

- (void).cxx_destruct
{
}

- (void)setPartialCandidate:(BOOL)a3
{
  self->_partialCandidate = a3;
}

- (BOOL)isPartialCandidate
{
  return self->_partialCandidate;
}

- (void)setInlineCandidate:(BOOL)a3
{
  self->_inlineCandidate = a3;
}

- (BOOL)isInlineCandidate
{
  return self->_inlineCandidate;
}

- (id)candidate
{
  return self->_candidate;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TILiveConversionCandidate;
  id v4 = a3;
  [(TIMecabraCandidate *)&v5 encodeWithCandidateResultSetCoder:v4];
  objc_msgSend(v4, "encodeString:", self->_candidate, v5.receiver, v5.super_class);
  [v4 encodeBool:self->_inlineCandidate];
  [v4 encodeBool:self->_partialCandidate];
}

- (TILiveConversionCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TILiveConversionCandidate;
  objc_super v5 = [(TIMecabraCandidate *)&v10 initWithCandidateResultSetCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeString];
    uint64_t v7 = [v6 copy];
    candidate = v5->_candidate;
    v5->_candidate = (NSString *)v7;

    v5->_inlineCandidate = [v4 decodeBool];
    v5->_partialCandidate = [v4 decodeBool];
  }

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)TILiveConversionCandidate;
  uint64_t v3 = 257 * [(TIKeyboardCandidate *)&v5 hash];
  return [(NSString *)self->_candidate hash] + v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v12.receiver = self,
        v12.super_class = (Class)TILiveConversionCandidate,
        [(TIMecabraCandidate *)&v12 isEqual:v4]))
  {
    id v5 = v4;
    v6 = [(TILiveConversionCandidate *)self label];
    uint64_t v7 = [v5 label];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(TILiveConversionCandidate *)self candidate];
      v9 = [v5 candidate];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TILiveConversionCandidate;
  [(TIMecabraCandidate *)&v6 encodeWithCoder:v4];
  candidate = self->_candidate;
  if (candidate) {
    [v4 encodeObject:candidate forKey:@"candidate-liveconversion"];
  }
  if (self->_inlineCandidate) {
    [v4 encodeBool:1 forKey:@"inlinecandidate-liveconversion"];
  }
  if (self->_partialCandidate) {
    [v4 encodeBool:1 forKey:@"partialcandidate-liveconversion"];
  }
}

- (id)label
{
  v4.receiver = self;
  v4.super_class = (Class)TILiveConversionCandidate;
  v2 = [(TIMecabraCandidate *)&v4 candidate];

  return v2;
}

- (TILiveConversionCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TILiveConversionCandidate;
  id v5 = [(TIMecabraCandidate *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidate-liveconversion"];
    uint64_t v7 = [v6 copy];
    candidate = v5->_candidate;
    v5->_candidate = (NSString *)v7;

    v5->_inlineCandidate = [v4 decodeBoolForKey:@"inlinecandidate-liveconversion"];
    v5->_partialCandidate = [v4 decodeBoolForKey:@"partialcandidate-liveconversion"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TILiveConversionCandidate;
  id v5 = -[TIMecabraCandidate copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_candidate copyWithZone:a3];
    uint64_t v7 = (void *)v5[30];
    v5[30] = v6;

    *((unsigned char *)v5 + 248) = self->_inlineCandidate;
    *((unsigned char *)v5 + 249) = self->_partialCandidate;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)type
{
  return 10;
}

- (TILiveConversionCandidate)initWithSurface:(id)a3 input:(id)a4 candidate:(id)a5 mecabraCandidatePointerValue:(id)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TILiveConversionCandidate;
  objc_super v12 = [(TIMecabraCandidate *)&v15 initWithSurface:a3 input:a4 mecabraCandidatePointerValue:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_candidate, a5);
  }

  return v13;
}

@end