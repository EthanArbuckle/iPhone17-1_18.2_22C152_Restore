@interface FedStatsDataTypeFactory
+ (id)createFedStatsDataType:(id)a3 dataTypeParams:(id)a4 possibleError:(id *)a5;
+ (id)stringFromDataType:(int64_t)a3;
+ (int64_t)dataTypeFromString:(id)a3;
@end

@implementation FedStatsDataTypeFactory

+ (int64_t)dataTypeFromString:(id)a3
{
  v3 = [&unk_26D0B52C8 objectForKey:a3];
  v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = -2;
  }

  return v5;
}

+ (id)stringFromDataType:(int64_t)a3
{
  v3 = [NSNumber numberWithInteger:a3];
  v4 = [&unk_26D0B52F0 allKeysForObject:v3];

  if (v4 && [v4 count] == 1)
  {
    int64_t v5 = [v4 firstObject];
  }
  else
  {
    int64_t v5 = @"InvalidType";
  }

  return v5;
}

+ (id)createFedStatsDataType:(id)a3 dataTypeParams:(id)a4 possibleError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  int64_t v9 = +[FedStatsDataTypeFactory dataTypeFromString:v7];
  switch(v9)
  {
    case -2:
      if (a5)
      {
        v10 = [NSString stringWithFormat:@"The data type \"%@\" is not defined", v7];
        uint64_t v11 = 200;
        goto LABEL_8;
      }
      goto LABEL_14;
    case -1:
      goto LABEL_6;
    case 0:
      v12 = FedStatsBooleanType;
      goto LABEL_13;
    case 1:
      v12 = FedStatsBoundedULongType;
      goto LABEL_13;
    case 2:
      v12 = FedStatsBucketedType;
      goto LABEL_13;
    case 3:
      v12 = FedStatsCategoricalType;
      goto LABEL_13;
    default:
      if (v9 == 99)
      {
        v12 = FedStatsCombinationType;
LABEL_13:
        a5 = [(__objc2_class *)v12 createFromDict:v8 possibleError:a5];
      }
      else
      {
LABEL_6:
        if (a5)
        {
          v10 = [NSString stringWithFormat:@"The data type \"%@\" is not supported", v7];
          uint64_t v11 = 900;
LABEL_8:
          *a5 = +[FedStatsError errorWithCode:v11 description:v10];

          a5 = 0;
        }
      }
LABEL_14:

      return a5;
  }
}

@end