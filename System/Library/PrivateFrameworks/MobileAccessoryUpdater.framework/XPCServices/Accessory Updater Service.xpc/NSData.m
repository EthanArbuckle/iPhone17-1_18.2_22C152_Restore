@interface NSData
- (NSString)byteString;
@end

@implementation NSData

- (NSString)byteString
{
  v3 = +[NSMutableString string];
  v4 = self;
  v5 = [(NSData *)v4 bytes];
  if ([(NSData *)v4 length])
  {
    unint64_t v6 = 0;
    do
      objc_msgSend(v3, "appendFormat:", @"%02x", v5[v6++]);
    while (v6 < [(NSData *)v4 length]);
  }
  v7 = +[NSString stringWithString:v3];

  return (NSString *)v7;
}

@end