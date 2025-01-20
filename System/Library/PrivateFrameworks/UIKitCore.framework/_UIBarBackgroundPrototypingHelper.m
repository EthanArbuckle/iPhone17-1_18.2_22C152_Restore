@interface _UIBarBackgroundPrototypingHelper
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation _UIBarBackgroundPrototypingHelper

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v5 = [(NSMutableArray *)self->_callbacks count];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    do
    {
      v8 = [(NSMutableArray *)self->_callbacks objectAtIndexedSubscript:v7];
      int v9 = v8[2]();

      if (v9)
      {
        ++v7;
      }
      else
      {
        [(NSMutableArray *)self->_callbacks removeObjectAtIndex:v7];
        --v6;
      }
    }
    while (v7 < v6);
  }
}

- (void).cxx_destruct
{
}

@end