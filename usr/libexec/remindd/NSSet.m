@interface NSSet
- (id)jsonify;
@end

@implementation NSSet

- (id)jsonify
{
  v2 = self;
  id v3 = sub_100413F78((Class *)NSMutableSet_ptr, (void (*)(void))&NSSet.makeIterator());

  return v3;
}

@end