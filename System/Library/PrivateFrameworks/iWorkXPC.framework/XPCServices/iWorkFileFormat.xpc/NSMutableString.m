@interface NSMutableString
- (void)tsu_appendCharacter:(unsigned __int16)a3;
- (void)tsu_appendSeparator:(id)a3 format:(id)a4;
- (void)tsu_indentBy:(unint64_t)a3;
- (void)tsu_insertCharacter:(unsigned __int16)a3 atIndex:(unint64_t)a4;
@end

@implementation NSMutableString

- (void)tsu_appendCharacter:(unsigned __int16)a3
{
  UniChar chars = a3;
  CFStringAppendCharacters((CFMutableStringRef)self, &chars, 1);
}

- (void)tsu_insertCharacter:(unsigned __int16)a3 atIndex:(unint64_t)a4
{
  id v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%C", a3);
  [(NSMutableString *)self insertString:v6 atIndex:a4];
}

- (void)tsu_appendSeparator:(id)a3 format:(id)a4
{
  if ([(NSMutableString *)self length]) {
    [(NSMutableString *)self appendString:a3];
  }
  [(NSMutableString *)self appendString:+[NSString tsu_stringWithFormat:a4 arguments:&v7]];
}

- (void)tsu_indentBy:(unint64_t)a3
{
  id v5 = [@"          " mutableCopy];
  id v7 = v5;
  while ((unint64_t)[v5 length] < a3)
  {
    [v7 appendString:v7];
    id v5 = v7;
  }
  objc_msgSend(v7, "deleteCharactersInRange:", a3, (char *)objc_msgSend(v7, "length") - a3);
  [(NSMutableString *)self insertString:v7 atIndex:0];
  id v6 = +[NSString stringWithFormat:@"\n%@", v7];
  [(NSMutableString *)self replaceOccurrencesOfString:@"\n", v6, 0, 0, [(NSMutableString *)self length] withString options range];
}

@end