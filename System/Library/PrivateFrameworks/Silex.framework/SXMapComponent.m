@interface SXMapComponent
+ (id)typeString;
+ (id)valueClassBlockForPropertyWithName:(id)a3;
- (unint64_t)defaultMapTypeWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXMapComponent

+ (id)typeString
{
  return @"map";
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"items"])
  {
    v5 = &__block_literal_global_92;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXMapComponent;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __53__SXMapComponent_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

- (unint64_t)defaultMapTypeWithValue:(id)a3 withType:(int)a4
{
  id v4 = a3;
  if ([v4 isEqualToString:@"standard"])
  {
    unint64_t v5 = 0;
  }
  else if ([v4 isEqualToString:@"satellite"])
  {
    unint64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"hybrid"])
  {
    unint64_t v5 = 2;
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

@end