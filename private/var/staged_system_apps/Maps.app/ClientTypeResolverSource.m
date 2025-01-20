@interface ClientTypeResolverSource
- (BOOL)hasObjectWithType:(int)a3;
- (BOOL)typeIsValid:(int)a3;
- (id)knownTypes;
@end

@implementation ClientTypeResolverSource

- (BOOL)typeIsValid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(ClientTypeResolverSource *)self knownTypes];
  v5 = +[NSNumber numberWithInt:v3];
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

- (id)knownTypes
{
  return &__NSArray0__struct;
}

- (BOOL)hasObjectWithType:(int)a3
{
  return 0;
}

@end