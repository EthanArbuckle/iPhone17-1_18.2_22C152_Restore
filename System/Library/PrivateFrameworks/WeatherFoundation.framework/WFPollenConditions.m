@interface WFPollenConditions
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (WFPollenConditions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)grassIndex;
- (unint64_t)ragweedIndex;
- (unint64_t)timeOfDay;
- (unint64_t)treeIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setGrassIndex:(unint64_t)a3;
- (void)setRagweedIndex:(unint64_t)a3;
- (void)setTimeOfDay:(unint64_t)a3;
- (void)setTreeIndex:(unint64_t)a3;
@end

@implementation WFPollenConditions

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = [(WFPollenConditions *)self date];
  uint64_t v7 = [v6 copyWithZone:a3];
  v8 = (void *)v5[1];
  v5[1] = v7;

  v5[2] = [(WFPollenConditions *)self timeOfDay];
  v5[3] = [(WFPollenConditions *)self grassIndex];
  v5[4] = [(WFPollenConditions *)self ragweedIndex];
  v5[5] = [(WFPollenConditions *)self treeIndex];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFPollenConditions)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFPollenConditions;
  v5 = [(WFPollenConditions *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFPollenConditionsDateKey"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v5->_timeOfDay = [v4 decodeIntegerForKey:@"WFPollenConditionsTimeOfDayKey"];
    v5->_grassIndex = [v4 decodeIntegerForKey:@"WFPollenConditionsGrassIndexKey"];
    v5->_ragweedIndex = [v4 decodeIntegerForKey:@"WFPollenConditionsRagweedIndexKey"];
    v5->_treeIndex = [v4 decodeIntegerForKey:@"WFPollenConditionsTreeIndexKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(WFPollenConditions *)self date];
  [v5 encodeObject:v4 forKey:@"WFPollenConditionsDateKey"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[WFPollenConditions timeOfDay](self, "timeOfDay"), @"WFPollenConditionsTimeOfDayKey");
  objc_msgSend(v5, "encodeInteger:forKey:", -[WFPollenConditions grassIndex](self, "grassIndex"), @"WFPollenConditionsGrassIndexKey");
  objc_msgSend(v5, "encodeInteger:forKey:", -[WFPollenConditions ragweedIndex](self, "ragweedIndex"), @"WFPollenConditionsRagweedIndexKey");
  objc_msgSend(v5, "encodeInteger:forKey:", -[WFPollenConditions treeIndex](self, "treeIndex"), @"WFPollenConditionsTreeIndexKey");
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (void)setTimeOfDay:(unint64_t)a3
{
  self->_timeOfDay = a3;
}

- (unint64_t)grassIndex
{
  return self->_grassIndex;
}

- (void)setGrassIndex:(unint64_t)a3
{
  self->_grassIndex = a3;
}

- (unint64_t)ragweedIndex
{
  return self->_ragweedIndex;
}

- (void)setRagweedIndex:(unint64_t)a3
{
  self->_ragweedIndex = a3;
}

- (unint64_t)treeIndex
{
  return self->_treeIndex;
}

- (void)setTreeIndex:(unint64_t)a3
{
  self->_treeIndex = a3;
}

- (void).cxx_destruct
{
}

@end