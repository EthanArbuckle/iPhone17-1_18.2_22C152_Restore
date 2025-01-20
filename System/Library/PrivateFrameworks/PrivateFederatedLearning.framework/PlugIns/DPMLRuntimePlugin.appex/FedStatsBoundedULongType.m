@interface FedStatsBoundedULongType
+ (id)createFromDict:(id)a3 possibleError:(id *)a4;
+ (id)gFedStatsOutOfBoundsNumber;
- (FedStatsBoundedULongType)initWithBound:(unint64_t)a3;
- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4;
- (id)decodeFromOneHotVector:(id)a3 possibleError:(id *)a4;
- (id)encodeToIndex:(id)a3 possibleError:(id *)a4;
- (id)encodeToOneHotVector:(id)a3 possibleError:(id *)a4;
- (id)sampleForIndex:(unint64_t)a3;
- (int64_t)dataType;
- (unint64_t)bound;
- (unint64_t)classCount;
- (void)setBound:(unint64_t)a3;
@end

@implementation FedStatsBoundedULongType

- (FedStatsBoundedULongType)initWithBound:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FedStatsBoundedULongType;
  result = [(FedStatsBoundedULongType *)&v5 init];
  if (result) {
    result->_bound = a3;
  }
  return result;
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  v6 = [a3 objectForKey:@"bound"];
  v7 = v6;
  if (!v6)
  {
    if (!a4) {
      goto LABEL_9;
    }
    v9 = +[NSString stringWithFormat:@"The key \"%@\" is missing", @"bound"];
    uint64_t v10 = 300;
    goto LABEL_7;
  }
  id v8 = [v6 unsignedLongValue];
  if (a4 && (unint64_t)v8 >= 0x20000001)
  {
    v9 = +[NSString stringWithFormat:@"The value for \"%@\" must be less than %lu", @"bound", 0x20000000];
    uint64_t v10 = 302;
LABEL_7:
    *a4 = +[FedStatsError errorWithCode:v10 description:v9];

    a4 = 0;
    goto LABEL_9;
  }
  a4 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithBound:", objc_msgSend(v7, "unsignedLongValue"));
LABEL_9:

  return a4;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  v7 = +[NSNull null];
  unsigned __int8 v8 = [v6 isEqual:v7];

  if (v8)
  {
    v9 = &off_1000346A0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (id v10 = [v6 longValue], v10 == objc_msgSend(v6, "unsignedLongValue")))
    {
      v11 = (char *)[v6 unsignedLongValue];
      if (v11 + 1 <= (char *)[(FedStatsBoundedULongType *)self bound]) {
        v12 = v11 + 1;
      }
      else {
        v12 = 0;
      }
      v9 = +[NSNumber numberWithUnsignedLong:v12];
    }
    else if (a4)
    {
      +[FedStatsError errorWithCode:401 description:@"The encoder can only work with a positive integer"];
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      CFStringRef v11 = @"The decoder can only work with a number type";
LABEL_9:
      +[FedStatsError errorWithCode:500 description:v11];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_10:
    id v10 = 0;
    goto LABEL_12;
  }
  id v8 = [v6 unsignedLongValue];
  if (v8 >= (id)[(FedStatsBoundedULongType *)self classCount])
  {
    if (a4)
    {
      CFStringRef v11 = @"The decoder requires a number less than the class count";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v9 = (char *)[v7 unsignedLongValue];
  if (v9)
  {
    id v10 = +[NSNumber numberWithUnsignedLong:v9 - 1];
  }
  else
  {
    id v10 = &off_1000346B8;
  }
LABEL_12:

  return v10;
}

- (id)encodeToOneHotVector:(id)a3 possibleError:(id *)a4
{
  objc_super v5 = [(FedStatsBoundedULongType *)self encodeToIndex:a3 possibleError:a4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 unsignedLongValue];
    id v8 = +[NSMutableData dataWithLength:[(FedStatsBoundedULongType *)self classCount]];
    char v11 = 1;
    objc_msgSend(v8, "replaceBytesInRange:withBytes:", v7, 1, &v11);
    v9 = +[NSData dataWithData:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)decodeFromOneHotVector:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  char v11 = 0;
  if ([v6 length])
  {
    uint64_t v7 = 0;
    while (1)
    {
      objc_msgSend(v6, "getBytes:range:", &v11, v7, 1);
      if (v11) {
        break;
      }
      if (++v7 >= (unint64_t)[v6 length]) {
        goto LABEL_5;
      }
    }
    v9 = +[NSNumber numberWithUnsignedLong:v7];
    id v8 = [(FedStatsBoundedULongType *)self decodeFromIndex:v9 possibleError:a4];
  }
  else
  {
LABEL_5:
    if (a4)
    {
      +[FedStatsError errorWithCode:900 description:@"Only one factor in the input vector must be non-zero."];
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)classCount
{
  return [(FedStatsBoundedULongType *)self bound] + 1;
}

- (int64_t)dataType
{
  return 1;
}

+ (id)gFedStatsOutOfBoundsNumber
{
  return &off_1000346B8;
}

- (id)sampleForIndex:(unint64_t)a3
{
  if (a3) {
    unint64_t v3 = a3 - 1;
  }
  else {
    unint64_t v3 = [(FedStatsBoundedULongType *)self bound];
  }
  return +[NSNumber numberWithUnsignedLong:v3];
}

- (unint64_t)bound
{
  return self->_bound;
}

- (void)setBound:(unint64_t)a3
{
  self->_bound = a3;
}

@end