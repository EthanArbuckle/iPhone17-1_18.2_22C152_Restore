@interface TPSExperiment
+ (BOOL)supportsSecureCoding;
- (BOOL)updateCampIfNeeded;
- (BOOL)updateWithExperimentDictionary:(id)a3;
- (TPSExperiment)init;
- (TPSExperiment)initWithCoder:(id)a3;
- (double)holdoutAllocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)camp;
- (int64_t)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setCamp:(int64_t)a3;
- (void)setHoldoutAllocation:(double)a3;
- (void)setIdentifier:(int64_t)a3;
@end

@implementation TPSExperiment

- (int64_t)camp
{
  return self->_camp;
}

- (BOOL)updateWithExperimentDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    int64_t v6 = [v4 TPSSafeIntegerForKey:@"id"];
    if (self->_identifier != v6)
    {
      int64_t v7 = v6;
      self->_identifier = v6;
      [v5 TPSSafeDoubleForKey:@"holdoutAllocation"];
      if (v8 > 1.0 || v8 < 0.0) {
        double v8 = 0.0;
      }
      self->_double holdoutAllocation = v8;
      v10 = +[TPSLogger data];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double holdoutAllocation = self->_holdoutAllocation;
        int v15 = 134218240;
        int64_t v16 = v7;
        __int16 v17 = 2048;
        double v18 = holdoutAllocation;
        _os_log_impl(&dword_19C8DC000, v10, OS_LOG_TYPE_DEFAULT, "Update experiment to identifier %zd, holdoutAllocation %.2f", (uint8_t *)&v15, 0x16u);
      }

      if (self->_camp)
      {
        self->_camp = 1;
        v12 = +[TPSLogger data];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_19C8DC000, v12, OS_LOG_TYPE_DEFAULT, "Experiment changes after camp has been assigned, rolling user back to all content group", (uint8_t *)&v15, 2u);
        }
      }
      goto LABEL_17;
    }
  }
  else if (self->_camp != 1)
  {
    self->_double holdoutAllocation = 0.0;
    self->_camp = 1;
LABEL_17:
    [(TPSExperiment *)self updateCampIfNeeded];
    BOOL v13 = 1;
    goto LABEL_18;
  }
  BOOL v13 = 0;
LABEL_18:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSExperiment)init
{
  v3.receiver = self;
  v3.super_class = (Class)TPSExperiment;
  result = [(TPSExperiment *)&v3 init];
  if (result)
  {
    result->_double holdoutAllocation = 0.0;
    result->_camp = 0;
    result->_identifier = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (TPSExperiment)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSExperiment;
  v5 = [(TPSExperiment *)&v13 init];
  if (v5)
  {
    v5->_int64_t identifier = [v4 decodeIntegerForKey:@"id"];
    [v4 decodeDoubleForKey:@"holdoutAllocation"];
    v5->_double holdoutAllocation = v6;
    uint64_t v7 = [v4 decodeIntegerForKey:@"camp"];
    if (v7 > 2) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7;
    }
    v5->_int64_t camp = v8;
    v9 = +[TPSLogger data];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int64_t identifier = v5->_identifier;
      int64_t camp = v5->_camp;
      *(_DWORD *)buf = 134218240;
      int64_t v15 = identifier;
      __int16 v16 = 2048;
      int64_t v17 = camp;
      _os_log_impl(&dword_19C8DC000, v9, OS_LOG_TYPE_DEFAULT, "Current experiment %zd, user camp %zd", buf, 0x16u);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeInteger:identifier forKey:@"id"];
  [v5 encodeInteger:self->_camp forKey:@"camp"];
  [v5 encodeDouble:@"holdoutAllocation" forKey:self->_holdoutAllocation];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [v4 setIdentifier:self->_identifier];
  [v4 setCamp:self->_camp];
  [v4 setHoldoutAllocation:self->_holdoutAllocation];
  return v4;
}

- (BOOL)updateCampIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[TPSDefaultsManager holdoutGroup];
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 integerValue];
    uint64_t v6 = v5;
    if (v5 == self->_camp)
    {
      BOOL v7 = 0;
    }
    else
    {
      self->_int64_t camp = v5;
      uint64_t v8 = +[TPSLogger data];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134217984;
        double v15 = *(double *)&v6;
        _os_log_impl(&dword_19C8DC000, v8, OS_LOG_TYPE_DEFAULT, "Camp overrode to %zd", (uint8_t *)&v14, 0xCu);
      }

      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
    uint64_t v6 = 1;
  }
  int64_t camp = self->_camp;
  if (!camp)
  {
    if (self->_holdoutAllocation != 0.0)
    {
      double v11 = (double)(arc4random_uniform(0x64u) + 1) / 100.0;
      if (v11 <= self->_holdoutAllocation) {
        uint64_t v6 = 2;
      }
      v12 = +[TPSLogger data];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134218240;
        double v15 = v11;
        __int16 v16 = 2048;
        uint64_t v17 = v6;
        _os_log_impl(&dword_19C8DC000, v12, OS_LOG_TYPE_DEFAULT, "Experiment dice roll %.2f, user camp %zd", (uint8_t *)&v14, 0x16u);
      }
    }
    if (v6 > 2) {
      int64_t v10 = 1;
    }
    else {
      int64_t v10 = v6;
    }
    goto LABEL_20;
  }
  if (camp >= 3)
  {
    int64_t v10 = 1;
LABEL_20:
    self->_int64_t camp = v10;
    BOOL v7 = 1;
  }

  return v7;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v7.receiver = self;
  v7.super_class = (Class)TPSExperiment;
  id v4 = [(TPSExperiment *)&v7 debugDescription];
  int64_t v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@"%@ = %zd\n", @"id", self->_identifier];
  [v5 appendFormat:@"%@ = %zd\n", @"camp", self->_camp];
  [v5 appendFormat:@"%@ = %.2f\n", @"holdoutAllocation", *(void *)&self->_holdoutAllocation];
  return v5;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_int64_t identifier = a3;
}

- (double)holdoutAllocation
{
  return self->_holdoutAllocation;
}

- (void)setHoldoutAllocation:(double)a3
{
  self->_double holdoutAllocation = a3;
}

- (void)setCamp:(int64_t)a3
{
  self->_int64_t camp = a3;
}

@end