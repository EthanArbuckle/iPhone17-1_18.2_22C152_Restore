@interface BKMRUEventStatistics
+ (id)statisticsWithLabel:(id)a3 capacity:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)pushStatistics:(id)a3;
- (void)reset;
@end

@implementation BKMRUEventStatistics

+ (id)statisticsWithLabel:(id)a3 capacity:(int64_t)a4
{
  id v7 = a3;
  if (a4 <= 0)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"BKEventStatisticsLoggingController.m", 262, @"Invalid parameter not satisfying: %@", @"capacity > 0" object file lineNumber description];
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___BKMRUEventStatistics;
  v8 = [super statisticWithLabel:v7];
  v8[5] = a4;

  return v8;
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BKMRUEventStatistics;
  v4 = [(BKEventStatistic *)&v8 copyWithZone:a3];
  id v5 = [(NSMutableOrderedSet *)self->_statistics copy];
  v6 = (void *)v4[4];
  v4[4] = v5;

  v4[5] = self->_capacity;
  return v4;
}

- (void)reset
{
  [(NSMutableOrderedSet *)self->_statistics removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)BKMRUEventStatistics;
  [(BKEventStatistic *)&v3 reset];
}

- (void)pushStatistics:(id)a3
{
  id v9 = a3;
  [(BKEventStatistic *)self setNeedsLogging:1];
  statistics = self->_statistics;
  if (!statistics)
  {
    id v5 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    v6 = self->_statistics;
    self->_statistics = v5;

    statistics = self->_statistics;
  }
  if ([(NSMutableOrderedSet *)statistics containsObject:v9]) {
    [(NSMutableOrderedSet *)self->_statistics removeObject:v9];
  }
  id v7 = self->_statistics;
  objc_super v8 = [v9 bs_map:&stru_1000F7EC8];
  [(NSMutableOrderedSet *)v7 addObject:v8];

  if ((unint64_t)[(NSMutableOrderedSet *)self->_statistics count] > self->_capacity) {
    [(NSMutableOrderedSet *)self->_statistics removeObjectAtIndex:0];
  }
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableOrderedSet *)self->_statistics bs_compactMap:&stru_1000F7E20];
  if ([v5 count])
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v4;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        objc_super v8 = v7;
      }
      else {
        objc_super v8 = 0;
      }
    }
    else
    {
      objc_super v8 = 0;
    }
    id v9 = v8;

    v10 = [(BKEventStatistic *)self label];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10007CF14;
    v13[3] = &unk_1000F7E88;
    id v11 = v7;
    id v14 = v11;
    [v9 appendCollection:v5 withName:v10 itemBlock:v13];

    v12.receiver = self;
    v12.super_class = (Class)BKMRUEventStatistics;
    [(BKEventStatistic *)&v12 appendDescriptionToFormatter:v11];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [v4[4] isEqual:self->_statistics];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableOrderedSet *)self->_statistics hash];
}

@end