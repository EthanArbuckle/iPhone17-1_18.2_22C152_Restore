@interface REMCDImageAttachment
+ (BOOL)isAbstract;
+ (id)cdEntityName;
+ (id)fetchRequest;
- (id)attachmentRepresentationAndReturnError:(id *)a3;
@end

@implementation REMCDImageAttachment

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMImageAttachment cdEntityName];
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDImageAttachment"];
}

- (id)attachmentRepresentationAndReturnError:(id *)a3
{
  return sub_100496B54(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_1004994D0);
}

@end