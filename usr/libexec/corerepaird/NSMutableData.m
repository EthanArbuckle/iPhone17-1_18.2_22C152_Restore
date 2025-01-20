@interface NSMutableData
- (void)appendByte:(unsigned __int8)a3;
- (void)appendLittleInt16:(unsigned __int16)a3;
- (void)appendLittleInt32:(unsigned int)a3;
@end

@implementation NSMutableData

- (void)appendByte:(unsigned __int8)a3
{
  unsigned __int8 v3 = a3;
  [(NSMutableData *)self appendBytes:&v3 length:1];
}

- (void)appendLittleInt16:(unsigned __int16)a3
{
  unsigned __int16 v3 = a3;
  [(NSMutableData *)self appendBytes:&v3 length:2];
}

- (void)appendLittleInt32:(unsigned int)a3
{
  unsigned int v3 = a3;
  [(NSMutableData *)self appendBytes:&v3 length:4];
}

@end