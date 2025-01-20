@interface CKOperationGroup(PKAdditions)
+ (id)pk_operationGroupWithName:()PKAdditions;
+ (id)pk_operationGroupWithName:()PKAdditions suffix:;
@end

@implementation CKOperationGroup(PKAdditions)

+ (id)pk_operationGroupWithName:()PKAdditions
{
  v3 = (objc_class *)MEMORY[0x1E4F1A218];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setName:v4];

  return v5;
}

+ (id)pk_operationGroupWithName:()PKAdditions suffix:
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    id v7 = [NSString stringWithFormat:@"%@.%@", v5, v6];
  }
  else
  {
    id v7 = v5;
  }
  v8 = v7;
  v9 = objc_msgSend((id)objc_opt_class(), "pk_operationGroupWithName:", v7);

  return v9;
}

@end