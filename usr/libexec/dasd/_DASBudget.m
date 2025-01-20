@interface _DASBudget
+ (BOOL)supportsSecureCoding;
+ (id)budgetWithName:(id)a3 capacity:(double)a4 allocationType:(unsigned __int8)a5 lastModulatedDate:(id)a6;
+ (id)budgetWithName:(id)a3 capacity:(double)a4 balance:(double)a5 allocationType:(unsigned __int8)a6 lastModulatedDate:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPositive;
- (BOOL)unlockedDecrementBy:(double)a3 whileModulatingBudget:(BOOL)a4;
- (NSDate)lastModulatedDate;
- (NSString)name;
- (_DASBudget)initWithCoder:(id)a3;
- (_DASBudget)initWithDictionary:(id)a3;
- (_DASBudget)initWithName:(id)a3 capacity:(double)a4 balance:(double)a5 allocationType:(unsigned __int8)a6 lastModulatedDate:(id)a7;
- (double)balance;
- (double)capacity;
- (double)maxBudgetValue;
- (double)minBudgetValue;
- (id)callback;
- (id)description;
- (id)dictionaryRepresentation;
- (os_unfair_lock_s)lock;
- (unint64_t)hash;
- (unsigned)allocationType;
- (void)decrementBy:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)incrementBy:(double)a3;
- (void)registerSignificantBudgetChangeCallback:(id)a3;
- (void)setAllocationType:(unsigned __int8)a3;
- (void)setBalance:(double)a3;
- (void)setCallback:(id)a3;
- (void)setCapacity:(double)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMaxBudgetValue:(double)a3;
- (void)setMinBudgetValue:(double)a3;
@end

@implementation _DASBudget

- (_DASBudget)initWithName:(id)a3 capacity:(double)a4 balance:(double)a5 allocationType:(unsigned __int8)a6 lastModulatedDate:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)_DASBudget;
  v14 = [(_DASBudget *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    v15->_capacity = a4;
    v15->_balance = a5;
    v15->_allocationType = a6;
    objc_storeStrong((id *)&v15->_lastModulatedDate, a7);
    *(float64x2_t *)&v15->_maxBudgetValue = vmulq_n_f64((float64x2_t)xmmword_100126730, a4);
    v15->_lock._os_unfair_lock_opaque = 0;
  }

  return v15;
}

- (_DASBudget)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"name"];
  if (v5)
  {
    v6 = (void *)v5;
    uint64_t v7 = [v4 objectForKeyedSubscript:@"capacity"];
    if (!v7)
    {
      v9 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v8 = (void *)v7;
    v9 = [v4 objectForKeyedSubscript:@"balance"];
    if (!v9)
    {
LABEL_11:

      goto LABEL_12;
    }
    v10 = [v4 objectForKeyedSubscript:@"allocationType"];

    if (v10)
    {
      v11 = [v4 objectForKeyedSubscript:@"lastModulatedDateInterval"];
      [v11 doubleValue];
      double v13 = v12;

      v6 = [v4 objectForKeyedSubscript:@"name"];
      v8 = [v4 objectForKeyedSubscript:@"capacity"];
      [v8 doubleValue];
      double v15 = v14;
      v16 = [v4 objectForKeyedSubscript:@"balance"];
      [v16 doubleValue];
      double v18 = v17;
      v19 = [v4 objectForKeyedSubscript:@"allocationType"];
      unsigned __int8 v20 = [v19 intValue];
      unsigned __int8 v21 = v20;
      if (v13 <= 0.0)
      {
        self = [(_DASBudget *)self initWithName:v6 capacity:v20 balance:0 allocationType:v15 lastModulatedDate:v18];
      }
      else
      {
        v22 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v13];
        self = [(_DASBudget *)self initWithName:v6 capacity:v21 balance:v22 allocationType:v15 lastModulatedDate:v18];
      }
      v9 = self;
      goto LABEL_11;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

+ (id)budgetWithName:(id)a3 capacity:(double)a4 allocationType:(unsigned __int8)a5 lastModulatedDate:(id)a6
{
  uint64_t v6 = a5;
  id v9 = a6;
  id v10 = a3;
  id v11 = [objc_alloc((Class)objc_opt_class()) initWithName:v10 capacity:v6 balance:v9 allocationType:a4 lastModulatedDate:a4];

  return v11;
}

+ (id)budgetWithName:(id)a3 capacity:(double)a4 balance:(double)a5 allocationType:(unsigned __int8)a6 lastModulatedDate:(id)a7
{
  uint64_t v7 = a6;
  id v11 = a7;
  id v12 = a3;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithName:v12 capacity:v7 balance:v11 allocationType:a4 lastModulatedDate:a5];

  return v13;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(_DASBudget *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  [(_DASBudget *)self capacity];
  uint64_t v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v5 forKeyedSubscript:@"capacity"];

  [(_DASBudget *)self balance];
  uint64_t v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v6 forKeyedSubscript:@"balance"];

  uint64_t v7 = +[NSNumber numberWithUnsignedChar:[(_DASBudget *)self allocationType]];
  [v3 setObject:v7 forKeyedSubscript:@"allocationType"];

  v8 = [(_DASBudget *)self lastModulatedDate];

  if (v8)
  {
    id v9 = [(_DASBudget *)self lastModulatedDate];
    [v9 timeIntervalSinceReferenceDate];
    id v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v10 forKeyedSubscript:@"lastModulatedDateInterval"];
  }
  id v11 = [v3 copy];

  return v11;
}

- (void)registerSignificantBudgetChangeCallback:(id)a3
{
  self->_callback = objc_retainBlock(a3);

  _objc_release_x1();
}

- (BOOL)isPositive
{
  return self->_balance > 0.0;
}

- (BOOL)unlockedDecrementBy:(double)a3 whileModulatingBudget:(BOOL)a4
{
  double balance = self->_balance;
  double maxBudgetValue = balance - a3;
  if (self->_maxBudgetValue < maxBudgetValue) {
    double maxBudgetValue = self->_maxBudgetValue;
  }
  if (self->_minBudgetValue >= maxBudgetValue) {
    double minBudgetValue = self->_minBudgetValue;
  }
  else {
    double minBudgetValue = maxBudgetValue;
  }
  self->_double balance = minBudgetValue;
  if (a4)
  {
    v8 = +[NSDate now];
    lastModulatedDate = self->_lastModulatedDate;
    self->_lastModulatedDate = v8;
  }
  return (balance > 0.0) ^ (minBudgetValue > 0.0);
}

- (void)decrementBy:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v6 = [(_DASBudget *)self unlockedDecrementBy:0 whileModulatingBudget:a3];
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    id callback = self->_callback;
    if (callback)
    {
      v8 = (void (*)(void))*((void *)callback + 2);
      v8();
    }
  }
}

- (void)incrementBy:(double)a3
{
}

- (void)setBalance:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v6 = [(_DASBudget *)self unlockedDecrementBy:1 whileModulatingBudget:self->_balance - a3];
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    id callback = self->_callback;
    if (callback)
    {
      v8 = (void (*)(void))*((void *)callback + 2);
      v8();
    }
  }
}

- (void)setCapacity:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v6 = a3 * -1.2;
  double balance = self->_balance;
  if (a3 * 1.5 < balance) {
    double balance = a3 * 1.5;
  }
  self->_double maxBudgetValue = a3 * 1.5;
  self->_double minBudgetValue = v6;
  if (v6 >= balance) {
    double v8 = a3 * -1.2;
  }
  else {
    double v8 = balance;
  }
  self->_capacity = a3;
  self->_double balance = v8;

  os_unfair_lock_unlock(p_lock);
}

- (void)setAllocationType:(unsigned __int8)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_allocationType = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DASBudget *)a3;
  if (self == v4)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      name = self->_name;
      double v6 = [(_DASBudget *)v4 name];
      unsigned __int8 v7 = [(NSString *)name isEqual:v6];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  unsigned int v3 = [(NSString *)self->_name isEqualToString:@"com.apple.dasd.remoteWidget"];
  name = self->_name;
  double capacity = self->_capacity;
  if (v3) {
    +[NSString stringWithFormat:@"<_DASBudget %@: %12.2lf/%12.2lf Last Modulated: %@>", name, *(void *)&self->_balance, *(void *)&capacity, self->_lastModulatedDate];
  }
  else {
  double v6 = +[NSString stringWithFormat:@"<_DASBudget %@: %12.2lf/%12.2lf>", name, *(void *)&self->_balance, *(void *)&capacity, v8];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_name forKey:@"name"];
  [v6 encodeDouble:@"capacity" forKey:self->_capacity];
  [v6 encodeDouble:@"balance" forKey:self->_balance];
  [v6 encodeInteger:self->_allocationType forKey:@"type"];
  lastModulatedDate = self->_lastModulatedDate;
  if (lastModulatedDate) {
    [(NSDate *)lastModulatedDate timeIntervalSinceReferenceDate];
  }
  else {
    double v5 = 0.0;
  }
  [v6 encodeDouble:@"lastModulatedDateInterval" forKey:v5];
}

- (_DASBudget)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  [v4 decodeDoubleForKey:@"capacity"];
  double v7 = v6;
  unsigned __int8 v8 = [v4 decodeIntegerForKey:@"type"];
  if (v5 || v7 != 0.0)
  {
    [v4 decodeDoubleForKey:@"balance"];
    double v11 = v10;
    [v4 decodeDoubleForKey:@"lastModulatedDateInterval"];
    if (v12 <= 0.0)
    {
      id v16 = objc_alloc((Class)objc_opt_class());
      if (v11 == 0.0) {
        double v17 = v7;
      }
      else {
        double v17 = v11;
      }
      id v9 = (_DASBudget *)[v16 initWithName:v5 capacity:v8 balance:0 allocationType:v7 lastModulatedDate:v17];
    }
    else
    {
      id v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      id v14 = objc_alloc((Class)objc_opt_class());
      if (v11 == 0.0) {
        double v15 = v7;
      }
      else {
        double v15 = v11;
      }
      id v9 = (_DASBudget *)[v14 initWithName:v5 capacity:v8 balance:v13 allocationType:v7 lastModulatedDate:v15];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (double)capacity
{
  return self->_capacity;
}

- (unsigned)allocationType
{
  return self->_allocationType;
}

- (double)balance
{
  return self->_balance;
}

- (NSDate)lastModulatedDate
{
  return self->_lastModulatedDate;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (double)maxBudgetValue
{
  return self->_maxBudgetValue;
}

- (void)setMaxBudgetValue:(double)a3
{
  self->_double maxBudgetValue = a3;
}

- (double)minBudgetValue
{
  return self->_minBudgetValue;
}

- (void)setMinBudgetValue:(double)a3
{
  self->_double minBudgetValue = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_lastModulatedDate, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end