@interface PMRStopwatch
+ (id)sharedStopwatch;
+ (void)benchmarkBlockWithTitle:(id)a3 iterations:(unint64_t)a4 usingBlock:(id)a5 onCompletion:(id)a6;
+ (void)setSharedStopwatch:(id)a3;
- (NSArray)splitTimes;
- (NSString)domain;
- (PMRStopwatch)init;
- (PMRStopwatch)initWithDomain:(id)a3;
- (id)_subtreeDescription;
- (id)description;
- (id)descriptionWithFormat:(int)a3 key:(id)a4 comment:(id)a5;
- (id)formattedUserInfoForSplitTime:(id)a3;
- (unint64_t)coreAnimationTotalTime;
- (unint64_t)maxSplitTimes;
- (unint64_t)startTime;
- (void)_purgeOldestSplitTimeIfNeeded;
- (void)addSplit:(id)a3;
- (void)beginTimingGroupForMethod:(SEL)a3 inClass:(Class)a4 comment:(id)a5;
- (void)dealloc;
- (void)endTimingGroup;
- (void)logEvent:(id)a3 comment:(id)a4;
- (void)logEvent:(id)a3 comment:(id)a4 userInfo:(id)a5;
- (void)logToLocation:(id)a3 key:(id)a4;
- (void)logWithFormat:(int)a3;
- (void)reset;
- (void)setCoreAnimationTotalTime:(unint64_t)a3;
- (void)setDomain:(id)a3;
- (void)setMaxSplitTimes:(unint64_t)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)writeToFile:(id)a3 key:(id)a4 comment:(id)a5 fileFormat:(int)a6;
@end

@implementation PMRStopwatch

- (PMRStopwatch)init
{
  return [(PMRStopwatch *)self initWithDomain:0];
}

- (PMRStopwatch)initWithDomain:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PMRStopwatch;
  v4 = [(PMRStopwatch *)&v6 init];
  if (v4)
  {
    v4->_splitTimes = (NSMutableArray *)objc_opt_new();
    v4->_startTime = mach_absolute_time();
    v4->_domain = (NSString *)[a3 copy];
    v4->_maxSplitTimes = 1000;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PMRStopwatch;
  [(PMRStopwatch *)&v3 dealloc];
}

- (id)description
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  objc_super v3 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)PMRStopwatch;
  id v4 = [(PMRStopwatch *)&v6 description];
  return (id)[v3 stringWithFormat:@"%@ (startTime=%.3f, splitTimes=%lu, maxSplitTimes=%lu)", v4, (double)(self->_startTime * (info.numer / info.denom)) / 1000000000.0, -[NSMutableArray count](self->_splitTimes, "count"), self->_maxSplitTimes];
}

- (id)_subtreeDescription
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = (id)objc_msgSend(-[PMRStopwatch description](self, "description"), "mutableCopy");
  uint64_t v15 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  if ([(NSMutableArray *)self->_splitTimes count])
  {
    [v3 appendString:@"\n"];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    obuint64_t j = self->_splitTimes;
    uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "performSelector:", sel__subtreeDescription), "componentsSeparatedByCharactersInSet:", v15);
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v17;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v17 != v11) {
                  objc_enumerationMutation(v8);
                }
                [v3 appendFormat:@"    %@\n", *(void *)(*((void *)&v16 + 1) + 8 * j)];
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v10);
          }
        }
        uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v5);
    }
  }
  return v3;
}

+ (id)sharedStopwatch
{
  return (id)__stopwatch;
}

+ (void)setSharedStopwatch:(id)a3
{
  __stopwatch = (uint64_t)a3;
}

- (void)reset
{
  id v3 = self->_splitTimes;
  self->_splitTimes = (NSMutableArray *)objc_opt_new();
  self->_startTime = mach_absolute_time();
}

- (void)_purgeOldestSplitTimeIfNeeded
{
  if (self->_maxSplitTimes && [(NSMutableArray *)self->_splitTimes count] >= self->_maxSplitTimes)
  {
    splitTimes = self->_splitTimes;
    [(NSMutableArray *)splitTimes removeObjectAtIndex:0];
  }
}

- (void)beginTimingGroupForMethod:(SEL)a3 inClass:(Class)a4 comment:(id)a5
{
  id v9 = [NSString alloc];
  uint64_t v10 = NSStringFromClass(a4);
  id v13 = (id)[v9 initWithFormat:@"%@.%@", v10, NSStringFromSelector(a3)];
  uint64_t v11 = [[PMRSplitTime alloc] initWithKey:v13 comment:a5 level:[(NSMutableArray *)self->_splitTimeStack count]];
  if ([(NSMutableArray *)self->_splitTimeStack count])
  {
    objc_msgSend((id)-[NSMutableArray lastObject](self->_splitTimeStack, "lastObject"), "addSplitTimesObject:", v11);
  }
  else
  {
    [(PMRStopwatch *)self _purgeOldestSplitTimeIfNeeded];
    [(NSMutableArray *)self->_splitTimes addObject:v11];
  }

  splitTimeStack = self->_splitTimeStack;
  if (!splitTimeStack)
  {
    splitTimeStack = (NSMutableArray *)objc_opt_new();
    self->_splitTimeStack = splitTimeStack;
  }
  [(NSMutableArray *)splitTimeStack addObject:v11];
}

- (void)endTimingGroup
{
}

+ (void)benchmarkBlockWithTitle:(id)a3 iterations:(unint64_t)a4 usingBlock:(id)a5 onCompletion:(id)a6
{
  uint64_t v10 = objc_opt_new();

  [v10 benchmarkBlockWithTitle:a3 iterations:a4 currentIteration:0 usingBlock:a5 onCompletion:a6];
}

- (void)logToLocation:(id)a3 key:(id)a4
{
  if (a3)
  {
    -[PMRStopwatch writeToFile:key:comment:fileFormat:](self, "writeToFile:key:comment:fileFormat:");
  }
  else
  {
    NSLog(&stru_1F119C630.isa, [(PMRStopwatch *)self descriptionWithFormat:1 key:a4 comment:0]);
  }
}

- (void)addSplit:(id)a3
{
  if ([(NSMutableArray *)self->_splitTimeStack count])
  {
    uint64_t v5 = (void *)[(NSMutableArray *)self->_splitTimeStack lastObject];
    [v5 addSplitTimesObject:a3];
  }
  else
  {
    [(PMRStopwatch *)self _purgeOldestSplitTimeIfNeeded];
    splitTimes = self->_splitTimes;
    [(NSMutableArray *)splitTimes addObject:a3];
  }
}

- (void)logEvent:(id)a3 comment:(id)a4
{
}

- (void)logEvent:(id)a3 comment:(id)a4 userInfo:(id)a5
{
  uint64_t v6 = [[PMRSplitTime alloc] initWithKey:a3 comment:a4 level:[(NSMutableArray *)self->_splitTimeStack count] duration:0 userInfo:a5];
  [(PMRStopwatch *)self addSplit:v6];
}

- (id)descriptionWithFormat:(int)a3 key:(id)a4 comment:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  if ([(NSMutableArray *)self->_splitTimes count])
  {
    id v35 = a5;
    id v36 = a4;
    v38 = (void *)[MEMORY[0x1E4F28E78] string];
    id v9 = [(PMRStopwatch *)self domain];
    uint64_t v10 = @"undefined";
    if (v9) {
      uint64_t v10 = (__CFString *)v9;
    }
    v37 = v10;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    unint64_t startTime = self->_startTime;
    splitTimes = self->_splitTimes;
    uint64_t v13 = [(NSMutableArray *)splitTimes countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v40;
      double v16 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          unint64_t v18 = startTime;
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(splitTimes);
          }
          long long v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          unint64_t startTime = [v19 splitTime];
          uint64_t v20 = [v19 duration];
          uint64_t v21 = info.numer / info.denom;
          double v22 = (double)(unint64_t)(v20 * v21) / 1000000.0;
          if (v22 == 0.0) {
            double v22 = (double)((startTime - v18) * v21) / 1000000.0;
          }
          long long v23 = (__CFString *)[v19 comment];
          id v24 = [(PMRStopwatch *)self formattedUserInfoForSplitTime:v19];
          if (a3 == 1)
          {
            id v25 = v24;
            if (!v23) {
              long long v23 = &stru_1F119C770;
            }
            uint64_t v30 = [v19 key];
            [v38 appendFormat:@"\t<Measurement key=\"%@\" value=\"%.3f\" comment=\"%@\" domain=\"%@\" %@ timestamp=\"%.3f\"/>\n", v30, *(void *)&v22, v23, v37, v25, (double)(startTime * (info.numer / info.denom)) / 1000000000.0];
          }
          else if (a3 == 2)
          {
            [v38 appendFormat:@"%@\t%.3f\n", objc_msgSend(v19, "key"), *(void *)&v22, v31, v32, v33, v34];
          }
          double v16 = v16 + v22;
        }
        uint64_t v14 = [(NSMutableArray *)splitTimes countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v14);
    }
    else
    {
      double v16 = 0.0;
    }
    if (a3 == 1)
    {
      a4 = v36;
      uint64_t v26 = [v36 stringByAppendingString:@"sum"];
      [v38 appendFormat:@"\t<Measurement key=\"%@\" value=\"%.3f\" comment=\"%@\" domain=\"%@\" timestamp=\"%.3f\"/>\n", v26, *(void *)&v16, v35, v37, (double)(mach_absolute_time() * (info.numer / info.denom)) / 1000000000.0];
    }
    else
    {
      a4 = v36;
      if (a3 == 2) {
        [v38 appendFormat:@"%@\t%.3f\n", objc_msgSend(v36, "stringByAppendingString:", @"sum", *(void *)&v16, v31, v32, v33];
      }
    }
  }
  else
  {
    v38 = 0;
  }
  if ([(PMRStopwatch *)self coreAnimationTotalTime])
  {
    if (!a3)
    {
      v27 = @"{ key :\"%@coreAnimationSum(ms)\", value : \"%.3f\",\n";
      goto LABEL_31;
    }
    if (a3 == 1)
    {
      v27 = @"\t<Measurement key=\"%@coreAnimationSum(ms)\" value=\"%.3f\" />\n";
LABEL_31:
      unint64_t v28 = [(PMRStopwatch *)self coreAnimationTotalTime];
      objc_msgSend(v38, "appendFormat:", v27, a4, (double)(v28 * (info.numer / info.denom)) / 1000000.0);
    }
  }
  return v38;
}

- (id)formattedUserInfoForSplitTime:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a3 userInfo];
  uint64_t v4 = (void *)[MEMORY[0x1E4F28E78] string];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        [v4 appendFormat:@"%@=\"%@\" ", *(void *)(*((void *)&v10 + 1) + 8 * v8), objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v8))];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v4;
}

- (void)logWithFormat:(int)a3
{
  id v3 = (const char *)objc_msgSend(-[PMRStopwatch descriptionWithFormat:key:comment:](self, "descriptionWithFormat:key:comment:", *(void *)&a3, 0, 0), "UTF8String");

  puts(v3);
}

- (void)writeToFile:(id)a3 key:(id)a4 comment:(id)a5 fileFormat:(int)a6
{
  uint64_t v16 = 0;
  id v8 = [(PMRStopwatch *)self descriptionWithFormat:*(void *)&a6 key:a4 comment:a5];
  if (v8)
  {
    id v9 = v8;
    long long v10 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    if ([a3 hasPrefix:@"/"])
    {
      uint64_t v11 = [a3 stringByExpandingTildeInPath];
    }
    else
    {
      uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "infoDictionary"), "objectForKey:", @"CFBundleName");
      long long v13 = (void *)[(id)objc_msgSend(NSString stringWithFormat:@"~/Library/Logs/%@/", v12), "stringByExpandingTildeInPath"];
      [v10 createDirectoryAtPath:v13 withIntermediateDirectories:0 attributes:0 error:0];
      uint64_t v11 = [v13 stringByAppendingPathComponent:a3];
    }
    uint64_t v14 = v11;
    if ([v10 fileExistsAtPath:v11])
    {
      uint64_t v15 = (void *)[MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v14];
      [v15 seekToEndOfFile];
      objc_msgSend(v15, "writeData:", objc_msgSend(v9, "dataUsingEncoding:", 4));
    }
    else
    {
      [v9 writeToFile:v14 atomically:1 encoding:4 error:&v16];
    }
  }
  [(NSMutableArray *)self->_splitTimes removeAllObjects];
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_unint64_t startTime = a3;
}

- (NSArray)splitTimes
{
  return &self->_splitTimes->super;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (unint64_t)maxSplitTimes
{
  return self->_maxSplitTimes;
}

- (void)setMaxSplitTimes:(unint64_t)a3
{
  self->_maxSplitTimes = a3;
}

- (unint64_t)coreAnimationTotalTime
{
  return self->_coreAnimationTotalTime;
}

- (void)setCoreAnimationTotalTime:(unint64_t)a3
{
  self->_coreAnimationTotalTime = a3;
}

@end