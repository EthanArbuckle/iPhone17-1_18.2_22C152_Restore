@interface NSHashTable(PKAdditions)
+ (id)pk_hashTableUsingPointerPersonality;
+ (id)pk_weakObjectsHashTableUsingPointerPersonality;
@end

@implementation NSHashTable(PKAdditions)

+ (id)pk_weakObjectsHashTableUsingPointerPersonality
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
  return v0;
}

+ (id)pk_hashTableUsingPointerPersonality
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:512 capacity:0];
  return v0;
}

@end