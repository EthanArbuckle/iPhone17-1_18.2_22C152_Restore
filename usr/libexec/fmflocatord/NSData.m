@interface NSData
- (NSData)initWithBase64EncodedString:(id)a3;
- (id)base64EncodedString;
- (id)hexString;
@end

@implementation NSData

- (id)base64EncodedString
{
  return [(NSData *)self base64EncodedStringWithOptions:0];
}

- (NSData)initWithBase64EncodedString:(id)a3
{
  return [(NSData *)self initWithBase64EncodedString:a3 options:0];
}

- (id)hexString
{
  +[NSMutableString stringWithCapacity:2 * [(NSData *)self length]];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000291A8;
  v6[3] = &unk_10005A590;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v7;
  [(NSData *)self enumerateByteRangesUsingBlock:v6];
  v4 = +[NSString stringWithString:v3];

  return v4;
}

@end