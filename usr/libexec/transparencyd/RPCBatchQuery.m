@interface RPCBatchQuery
+ (id)fetchRequest;
@end

@implementation RPCBatchQuery

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"RPCBatchQuery"];
}

@end