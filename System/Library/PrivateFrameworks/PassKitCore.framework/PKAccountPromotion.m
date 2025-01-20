@interface PKAccountPromotion
+ (BOOL)supportsSecureCoding;
- (BOOL)_completed;
- (BOOL)_endDateHasPassed;
- (BOOL)_hasNonZeroProgress;
- (BOOL)_isOngoing;
- (BOOL)_startDateHasPassed;
- (BOOL)expiringSoon;
- (BOOL)hideTimeRemaining;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountPromotion:(id)a3;
- (BOOL)isInTerminalState;
- (NSArray)completionSteps;
- (NSCopying)identifier;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)layoutDictionary;
- (NSString)description;
- (NSString)name;
- (NSString)programIdentifier;
- (NSString)templateIdentifier;
- (NSURL)termsURL;
- (PKAccountPromotion)initWithCoder:(id)a3;
- (PKAccountPromotion)initWithDictionary:(id)a3;
- (PKDynamicTemplateLayout)layout;
- (double)timeRemaining;
- (id)copyWithZone:(_NSZone *)a3;
- (id)layoutData;
- (int64_t)impressionCount;
- (unint64_t)hash;
- (unint64_t)state;
- (unint64_t)type;
- (void)_initWithPromotionDictionary:(id)a3;
- (void)_parseLayoutDictionary;
- (void)_updateState;
- (void)encodeWithCoder:(id)a3;
- (void)incrementImpressionCount;
- (void)resetImpressionCount;
- (void)setCompletionSteps:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setImpressionCount:(int64_t)a3;
- (void)setLayout:(id)a3;
- (void)setLayoutDictionary:(id)a3;
- (void)setLayoutDictionaryFromData:(id)a3;
- (void)setName:(id)a3;
- (void)setProgramIdentifier:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTemplateIdentifier:(id)a3;
- (void)setTermsURL:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountPromotion

- (PKAccountPromotion)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKAccountPromotion;
    v5 = [(PKAccountPromotion *)&v9 init];
    v6 = v5;
    if (v5) {
      [(PKAccountPromotion *)v5 _initWithPromotionDictionary:v4];
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_initWithPromotionDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 PKStringForKey:@"programIdentifier"];
  programIdentifier = self->_programIdentifier;
  self->_programIdentifier = v5;

  v7 = [v4 PKStringForKey:@"type"];
  self->_type = PKAccountPromotionTypeFromString(v7);

  v8 = [v4 PKDateForKey:@"startDate"];
  startDate = self->_startDate;
  self->_startDate = v8;

  v10 = [v4 PKDateForKey:@"endDate"];
  endDate = self->_endDate;
  self->_endDate = v10;

  v12 = [v4 PKStringForKey:@"name"];
  name = self->_name;
  self->_name = v12;

  id v18 = [v4 PKArrayForKey:@"completionSteps"];
  v14 = +[PKAccountPromotionCompletionStep completionStepsFromDictionaries:v18];
  completionSteps = self->_completionSteps;
  self->_completionSteps = v14;

  self->_impressionCount = 0;
  [(PKAccountPromotion *)self _updateState];
  v16 = [v4 PKDictionaryForKey:@"layout"];

  layoutDictionary = self->_layoutDictionary;
  self->_layoutDictionary = v16;

  [(PKAccountPromotion *)self _parseLayoutDictionary];
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
  [(PKAccountPromotion *)self _updateState];
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
  [(PKAccountPromotion *)self _updateState];
}

- (void)setCompletionSteps:(id)a3
{
  objc_storeStrong((id *)&self->_completionSteps, a3);
  [(PKAccountPromotion *)self _updateState];
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setLayoutDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_layoutDictionary, a3);
  [(PKAccountPromotion *)self _parseLayoutDictionary];
}

- (void)_parseLayoutDictionary
{
  if ([(NSDictionary *)self->_layoutDictionary count])
  {
    v3 = [[PKDynamicTemplateLayout alloc] initWithDictionary:self->_layoutDictionary];
    layout = self->_layout;
    self->_layout = v3;

    v5 = [(PKDynamicTemplateLayout *)self->_layout templateIdentifier];
    templateIdentifier = self->_templateIdentifier;
    self->_templateIdentifier = v5;

    v13 = [(PKDynamicTemplateLayout *)self->_layout anyLayoutLinkNamed:@"disclosure"];
    v7 = [v13 url];
    termsURL = self->_termsURL;
    self->_termsURL = v7;

    objc_super v9 = (NSString *)v13;
  }
  else
  {
    v10 = self->_layout;
    self->_layout = 0;

    layoutDictionary = self->_layoutDictionary;
    self->_layoutDictionary = 0;

    v12 = self->_termsURL;
    self->_termsURL = 0;

    objc_super v9 = self->_templateIdentifier;
    self->_templateIdentifier = 0;
  }
}

- (id)layoutData
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  layoutDictionary = self->_layoutDictionary;
  if (layoutDictionary)
  {
    id v7 = 0;
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:layoutDictionary options:0 error:&v7];
    id v4 = v7;
    if (v4)
    {
      v5 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Error serializing promotion layout dictionary: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setLayoutDictionaryFromData:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4 && [v4 length])
  {
    v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:0];
    objc_opt_class();
    id v6 = 0;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    [(PKAccountPromotion *)self setLayoutDictionary:v6];
  }
  else
  {
    [(PKAccountPromotion *)self setLayoutDictionary:0];
  }
}

- (double)timeRemaining
{
  endDate = self->_endDate;
  if (!endDate) {
    return 0.0;
  }
  [(NSDate *)endDate timeIntervalSinceNow];
  return result;
}

- (BOOL)hideTimeRemaining
{
  layoutDictionary = self->_layoutDictionary;
  if (layoutDictionary) {
    LOBYTE(layoutDictionary) = [(NSDictionary *)layoutDictionary PKBoolForKey:@"hideTimeRemaining"];
  }
  return (char)layoutDictionary;
}

- (BOOL)expiringSoon
{
  [(PKAccountPromotion *)self timeRemaining];
  return v2 < 432000.0;
}

- (BOOL)isInTerminalState
{
  return self->_state - 3 < 2;
}

- (void)incrementImpressionCount
{
}

- (void)resetImpressionCount
{
  self->_impressionCount = 0;
}

- (void)_updateState
{
  BOOL v3 = [(PKAccountPromotion *)self _completed];
  BOOL v4 = [(PKAccountPromotion *)self _startDateHasPassed];
  BOOL v5 = [(PKAccountPromotion *)self _endDateHasPassed];
  unint64_t v6 = 2;
  if (v3) {
    unint64_t v6 = 3;
  }
  if (v4)
  {
    if (!v3 && v5)
    {
      if ([(PKAccountPromotion *)self _isOngoing]
        && [(PKAccountPromotion *)self _hasNonZeroProgress])
      {
        unint64_t v6 = 3;
      }
      else
      {
        unint64_t v6 = 4;
      }
    }
  }
  else
  {
    unint64_t v6 = 1;
  }
  self->_state = v6;
}

- (BOOL)_startDateHasPassed
{
  BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(self) = [v3 compare:self->_startDate] == 1;

  return (char)self;
}

- (BOOL)_endDateHasPassed
{
  BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(self) = [v3 compare:self->_endDate] == 1;

  return (char)self;
}

- (BOOL)_isOngoing
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v2 = [(PKAccountPromotion *)self completionSteps];
  if ([v2 count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          id v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "endValue", (void)v9);

          if (!v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (BOOL)_hasNonZeroProgress
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v2 = [(PKAccountPromotion *)self completionSteps];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = [*(id *)(*((void *)&v10 + 1) + 8 * i) currentValue];
        id v7 = [MEMORY[0x1E4F28C28] zero];
        uint64_t v8 = [v6 compare:v7];

        if (v8 == 1)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_completed
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_completionSteps count]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(PKAccountPromotion *)self completionSteps];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (![*(id *)(*((void *)&v10 + 1) + 8 * i) completed])
        {
          BOOL v8 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_programIdentifier;
}

- (NSString)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"programIdentifier: '%@'; ", self->_programIdentifier];
  unint64_t type = self->_type;
  if (type > 5) {
    uint64_t v5 = @"unknown";
  }
  else {
    uint64_t v5 = off_1E56F17C8[type];
  }
  [v3 appendFormat:@"type: '%@'; ", v5];
  uint64_t v6 = PKLongDateString(self->_startDate);
  [v3 appendFormat:@"startDate: '%@'; ", v6];

  id v7 = PKLongDateString(self->_endDate);
  [v3 appendFormat:@"endDate: '%@'; ", v7];

  [v3 appendFormat:@"name: '%@'; ", self->_name];
  [v3 appendFormat:@"terms: '%@'; ", self->_termsURL];
  [v3 appendFormat:@"templateID: '%@'; ", self->_templateIdentifier];
  [v3 appendFormat:@"completionSteps: \n"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v8 = self->_completionSteps;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) description];
        [v3 appendFormat:@"- %@\n", v13];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [v3 appendFormat:@"layout: %@\n", self->_layoutDictionary];
  objc_msgSend(v3, "appendFormat:", @"impressionCount: %ld\n", self->_impressionCount);
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKAccountPromotion *)a3;
  uint64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountPromotion *)self isEqualToAccountPromotion:v5];

  return v6;
}

- (BOOL)isEqualToAccountPromotion:(id)a3
{
  uint64_t v4 = (id *)a3;
  if (!v4) {
    goto LABEL_32;
  }
  if ([(NSDictionary *)self->_layoutDictionary count]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = [v4[12] count] == 0;
  }
  layoutDictionary = self->_layoutDictionary;
  id v7 = (NSDictionary *)v4[12];
  if (layoutDictionary && v7) {
    int v8 = -[NSDictionary isEqual:](layoutDictionary, "isEqual:");
  }
  else {
    int v8 = layoutDictionary == v7;
  }
  id v9 = v4[2];
  uint64_t v10 = self->_programIdentifier;
  uint64_t v11 = (NSString *)v9;
  if (v10 == v11)
  {
  }
  else
  {
    long long v12 = v11;
    if (!v10 || !v11) {
      goto LABEL_31;
    }
    BOOL v13 = [(NSString *)v10 isEqualToString:v11];

    if (!v13) {
      goto LABEL_32;
    }
  }
  if (self->_type != v4[3]) {
    goto LABEL_32;
  }
  startDate = self->_startDate;
  long long v15 = (NSDate *)v4[4];
  if (startDate && v15)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0) {
      goto LABEL_32;
    }
  }
  else if (startDate != v15)
  {
    goto LABEL_32;
  }
  endDate = self->_endDate;
  long long v17 = (NSDate *)v4[5];
  if (endDate && v17)
  {
    if ((-[NSDate isEqual:](endDate, "isEqual:") & 1) == 0) {
      goto LABEL_32;
    }
  }
  else if (endDate != v17)
  {
    goto LABEL_32;
  }
  id v18 = v4[6];
  uint64_t v10 = self->_name;
  v19 = (NSString *)v18;
  if (v10 != v19)
  {
    long long v12 = v19;
    if (v10 && v19)
    {
      BOOL v20 = [(NSString *)v10 isEqualToString:v19];

      if (!v20) {
        goto LABEL_32;
      }
      goto LABEL_35;
    }
LABEL_31:

    goto LABEL_32;
  }

LABEL_35:
  completionSteps = self->_completionSteps;
  v24 = (NSArray *)v4[7];
  if (completionSteps && v24)
  {
    if ((-[NSArray isEqual:](completionSteps, "isEqual:") & 1) == 0) {
      goto LABEL_32;
    }
  }
  else if (completionSteps != v24)
  {
    goto LABEL_32;
  }
  termsURL = self->_termsURL;
  v26 = (NSURL *)v4[9];
  if (termsURL && v26)
  {
    if ((-[NSURL isEqual:](termsURL, "isEqual:") & 1) == 0) {
      goto LABEL_32;
    }
  }
  else if (termsURL != v26)
  {
    goto LABEL_32;
  }
  int v27 = v8 | v5;
  templateIdentifier = self->_templateIdentifier;
  v29 = (NSString *)v4[10];
  if (templateIdentifier && v29) {
    int v30 = -[NSString isEqual:](templateIdentifier, "isEqual:");
  }
  else {
    int v30 = templateIdentifier == v29;
  }
  if ((v30 & v27) == 1)
  {
    BOOL v21 = self->_impressionCount == (void)v4[8];
    goto LABEL_33;
  }
LABEL_32:
  BOOL v21 = 0;
LABEL_33:

  return v21;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_programIdentifier];
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_endDate];
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_completionSteps];
  [v3 safelyAddObject:self->_termsURL];
  [v3 safelyAddObject:self->_templateIdentifier];
  [v3 safelyAddObject:self->_layoutDictionary];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_impressionCount - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPromotion)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKAccountPromotion;
  unint64_t v5 = [(PKAccountPromotion *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"programIdentifier"];
    programIdentifier = v5->_programIdentifier;
    v5->_programIdentifier = (NSString *)v6;

    int v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_unint64_t type = PKAccountPromotionTypeFromString(v8);

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v13;

    long long v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    id v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"completionSteps"];
    completionSteps = v5->_completionSteps;
    v5->_completionSteps = (NSArray *)v19;

    BOOL v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layout"];
    [(PKAccountPromotion *)v5 setLayoutDictionaryFromData:v21];
    v5->_impressionCount = [v4 decodeIntegerForKey:@"impressionCount"];
    [(PKAccountPromotion *)v5 _updateState];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  programIdentifier = self->_programIdentifier;
  id v8 = a3;
  [v8 encodeObject:programIdentifier forKey:@"programIdentifier"];
  unint64_t type = self->_type;
  if (type > 5) {
    uint64_t v6 = @"unknown";
  }
  else {
    uint64_t v6 = off_1E56F17C8[type];
  }
  [v8 encodeObject:v6 forKey:@"type"];
  [v8 encodeObject:self->_startDate forKey:@"startDate"];
  [v8 encodeObject:self->_endDate forKey:@"endDate"];
  [v8 encodeObject:self->_name forKey:@"name"];
  [v8 encodeObject:self->_completionSteps forKey:@"completionSteps"];
  id v7 = [(PKAccountPromotion *)self layoutData];
  [v8 encodeObject:v7 forKey:@"layout"];

  [v8 encodeInteger:self->_impressionCount forKey:@"impressionCount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_programIdentifier copyWithZone:a3];
  id v7 = (void *)v5[2];
  v5[2] = v6;

  v5[3] = self->_type;
  uint64_t v8 = [(NSDate *)self->_startDate copyWithZone:a3];
  uint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSDate *)self->_endDate copyWithZone:a3];
  uint64_t v11 = (void *)v5[5];
  v5[5] = v10;

  uint64_t v12 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v13 = (void *)v5[6];
  v5[6] = v12;

  completionSteps = self->_completionSteps;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __35__PKAccountPromotion_copyWithZone___block_invoke;
  v20[3] = &__block_descriptor_40_e42__16__0__PKAccountPromotionCompletionStep_8l;
  v20[4] = a3;
  uint64_t v15 = [(NSArray *)completionSteps pk_arrayBySafelyApplyingBlock:v20];
  uint64_t v16 = (void *)v5[7];
  v5[7] = v15;

  uint64_t v17 = [(PKAccountPromotion *)self layoutData];
  id v18 = (void *)[v17 copyWithZone:a3];
  [v5 setLayoutDictionaryFromData:v18];
  v5[8] = self->_impressionCount;
  [v5 _updateState];

  return v5;
}

id __35__PKAccountPromotion_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  double v2 = (void *)[a2 copyWithZone:*(void *)(a1 + 32)];
  return v2;
}

- (NSString)programIdentifier
{
  return self->_programIdentifier;
}

- (void)setProgramIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)completionSteps
{
  return self->_completionSteps;
}

- (int64_t)impressionCount
{
  return self->_impressionCount;
}

- (void)setImpressionCount:(int64_t)a3
{
  self->_impressionCount = a3;
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
}

- (NSString)templateIdentifier
{
  return self->_templateIdentifier;
}

- (void)setTemplateIdentifier:(id)a3
{
}

- (PKDynamicTemplateLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (NSDictionary)layoutDictionary
{
  return self->_layoutDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutDictionary, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_templateIdentifier, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_completionSteps, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_programIdentifier, 0);
}

@end