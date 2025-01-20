@interface NSData
- (BOOL)ps_containsString:(id)a3;
@end

@implementation NSData

- (BOOL)ps_containsString:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self)
  {
    v6 = [v4 dataUsingEncoding:4];
    LOBYTE(self) = -[NSData rangeOfData:options:range:](self, "rangeOfData:options:range:", v6, 0, 0, [(NSData *)self length]) != (id)0x7FFFFFFFFFFFFFFFLL;
  }
  return (char)self;
}

@end