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
    v9 = [NSString stringWithFormat:@"The key \"%@\" is missing", @"bound"];
    uint64_t v10 = 300;
    goto LABEL_7;
  }
  unint64_t v8 = [v6 unsignedLongValue];
  if (a4 && v8 >= 0x20000001)
  {
    v9 = [NSString stringWithFormat:@"The value for \"%@\" must be less than %lu", @"bound", 0x20000000];
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
  v7 = [MEMORY[0x263EFF9D0] null];
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
    v9 = &unk_26D0B51C8;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (uint64_t v10 = [v6 longValue], v10 == objc_msgSend(v6, "unsignedLongValue")))
    {
      uint64_t v11 = [v6 unsignedLongValue];
      if (v11 + 1 <= [(FedStatsBoundedULongType *)self bound]) {
        uint64_t v12 = v11 + 1;
      }
      else {
        uint64_t v12 = 0;
      }
      v9 = [NSNumber numberWithUnsignedLong:v12];
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
      uint64_t v11 = @"The decoder can only work with a number type";
LABEL_9:
      +[FedStatsError errorWithCode:500 description:v11];
      uint64_t v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_10:
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  unint64_t v8 = [v6 unsignedLongValue];
  if (v8 >= [(FedStatsBoundedULongType *)self classCount])
  {
    if (a4)
    {
      uint64_t v11 = @"The decoder requires a number less than the class count";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  uint64_t v9 = [v7 unsignedLongValue];
  if (v9)
  {
    uint64_t v10 = [NSNumber numberWithUnsignedLong:v9 - 1];
  }
  else
  {
    uint64_t v10 = &unk_26D0B51E0;
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
    uint64_t v7 = [v5 unsignedLongValue];
    unint64_t v8 = [(FedStatsBoundedULongType *)self classCount];
    uint64_t v9 = [MEMORY[0x263EFF990] dataWithLength:v8];
    char v12 = 1;
    objc_msgSend(v9, "replaceBytesInRange:withBytes:", v7, 1, &v12);
    uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithData:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
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
    uint64_t v9 = [NSNumber numberWithUnsignedLong:v7];
    unint64_t v8 = [(FedStatsBoundedULongType *)self decodeFromIndex:v9 possibleError:a4];
  }
  else
  {
LABEL_5:
    if (a4)
    {
      +[FedStatsError errorWithCode:900 description:@"Only one factor in the input vector must be non-zero."];
      unint64_t v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v8 = 0;
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
  return &unk_26D0B51E0;
}

- (id)sampleForIndex:(unint64_t)a3
{
  v3 = NSNumber;
  if (a3) {
    unint64_t v4 = a3 - 1;
  }
  else {
    unint64_t v4 = [(FedStatsBoundedULongType *)self bound];
  }
  return (id)[v3 numberWithUnsignedLong:v4];
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