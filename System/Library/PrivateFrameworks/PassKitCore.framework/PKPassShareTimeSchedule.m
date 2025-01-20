@interface PKPassShareTimeSchedule
+ (BOOL)supportsSecureCoding;
+ (id)emptySchedule;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPassShareTimeSchedule:(id)a3;
- (NSArray)daysOfMonth;
- (NSArray)daysOfWeek;
- (NSArray)hoursOfDay;
- (PKPassShareTimeSchedule)initWithCoder:(id)a3;
- (PKPassShareTimeSchedule)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)intersect:(id)a3;
- (unint64_t)frequency;
- (unint64_t)hash;
- (unint64_t)interval;
- (void)encodeWithCoder:(id)a3;
- (void)setDaysOfMonth:(id)a3;
- (void)setDaysOfWeek:(id)a3;
- (void)setFrequency:(unint64_t)a3;
- (void)setHoursOfDay:(id)a3;
- (void)setInterval:(unint64_t)a3;
@end

@implementation PKPassShareTimeSchedule

+ (id)emptySchedule
{
  v2 = objc_alloc_init(PKPassShareTimeSchedule);
  [(PKPassShareTimeSchedule *)v2 setInterval:1];
  [(PKPassShareTimeSchedule *)v2 setFrequency:2];
  return v2;
}

- (PKPassShareTimeSchedule)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)PKPassShareTimeSchedule;
    v5 = [(PKPassShareTimeSchedule *)&v16 init];
    if (v5)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__PKPassShareTimeSchedule_initWithDictionary___block_invoke;
      aBlock[3] = &unk_1E56E7B78;
      id v6 = v4;
      id v15 = v6;
      v7 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
      v8 = v7[2](v7, @"hoursOfDay");
      [(PKPassShareTimeSchedule *)v5 setHoursOfDay:v8];

      v9 = v7[2](v7, @"daysOfTheWeek");
      [(PKPassShareTimeSchedule *)v5 setDaysOfWeek:v9];

      v10 = v7[2](v7, @"daysOfTheMonth");
      [(PKPassShareTimeSchedule *)v5 setDaysOfMonth:v10];

      v5->_interval = [v6 PKIntegerForKey:@"interval"];
      v11 = [v6 PKStringForKey:@"frequency"];
      v5->_frequency = PKPassShareTimeScheduleFrequencyFromString(v11);
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __46__PKPassShareTimeSchedule_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) PKArrayContaining:objc_opt_class() forKey:v3];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [*(id *)(a1 + 32) PKArrayContaining:objc_opt_class() forKey:v3];
    objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_140);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

uint64_t __46__PKPassShareTimeSchedule_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 integerValue];
  return [v2 numberWithInteger:v3];
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NSArray *)self->_hoursOfDay pk_arrayByApplyingBlock:&__block_literal_global_159];
  [v3 setObject:v4 forKeyedSubscript:@"hoursOfDay"];

  v5 = [(NSArray *)self->_daysOfWeek pk_arrayByApplyingBlock:&__block_literal_global_161];
  [v3 setObject:v5 forKeyedSubscript:@"daysOfTheWeek"];

  id v6 = [(NSArray *)self->_daysOfMonth pk_arrayByApplyingBlock:&__block_literal_global_163];
  [v3 setObject:v6 forKeyedSubscript:@"daysOfTheMonth"];

  if (self->_interval)
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v7 forKeyedSubscript:@"interval"];
  }
  switch(self->_frequency)
  {
    case 0uLL:
      goto LABEL_9;
    case 1uLL:
      v8 = @"day";
      goto LABEL_8;
    case 2uLL:
      v8 = @"week";
      goto LABEL_8;
    case 3uLL:
      v8 = @"month";
      goto LABEL_8;
    default:
      v8 = @"none";
LABEL_8:
      [v3 setObject:v8 forKeyedSubscript:@"frequency"];
LABEL_9:
      v9 = (void *)[v3 copy];

      return v9;
  }
}

uint64_t __51__PKPassShareTimeSchedule_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

uint64_t __51__PKPassShareTimeSchedule_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

uint64_t __51__PKPassShareTimeSchedule_dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

- (void)setHoursOfDay:(id)a3
{
  id v4 = [a3 sortedArrayUsingComparator:&__block_literal_global_166_0];
  hoursOfDay = self->_hoursOfDay;
  self->_hoursOfDay = v4;
}

uint64_t __41__PKPassShareTimeSchedule_setHoursOfDay___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setDaysOfWeek:(id)a3
{
  id v4 = [a3 sortedArrayUsingComparator:&__block_literal_global_168];
  daysOfWeek = self->_daysOfWeek;
  self->_daysOfWeek = v4;
}

uint64_t __41__PKPassShareTimeSchedule_setDaysOfWeek___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setDaysOfMonth:(id)a3
{
  id v4 = [a3 sortedArrayUsingComparator:&__block_literal_global_170_1];
  daysOfMonth = self->_daysOfMonth;
  self->_daysOfMonth = v4;
}

uint64_t __42__PKPassShareTimeSchedule_setDaysOfMonth___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)intersect:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __37__PKPassShareTimeSchedule_intersect___block_invoke;
    v19 = &unk_1E56E7BC0;
    v20 = self;
    id v6 = v4;
    id v21 = v6;
    v7 = (void (**)(void *, void *))_Block_copy(&v16);
    v8 = v7[2](v7, &__block_literal_global_175);
    v9 = v8;
    if (v8 && !objc_msgSend(v8, "count", v16, v17, v18, v19, v20))
    {
      v14 = 0;
    }
    else
    {
      v10 = v7[2](v7, &__block_literal_global_177);
      v11 = v10;
      if (v10 && ![v10 count])
      {
        v14 = 0;
      }
      else
      {
        v12 = v7[2](v7, &__block_literal_global_179_0);
        v13 = v12;
        if ((!v12 || [v12 count]) && self->_interval == v6[4] && self->_frequency == v6[5])
        {
          v14 = objc_alloc_init(PKPassShareTimeSchedule);
          [(PKPassShareTimeSchedule *)v14 setHoursOfDay:v9];
          [(PKPassShareTimeSchedule *)v14 setDaysOfWeek:v11];
          [(PKPassShareTimeSchedule *)v14 setDaysOfMonth:v13];
          [(PKPassShareTimeSchedule *)v14 setInterval:self->_interval];
          [(PKPassShareTimeSchedule *)v14 setFrequency:self->_frequency];
        }
        else
        {
          v14 = 0;
        }
      }
    }
  }
  else
  {
    v14 = self;
  }

  return v14;
}

id __37__PKPassShareTimeSchedule_intersect___block_invoke(uint64_t a1, void *a2)
{
  id v4 = (void (**)(id, void))(a2 + 2);
  id v3 = (void (*)(void))a2[2];
  v5 = a2;
  id v6 = v3();
  if ([v6 count]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  unint64_t v8 = v7;

  v9 = (*v4)(v5, *(void *)(a1 + 40));

  if ([v9 count]) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  unint64_t v11 = v10;

  v12 = 0;
  if (v8 | v11)
  {
    if (v8) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      id v17 = (id)v8;
      v12 = v6;
    }
    else
    {
      if (v8) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = v11 == 0;
      }
      if (v14)
      {
        id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v8];
        uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
        [v15 intersectSet:v16];
        v12 = [v15 allObjects];
      }
      else
      {
        id v18 = (id)v11;
        v12 = v9;
      }
    }
  }

  return v12;
}

uint64_t __37__PKPassShareTimeSchedule_intersect___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hoursOfDay];
}

uint64_t __37__PKPassShareTimeSchedule_intersect___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 daysOfWeek];
}

uint64_t __37__PKPassShareTimeSchedule_intersect___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 daysOfMonth];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassShareTimeSchedule)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPassShareTimeSchedule;
  v5 = [(PKPassShareTimeSchedule *)&v18 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    unint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"hoursOfDay"];
    hoursOfDay = v5->_hoursOfDay;
    v5->_hoursOfDay = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"daysOfWeek"];
    daysOfWeek = v5->_daysOfWeek;
    v5->_daysOfWeek = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:@"daysOfMonth"];
    daysOfMonth = v5->_daysOfMonth;
    v5->_daysOfMonth = (NSArray *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interval"];
    v5->_interval = [v15 unsignedIntegerValue];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frequency"];
    v5->_frequency = PKPassShareTimeScheduleFrequencyFromString(v16);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  hoursOfDay = self->_hoursOfDay;
  id v8 = a3;
  [v8 encodeObject:hoursOfDay forKey:@"hoursOfDay"];
  [v8 encodeObject:self->_daysOfWeek forKey:@"daysOfWeek"];
  [v8 encodeObject:self->_daysOfMonth forKey:@"daysOfMonth"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_interval];
  [v8 encodeObject:v5 forKey:@"interval"];

  unint64_t v6 = self->_frequency - 1;
  if (v6 > 2) {
    uint64_t v7 = @"none";
  }
  else {
    uint64_t v7 = off_1E56E7C18[v6];
  }
  [v8 encodeObject:v7 forKey:@"frequency"];
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"hoursOfDay: '%@'; ", self->_hoursOfDay];
  [v6 appendFormat:@"daysOfWeek: '%@'; ", self->_daysOfWeek];
  [v6 appendFormat:@"daysOfMonth: '%@'; ", self->_daysOfMonth];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_interval];
  [v6 appendFormat:@"interval: '%@'; ", v7];

  id v8 = [NSNumber numberWithUnsignedInteger:self->_frequency];
  [v6 appendFormat:@"frequency: '%@'; ", v8];

  [v6 appendFormat:@">"];
  uint64_t v9 = [NSString stringWithString:v6];

  return v9;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_hoursOfDay) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_daysOfWeek) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_daysOfMonth) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  unint64_t v6 = self->_interval - v5 + 32 * v5;
  unint64_t v7 = self->_frequency - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPassShareTimeSchedule *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassShareTimeSchedule *)self isEqualToPassShareTimeSchedule:v5];

  return v6;
}

- (BOOL)isEqualToPassShareTimeSchedule:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_22;
  }
  hoursOfDay = self->_hoursOfDay;
  BOOL v6 = (NSArray *)v4[1];
  if (hoursOfDay) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (hoursOfDay != v6) {
      goto LABEL_22;
    }
  }
  else if ((-[NSArray isEqual:](hoursOfDay, "isEqual:") & 1) == 0)
  {
    goto LABEL_22;
  }
  daysOfWeek = self->_daysOfWeek;
  uint64_t v9 = (NSArray *)v4[2];
  if (daysOfWeek && v9)
  {
    if ((-[NSArray isEqual:](daysOfWeek, "isEqual:") & 1) == 0) {
      goto LABEL_22;
    }
  }
  else if (daysOfWeek != v9)
  {
    goto LABEL_22;
  }
  daysOfMonth = self->_daysOfMonth;
  uint64_t v11 = (NSArray *)v4[3];
  if (!daysOfMonth || !v11)
  {
    if (daysOfMonth == v11) {
      goto LABEL_20;
    }
LABEL_22:
    BOOL v12 = 0;
    goto LABEL_23;
  }
  if ((-[NSArray isEqual:](daysOfMonth, "isEqual:") & 1) == 0) {
    goto LABEL_22;
  }
LABEL_20:
  if (self->_interval != v4[4]) {
    goto LABEL_22;
  }
  BOOL v12 = self->_frequency == v4[5];
LABEL_23:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PKPassShareTimeSchedule allocWithZone:a3] init];
  uint64_t v5 = [(NSArray *)self->_hoursOfDay copy];
  hoursOfDay = v4->_hoursOfDay;
  v4->_hoursOfDay = (NSArray *)v5;

  uint64_t v7 = [(NSArray *)self->_daysOfWeek copy];
  daysOfWeek = v4->_daysOfWeek;
  v4->_daysOfWeek = (NSArray *)v7;

  uint64_t v9 = [(NSArray *)self->_daysOfMonth copy];
  daysOfMonth = v4->_daysOfMonth;
  v4->_daysOfMonth = (NSArray *)v9;

  v4->_interval = self->_interval;
  v4->_frequency = self->_frequency;
  return v4;
}

- (NSArray)hoursOfDay
{
  return self->_hoursOfDay;
}

- (NSArray)daysOfWeek
{
  return self->_daysOfWeek;
}

- (NSArray)daysOfMonth
{
  return self->_daysOfMonth;
}

- (unint64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(unint64_t)a3
{
  self->_interval = a3;
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(unint64_t)a3
{
  self->_frequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysOfMonth, 0);
  objc_storeStrong((id *)&self->_daysOfWeek, 0);
  objc_storeStrong((id *)&self->_hoursOfDay, 0);
}

@end