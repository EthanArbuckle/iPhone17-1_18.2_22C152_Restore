@interface TSDFPSCounter
- (TSDFPSCounter)init;
- (id)fpsGraphString;
- (id)fpsSummaryString;
- (id)p_fpsSummaryStringIncludingGraph:(BOOL)a3;
- (id)p_getFPSInfo:(BOOL)a3;
- (void)addFrame;
- (void)addFrameAtDrawTime:(double)a3;
- (void)addFrameAtDrawTime:(double)a3 duration:(double)a4;
- (void)dealloc;
- (void)reset;
- (void)writeFPSInfoToLog:(id)a3 identifier:(id)a4 type:(id)a5 direction:(id)a6 duration:(double)a7 graphing:(BOOL)a8 slide:(int64_t)a9;
@end

@implementation TSDFPSCounter

- (TSDFPSCounter)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSDFPSCounter;
  v2 = [(TSDFPSCounter *)&v4 init];
  if (v2) {
    v2->_dateArray = (NSMutableArray *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDFPSCounter;
  [(TSDFPSCounter *)&v3 dealloc];
}

- (void)reset
{
}

- (void)addFrame
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];

  -[TSDFPSCounter addFrameAtDrawTime:duration:](self, "addFrameAtDrawTime:duration:");
}

- (void)addFrameAtDrawTime:(double)a3
{
}

- (void)addFrameAtDrawTime:(double)a3 duration:(double)a4
{
  v6[2] = *MEMORY[0x263EF8340];
  dateArray = self->_dateArray;
  v6[0] = [NSNumber numberWithDouble:a3];
  v6[1] = [NSNumber numberWithDouble:a4];
  -[NSMutableArray addObject:](dateArray, "addObject:", [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2]);
}

- (id)p_fpsSummaryStringIncludingGraph:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v51 = *MEMORY[0x263EF8340];
  if ((unint64_t)[(NSMutableArray *)self->_dateArray count] < 2) {
    return @"FPSCounter error: not enough frames";
  }
  id v40 = (id)[objc_alloc(MEMORY[0x263F089D8]) initWithString:&stru_26D688A48];
  if (v3) {
    [v40 appendString:@"\n===== FPS LOGGING BEGIN =====\n"];
  }
  BOOL v44 = v3;
  v5 = objc_msgSend((id)-[NSMutableArray firstObject](self->_dateArray, "firstObject"), "firstObject");
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  dateArray = self->_dateArray;
  uint64_t v7 = [(NSMutableArray *)dateArray countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v7)
  {
    double v11 = 0.0;
    double v9 = 1.79769313e308;
    double v42 = 0.0;
    double v43 = 1.79769313e308;
    double v12 = 0.0;
    double v45 = 0.0;
    goto LABEL_46;
  }
  uint64_t v8 = v7;
  double v9 = 1.79769313e308;
  uint64_t v10 = *(void *)v47;
  double v11 = 0.0;
  double v42 = 0.0;
  double v43 = 1.79769313e308;
  double v12 = 0.0;
  double v45 = 0.0;
  v13 = v5;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v47 != v10) {
        objc_enumerationMutation(dateArray);
      }
      v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      v16 = (void *)[v15 objectAtIndexedSubscript:0];
      objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", 1), "doubleValue");
      double v18 = v17;
      if (v16 != v5 || v17 != 0.0)
      {
        [v16 doubleValue];
        double v20 = v19;
        [v13 doubleValue];
        double v22 = v20 - v21;
        double v23 = 0.0;
        if (v22 > 0.0)
        {
          double v23 = 1.0 / v22;
          if (v43 >= 1.0 / v22) {
            double v24 = 1.0 / v22;
          }
          else {
            double v24 = v43;
          }
          if (v11 <= v23) {
            double v11 = 1.0 / v22;
          }
          double v42 = v42 + v23;
          double v43 = v24;
        }
        if (v18 != 0.0)
        {
          if (v9 >= v18) {
            double v9 = v18;
          }
          if (v12 <= v18) {
            double v12 = v18;
          }
          double v45 = v45 + v18;
        }
        if (!v44)
        {
          v13 = v16;
          continue;
        }
        double v41 = v12;
        double v25 = v9;
        double v26 = v11;
        if (v23 / 60.0 <= 1.0) {
          double v27 = v23 / 60.0;
        }
        else {
          double v27 = 1.0;
        }
        double v28 = 0.0;
        int v29 = -7;
        v30 = &stru_26D688A48;
        while (1)
        {
          if (v27 <= v28 / 7.0) {
            goto LABEL_33;
          }
          if (v29 == -1)
          {
            v31 = @"*";
            goto LABEL_34;
          }
          v31 = @"*";
          if (v27 >= (double)(v29 + 8) / 7.0) {
LABEL_33:
          }
            v31 = @" ";
LABEL_34:
          double v28 = v28 + 1.0;
          v30 = (__CFString *)[(__CFString *)v30 stringByAppendingString:v31];
          if (__CFADD__(v29++, 1))
          {
            v33 = NSString;
            [v16 doubleValue];
            double v35 = v34;
            [v5 doubleValue];
            uint64_t v37 = [v33 stringWithFormat:@"FPS(%0.2f): |%@| %0.0f", v35 - v36, v30, *(void *)&v23];
            v38 = &stru_26D688A48;
            double v11 = v26;
            if (v18 != 0.0) {
              v38 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" ... duration:%2.0fms (%4.0f FPS)", v18 * 1000.0, 1.0 / v18);
            }
            [v40 appendFormat:@"%@%@\n", v37, v38];
            v13 = v16;
            double v9 = v25;
            double v12 = v41;
            break;
          }
        }
      }
    }
    uint64_t v8 = [(NSMutableArray *)dateArray countByEnumeratingWithState:&v46 objects:v50 count:16];
  }
  while (v8);
LABEL_46:
  objc_msgSend(v40, "appendFormat:", @"FPS(min/avg/max): %0.0f/%0.0f/%0.0f (%d frames)", *(void *)&v43, v42 / (double)(unint64_t)-[NSMutableArray count](self->_dateArray, "count"), *(void *)&v11, -[NSMutableArray count](self->_dateArray, "count") - 1);
  if (v45 > 0.0) {
    objc_msgSend(v40, "appendFormat:", @"\nDuration(min/avg/max): %0.0f/%0.0f/%0.0fms (%d frames)", v9 * 1000.0, v45 / (double)(unint64_t)-[NSMutableArray count](self->_dateArray, "count") * 1000.0, v12 * 1000.0, -[NSMutableArray count](self->_dateArray, "count") - 1);
  }
  if (v44) {
    [v40 appendString:@"\n============================="];
  }
  return v40;
}

- (id)fpsSummaryString
{
  return [(TSDFPSCounter *)self p_fpsSummaryStringIncludingGraph:0];
}

- (id)fpsGraphString
{
  return [(TSDFPSCounter *)self p_fpsSummaryStringIncludingGraph:1];
}

- (void)writeFPSInfoToLog:(id)a3 identifier:(id)a4 type:(id)a5 direction:(id)a6 duration:(double)a7 graphing:(BOOL)a8 slide:(int64_t)a9
{
  BOOL v10 = a8;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v16 = [(TSDFPSCounter *)self p_getFPSInfo:a8];
  if (!v16) {
    return;
  }
  double v17 = v16;
  objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", @"min"), "floatValue");
  float v19 = v18;
  objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", @"avg"), "floatValue");
  float v21 = v20;
  objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", @"max"), "floatValue");
  float v23 = v22;
  double v24 = (void *)[v17 objectForKeyedSubscript:@"array"];
  double v25 = (void *)[MEMORY[0x263F089D8] string];
  [v25 appendString:@"\nKNAnimTest"];
  [v25 appendString:@"**"];
  if (!a3)
  {
    if (!a4)
    {
      [v25 appendString:@"UnknownAnimation"];
      if (!a5) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    [v25 appendString:a4];
    goto LABEL_7;
  }
  [v25 appendString:a3];
  if (a4)
  {
LABEL_7:
    [v25 appendString:@"**"];
    [v25 appendFormat:@"Identifier:::%@", a4];
  }
  if (a5)
  {
LABEL_9:
    [v25 appendString:@"**"];
    [v25 appendFormat:@"Type:::%@", a5];
  }
LABEL_10:
  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  if (a6)
  {
    [v25 appendString:@"**"];
    [v25 appendFormat:@"Direction:::%@", a6];
  }
  [v25 appendString:@"**"];
  [v25 appendFormat:@"Duration:::%.2f", *(void *)&a7];
  [v25 appendString:@"**"];
  objc_msgSend(v25, "appendFormat:", @"Slide:::%ld", a9);
  [v25 appendString:@"**"];
  [v25 appendFormat:@"FPS:::%.2f %.2f %.2f", *(void *)&v26, *(void *)&v27, *(void *)&v28];
  if (v10)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v29 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v36;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v36 != v30) {
            objc_enumerationMutation(v24);
          }
          objc_msgSend(v25, "appendFormat:", @" %d", objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * v31++), "intValue"));
        }
        while (v29 != v31);
        uint64_t v29 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v29);
    }
  }
  [v25 appendString:@"\n"];
  uint64_t v32 = objc_msgSend(-[NSArray objectAtIndex:](NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1), "objectAtIndex:", 0), "stringByAppendingPathComponent:", @"animationTest_log");
  v33 = (void *)[MEMORY[0x263F08840] fileHandleForWritingAtPath:v32];
  double v34 = v33;
  if (v33)
  {
    [v33 seekToEndOfFile];
    objc_msgSend(v34, "writeData:", objc_msgSend(v25, "dataUsingEncoding:", 4));
    [v34 closeFile];
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "createFileAtPath:contents:attributes:", v32, objc_msgSend(v25, "dataUsingEncoding:", 4), 0);
  }
}

- (id)p_getFPSInfo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  if ((unint64_t)[(NSMutableArray *)self->_dateArray count] < 2) {
    return 0;
  }
  uint64_t v6 = objc_msgSend((id)-[NSMutableArray firstObject](self->_dateArray, "firstObject"), "firstObject");
  uint64_t v7 = (void *)[MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v30 = self;
  dateArray = self->_dateArray;
  uint64_t v9 = [(NSMutableArray *)dateArray countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    double v12 = 0.0;
    double v13 = 1.79769313e308;
    double v14 = 0.0;
    v15 = (void *)v6;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(dateArray);
        }
        double v17 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * i) objectAtIndexedSubscript:0];
        if (v17 != (void *)v6)
        {
          float v18 = v17;
          [v17 doubleValue];
          double v20 = v19;
          [v15 doubleValue];
          double v22 = v20 - v21;
          if (v22 > 0.0)
          {
            double v23 = 1.0 / v22;
            if (v13 >= v23) {
              double v13 = v23;
            }
            if (v12 <= v23) {
              double v12 = v23;
            }
            double v14 = v14 + v23;
            if (v3) {
              objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:"));
            }
            v15 = v18;
          }
        }
      }
      uint64_t v10 = [(NSMutableArray *)dateArray countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
    double v13 = 1.79769313e308;
    double v14 = 0.0;
  }
  unint64_t v24 = [(NSMutableArray *)v30->_dateArray count];
  double v25 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v26 = [NSNumber numberWithDouble:v14 / (double)v24];
  uint64_t v27 = [NSNumber numberWithDouble:v13];
  double v28 = objc_msgSend(v25, "dictionaryWithObjectsAndKeys:", v26, @"avg", v27, @"min", objc_msgSend(NSNumber, "numberWithDouble:", v12), @"max", 0);
  v5 = v28;
  if (v3) {
    [v28 setObject:v7 forKeyedSubscript:@"array"];
  }
  return v5;
}

@end