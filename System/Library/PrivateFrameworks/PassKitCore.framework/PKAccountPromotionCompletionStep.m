@interface PKAccountPromotionCompletionStep
+ (BOOL)supportsSecureCoding;
+ (id)completionStepsFromDictionaries:(id)a3;
- (BOOL)completed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountPromotionCompletionStep:(id)a3;
- (NSDecimalNumber)currentValue;
- (NSDecimalNumber)endValue;
- (NSString)currencyCode;
- (PKAccountPromotionCompletionStep)initWithCoder:(id)a3;
- (PKAccountPromotionCompletionStep)initWithDictionary:(id)a3 index:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)index;
- (unint64_t)hash;
- (unint64_t)progressType;
- (void)_initWithCompletionStepDictionary:(id)a3 index:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setEndValue:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)setProgressType:(unint64_t)a3;
@end

@implementation PKAccountPromotionCompletionStep

+ (id)completionStepsFromDictionaries:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F1CA48];
    id v4 = a3;
    v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__PKAccountPromotionCompletionStep_completionStepsFromDictionaries___block_invoke;
    v9[3] = &unk_1E56EEAA0;
    id v10 = v5;
    id v6 = v5;
    [v4 enumerateObjectsUsingBlock:v9];

    v7 = (void *)[v6 copy];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __68__PKAccountPromotionCompletionStep_completionStepsFromDictionaries___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v7 = [[PKAccountPromotionCompletionStep alloc] initWithDictionary:v5 index:a3];

  id v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 32) addObject:v7];
    id v6 = v7;
  }
}

- (PKAccountPromotionCompletionStep)initWithDictionary:(id)a3 index:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)PKAccountPromotionCompletionStep;
    v7 = [(PKAccountPromotionCompletionStep *)&v11 init];
    v8 = v7;
    if (v7) {
      [(PKAccountPromotionCompletionStep *)v7 _initWithCompletionStepDictionary:v6 index:a4];
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_initWithCompletionStepDictionary:(id)a3 index:(int64_t)a4
{
  self->_index = a4;
  id v5 = a3;
  id v6 = [v5 PKStringForKey:@"type"];
  self->_progressType = PKAccountPromotionCompletionStepProgressTypeFromString(v6);

  v7 = [v5 PKStringForKey:@"currencyCode"];
  currencyCode = self->_currencyCode;
  self->_currencyCode = v7;

  v9 = [v5 PKDecimalNumberFromStringForKey:@"endValue"];
  endValue = self->_endValue;
  self->_endValue = v9;

  objc_super v11 = [v5 PKDecimalNumberFromStringForKey:@"currentValue"];
  currentValue = self->_currentValue;
  self->_currentValue = v11;

  LOBYTE(v6) = [v5 PKBoolForKey:@"completed"];
  self->_completed = (char)v6;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", @"index: '%ld'; ", self->_index);
  unint64_t progressType = self->_progressType;
  if (progressType > 4) {
    id v5 = @"unknown";
  }
  else {
    id v5 = off_1E56EEAC0[progressType];
  }
  [v3 appendFormat:@"progressType: '%@'; ", v5];
  [v3 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  id v6 = [(NSDecimalNumber *)self->_currentValue stringValue];
  [v3 appendFormat:@"currentValue: '%@'; ", v6];

  v7 = [(NSDecimalNumber *)self->_endValue stringValue];
  [v3 appendFormat:@"endValue: '%@'; ", v7];

  if (self->_completed) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v3 appendFormat:@"completed: '%@'; ", v8];
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAccountPromotionCompletionStep *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountPromotionCompletionStep *)self isEqualToAccountPromotionCompletionStep:v5];

  return v6;
}

- (BOOL)isEqualToAccountPromotionCompletionStep:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4 || self->_index != v4[3] || self->_progressType != v4[2]) {
    goto LABEL_21;
  }
  BOOL v6 = (void *)v4[4];
  v7 = self->_currencyCode;
  v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_21;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_21;
    }
  }
  currentValue = self->_currentValue;
  v12 = (NSDecimalNumber *)v5[6];
  if (currentValue && v12)
  {
    if ((-[NSDecimalNumber isEqual:](currentValue, "isEqual:") & 1) == 0) {
      goto LABEL_21;
    }
  }
  else if (currentValue != v12)
  {
    goto LABEL_21;
  }
  endValue = self->_endValue;
  v14 = (NSDecimalNumber *)v5[5];
  if (!endValue || !v14)
  {
    if (endValue == v14) {
      goto LABEL_19;
    }
LABEL_21:
    BOOL v15 = 0;
    goto LABEL_22;
  }
  if ((-[NSDecimalNumber isEqual:](endValue, "isEqual:") & 1) == 0) {
    goto LABEL_21;
  }
LABEL_19:
  BOOL v15 = self->_completed == *((unsigned __int8 *)v5 + 8);
LABEL_22:

  return v15;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_currentValue];
  [v3 safelyAddObject:self->_endValue];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_index - v4 + 32 * v4;
  unint64_t v6 = self->_progressType - v5 + 32 * v5;
  unint64_t v7 = self->_completed - v6 + 32 * v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPromotionCompletionStep)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKAccountPromotionCompletionStep;
  int64_t v5 = [(PKAccountPromotionCompletionStep *)&v14 init];
  if (v5)
  {
    v5->_index = [v4 decodeIntegerForKey:@"index"];
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_unint64_t progressType = PKAccountPromotionCompletionStepProgressTypeFromString(v6);

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endValue"];
    endValue = v5->_endValue;
    v5->_endValue = (NSDecimalNumber *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentValue"];
    currentValue = v5->_currentValue;
    v5->_currentValue = (NSDecimalNumber *)v11;

    v5->_completed = [v4 decodeBoolForKey:@"completed"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t index = self->_index;
  id v7 = a3;
  [v7 encodeInteger:index forKey:@"index"];
  unint64_t progressType = self->_progressType;
  if (progressType > 4) {
    unint64_t v6 = @"unknown";
  }
  else {
    unint64_t v6 = off_1E56EEAC0[progressType];
  }
  [v7 encodeObject:v6 forKey:@"type"];
  [v7 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v7 encodeObject:self->_endValue forKey:@"endValue"];
  [v7 encodeObject:self->_currentValue forKey:@"currentValue"];
  [v7 encodeBool:self->_completed forKey:@"completed"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 24) = self->_index;
  *(void *)(v5 + 16) = self->_progressType;
  uint64_t v6 = [(NSString *)self->_currencyCode copyWithZone:a3];
  id v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_endValue copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_currentValue copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  *(unsigned char *)(v5 + 8) = self->_completed;
  return (id)v5;
}

- (unint64_t)progressType
{
  return self->_progressType;
}

- (void)setProgressType:(unint64_t)a3
{
  self->_unint64_t progressType = a3;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_int64_t index = a3;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSDecimalNumber)endValue
{
  return self->_endValue;
}

- (void)setEndValue:(id)a3
{
}

- (NSDecimalNumber)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(id)a3
{
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentValue, 0);
  objc_storeStrong((id *)&self->_endValue, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end