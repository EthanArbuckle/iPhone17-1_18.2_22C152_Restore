@interface NSMapTable(MSVAdditions)
+ (id)msvIndexMapTableWithCapacity:()MSVAdditions;
@end

@implementation NSMapTable(MSVAdditions)

+ (id)msvIndexMapTableWithCapacity:()MSVAdditions
{
  v3 = (void *)[[a1 alloc] initWithKeyOptions:512 valueOptions:1282 capacity:a3];
  return v3;
}

@end