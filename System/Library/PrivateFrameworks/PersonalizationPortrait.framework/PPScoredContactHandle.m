@interface PPScoredContactHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScoredContactHandle:(id)a3;
- (NSString)contactHandle;
- (PPScoredContactHandle)initWithCoder:(id)a3;
- (PPScoredContactHandle)initWithContactHandle:(id)a3 score:(double)a4;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)reverseCompare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPScoredContactHandle

- (void).cxx_destruct
{
}

- (double)score
{
  return self->_score;
}

- (NSString)contactHandle
{
  return self->_contactHandle;
}

- (BOOL)isEqualToScoredContactHandle:(id)a3
{
  id v4 = a3;
  v5 = (double *)v4;
  if (!v4) {
    goto LABEL_4;
  }
  contactHandle = self->_contactHandle;
  v7 = (NSString *)*((id *)v4 + 1);
  if (contactHandle == v7)
  {

    goto LABEL_6;
  }
  v8 = v7;
  v9 = contactHandle;
  char v10 = [(NSString *)v9 isEqual:v8];

  if (v10)
  {
LABEL_6:
    BOOL v11 = self->_score == v5[2];
    goto LABEL_7;
  }
LABEL_4:
  BOOL v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPScoredContactHandle *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPScoredContactHandle *)self isEqualToScoredContactHandle:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  BOOL v6 = (void *)[(NSString *)self->_contactHandle copyWithZone:a3];
  v7 = (void *)[v5 initWithContactHandle:v6 score:self->_score];

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_contactHandle hash];
  id v4 = [NSNumber numberWithDouble:self->_score];
  unint64_t v5 = [v4 hash] - v3 + 32 * v3;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contactHandle = self->_contactHandle;
  id v5 = a3;
  [v5 encodeObject:contactHandle forKey:@"ch"];
  [v5 encodeDouble:@"sc" forKey:self->_score];
}

- (PPScoredContactHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = pp_default_log_handle();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"ch" withCoder:v4 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v7];

  if (v8)
  {
    [v4 decodeDoubleForKey:@"sc"];
    self = -[PPScoredContactHandle initWithContactHandle:score:](self, "initWithContactHandle:score:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)reverseCompare:(id)a3
{
  double score = self->_score;
  [a3 score];
  return +[PPUtils reverseCompareDouble:score withDouble:v4];
}

- (int64_t)compare:(id)a3
{
  double score = self->_score;
  [a3 score];
  return +[PPUtils compareDouble:score withDouble:v4];
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPScoredContactHandle c:%@ s:%f>", self->_contactHandle, *(void *)&self->_score];
  return v2;
}

- (PPScoredContactHandle)initWithContactHandle:(id)a3 score:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPScoredContactHandle;
  v8 = [(PPScoredContactHandle *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contactHandle, a3);
    v9->_double score = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end