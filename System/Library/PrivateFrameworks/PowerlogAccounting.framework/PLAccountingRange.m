@interface PLAccountingRange
+ (PLAccountingRange)rangeWithStartDate:(id)a3 withEndDate:(id)a4;
+ (id)emptyRange;
- (BOOL)containsDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)overlaps:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (PLAccountingRange)initWithStartDate:(id)a3 withEndDate:(id)a4;
- (double)length;
- (id)description;
- (id)intersect:(id)a3;
@end

@implementation PLAccountingRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (id)intersect:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__PLAccountingRange_intersect___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (intersect__defaultOnce != -1) {
      dispatch_once(&intersect__defaultOnce, block);
    }
    if (intersect__classDebugEnabled)
    {
      v6 = [NSString stringWithFormat:@"self=%@, otherRange=%@", self, v4];
      v7 = (void *)MEMORY[0x263F5F638];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingRange intersect:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:42];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v12 = [(PLAccountingRange *)self endDate];
  v13 = [v4 startDate];
  [v12 timeIntervalSinceDate:v13];
  double v15 = v14;

  if (v15 < 0.0)
  {
    if (![MEMORY[0x263F5F640] debugEnabled]) {
      goto LABEL_23;
    }
    uint64_t v16 = objc_opt_class();
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __31__PLAccountingRange_intersect___block_invoke_17;
    v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v49[4] = v16;
    if (intersect__defaultOnce_15 != -1) {
      dispatch_once(&intersect__defaultOnce_15, v49);
    }
    if (!intersect__classDebugEnabled_16) {
      goto LABEL_23;
    }
    v17 = [NSString stringWithFormat:@"self ends before otherRange"];
    v18 = (void *)MEMORY[0x263F5F638];
    v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m"];
    v20 = [v19 lastPathComponent];
    v21 = [NSString stringWithUTF8String:"-[PLAccountingRange intersect:]"];
    [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:46];

    v22 = PLLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[PLAccountingDependency activate]();
    }
LABEL_22:

LABEL_23:
    v32 = [(id)objc_opt_class() emptyRange];
    goto LABEL_24;
  }
  v23 = [v4 endDate];
  v24 = [(PLAccountingRange *)self startDate];
  [v23 timeIntervalSinceDate:v24];
  double v26 = v25;

  if (v26 < 0.0)
  {
    if (![MEMORY[0x263F5F640] debugEnabled]) {
      goto LABEL_23;
    }
    uint64_t v27 = objc_opt_class();
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __31__PLAccountingRange_intersect___block_invoke_23;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = v27;
    if (intersect__defaultOnce_21 != -1) {
      dispatch_once(&intersect__defaultOnce_21, v48);
    }
    if (!intersect__classDebugEnabled_22) {
      goto LABEL_23;
    }
    v17 = [NSString stringWithFormat:@"otherRange ends before self"];
    v28 = (void *)MEMORY[0x263F5F638];
    v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m"];
    v30 = [v29 lastPathComponent];
    v31 = [NSString stringWithUTF8String:"-[PLAccountingRange intersect:]"];
    [v28 logMessage:v17 fromFile:v30 fromFunction:v31 fromLineNumber:52];

    v22 = PLLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[PLAccountingDependency activate]();
    }
    goto LABEL_22;
  }
  v34 = [(PLAccountingRange *)self startDate];
  v35 = [v4 startDate];
  v36 = [v34 laterDate:v35];
  v37 = [(PLAccountingRange *)self endDate];
  v38 = [v4 endDate];
  v39 = [v37 earlierDate:v38];
  v32 = +[PLAccountingRange rangeWithStartDate:v36 withEndDate:v39];

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v40 = objc_opt_class();
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __31__PLAccountingRange_intersect___block_invoke_29;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v40;
    if (intersect__defaultOnce_27 != -1) {
      dispatch_once(&intersect__defaultOnce_27, v47);
    }
    if (intersect__classDebugEnabled_28)
    {
      v41 = [NSString stringWithFormat:@"intersectionRange=%@", v32];
      v42 = (void *)MEMORY[0x263F5F638];
      v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m"];
      v44 = [v43 lastPathComponent];
      v45 = [NSString stringWithUTF8String:"-[PLAccountingRange intersect:]"];
      [v42 logMessage:v41 fromFile:v44 fromFunction:v45 fromLineNumber:59];

      v46 = PLLogCommon();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
LABEL_24:

  return v32;
}

- (double)length
{
  v3 = [(PLAccountingRange *)self startDate];
  if (v3)
  {
    id v4 = [(PLAccountingRange *)self endDate];
    if (v4)
    {
      uint64_t v5 = [(PLAccountingRange *)self endDate];
      v6 = [(PLAccountingRange *)self startDate];
      [v5 timeIntervalSinceDate:v6];
      double v8 = v7;
    }
    else
    {
      double v8 = 1.79769313e308;
    }
  }
  else
  {
    double v8 = 1.79769313e308;
  }

  return v8;
}

- (NSDate)startDate
{
  return self->_startDate;
}

+ (PLAccountingRange)rangeWithStartDate:(id)a3 withEndDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [[PLAccountingRange alloc] initWithStartDate:v6 withEndDate:v5];

  return v7;
}

- (PLAccountingRange)initWithStartDate:(id)a3 withEndDate:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (v7 | v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)PLAccountingRange;
    v9 = [(PLAccountingRange *)&v15 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_startDate, a3);
      if (v7)
      {
        v11 = [(id)v8 laterDate:v7];
      }
      else
      {
        v11 = (NSDate *)(id)v8;
      }
      endDate = v10->_endDate;
      v10->_endDate = v11;
    }
    self = v10;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)emptyRange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__PLAccountingRange_emptyRange__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (emptyRange_onceToken != -1) {
    dispatch_once(&emptyRange_onceToken, block);
  }
  v2 = (void *)emptyRange_emptyRange;
  return v2;
}

- (BOOL)overlaps:(id)a3
{
  id v4 = (PLAccountingRange *)a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__PLAccountingRange_overlaps___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (overlaps__defaultOnce != -1) {
      dispatch_once(&overlaps__defaultOnce, block);
    }
    if (overlaps__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"self=%@, otherRange=%@", self, v4];
      unint64_t v7 = (void *)MEMORY[0x263F5F638];
      unint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingRange overlaps:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:64];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  [(PLAccountingRange *)self length];
  if (v12 == 0.0)
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __30__PLAccountingRange_overlaps___block_invoke_35;
      v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v44[4] = v13;
      if (overlaps__defaultOnce_33 != -1) {
        dispatch_once(&overlaps__defaultOnce_33, v44);
      }
      if (overlaps__classDebugEnabled_34)
      {
        double v14 = [NSString stringWithFormat:@"self is an EventPoint"];
        objc_super v15 = (void *)MEMORY[0x263F5F638];
        uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m"];
        v17 = [v16 lastPathComponent];
        v18 = [NSString stringWithUTF8String:"-[PLAccountingRange overlaps:]"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:67];

        v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    v20 = [(PLAccountingRange *)self startDate];
    v21 = v4;
LABEL_26:
    BOOL v32 = [(PLAccountingRange *)v21 containsDate:v20];
    goto LABEL_27;
  }
  [(PLAccountingRange *)v4 length];
  double v23 = v22;
  int v24 = [MEMORY[0x263F5F640] debugEnabled];
  if (v23 == 0.0)
  {
    if (v24)
    {
      uint64_t v25 = objc_opt_class();
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __30__PLAccountingRange_overlaps___block_invoke_41;
      v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v43[4] = v25;
      if (overlaps__defaultOnce_39 != -1) {
        dispatch_once(&overlaps__defaultOnce_39, v43);
      }
      if (overlaps__classDebugEnabled_40)
      {
        double v26 = [NSString stringWithFormat:@"otherRange is an EventPoint"];
        uint64_t v27 = (void *)MEMORY[0x263F5F638];
        v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m"];
        v29 = [v28 lastPathComponent];
        v30 = [NSString stringWithUTF8String:"-[PLAccountingRange overlaps:]"];
        [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:71];

        v31 = PLLogCommon();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    v20 = [(PLAccountingRange *)v4 startDate];
    v21 = self;
    goto LABEL_26;
  }
  if (v24)
  {
    uint64_t v34 = objc_opt_class();
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __30__PLAccountingRange_overlaps___block_invoke_47;
    v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v42[4] = v34;
    if (overlaps__defaultOnce_45 != -1) {
      dispatch_once(&overlaps__defaultOnce_45, v42);
    }
    if (overlaps__classDebugEnabled_46)
    {
      v35 = [NSString stringWithFormat:@"both are EventIntervals"];
      v36 = (void *)MEMORY[0x263F5F638];
      v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m"];
      v38 = [v37 lastPathComponent];
      v39 = [NSString stringWithUTF8String:"-[PLAccountingRange overlaps:]"];
      [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:75];

      uint64_t v40 = PLLogCommon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v20 = [(PLAccountingRange *)self intersect:v4];
  [v20 length];
  BOOL v32 = v41 >= 1.0;
LABEL_27:

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  id v6 = [(PLAccountingRange *)self startDate];
  if (!v6)
  {
    v3 = [v5 startDate];
    if (!v3)
    {
      char v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  unint64_t v7 = [v5 startDate];
  unint64_t v8 = [(PLAccountingRange *)self startDate];
  char v9 = [v7 isEqualToDate:v8];

  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:

  v10 = [(PLAccountingRange *)self endDate];
  if (!v10)
  {
    v3 = [v5 endDate];
    if (!v3)
    {
      char v13 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  v11 = [v5 endDate];
  double v12 = [(PLAccountingRange *)self endDate];
  char v13 = [v11 isEqualToDate:v12];

  if (!v10) {
    goto LABEL_12;
  }
LABEL_13:

  return v9 & v13;
}

uint64_t __31__PLAccountingRange_intersect___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  intersect__classDebugEnabled = result;
  return result;
}

uint64_t __31__PLAccountingRange_intersect___block_invoke_17(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  intersect__classDebugEnabled_16 = result;
  return result;
}

uint64_t __31__PLAccountingRange_intersect___block_invoke_23(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  intersect__classDebugEnabled_22 = result;
  return result;
}

uint64_t __31__PLAccountingRange_intersect___block_invoke_29(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  intersect__classDebugEnabled_28 = result;
  return result;
}

uint64_t __30__PLAccountingRange_overlaps___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  overlaps__classDebugEnabled = result;
  return result;
}

uint64_t __30__PLAccountingRange_overlaps___block_invoke_35(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  overlaps__classDebugEnabled_34 = result;
  return result;
}

uint64_t __30__PLAccountingRange_overlaps___block_invoke_41(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  overlaps__classDebugEnabled_40 = result;
  return result;
}

uint64_t __30__PLAccountingRange_overlaps___block_invoke_47(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  overlaps__classDebugEnabled_46 = result;
  return result;
}

void __31__PLAccountingRange_emptyRange__block_invoke()
{
  v0 = objc_opt_class();
  id v4 = [MEMORY[0x263EFF910] distantPast];
  v1 = [MEMORY[0x263EFF910] distantPast];
  uint64_t v2 = [v0 rangeWithStartDate:v4 withEndDate:v1];
  v3 = (void *)emptyRange_emptyRange;
  emptyRange_emptyRange = v2;
}

- (BOOL)containsDate:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__PLAccountingRange_containsDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (containsDate__defaultOnce != -1) {
      dispatch_once(&containsDate__defaultOnce, block);
    }
    if (containsDate__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"self=%@, date=%@", self, v4];
      unint64_t v7 = (void *)MEMORY[0x263F5F638];
      unint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m"];
      char v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccountingRange containsDate:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:99];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  double v12 = [(PLAccountingRange *)self startDate];
  [v4 timeIntervalSinceDate:v12];
  if (v13 >= -1.0)
  {
    objc_super v15 = [(PLAccountingRange *)self endDate];
    [v4 timeIntervalSinceDate:v15];
    BOOL v14 = v16 <= 1.0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __34__PLAccountingRange_containsDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  containsDate__classDebugEnabled = result;
  return result;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(PLAccountingRange *)self startDate];
  [v4 timeIntervalSince1970];
  uint64_t v6 = v5;
  unint64_t v7 = [(PLAccountingRange *)self endDate];
  [v7 timeIntervalSince1970];
  char v9 = objc_msgSend(v3, "stringWithFormat:", @"(%f->%f)", v6, v8);

  return v9;
}

@end