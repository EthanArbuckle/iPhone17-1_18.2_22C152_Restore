@interface SXWebContentComponent
+ (id)jsonPropertyNameForObjCPropertyName:(id)a3;
+ (id)typeString;
+ (id)valueClassBlockForPropertyWithName:(id)a3;
- (unint64_t)traits;
@end

@implementation SXWebContentComponent

+ (id)typeString
{
  return @"webcontent";
}

- (unint64_t)traits
{
  return 32;
}

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"dataSourceReferences"])
  {
    v5 = @"dataSources";
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXWebContentComponent;
    objc_msgSendSuper2(&v7, sel_jsonPropertyNameForObjCPropertyName_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"dataSourceReferences"])
  {
    v5 = &__block_literal_global_21;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXWebContentComponent;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __60__SXWebContentComponent_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

@end