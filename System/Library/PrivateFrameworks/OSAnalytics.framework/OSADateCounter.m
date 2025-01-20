@interface OSADateCounter
- (OSADateCounter)initWithIdentifier:(id)a3;
- (unint64_t)count;
- (void)increment;
- (void)resetCount;
@end

@implementation OSADateCounter

- (OSADateCounter)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OSADateCounter;
  v5 = [(OSADateCounter *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [NSString stringWithFormat:@"%@Day", v4];
    dayKey = v5->_dayKey;
    v5->_dayKey = (NSString *)v6;

    uint64_t v8 = [NSString stringWithFormat:@"%@Count", v4];
    countKey = v5->_countKey;
    v5->_countKey = (NSString *)v8;
  }
  return v5;
}

- (unint64_t)count
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = [v3 integerForKey:self->_dayKey];

  time_t v5 = time(0);
  if (v5 >= 0) {
    unint64_t v6 = v5 / 0x15180uLL;
  }
  else {
    unint64_t v6 = v5;
  }
  if (v6 != v4)
  {
    [(OSADateCounter *)self resetCount];
    v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v9 setInteger:v6 forKey:self->_dayKey];

    return 0;
  }
  v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  unint64_t v8 = [v7 integerForKey:self->_countKey];

  if ((v8 & 0x8000000000000000) != 0)
  {
    [(OSADateCounter *)self resetCount];
    return 0;
  }
  return v8;
}

- (void)increment
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v3, "setInteger:forKey:", -[OSADateCounter count](self, "count") + 1, self->_countKey);
}

- (void)resetCount
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 setInteger:0 forKey:self->_countKey];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countKey, 0);
  objc_storeStrong((id *)&self->_dayKey, 0);
}

@end