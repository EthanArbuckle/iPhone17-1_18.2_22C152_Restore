@interface FedStatsBooleanType
+ (id)createFromDict:(id)a3 possibleError:(id *)a4;
- (FedStatsBooleanType)init;
- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4;
- (id)decodeFromOneHotVector:(id)a3 possibleError:(id *)a4;
- (id)encodeToIndex:(id)a3 possibleError:(id *)a4;
- (id)encodeToOneHotVector:(id)a3 possibleError:(id *)a4;
- (id)sampleForIndex:(unint64_t)a3;
- (int64_t)dataType;
- (unint64_t)classCount;
@end

@implementation FedStatsBooleanType

- (FedStatsBooleanType)init
{
  v3.receiver = self;
  v3.super_class = (Class)FedStatsBooleanType;
  return [(FedStatsBooleanType *)&v3 init];
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  id v4 = objc_alloc_init((Class)a1);
  return v4;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x263EFF9D0] null];
  char v7 = [v5 isEqual:v6];

  if (v7)
  {
    v8 = &unk_26D0B51C8;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "BOOLValue"));
    }
    else if (a4)
    {
      +[FedStatsError errorWithCode:401 description:@"The encoder can only work with a number type"];
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    char v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:500 description:@"The encoder can only work with a number type"];
    char v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)encodeToOneHotVector:(id)a3 possibleError:(id *)a4
{
  id v4 = [(FedStatsBooleanType *)self encodeToIndex:a3 possibleError:a4];
  id v5 = v4;
  if (v4)
  {
    __int16 v8 = 0;
    *((unsigned char *)&v8 + [v4 unsignedIntValue]) = 1;
    v6 = [MEMORY[0x263EFF8F8] dataWithBytes:&v8 length:2];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)decodeFromOneHotVector:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  char v7 = v6;
  if (v6)
  {
    __int16 v11 = 0;
    objc_msgSend(v6, "getBytes:range:", &v11, 0, 2);
    __int16 v8 = [NSNumber numberWithBool:HIBYTE(v11) == 1];
    v9 = [(FedStatsBooleanType *)self decodeFromIndex:v8 possibleError:a4];
  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:500 description:@"The decoder can only work with a valid one-hot vector"];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)dataType
{
  return 0;
}

- (unint64_t)classCount
{
  return 2;
}

- (id)sampleForIndex:(unint64_t)a3
{
  return (id)[NSNumber numberWithBool:a3 == 1];
}

@end