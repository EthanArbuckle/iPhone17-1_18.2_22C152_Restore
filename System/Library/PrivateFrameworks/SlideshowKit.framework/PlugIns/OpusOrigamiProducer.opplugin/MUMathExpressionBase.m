@interface MUMathExpressionBase
+ (id)parserErrorToString:(id *)a3;
- (MUMathExpressionBase)init;
- (id)lastError;
- (void)_cleanup;
- (void)dealloc;
- (void)setLastError:(id *)a3;
@end

@implementation MUMathExpressionBase

- (MUMathExpressionBase)init
{
  v4.receiver = self;
  v4.super_class = (Class)MUMathExpressionBase;
  v2 = [(MUMathExpressionBase *)&v4 init];
  if (v2) {
    v2->_indicesForVariables = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v2;
}

- (void)_cleanup
{
  self->_indicesForVariables = 0;
  lastError = self->_lastError;
}

- (void)dealloc
{
  [(MUMathExpressionBase *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MUMathExpressionBase;
  [(MUMathExpressionBase *)&v3 dealloc];
}

- (id)lastError
{
  return self->_lastError;
}

+ (id)parserErrorToString:(id *)a3
{
  unsigned int v3 = a3->var0 - 1;
  if (v3 > 0x1B) {
    return @"Unknown Parser Error Type!";
  }
  else {
    return off_1A5288[v3];
  }
}

- (void)setLastError:(id *)a3
{
  v5 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[MUMathExpressionBase parserErrorToString:](MUMathExpressionBase, "parserErrorToString:", a3), NSLocalizedDescriptionKey, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->var0), @"kMUMathParserErrorCode", +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", a3->var1), @"kMUMathParserErrorStartOffset", +[NSNumber numberWithLong:a3->var2], @"kMUMathParserErrorEndOffset", 0);
  self->_lastError = +[NSError errorWithDomain:@"kMUMathParserErrorDomain" code:a3->var0 userInfo:v5];
  NSLog(@"MathExpression ParserError :\n %@\n", v5);
}

@end