@interface NSOperationQueue(SPUIAdditions)
- (uint64_t)logStateOperationCountGreaterThan:()SPUIAdditions;
@end

@implementation NSOperationQueue(SPUIAdditions)

- (uint64_t)logStateOperationCountGreaterThan:()SPUIAdditions
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__NSOperationQueue_SPUIAdditions__logStateOperationCountGreaterThan___block_invoke;
  v4[3] = &unk_264E90638;
  v4[4] = a1;
  v4[5] = a3;
  return [a1 addOperationWithBlock:v4];
}

@end