@interface FedStatsGeoHashType
+ (id)createFromDict:(id)a3 possibleError:(id *)a4;
+ (unint64_t)geoHashCharToInteger:(char)a3;
- (FedStatsGeoHashType)initWithGeoHashLength:(unint64_t)a3;
- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4;
- (id)encodeToIndex:(id)a3 possibleError:(id *)a4;
- (id)sampleForIndex:(unint64_t)a3;
- (unint64_t)hashLength;
- (void)setHashLength:(unint64_t)a3;
@end

@implementation FedStatsGeoHashType

+ (unint64_t)geoHashCharToInteger:(char)a3
{
  uint64_t v3 = a3 - 48;
  if (v3 > 0x4A) {
    return -1;
  }
  else {
    return *(void *)&kFedStatsGeoHashMap[8 * v3 + 32];
  }
}

- (FedStatsGeoHashType)initWithGeoHashLength:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FedStatsGeoHashType;
  result = [(FedStatsBoundedULongType *)&v5 initWithBound:1 << (5 * a3)];
  if (result) {
    result->_hashLength = a3;
  }
  return result;
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  objc_super v5 = [a3 objectForKey:@"hashLength"];
  if (!v5)
  {
    if (!a4) {
      goto LABEL_12;
    }
    v10 = +[NSString stringWithFormat:@"Missing key \"%@\", @"hashLength""];
    uint64_t v11 = 300;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 doubleValue];
    double v7 = v6;
    [v5 doubleValue];
    if (v7 == round(v8))
    {
      id v9 = [v5 unsignedLongValue];
      if (v9 == [v5 longValue])
      {
        if ([v5 unsignedLongValue])
        {
          a4 = -[FedStatsGeoHashType initWithGeoHashLength:]([FedStatsGeoHashType alloc], "initWithGeoHashLength:", [v5 unsignedLongValue]);
          goto LABEL_12;
        }
      }
    }
  }
  if (a4)
  {
    v10 = +[NSString stringWithFormat:@"The value for key \"%@\" must be a positive integer", @"hashLength"];
    uint64_t v11 = 302;
LABEL_11:
    *a4 = +[FedStatsError errorWithCode:v11 description:v10];

    a4 = 0;
  }
LABEL_12:

  return a4;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  double v7 = +[NSNull null];
  unsigned __int8 v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v9 = &off_1000346E8;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      +[FedStatsError errorWithCode:401 description:@"The geohash type accepts only a string to encode"];
      id v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  id v10 = [v6 length];
  if (v10 > (id)[(FedStatsGeoHashType *)self hashLength])
  {
    if (a4)
    {
      uint64_t v11 = +[NSString stringWithFormat:@"This geohash encoder accepts hashes of length %lu", [(FedStatsGeoHashType *)self hashLength]];
      *a4 = +[FedStatsError errorWithCode:401 description:v11];
    }
LABEL_9:
    id v9 = 0;
    goto LABEL_18;
  }
  uint64_t v12 = 1;
  v13 = (char *)[v6 cStringUsingEncoding:1];
  if ([(FedStatsGeoHashType *)self hashLength])
  {
    uint64_t v14 = 0;
    int v15 = 0;
    unint64_t v16 = 0;
    while (1)
    {
      unint64_t v17 = +[FedStatsGeoHashType geoHashCharToInteger:v13[v14]];
      if (v17 == -1) {
        break;
      }
      unint64_t v16 = v17 + 32 * v16;
      uint64_t v14 = ++v15;
      if ([(FedStatsGeoHashType *)self hashLength] <= v15)
      {
        uint64_t v12 = v16 + 1;
        goto LABEL_15;
      }
    }
    uint64_t v18 = 0;
  }
  else
  {
LABEL_15:
    uint64_t v18 = v12;
  }
  id v9 = +[NSNumber numberWithUnsignedLong:v18];
LABEL_18:

  return v9;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  double v7 = (char *)[v6 unsignedLongValue];
  if (v7 == [v6 longValue])
  {
    if (v7)
    {
      unint64_t v8 = (unint64_t)(v7 - 1);
      id v9 = malloc_type_malloc([(FedStatsGeoHashType *)self hashLength] + 1, 0x100004077774924uLL);
      *((unsigned char *)[(FedStatsGeoHashType *)self hashLength] + (void)v9) = 0;
      unsigned int v10 = [(FedStatsGeoHashType *)self hashLength];
      do
      {
        v9[--v10] = kFedStatsGeoHashMap[v8 & 0x1F];
        v8 >>= 5;
      }
      while ((_BYTE)v10);
      uint64_t v11 = +[NSString stringWithCString:v9 encoding:1];
      free(v9);
    }
    else
    {
      uint64_t v11 = [(FedStatsGeoHashType *)self sampleForIndex:0];
    }
  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:500 description:@"The geohash decoder accepts only positive integers"];
    uint64_t v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)sampleForIndex:(unint64_t)a3
{
  if (a3)
  {
    v4 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:");
    objc_super v5 = [(FedStatsGeoHashType *)self decodeFromIndex:v4 possibleError:0];
  }
  else
  {
    objc_super v5 = objc_msgSend(&stru_100031ED0, "stringByPaddingToLength:withString:startingAtIndex:", -[FedStatsGeoHashType hashLength](self, "hashLength"), @"@", 0);
  }
  return v5;
}

- (unint64_t)hashLength
{
  return self->_hashLength;
}

- (void)setHashLength:(unint64_t)a3
{
  self->_hashLength = a3;
}

@end