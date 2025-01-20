@interface _DASActivityRateLimitTracker
- (BOOL)onlyExpiredOccurrencesAtDate:(id)a3;
- (BOOL)timewiseEligibleAtDate:(id)a3 withLPMWindowExtension:(BOOL)a4;
- (NSMutableArray)occurrences;
- (_DASActivityRateLimitTracker)initWithRateLimit:(id)a3;
- (_DASActivityRateLimitTracker)initWithRateLimit:(id)a3 andOccurrences:(id)a4;
- (double)window;
- (id)description;
- (id)nextTimewiseEligibleDateFromDate:(id)a3 withLPMWindowExtension:(BOOL)a4;
- (os_unfair_lock_s)lock;
- (unint64_t)maximum;
- (unint64_t)occurrencesInWindow:(double)a3 atDate:(id)a4;
- (void)executeAtDate:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMaximum:(unint64_t)a3;
- (void)setOccurrences:(id)a3;
- (void)setWindow:(double)a3;
@end

@implementation _DASActivityRateLimitTracker

- (_DASActivityRateLimitTracker)initWithRateLimit:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_DASActivityRateLimitTracker;
  v5 = [(_DASActivityRateLimitTracker *)&v10 init];
  if (v5)
  {
    v5->_maximum = (unint64_t)[v4 maximum];
    [v4 window];
    v5->_window = v6;
    uint64_t v7 = +[NSMutableArray array];
    occurrences = v5->_occurrences;
    v5->_occurrences = (NSMutableArray *)v7;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (_DASActivityRateLimitTracker)initWithRateLimit:(id)a3 andOccurrences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_DASActivityRateLimitTracker;
  v8 = [(_DASActivityRateLimitTracker *)&v14 init];
  if (v8)
  {
    v8->_maximum = (unint64_t)[v6 maximum];
    [v6 window];
    v8->_window = v9;
    objc_super v10 = [v7 allObjects];
    uint64_t v11 = +[NSMutableArray arrayWithArray:v10];
    occurrences = v8->_occurrences;
    v8->_occurrences = (NSMutableArray *)v11;

    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (unint64_t)occurrencesInWindow:(double)a3 atDate:(id)a4
{
  id v6 = a4;
  id v7 = +[NSMutableArray array];
  os_unfair_lock_lock(&self->_lock);
  v8 = [(_DASActivityRateLimitTracker *)self occurrences];
  double v9 = +[NSArray arrayWithArray:v8];

  os_unfair_lock_unlock(&self->_lock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    unint64_t v13 = 0;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v16 timeIntervalSinceDate:v6];
        double v18 = (double)(int)-v17;
        if (v18 <= a3)
        {
          ++v13;
          [v7 addObject:v16, v18];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
  else
  {
    unint64_t v13 = 0;
  }

  os_unfair_lock_lock(&self->_lock);
  [(_DASActivityRateLimitTracker *)self setOccurrences:v7];
  os_unfair_lock_unlock(&self->_lock);

  return v13;
}

- (BOOL)timewiseEligibleAtDate:(id)a3 withLPMWindowExtension:(BOOL)a4
{
  id v6 = a3;
  if (a4) {
    double v7 = 3600.0;
  }
  else {
    [(_DASActivityRateLimitTracker *)self window];
  }
  unint64_t v8 = [(_DASActivityRateLimitTracker *)self occurrencesInWindow:v6 atDate:v7];
  BOOL v9 = v8 < [(_DASActivityRateLimitTracker *)self maximum];

  return v9;
}

- (void)executeAtDate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_occurrences addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)nextTimewiseEligibleDateFromDate:(id)a3 withLPMWindowExtension:(BOOL)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v8 = [(NSMutableArray *)self->_occurrences count];
  os_unfair_lock_unlock(&self->_lock);
  if (a4)
  {
    double v9 = 3600.0;
  }
  else
  {
    [(_DASActivityRateLimitTracker *)self window];
    double v9 = v10;
  }
  unint64_t v11 = [(_DASActivityRateLimitTracker *)self occurrencesInWindow:v6 atDate:v9];
  if (v11 < [(_DASActivityRateLimitTracker *)self maximum]
    || (uint64_t v12 = v8 - v11, (v12 & 0x80000000) != 0))
  {
    id v15 = v6;
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    unint64_t v13 = [(_DASActivityRateLimitTracker *)self occurrences];
    uint64_t v14 = [v13 objectAtIndexedSubscript:v12];

    os_unfair_lock_unlock(p_lock);
    id v15 = +[NSDate dateWithTimeInterval:v14 sinceDate:v9];
  }

  return v15;
}

- (BOOL)onlyExpiredOccurrencesAtDate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(_DASActivityRateLimitTracker *)self occurrences];
  id v6 = +[NSArray arrayWithArray:v5];

  os_unfair_lock_unlock(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) timeIntervalSinceDate:v4];
        double v13 = (double)(int)-v12;
        [(_DASActivityRateLimitTracker *)self window];
        if (v14 >= v13)
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (id)description
{
  [(_DASActivityRateLimitTracker *)self window];
  double v4 = v3;
  id v5 = +[NSDate now];
  id v6 = +[NSNumber numberWithUnsignedInteger:[(_DASActivityRateLimitTracker *)self occurrencesInWindow:v5 atDate:v4]];
  id v7 = +[NSNumber numberWithUnsignedInteger:self->_maximum];
  id v8 = +[NSNumber numberWithDouble:self->_window];
  id v9 = +[NSString stringWithFormat:@"<Rate Limit - Current:%@ Max:%@ Window:%@>", v6, v7, v8];

  return v9;
}

- (unint64_t)maximum
{
  return self->_maximum;
}

- (void)setMaximum:(unint64_t)a3
{
  self->_maximum = a3;
}

- (double)window
{
  return self->_window;
}

- (void)setWindow:(double)a3
{
  self->_window = a3;
}

- (NSMutableArray)occurrences
{
  return self->_occurrences;
}

- (void)setOccurrences:(id)a3
{
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
}

@end