@interface _SWCPatternMatchingResult
+ (id)new;
- (BOOL)isExcluded;
- (_SWCPatternMatchingResult)init;
- (id)_initWithIndex:(unint64_t)a3 excluded:(BOOL)a4;
- (unint64_t)index;
@end

@implementation _SWCPatternMatchingResult

+ (id)new
{
}

- (_SWCPatternMatchingResult)init
{
}

- (id)_initWithIndex:(unint64_t)a3 excluded:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_SWCPatternMatchingResult;
  id result = [(_SWCPatternMatchingResult *)&v7 init];
  if (result)
  {
    *((void *)result + 2) = a3;
    *((unsigned char *)result + 8) = a4;
  }
  return result;
}

- (unint64_t)index
{
  return self->_index;
}

- (BOOL)isExcluded
{
  return self->_excluded;
}

@end