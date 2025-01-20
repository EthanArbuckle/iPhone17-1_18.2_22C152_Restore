@interface HKMHDaySummary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMHDaySummary)initWithCoder:(id)a3;
- (HKMHDaySummary)initWithDayIndex:(int64_t)a3 momentaryStatesOfMind:(id)a4 dailyStateOfMind:(id)a5;
- (HKStateOfMind)dailyStateOfMind;
- (NSArray)momentaryStatesOfMind;
- (id)description;
- (int64_t)dayIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDailyStateOfMind:(id)a3;
@end

@implementation HKMHDaySummary

- (HKMHDaySummary)initWithDayIndex:(int64_t)a3 momentaryStatesOfMind:(id)a4 dailyStateOfMind:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKMHDaySummary;
  v10 = [(HKMHDaySummary *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_dayIndex = a3;
    uint64_t v12 = [v8 copy];
    momentaryStatesOfMind = v11->_momentaryStatesOfMind;
    v11->_momentaryStatesOfMind = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    dailyStateOfMind = v11->_dailyStateOfMind;
    v11->_dailyStateOfMind = (HKStateOfMind *)v14;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if (self->_dayIndex != v5[1] || ![(NSArray *)self->_momentaryStatesOfMind isEqualToArray:v5[2]]) {
      goto LABEL_8;
    }
    dailyStateOfMind = self->_dailyStateOfMind;
    v7 = (HKStateOfMind *)v5[3];
    if (dailyStateOfMind == v7)
    {
      char v8 = 1;
      goto LABEL_9;
    }
    if (v7) {
      char v8 = -[HKStateOfMind isEqual:](dailyStateOfMind, "isEqual:");
    }
    else {
LABEL_8:
    }
      char v8 = 0;
LABEL_9:

    goto LABEL_10;
  }
  char v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)hash
{
  int64_t dayIndex = self->_dayIndex;
  uint64_t v4 = [(NSArray *)self->_momentaryStatesOfMind hash] ^ dayIndex;
  return v4 ^ [(HKStateOfMind *)self->_dailyStateOfMind hash];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [NSNumber numberWithInteger:self->_dayIndex];
  v6 = [v3 stringWithFormat:@"<%@:%p index:%@ dailyState:%@ states:%@>", v4, self, v5, self->_dailyStateOfMind, self->_momentaryStatesOfMind];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHDaySummary)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"DayIndex"];
  v6 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"MomentaryStatesOfMind"];

  char v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DailyStateOfMind"];

  id v9 = [(HKMHDaySummary *)self initWithDayIndex:v5 momentaryStatesOfMind:v7 dailyStateOfMind:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t dayIndex = self->_dayIndex;
  id v5 = a3;
  [v5 encodeInteger:dayIndex forKey:@"DayIndex"];
  [v5 encodeObject:self->_momentaryStatesOfMind forKey:@"MomentaryStatesOfMind"];
  [v5 encodeObject:self->_dailyStateOfMind forKey:@"DailyStateOfMind"];
}

- (int64_t)dayIndex
{
  return self->_dayIndex;
}

- (NSArray)momentaryStatesOfMind
{
  return self->_momentaryStatesOfMind;
}

- (HKStateOfMind)dailyStateOfMind
{
  return self->_dailyStateOfMind;
}

- (void)setDailyStateOfMind:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyStateOfMind, 0);
  objc_storeStrong((id *)&self->_momentaryStatesOfMind, 0);
}

@end