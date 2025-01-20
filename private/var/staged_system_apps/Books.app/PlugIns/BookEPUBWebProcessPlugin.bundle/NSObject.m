@interface NSObject
- (BOOL)baxBoolValueForKey:(id)a3;
- (CGPoint)baxCGPointValueForKey:(id)a3;
- (CGRect)baxCGRectValueForKey:(id)a3;
- (CGSize)baxCGSizeValueForKey:(id)a3;
- (_NSRange)baxRangeValueForKey:(id)a3;
- (double)baxCGFloatValueForKey:(id)a3;
- (double)baxDoubleValueForKey:(id)a3;
- (double)baxTimeIntervalValueForKey:(id)a3;
- (float)baxFloatValueForKey:(id)a3;
- (id)_baxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 expectedTypeEncoding:(const char *)a5;
- (id)_baxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 possibleExpectedTypeEncodings:(const char *)a5;
- (id)baxValueForKey:(id)a3;
- (int)baxIntValueForKey:(id)a3;
- (int64_t)baxIntegerValueForKey:(id)a3;
- (unint64_t)baxUnsignedIntegerValueForKey:(id)a3;
- (unsigned)baxUnsignedIntValueForKey:(id)a3;
@end

@implementation NSObject

- (id)_baxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 expectedTypeEncoding:(const char *)a5
{
  return -[NSObject _baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, a4, a5, 0);
}

- (id)_baxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 possibleExpectedTypeEncodings:(const char *)a5
{
  id v7 = a3;
  id v8 = [self baxValueForKey:v7];
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (qword_27258 == -1)
      {
LABEL_10:

        id v8 = 0;
        goto LABEL_11;
      }
LABEL_15:
      dispatch_once(&qword_27258, &stru_209F8);
      goto LABEL_10;
    }
    if (a5)
    {
      id v8 = v8;
      v9 = (const char *)[v8 objCType];
      if (strcmp(v9, a5))
      {
        v12 = (const char **)&v14;
        while (1)
        {
          v10 = v12++;
          if (!*v10) {
            break;
          }
          if (!strcmp(v9, *v10)) {
            goto LABEL_11;
          }
        }
        if (qword_27258 == -1) {
          goto LABEL_10;
        }
        goto LABEL_15;
      }
    }
  }
LABEL_11:

  return v8;
}

- (id)baxValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [self valueForKey:v4];

  return v5;
}

- (BOOL)baxBoolValueForKey:(id)a3
{
  id v4 = a3;
  v5 = -[NSObject _baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "i", "c", "B", 0);

  unsigned __int8 v6 = [v5 BOOLValue];
  return v6;
}

- (int)baxIntValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [self _baxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"i"];

  int v6 = [v5 intValue];
  return v6;
}

- (unsigned)baxUnsignedIntValueForKey:(id)a3
{
  id v4 = a3;
  v5 = -[NSObject _baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "i", "I", 0);

  unsigned int v6 = [v5 unsignedIntValue];
  return v6;
}

- (int64_t)baxIntegerValueForKey:(id)a3
{
  id v4 = a3;
  v5 = -[NSObject _baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "q", 0);

  id v6 = [v5 integerValue];
  return (int64_t)v6;
}

- (unint64_t)baxUnsignedIntegerValueForKey:(id)a3
{
  id v4 = a3;
  v5 = -[NSObject _baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_baxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "Q", "q", "Q", 0);

  id v6 = [v5 unsignedIntegerValue];
  return (unint64_t)v6;
}

- (float)baxFloatValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [self _baxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"f"];

  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (double)baxDoubleValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [self _baxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"d"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (double)baxTimeIntervalValueForKey:(id)a3
{
  [self baxDoubleValueForKey:a3];
  return result;
}

- (_NSRange)baxRangeValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [self _baxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"{_NSRange=QQ}"];

  id v6 = [v5 rangeValue];
  NSUInteger v8 = v7;

  NSUInteger v9 = (NSUInteger)v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (double)baxCGFloatValueForKey:(id)a3
{
  [self baxDoubleValueForKey:a3];
  return result;
}

- (CGPoint)baxCGPointValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [self _baxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGPoint=dd}"];

  [v5 CGPointValue];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGSize)baxCGSizeValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [self _baxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGSize=dd}"];

  [v5 CGSizeValue];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGRect)baxCGRectValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [self _baxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGRect={CGPoint=dd}{CGSize=dd}}"];

  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

@end