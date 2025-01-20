@interface SXSectionComponent
+ (id)jsonPropertyNameForObjCPropertyName:(id)a3;
+ (id)typeString;
@end

@implementation SXSectionComponent

+ (id)typeString
{
  return @"section";
}

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"animation"])
  {
    v5 = @"scene";
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXSectionComponent;
    objc_msgSendSuper2(&v7, sel_jsonPropertyNameForObjCPropertyName_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end