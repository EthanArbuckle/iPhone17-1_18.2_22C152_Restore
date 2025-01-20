@interface NUEmptyPattern
- (BOOL)isEmpty;
- (BOOL)isEqualToPattern:(id)a3;
- (BOOL)isFixedOrder;
- (BOOL)match:(id)a3 location:(unint64_t *)a4 count:(unint64_t *)a5;
- (id)shortestMatch;
- (id)stringRepresentation;
- (id)tokens;
@end

@implementation NUEmptyPattern

- (BOOL)match:(id)a3 location:(unint64_t *)a4 count:(unint64_t *)a5
{
  unint64_t v6 = *a4;
  unint64_t v7 = [a3 count];
  if (v6 <= v7) {
    *a5 = 0;
  }
  return v6 <= v7;
}

- (BOOL)isEqualToPattern:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isEmpty
{
  return 1;
}

- (id)stringRepresentation
{
  return @"[]";
}

- (id)shortestMatch
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isFixedOrder
{
  return 1;
}

- (id)tokens
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

@end