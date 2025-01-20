@interface UISubTest
- (NSNumber)startTime;
- (UISubTest)initWithName:(id)a3 metrics:(id)a4;
- (id)getObjectForKey:(id)a3;
- (id)outputData;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)startWithFrameCount:(id)a3;
- (void)stopWithFrameCount:(id)a3;
@end

@implementation UISubTest

- (void)stopWithFrameCount:(id)a3
{
  id v4 = a3;
  if (self->_startTime)
  {
    id v15 = v4;
    double Current = CFAbsoluteTimeGetCurrent();
    [(NSNumber *)self->_startTime doubleValue];
    double v7 = Current - v6;
    time = self->_time;
    v9 = [NSNumber numberWithDouble:v7];
    [(NSMutableArray *)time addObject:v9];

    id v4 = v15;
    if (v7 != 0.0 && self->_startFrame != 0)
    {
      int v11 = [v15 unsignedIntValue];
      unsigned int v12 = [(NSNumber *)self->_startFrame unsignedIntValue];
      fps = self->_fps;
      v14 = [NSNumber numberWithDouble:(double)(v11 - v12) / v7];
      [(NSMutableArray *)fps addObject:v14];

      id v4 = v15;
    }
  }
}

- (void)startWithFrameCount:(id)a3
{
  id v7 = a3;
  v5 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  startTime = self->_startTime;
  self->_startTime = v5;

  if (v7) {
    objc_storeStrong((id *)&self->_startFrame, a3);
  }
}

- (NSNumber)startTime
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (UISubTest)initWithName:(id)a3 metrics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UISubTest;
  v9 = [(UISubTest *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testName, a3);
    int v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    time = v10->_time;
    v10->_time = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    fps = v10->_fps;
    v10->_fps = v13;

    id v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    data = v10->_data;
    v10->_data = v15;

    if ([v8 count])
    {
      v10->_showTime = [v8 containsObject:@"time"];
      v10->_showFps = [v8 containsObject:@"fps"];
    }
    else
    {
      NSLog(&cfstr_NoMetricsNoRes.isa);
    }
  }

  return v10;
}

- (id)getObjectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_data objectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_fps, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_startFrame, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

- (id)outputData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (self->_showTime)
  {
    unint64_t v4 = [(NSMutableArray *)self->_time count];
    time = self->_time;
    if (v4 < 2)
    {
      if ([(NSMutableArray *)time count])
      {
        v14 = [(NSMutableArray *)self->_time objectAtIndex:0];
        id v15 = [NSString stringWithFormat:@"sub:%@:time", self->_testName];
        [v3 setValue:v14 forKey:v15];
      }
      else
      {
        NSLog(&cfstr_NoTimeDataFor.isa, self->_testName);
      }
    }
    else
    {
      double v6 = [(NSMutableArray *)time valueForKeyPath:@"@avg.doubleValue"];
      id v7 = [NSString stringWithFormat:@"sub:%@:%@", self->_testName, @"time:mean"];
      [v3 setValue:v6 forKey:v7];

      id v8 = [(NSMutableArray *)self->_time valueForKeyPath:@"@max.doubleValue"];
      v9 = [NSString stringWithFormat:@"sub:%@:%@", self->_testName, @"time:max"];
      [v3 setValue:v8 forKey:v9];

      v10 = [(NSMutableArray *)self->_time valueForKeyPath:@"@min.doubleValue"];
      int v11 = [NSString stringWithFormat:@"sub:%@:%@", self->_testName, @"time:min"];
      [v3 setValue:v10 forKey:v11];

      unsigned int v12 = [(NSMutableArray *)self->_time objectAtIndex:0];
      v13 = [NSString stringWithFormat:@"sub:%@:%@", self->_testName, @"time:first"];
      [v3 setValue:v12 forKey:v13];
    }
  }
  if (self->_showFps)
  {
    if ((unint64_t)[(NSMutableArray *)self->_fps count] >= 2)
    {
      v16 = [NSString stringWithFormat:@"sub:%@:%@", self->_testName, @"fps:mean"];
      v17 = [v16 stringByAppendingString:@"Units"];
      [v3 setObject:@"fps" forKey:v17];

      objc_super v18 = [(NSMutableArray *)self->_fps valueForKeyPath:@"@avg.doubleValue"];
      [v3 setValue:v18 forKey:v16];

      v19 = [NSString stringWithFormat:@"sub:%@:%@", self->_testName, @"fps:max"];
      v20 = [v19 stringByAppendingString:@"Units"];
      [v3 setObject:@"fps" forKey:v20];

      v21 = [(NSMutableArray *)self->_fps valueForKeyPath:@"@max.doubleValue"];
      [v3 setValue:v21 forKey:v19];

      v22 = [NSString stringWithFormat:@"sub:%@:%@", self->_testName, @"fps:min"];
      v23 = [v22 stringByAppendingString:@"Units"];
      [v3 setObject:@"fps" forKey:v23];

      v24 = [(NSMutableArray *)self->_fps valueForKeyPath:@"@min.doubleValue"];
      [v3 setValue:v24 forKey:v22];

      v25 = [NSString stringWithFormat:@"sub:%@:%@", self->_testName, @"fps:first"];
      v26 = [v25 stringByAppendingString:@"Units"];
      [v3 setObject:@"fps" forKey:v26];

      v27 = [(NSMutableArray *)self->_fps objectAtIndex:0];
      [v3 setValue:v27 forKey:v25];

LABEL_12:
      goto LABEL_14;
    }
    if ([(NSMutableArray *)self->_fps count])
    {
      v28 = [NSString stringWithFormat:@"sub:%@:fps%@", self->_testName, @"Units"];
      [v3 setObject:@"fps" forKey:v28];

      v16 = [(NSMutableArray *)self->_fps objectAtIndex:0];
      v29 = [NSString stringWithFormat:@"sub:%@:fps", self->_testName];
      [v3 setValue:v16 forKey:v29];

      goto LABEL_12;
    }
    NSLog(&cfstr_NoFpsDataFor.isa, self->_testName);
  }
LABEL_14:
  return v3;
}

@end