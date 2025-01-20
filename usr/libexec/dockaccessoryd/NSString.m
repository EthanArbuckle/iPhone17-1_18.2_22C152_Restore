@interface NSString
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (id)serializeWithError:(id *)a3;
@end

@implementation NSString

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)NSString);
  id v7 = v5;
  id v8 = [v7 bytes];
  id v9 = [v7 length];

  id v10 = [v6 initWithBytes:v8 length:v9 encoding:4];
  v11 = v10;
  if (a4 && !v10)
  {
    *a4 = +[NSError hapErrorWithcode:9 description:@"Invalid parameter." reason:@"TLV data is not UTF8 encoded" suggestion:0 underlyingError:0];
  }

  return v11;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v4 = [(NSString *)self dataUsingEncoding:4 allowLossyConversion:0];
  id v5 = (void *)v4;
  if (a3 && !v4)
  {
    *a3 = +[NSError hapErrorWithcode:9 description:@"Invalid parameter." reason:@"TLV data cannot be UTF8 encoded" suggestion:0 underlyingError:0];
  }

  return v5;
}

@end