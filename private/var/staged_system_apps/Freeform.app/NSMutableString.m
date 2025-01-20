@interface NSMutableString
- (void)crl_appendCharacter:(unsigned __int16)a3;
- (void)crl_appendSeparator:(id)a3 format:(id)a4;
- (void)crl_indentBy:(unint64_t)a3;
- (void)crl_insertCharacter:(unsigned __int16)a3 atIndex:(unint64_t)a4;
@end

@implementation NSMutableString

- (void)crl_indentBy:(unint64_t)a3
{
  id v5 = [@"          " mutableCopy];
  id v7 = v5;
  while ((unint64_t)[v5 length] < a3)
  {
    [v7 appendString:v7];
    id v5 = v7;
  }
  [v7 deleteCharactersInRange:a3, [v7 length] - a3];
  [(NSMutableString *)self insertString:v7 atIndex:0];
  v6 = +[NSString stringWithFormat:@"\n%@", v7];
  [(NSMutableString *)self replaceOccurrencesOfString:@"\n", v6, 0, 0, [(NSMutableString *)self length] withString options range];
}

- (void)crl_appendCharacter:(unsigned __int16)a3
{
  UniChar chars = a3;
  CFStringAppendCharacters((CFMutableStringRef)self, &chars, 1);
}

- (void)crl_insertCharacter:(unsigned __int16)a3 atIndex:(unint64_t)a4
{
  id v6 = [objc_alloc((Class)NSString) initWithFormat:@"%C" a3];
  [(NSMutableString *)self insertString:v6 atIndex:a4];
}

- (void)crl_appendSeparator:(id)a3 format:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableString *)self length]) {
    [(NSMutableString *)self appendString:v6];
  }
  v8 = +[NSString crl_stringWithFormat:v7 arguments:&v9];
  [(NSMutableString *)self appendString:v8];
}

@end