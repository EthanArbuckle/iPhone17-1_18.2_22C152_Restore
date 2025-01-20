@interface NSMutableString
- (void)gqd_insertCharacter:(unsigned __int16)a3 atIndex:(unsigned __int16)a4;
@end

@implementation NSMutableString

- (void)gqd_insertCharacter:(unsigned __int16)a3 atIndex:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  id v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%C", a3);
  [(NSMutableString *)self insertString:v6 atIndex:v4];
}

@end