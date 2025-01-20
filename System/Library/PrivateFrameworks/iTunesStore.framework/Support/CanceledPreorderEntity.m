@interface CanceledPreorderEntity
+ (id)databaseTable;
@end

@implementation CanceledPreorderEntity

+ (id)databaseTable
{
  return @"canceled_preorder";
}

@end