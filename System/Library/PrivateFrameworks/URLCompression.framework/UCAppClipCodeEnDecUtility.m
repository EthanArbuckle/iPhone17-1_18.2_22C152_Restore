@interface UCAppClipCodeEnDecUtility
+ (id)perepareData:(id)a3 withCodingVersion:(int64_t)a4 forCompressionVersion:(int64_t)a5;
+ (id)prepareData:(id)a3 withCompressionVersion:(int64_t)a4 forCodingVersion:(int64_t)a5;
+ (id)prepareURL:(id)a3 withCodingVersion:(int64_t)a4 forCompressionVersion:(int64_t)a5;
+ (id)prepareURL:(id)a3 withCompressionVersion:(int64_t)a4 forCodingVersion:(int64_t)a5;
+ (int64_t)compressionVersionFromPayloadVersion:(int64_t)a3;
@end

@implementation UCAppClipCodeEnDecUtility

+ (int64_t)compressionVersionFromPayloadVersion:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

+ (id)prepareURL:(id)a3 withCodingVersion:(int64_t)a4 forCompressionVersion:(int64_t)a5
{
  id v7 = a3;
  v8 = v7;
  if (a4 == 2 && a5 == 1) {
    id v9 = (id)[v7 padPayloadToV1Length];
  }
  else {
    id v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (id)prepareData:(id)a3 withCompressionVersion:(int64_t)a4 forCodingVersion:(int64_t)a5
{
  id v7 = a3;
  v8 = v7;
  if (a4 == 1 && a5 == 2)
  {
    id v9 = (id)[v7 transformV1ToV2Encoding];
  }
  else if (a4 == 1 && a5 == 3)
  {
    id v9 = (id)[v7 transformV1ToV3Encoding];
  }
  else
  {
    id v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (id)perepareData:(id)a3 withCodingVersion:(int64_t)a4 forCompressionVersion:(int64_t)a5
{
  id v7 = a3;
  v8 = v7;
  if (a4 == 2 && a5 == 1)
  {
    id v9 = (id)[v7 transformV2ToV1Encoding];
  }
  else if (a4 == 3 && a5 == 1)
  {
    id v9 = (id)[v7 transformV3ToV1Encoding];
  }
  else
  {
    id v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (id)prepareURL:(id)a3 withCompressionVersion:(int64_t)a4 forCodingVersion:(int64_t)a5
{
  id v7 = a3;
  v8 = v7;
  if (a4 == 1 && a5 == 2) {
    id v9 = (id)[v7 truncatePayloadToV2Length];
  }
  else {
    id v9 = v7;
  }
  v10 = v9;

  return v10;
}

@end