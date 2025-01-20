@interface STUsage
+ (id)fetchRequest;
+ (id)fetchRequestMatchingUser:(id)a3 device:(id)a4;
@end

@implementation STUsage

+ (id)fetchRequest
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___STUsage;
  v2 = objc_msgSendSuper2(&v4, sel_fetchRequest);
  return v2;
}

+ (id)fetchRequestMatchingUser:(id)a3 device:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[STUsage fetchRequest];
  v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == %@) AND (%K == %@)", @"user", v6, @"device", v5];

  [v7 setPredicate:v8];
  return v7;
}

@end