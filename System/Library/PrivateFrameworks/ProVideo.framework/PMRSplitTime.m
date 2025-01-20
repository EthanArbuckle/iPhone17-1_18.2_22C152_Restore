@interface PMRSplitTime
- (NSArray)splitTimes;
- (NSDictionary)userInfo;
- (NSString)comment;
- (NSString)key;
- (PMRSplitTime)initWithKey:(id)a3 comment:(id)a4 level:(int64_t)a5;
- (PMRSplitTime)initWithKey:(id)a3 comment:(id)a4 level:(int64_t)a5 duration:(unint64_t)a6 userInfo:(id)a7;
- (id)_subtreeDescription;
- (id)description;
- (id)dumpTraceLog;
- (int64_t)level;
- (unint64_t)duration;
- (unint64_t)splitTime;
- (void)addSplitTimesObject:(id)a3;
- (void)dealloc;
- (void)removeSplitTimesObject:(id)a3;
- (void)setComment:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setKey:(id)a3;
- (void)setLevel:(int64_t)a3;
- (void)setSplitTime:(unint64_t)a3;
- (void)setSplitTimes:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation PMRSplitTime

- (PMRSplitTime)initWithKey:(id)a3 comment:(id)a4 level:(int64_t)a5
{
  return [(PMRSplitTime *)self initWithKey:a3 comment:a4 level:a5 duration:0 userInfo:0];
}

- (PMRSplitTime)initWithKey:(id)a3 comment:(id)a4 level:(int64_t)a5 duration:(unint64_t)a6 userInfo:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)PMRSplitTime;
  v12 = [(PMRSplitTime *)&v14 init];
  if (v12)
  {
    v12->_key = (NSString *)[a3 copy];
    v12->_comment = (NSString *)[a4 copy];
    v12->_splitTime = mach_absolute_time();
    v12->_level = a5;
    v12->_duration = a6;
    v12->_userInfo = (NSDictionary *)[a7 copy];
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PMRSplitTime;
  [(PMRSplitTime *)&v3 dealloc];
}

- (id)description
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  comment = self->_comment;
  if (comment) {
    v4 = -[NSArray objectAtIndex:](-[NSString componentsSeparatedByCharactersInSet:](comment, "componentsSeparatedByCharactersInSet:", [MEMORY[0x1E4F28B88] newlineCharacterSet]), "objectAtIndex:", 0);
  }
  else {
    v4 = &stru_1F119C770;
  }
  unint64_t v5 = [(PMRSplitTime *)self duration];
  v6 = NSString;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)PMRSplitTime;
    id v7 = [(PMRSplitTime *)&v13 description];
    key = self->_key;
    unint64_t v9 = [(PMRSplitTime *)self duration];
    return (id)[v6 stringWithFormat:@"%@ key: %@, duration: %.3f, splitTimes=%li, comment: %@", v7, key, (double)(v9 * (info.numer / info.denom)) / 1000000000.0, -[NSMutableArray count](self->_splitTimes, "count"), v4];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PMRSplitTime;
    id v11 = [(PMRSplitTime *)&v12 description];
    return (id)[v6 stringWithFormat:@"%@ key: %@, timestamp: %.3f, splitTimes=%li, comment: %@", v11, self->_key, (double)(self->_splitTime * (info.numer / info.denom)) / 1000000000.0, -[NSMutableArray count](self->_splitTimes, "count"), v4];
  }
}

- (id)_subtreeDescription
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", self, 0);
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  while ([v2 count])
  {
    v4 = (void *)[v2 objectAtIndex:0];
    [v2 removeObjectAtIndex:0];
    if ([v4 level] >= 1)
    {
      uint64_t v5 = 0;
      do
      {
        [v3 appendString:@"    "];
        ++v5;
      }
      while (v5 < [v4 level]);
    }
    [v3 appendFormat:@"%@\n", objc_msgSend(v4, "description")];
    objc_msgSend(v2, "replaceObjectsInRange:withObjectsFromArray:", 0, 0, objc_msgSend(v4, "splitTimes"));
  }

  return v3;
}

- (id)dumpTraceLog
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", self, 0);
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  while ([v2 count])
  {
    v4 = (void *)[v2 objectAtIndex:0];
    [v2 removeObjectAtIndex:0];
    if ([v4 level] >= 1)
    {
      uint64_t v5 = 0;
      do
      {
        [v3 appendString:@"  "];
        ++v5;
      }
      while (v5 < [v4 level]);
    }
    if ([v4 comment])
    {
      v6 = (void *)[v4 comment];
      id v7 = (__CFString *)objc_msgSend((id)objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "newlineCharacterSet")), "objectAtIndex:", 0);
    }
    else
    {
      id v7 = &stru_1F119C770;
    }
    [v3 appendFormat:@"%@\n", objc_msgSend(NSString, "stringWithFormat:", @"%@: %@", objc_msgSend(v4, "key"), v7)];
    objc_msgSend(v2, "replaceObjectsInRange:withObjectsFromArray:", 0, 0, objc_msgSend(v4, "splitTimes"));
  }

  return v3;
}

- (void)addSplitTimesObject:(id)a3
{
  if (a3)
  {
    splitTimes = self->_splitTimes;
    if (!splitTimes)
    {
      splitTimes = (NSMutableArray *)objc_opt_new();
      self->_splitTimes = splitTimes;
    }
    [(NSMutableArray *)splitTimes addObject:a3];
  }
}

- (void)removeSplitTimesObject:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (unint64_t)splitTime
{
  return self->_splitTime;
}

- (void)setSplitTime:(unint64_t)a3
{
  self->_splitTime = a3;
}

- (NSArray)splitTimes
{
  return &self->_splitTimes->super;
}

- (void)setSplitTimes:(id)a3
{
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

@end