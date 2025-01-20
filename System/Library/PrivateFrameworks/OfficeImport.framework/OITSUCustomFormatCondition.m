@interface OITSUCustomFormatCondition
- (BOOL)isEqual:(id)a3;
- (OITSUCustomFormatCondition)init;
- (OITSUCustomFormatCondition)initWithType:(int)a3 value:(double)a4 data:(id)a5;
- (OITSUCustomFormatData)data;
- (double)conditionValue;
- (id)copyWithZone:(_NSZone *)a3;
- (int)conditionType;
- (unint64_t)hash;
@end

@implementation OITSUCustomFormatCondition

- (OITSUCustomFormatCondition)init
{
  v3 = [NSString stringWithUTF8String:"-[OITSUCustomFormatCondition init]"];
  v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:526 isFatal:0 description:"Do not call init for TSUCustomFormatCondition"];

  +[OITSUAssertionHandler logBacktraceThrottled];
  return 0;
}

- (OITSUCustomFormatCondition)initWithType:(int)a3 value:(double)a4 data:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)OITSUCustomFormatCondition;
  v9 = [(OITSUCustomFormatCondition *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_conditionType = a3;
    v9->_conditionValue = a4;
    if (!v8)
    {
      v11 = [NSString stringWithUTF8String:"-[OITSUCustomFormatCondition initWithType:value:data:]"];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 537, 0, "invalid nil value for '%{public}s'", "data");

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    uint64_t v13 = [v8 copy];
    data = v10->_data;
    v10->_data = (OITSUCustomFormatData *)v13;

    [(OITSUCustomFormatData *)v10->_data setIsConditional:1];
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[OITSUCustomFormatCondition allocWithZone:a3];
  uint64_t v5 = [(OITSUCustomFormatCondition *)self conditionType];
  [(OITSUCustomFormatCondition *)self conditionValue];
  double v7 = v6;
  id v8 = [(OITSUCustomFormatCondition *)self data];
  v9 = [(OITSUCustomFormatCondition *)v4 initWithType:v5 value:v8 data:v7];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = TSUDynamicCast(v5, (uint64_t)v4);

  if (v6
    && ([(OITSUCustomFormatCondition *)self conditionValue],
        double v8 = v7,
        [v6 conditionValue],
        v8 == v9)
    && (int v10 = [(OITSUCustomFormatCondition *)self conditionType],
        v10 == [v6 conditionType]))
  {
    v11 = [(OITSUCustomFormatCondition *)self data];
    v12 = [v6 data];
    char v13 = [v11 isEqual:v12];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return [(OITSUCustomFormatCondition *)self conditionType];
}

- (int)conditionType
{
  return self->_conditionType;
}

- (double)conditionValue
{
  return self->_conditionValue;
}

- (OITSUCustomFormatData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end