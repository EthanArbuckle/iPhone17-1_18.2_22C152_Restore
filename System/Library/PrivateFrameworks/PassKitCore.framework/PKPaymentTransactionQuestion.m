@interface PKPaymentTransactionQuestion
+ (BOOL)supportsSecureCoding;
- (BOOL)answered;
- (BOOL)answeredOnThisDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQuestion:(id)a3;
- (NSArray)allowedAnswers;
- (NSDate)expirationDate;
- (PKPaymentTransactionQuestion)initWithCoder:(id)a3;
- (PKPaymentTransactionQuestion)initWithDictionary:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAnswered:(BOOL)a3;
- (void)setAnsweredOnThisDevice:(BOOL)a3;
- (void)setExpirationDate:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPaymentTransactionQuestion

- (PKPaymentTransactionQuestion)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentTransactionQuestion;
  v5 = [(PKPaymentTransactionQuestion *)&v10 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"type"];
    v5->_type = PKPaymentTransactionQuestionTypeFromString(v6);

    uint64_t v7 = [v4 PKDateForKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v7;

    *(_WORD *)&v5->_answered = 0;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  unint64_t type = self->_type;
  if (type > 2) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E56F0A00[type];
  }
  [v3 setObject:v6 forKeyedSubscript:@"type"];
  if (self->_expirationDate)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v7 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    v8 = [v7 stringFromDate:self->_expirationDate];
    [v4 setObject:v8 forKeyedSubscript:@"expirationDate"];
  }
  v9 = (void *)[v4 copy];

  return v9;
}

- (NSArray)allowedAnswers
{
  v4[2] = *MEMORY[0x1E4F143B8];
  if (self->_type - 1 > 1)
  {
    v2 = 0;
  }
  else
  {
    v4[0] = @"yes";
    v4[1] = @"no";
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  }
  return (NSArray *)v2;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_expirationDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  uint64_t v6 = self->_answered - v5 + 32 * v5;
  unint64_t v7 = self->_answeredOnThisDevice - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPaymentTransactionQuestion *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentTransactionQuestion *)self isEqualToQuestion:v5];

  return v6;
}

- (BOOL)isEqualToQuestion:(id)a3
{
  id v4 = a3;
  expirationDate = self->_expirationDate;
  uint64_t v6 = [v4 expirationDate];
  unint64_t v7 = (void *)v6;
  if (expirationDate) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (expirationDate != (NSDate *)v6)
    {
LABEL_12:
      BOOL v13 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    char v9 = [(NSDate *)expirationDate isEqual:v6];
    if ((v9 & 1) == 0) {
      goto LABEL_12;
    }
  }
  unint64_t type = self->_type;
  if (type != [v4 type]) {
    goto LABEL_12;
  }
  int answered = self->_answered;
  if (answered != [v4 answered]) {
    goto LABEL_12;
  }
  int answeredOnThisDevice = self->_answeredOnThisDevice;
  BOOL v13 = answeredOnThisDevice == [v4 answeredOnThisDevice];
LABEL_13:

  return v13;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  unint64_t type = self->_type;
  if (type > 2) {
    uint64_t v6 = @"unknown";
  }
  else {
    uint64_t v6 = off_1E56F0A00[type];
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  unint64_t v7 = [(NSDate *)self->_expirationDate description];
  [v4 appendFormat:@"expirationDate: '%@'; ", v7];

  if (self->_answered) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  [v4 appendFormat:@"answered: '%@'; ", v8];
  if (self->_answeredOnThisDevice) {
    char v9 = @"YES";
  }
  else {
    char v9 = @"NO";
  }
  [v4 appendFormat:@"answered on device: '%@'; ", v9];
  [v4 appendFormat:@">"];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionQuestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTransactionQuestion;
  unint64_t v5 = [(PKPaymentTransactionQuestion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
    v5->_int answered = [v4 decodeIntegerForKey:@"answered"] != 0;
    v5->_int answeredOnThisDevice = [v4 decodeIntegerForKey:@"answeredOnThisDevice"] != 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeInteger:self->_answered forKey:@"answered"];
  [v5 encodeInteger:self->_answeredOnThisDevice forKey:@"answeredOnThisDevice"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)answered
{
  return self->_answered;
}

- (void)setAnswered:(BOOL)a3
{
  self->_int answered = a3;
}

- (BOOL)answeredOnThisDevice
{
  return self->_answeredOnThisDevice;
}

- (void)setAnsweredOnThisDevice:(BOOL)a3
{
  self->_int answeredOnThisDevice = a3;
}

- (void).cxx_destruct
{
}

@end