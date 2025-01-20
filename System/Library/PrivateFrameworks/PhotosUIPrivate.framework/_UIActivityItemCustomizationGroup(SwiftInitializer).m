@interface _UIActivityItemCustomizationGroup(SwiftInitializer)
+ (id)createWithGroupName:()SwiftInitializer identifier:customizations:;
@end

@implementation _UIActivityItemCustomizationGroup(SwiftInitializer)

+ (id)createWithGroupName:()SwiftInitializer identifier:customizations:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[a1 alloc] _initGroupWithName:v10 identifier:v9 customizations:v8];

  return v11;
}

@end