@interface BKEventStatistic
+ (BKEventStatistic)statisticWithLabel:(id)a3;
- (BOOL)automaticResetDisabled;
- (BOOL)needsLogging;
- (NSArray)associatedStatistics;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)reset;
- (void)setAssociatedStatistics:(id)a3;
- (void)setAutomaticResetDisabled:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setNeedsLogging:(BOOL)a3;
@end

@implementation BKEventStatistic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedStatistics, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (BOOL)needsLogging
{
  return self->_needsLogging;
}

- (NSString)label
{
  return self->_label;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v5 = [(NSArray *)self->_associatedStatistics bs_filter:&stru_1000F7EE8];
  if ([v5 count])
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v4;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    id v9 = v8;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10007C7C4;
    v10[3] = &unk_1000F7F10;
    id v11 = v7;
    [v9 appendCollection:v5 withName:0 itemBlock:v10];
  }
}

+ (BKEventStatistic)statisticWithLabel:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setLabel:v3];

  return (BKEventStatistic *)v4;
}

- (void)setLabel:(id)a3
{
}

- (void)setAutomaticResetDisabled:(BOOL)a3
{
  self->_automaticResetDisabled = a3;
}

- (void)setNeedsLogging:(BOOL)a3
{
  self->_needsLogging = a3;
}

- (BOOL)automaticResetDisabled
{
  return self->_automaticResetDisabled;
}

- (void)reset
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_associatedStatistics;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) reset:v8];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  self->_needsLogging = 0;
}

- (void)setAssociatedStatistics:(id)a3
{
}

- (NSArray)associatedStatistics
{
  return self->_associatedStatistics;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() statisticWithLabel:self->_label];
  objc_storeStrong((id *)(v4 + 24), self->_associatedStatistics);
  *(unsigned char *)(v4 + 9) = self->_needsLogging;
  return (id)v4;
}

@end