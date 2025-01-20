@interface PPScoredLabeledValue
+ (BOOL)supportsSecureCoding;
+ (id)scoredLabeledValueWithLabeledValue:(id)a3 score:(double)a4 flags:(unsigned __int8)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScoredLabeledValue:(id)a3;
- (PPLabeledValue)labeledValue;
- (PPScoredLabeledValue)initWithCoder:(id)a3;
- (PPScoredLabeledValue)initWithLabeledValue:(id)a3 score:(double)a4 flags:(unsigned __int8)a5;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)reverseCompare:(id)a3;
- (unint64_t)hash;
- (unsigned)flags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPScoredLabeledValue

- (void).cxx_destruct
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (double)score
{
  return self->_score;
}

- (PPLabeledValue)labeledValue
{
  return self->_labeledValue;
}

- (BOOL)isEqualToScoredLabeledValue:(id)a3
{
  v4 = (id *)a3;
  v5 = (double *)v4;
  if (!v4) {
    goto LABEL_8;
  }
  labeledValue = self->_labeledValue;
  v7 = (PPLabeledValue *)v4[2];
  if (labeledValue == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = labeledValue;
    BOOL v10 = [(PPLabeledValue *)v9 isEqual:v8];

    if (!v10) {
      goto LABEL_8;
    }
  }
  if (self->_score != v5[3])
  {
LABEL_8:
    BOOL v11 = 0;
    goto LABEL_9;
  }
  BOOL v11 = self->_flags == *((unsigned __int8 *)v5 + 8);
LABEL_9:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPScoredLabeledValue *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPScoredLabeledValue *)self isEqualToScoredLabeledValue:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  id v6 = [(PPLabeledValue *)self->_labeledValue copyWithZone:a3];
  v7 = [v5 scoredLabeledValueWithLabeledValue:v6 score:self->_flags flags:self->_score];

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PPLabeledValue *)self->_labeledValue hash];
  v4 = [NSNumber numberWithDouble:self->_score];
  uint64_t v5 = [v4 hash] - v3 + 32 * v3;

  return self->_flags - v5 + 32 * v5;
}

- (void)encodeWithCoder:(id)a3
{
  labeledValue = self->_labeledValue;
  id v5 = a3;
  [v5 encodeObject:labeledValue forKey:@"lvl"];
  [v5 encodeDouble:@"sco" forKey:self->_score];
  [v5 encodeInt32:self->_flags forKey:@"fla"];
}

- (PPScoredLabeledValue)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lvl"];
  [v4 decodeDoubleForKey:@"sco"];
  double v7 = v6;
  unsigned __int8 v8 = [v4 decodeInt32ForKey:@"fla"];

  v9 = [(PPScoredLabeledValue *)self initWithLabeledValue:v5 score:v8 flags:v7];
  return v9;
}

- (int64_t)reverseCompare:(id)a3
{
  return [a3 compare:self];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  double score = self->_score;
  [v4 score];
  int64_t v7 = +[PPUtils compareDouble:score withDouble:v6];
  if (!v7)
  {
    unsigned __int8 v8 = [(PPLabeledValue *)self->_labeledValue label];
    v9 = [v4 labeledValue];
    BOOL v10 = [v9 label];
    int64_t v7 = [v8 compare:v10];
  }
  return v7;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPScoredLabeledValue lv:%@ s:%f f:%u>", self->_labeledValue, *(void *)&self->_score, self->_flags];
  return v2;
}

- (PPScoredLabeledValue)initWithLabeledValue:(id)a3 score:(double)a4 flags:(unsigned __int8)a5
{
  id v10 = a3;
  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PPScoredLabeledValue.m", 23, @"Invalid parameter not satisfying: %@", @"labeledValue" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PPScoredLabeledValue;
  BOOL v11 = [(PPScoredLabeledValue *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_labeledValue, a3);
    v12->_double score = a4;
    v12->_flags = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)scoredLabeledValueWithLabeledValue:(id)a3 score:(double)a4 flags:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithLabeledValue:v8 score:v5 flags:a4];

  return v9;
}

@end