@interface TIMecabraFacemarkCandidate
+ (BOOL)supportsSecureCoding;
+ (id)candidateWithCandidate:(id)a3 category:(id)a4 input:(id)a5 mecabraCandidatePointerValue:(id)a6;
+ (int)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFacemarkCandidate;
- (NSString)category;
- (TIMecabraFacemarkCandidate)initWithCandidate:(id)a3 category:(id)a4 input:(id)a5 mecabraCandidatePointerValue:(id)a6;
- (TIMecabraFacemarkCandidate)initWithCandidateResultSetCoder:(id)a3;
- (TIMecabraFacemarkCandidate)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCandidateResultSetCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
@end

@implementation TIMecabraFacemarkCandidate

- (void).cxx_destruct
{
}

- (void)setCategory:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TIMecabraFacemarkCandidate;
  id v4 = a3;
  [(TIMecabraCandidate *)&v6 encodeWithCandidateResultSetCoder:v4];
  v5 = [(TIMecabraFacemarkCandidate *)self category];
  [v4 encodeString:v5];
}

- (TIMecabraFacemarkCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIMecabraFacemarkCandidate;
  v5 = [(TIMecabraCandidate *)&v10 initWithCandidateResultSetCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeString];
    uint64_t v7 = [v6 copy];
    category = v5->_category;
    v5->_category = (NSString *)v7;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TIMecabraCandidate *)self input];
  objc_super v6 = [(TIMecabraCandidate *)self candidate];
  uint64_t v7 = [(TIMecabraFacemarkCandidate *)self category];
  v8 = [v3 stringWithFormat:@"<%@: %p '%@' -> '%@' (%@)", v4, self, v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TIMecabraFacemarkCandidate *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      objc_super v6 = [(TIMecabraFacemarkCandidate *)v5 category];
      uint64_t v7 = [(TIMecabraFacemarkCandidate *)self category];
      int v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        v11.receiver = self;
        v11.super_class = (Class)TIMecabraFacemarkCandidate;
        BOOL v9 = [(TIMecabraCandidate *)&v11 isEqual:v5];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TIMecabraFacemarkCandidate;
  [(TIMecabraCandidate *)&v6 encodeWithCoder:v4];
  category = self->_category;
  if (category) {
    [v4 encodeObject:category forKey:@"category"];
  }
}

- (TIMecabraFacemarkCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIMecabraFacemarkCandidate;
  v5 = [(TIMecabraCandidate *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    uint64_t v7 = [v6 copy];
    category = v5->_category;
    v5->_category = (NSString *)v7;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TIMecabraFacemarkCandidate;
  v5 = -[TIMecabraCandidate copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_category copyWithZone:a3];
    uint64_t v7 = (void *)v5[30];
    v5[30] = v6;
  }
  return v5;
}

- (BOOL)isFacemarkCandidate
{
  return 1;
}

- (TIMecabraFacemarkCandidate)initWithCandidate:(id)a3 category:(id)a4 input:(id)a5 mecabraCandidatePointerValue:(id)a6
{
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TIMecabraFacemarkCandidate;
  objc_super v11 = [(TIMecabraCandidate *)&v14 initWithSurface:a3 input:a5 mecabraCandidatePointerValue:a6];
  v12 = v11;
  if (v11) {
    [(TIMecabraFacemarkCandidate *)v11 setCategory:v10];
  }

  return v12;
}

+ (int)type
{
  return 8;
}

+ (id)candidateWithCandidate:(id)a3 category:(id)a4 input:(id)a5 mecabraCandidatePointerValue:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  objc_super v14 = (void *)[objc_alloc((Class)a1) initWithCandidate:v13 category:v12 input:v11 mecabraCandidatePointerValue:v10];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end