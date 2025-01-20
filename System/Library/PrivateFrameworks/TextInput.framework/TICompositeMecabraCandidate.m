@interface TICompositeMecabraCandidate
+ (BOOL)supportsSecureCoding;
+ (int)type;
- (NSArray)autoconvertedCandidatePointerValues;
- (NSString)remainderCandidateString;
- (TICompositeMecabraCandidate)initWithCandidateResultSetCoder:(id)a3;
- (TICompositeMecabraCandidate)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCandidateResultSetCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoconvertedCandidatePointerValues:(id)a3;
- (void)setRemainderCandidateString:(id)a3;
@end

@implementation TICompositeMecabraCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoconvertedCandidatePointerValues, 0);

  objc_storeStrong((id *)&self->_remainderCandidateString, 0);
}

- (void)setAutoconvertedCandidatePointerValues:(id)a3
{
}

- (NSArray)autoconvertedCandidatePointerValues
{
  return self->_autoconvertedCandidatePointerValues;
}

- (void)setRemainderCandidateString:(id)a3
{
}

- (NSString)remainderCandidateString
{
  return self->_remainderCandidateString;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TICompositeMecabraCandidate;
  id v4 = a3;
  [(TIMecabraCandidate *)&v7 encodeWithCandidateResultSetCoder:v4];
  v5 = [(TICompositeMecabraCandidate *)self remainderCandidateString];
  [v4 encodeString:v5];

  v6 = [(TICompositeMecabraCandidate *)self autoconvertedCandidatePointerValues];
  [v4 encodePointerValueArray:v6];
}

- (TICompositeMecabraCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TICompositeMecabraCandidate;
  v5 = [(TIMecabraCandidate *)&v13 initWithCandidateResultSetCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeString];
    uint64_t v7 = [v6 copy];
    remainderCandidateString = v5->_remainderCandidateString;
    v5->_remainderCandidateString = (NSString *)v7;

    v9 = [v4 decodePointerValueArray];
    uint64_t v10 = [v9 copy];
    autoconvertedCandidatePointerValues = v5->_autoconvertedCandidatePointerValues;
    v5->_autoconvertedCandidatePointerValues = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TICompositeMecabraCandidate;
  [(TIMecabraCandidate *)&v7 encodeWithCoder:v4];
  remainderCandidateString = self->_remainderCandidateString;
  if (remainderCandidateString) {
    [v4 encodeObject:remainderCandidateString forKey:@"remainderCandidateString"];
  }
  autoconvertedCandidatePointerValues = self->_autoconvertedCandidatePointerValues;
  if (autoconvertedCandidatePointerValues) {
    [v4 encodeObject:autoconvertedCandidatePointerValues forKey:@"autoconvertedCandidatePointerValues"];
  }
}

- (TICompositeMecabraCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TICompositeMecabraCandidate;
  v5 = [(TIMecabraCandidate *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remainderCandidateString"];
    uint64_t v7 = [v6 copy];
    remainderCandidateString = v5->_remainderCandidateString;
    v5->_remainderCandidateString = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"autoconvertedCandidatePointerValues"];
    uint64_t v13 = [v12 copy];
    autoconvertedCandidatePointerValues = v5->_autoconvertedCandidatePointerValues;
    v5->_autoconvertedCandidatePointerValues = (NSArray *)v13;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TICompositeMecabraCandidate;
  v5 = -[TIMecabraCandidate copyWithZone:](&v11, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_remainderCandidateString copyWithZone:a3];
    uint64_t v7 = (void *)v5[30];
    v5[30] = v6;

    uint64_t v8 = [(NSArray *)self->_autoconvertedCandidatePointerValues copyWithZone:a3];
    v9 = (void *)v5[31];
    v5[31] = v8;
  }
  return v5;
}

+ (int)type
{
  return 7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end