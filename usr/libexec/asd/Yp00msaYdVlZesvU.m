@interface Yp00msaYdVlZesvU
+ (double)otlAmd6vMhhfwQLu:(id)a3 withObject:(id)a4 errorValue:(int64_t *)a5;
+ (id)HeSoUpzppdCV64Ik:(_JOUEz2LcleEhhpFW *)a3 xNtFS0jGMQPgkTi7:(int64_t *)a4 i4KDOQicW9Xd5WBz:(id)a5;
+ (id)dependenciesForStringExpression:(_JOUEz2LcleEhhpFW *)a3;
+ (id)eJSthhES04gLkDjz:(_TvmAC17dBJf7RbKu *)a3 i4KDOQicW9Xd5WBz:(id)a4 TWWnmIjkBlMfHmma:(id)a5 eZh1LWn1FH2uQtPX:(int64_t *)a6;
+ (id)listDependenciesForIntExpression:(_TvmAC17dBJf7RbKu *)a3;
+ (id)listDependenciesForStringType:(_uPR6qtVQRSW46QVd *)a3;
+ (id)yv5QRLoFvJ66jYJS:(_uPR6qtVQRSW46QVd *)a3 xNtFS0jGMQPgkTi7:(int64_t *)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
+ (unint64_t)cv2QAcQ2CDdiHuN6:(id)a3;
@end

@implementation Yp00msaYdVlZesvU

+ (id)HeSoUpzppdCV64Ik:(_JOUEz2LcleEhhpFW *)a3 xNtFS0jGMQPgkTi7:(int64_t *)a4 i4KDOQicW9Xd5WBz:(id)a5
{
  id v7 = a5;
  v23 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:a3->var0 gsx0MJUoOpcxcozG:a3->var1];
  var2 = a3->var2;
  if (var2)
  {
    v9 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:a3->var2 gsx0MJUoOpcxcozG:a3->var3];
  }
  else
  {
    v9 = 0;
  }
  unint64_t var4 = a3->var4;
  id v11 = [v7 count];
  uint64_t v12 = a3->var4;
  if ((unint64_t)v11 <= var4)
  {
    v15 = 0;
    v16 = 0;
    if (v12 >= 0x3E7) {
      int v17 = 999;
    }
    else {
      int v17 = v12;
    }
    *a4 = (v17 + 16000);
    goto LABEL_20;
  }
  v13 = [v7 objectAtIndexedSubscript:v12];
  id v14 = [v13 qfSDGTGvqd3Hruzg];
  *a4 = (int64_t)v14;
  if (!v14)
  {
    v18 = +[NSExpression expressionWithFormat:v23];
    v19 = [v13 GyF0atX3JpCKc9pK];
    v15 = [v18 expressionValueWithObject:v19 context:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [v15 stringValue];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        var2 = v15;
        v15 = var2;
LABEL_18:

        goto LABEL_19;
      }
      if (!var2)
      {
        unsigned int v22 = a3->var4;
        if (v22 >= 0x3E7) {
          unsigned int v22 = 999;
        }
        *a4 = v22 + 16000;
        goto LABEL_18;
      }
      v20 = v9;
    }
    var2 = v20;
    goto LABEL_18;
  }
  var2 = 0;
  v15 = 0;
LABEL_19:
  v16 = var2;

LABEL_20:

  return v16;
}

+ (id)yv5QRLoFvJ66jYJS:(_uPR6qtVQRSW46QVd *)a3 xNtFS0jGMQPgkTi7:(int64_t *)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v25 = a5;
  id v24 = a6;
  v8 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:a3->var0 gsx0MJUoOpcxcozG:a3->var1];
  var6 = (char *)a3->var6;
  switch((int)var6)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      v10 = 0;
      var2 = a3->var2;
      goto LABEL_7;
    case 4:
    case 6:
      v10 = 0;
      var2 = a3->var3;
      var6 = (char *)a3->var5;
      goto LABEL_7;
    case 5:
      if ([v24 count])
      {
        v10 = [v24 lastObject];
        var6 = (char *)[v10 count];
        var2 = 0;
LABEL_7:
        v27 = v10;
        if (a3->var6 == 5)
        {
          if (var6)
          {
            for (i = 0; i != var6; ++i)
            {
              id v14 = +[NSString stringWithFormat:@"$%d", i];
              v15 = [v27 objectAtIndexedSubscript:i];
              if (v15)
              {
                uint64_t v16 = [v8 stringByReplacingOccurrencesOfString:v14 withString:v15];

                v8 = (void *)v16;
              }
            }
          }
        }
        else if (var6)
        {
          for (j = 0; j != var6; ++j)
          {
            if ((a3->var6 | 2) == 6) {
              v18 = (char *)a3->var4[(void)j];
            }
            else {
              v18 = j;
            }
            v19 = +[NSString stringWithFormat:@"$%d", v18];
            uint64_t v20 = +[Yp00msaYdVlZesvU HeSoUpzppdCV64Ik:var2 xNtFS0jGMQPgkTi7:a4 i4KDOQicW9Xd5WBz:v25];
            v21 = (void *)v20;
            if (*a4 || !v20)
            {

              id v12 = 0;
              goto LABEL_26;
            }
            uint64_t v22 = [v8 stringByReplacingOccurrencesOfString:v19 withString:v20];

            ++var2;
            v8 = (void *)v22;
          }
          v8 = (void *)v22;
        }
      }
      else
      {
        v27 = 0;
        *a4 = 164002;
      }
      id v12 = v8;
      v8 = v12;
LABEL_26:

LABEL_27:
      return v12;
    default:
      id v12 = 0;
      goto LABEL_27;
  }
}

+ (id)dependenciesForStringExpression:(_JOUEz2LcleEhhpFW *)a3
{
  return +[NSNumber numberWithUnsignedInt:a3->var4];
}

+ (id)listDependenciesForStringType:(_uPR6qtVQRSW46QVd *)a3
{
  p_unsigned int var6 = &a3->var6;
  unsigned int var6 = a3->var6;
  if (var6 >= 4)
  {
    if (var6 != 4 && var6 != 6)
    {
      id v11 = +[NSSet set];
      goto LABEL_12;
    }
    var3 = a3->var3;
    p_unsigned int var6 = &a3->var5;
  }
  else
  {
    var3 = a3->var2;
  }
  uint64_t v7 = *p_var6;
  id v8 = objc_alloc_init((Class)NSMutableSet);
  if ((int)v7 >= 1)
  {
    do
    {
      v9 = +[Yp00msaYdVlZesvU dependenciesForStringExpression:var3];
      [v8 addObject:v9];

      ++var3;
      --v7;
    }
    while (v7);
  }
  id v11 = +[NSSet setWithSet:v8];

LABEL_12:

  return v11;
}

+ (id)listDependenciesForIntExpression:(_TvmAC17dBJf7RbKu *)a3
{
  id v4 = objc_alloc_init((Class)NSMutableSet);
  v5 = +[NSNumber numberWithUnsignedInt:a3->var2];
  [v4 addObject:v5];

  if (a3->var0 - 1 < 2)
  {
    v6 = +[Yp00msaYdVlZesvU listDependenciesForStringType:&a3->var3];
    [v4 unionSet:v6];
  }
  uint64_t v7 = +[NSSet setWithSet:v4];

  return v7;
}

+ (double)otlAmd6vMhhfwQLu:(id)a3 withObject:(id)a4 errorValue:(int64_t *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSExpression expressionWithFormat:v6];
  v9 = [v8 expressionValueWithObject:v7 context:0];
  [v9 floatValue];
  double v11 = v10;

  return v11;
}

+ (id)eJSthhES04gLkDjz:(_TvmAC17dBJf7RbKu *)a3 i4KDOQicW9Xd5WBz:(id)a4 TWWnmIjkBlMfHmma:(id)a5 eZh1LWn1FH2uQtPX:(int64_t *)a6
{
  id v9 = a4;
  id v10 = a5;
  int64_t v30 = 0;
  unint64_t var2 = a3->var2;
  if ((unint64_t)[v9 count] <= var2)
  {
    *a6 = -27806;
    id v14 = &off_100688280;
  }
  else
  {
    id v12 = [v9 objectAtIndexedSubscript:a3->var2];
    if (a3->var0 - 1 > 1)
    {
      v13 = 0;
    }
    else
    {
      v13 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var3 xNtFS0jGMQPgkTi7:&v30 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v10];
    }
    if (v30)
    {
      *a6 = v30;
      id v14 = &off_100688280;
    }
    else
    {
      switch(a3->var0)
      {
        case 1u:
          v28 = +[NSPredicate predicateWithFormat:v13];
          v15 = [v12 GyF0atX3JpCKc9pK];
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v28 evaluateWithObject:v15 substitutionVariables:0]);
          uint64_t v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();

          *a6 = 0;
          id v17 = 0;
          break;
        case 2u:
          v21 = +[NSExpression expressionWithFormat:v13];
          uint64_t v22 = [v12 GyF0atX3JpCKc9pK];
          v27 = v21;
          id v17 = [v21 expressionValueWithObject:v22 context:0];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = v17;

            uint64_t v16 = (_UNKNOWN **)v17;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              *a6 = 134002;

              goto LABEL_22;
            }
            uint64_t v29 = 0;
            v23 = +[NSScanner scannerWithString:v17];
            unsigned int v24 = [v23 scanLongLong:&v29];

            if (v24)
            {
              uint64_t v16 = +[NSNumber numberWithLongLong:v29];
              int64_t v25 = 0;
            }
            else
            {
              uint64_t v16 = &off_100688280;
              int64_t v25 = 134001;
            }
            *a6 = v25;
          }
          break;
        case 3u:
          uint64_t v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 qfSDGTGvqd3Hruzg]);
          goto LABEL_13;
        case 4u:
          uint64_t v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 yOtBxuHAYKqZrNQN]);
LABEL_13:
          uint64_t v16 = (_UNKNOWN **)v20;
          goto LABEL_14;
        case 5u:
          v18 = [v12 wgZJLy8f4tn41Pge];
          [v18 timeIntervalSinceNow];
          uint64_t v16 = +[NSNumber numberWithDouble:v19 * -1000.0];

LABEL_14:
          id v17 = 0;
          *a6 = 0;
          break;
        default:
          id v17 = 0;
          *a6 = 133;
LABEL_22:
          uint64_t v16 = &off_100688280;
          break;
      }
      id v14 = v16;
    }
  }

  return v14;
}

+ (unint64_t)cv2QAcQ2CDdiHuN6:(id)a3
{
  id v3 = a3;
  [v3 finishEncoding];
  id v4 = [v3 encodedData];
  id v5 = [v4 bytes];
  id v6 = [v3 encodedData];
  CC_SHA256(v5, (CC_LONG)[v6 length], md);

  unint64_t v7 = *(void *)md;
  return v7;
}

@end