@interface SXAdvertisementPlacementType
+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4;
+ (id)valueClassBlockForPropertyWithName:(id)a3;
- (NSString)description;
- (unint64_t)bannerTypeWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXAdvertisementPlacementType

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"conditional"])
  {
    v5 = &__block_literal_global_6;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXAdvertisementPlacementType;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __67__SXAdvertisementPlacementType_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"layout"])
  {
    uint64_t v8 = objc_opt_class();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXAdvertisementPlacementType;
    uint64_t v8 = objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
  }
  v9 = (void *)v8;

  return (Class)v9;
}

- (unint64_t)bannerTypeWithValue:(id)a3 withType:(int)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEqualToString:@"any"])
    {
      unint64_t v5 = 1;
    }
    else if ([v4 isEqualToString:@"standard"])
    {
      unint64_t v5 = 2;
    }
    else if ([v4 isEqualToString:@"double_height"])
    {
      unint64_t v5 = 3;
    }
    else if ([v4 isEqualToString:@"large"])
    {
      unint64_t v5 = 4;
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  if (v5 <= 1) {
    unint64_t v5 = 1;
  }

  return v5;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; enabled: %d",
    [(SXAdvertisementPlacementType *)self enabled]);
  id v4 = [(SXAdvertisementPlacementType *)self layout];
  [v3 appendFormat:@"; layout: %@", v4];

  objc_msgSend(v3, "appendFormat:", @"; frequency: %lu",
    [(SXAdvertisementPlacementType *)self frequency]);
  objc_msgSend(v3, "appendFormat:", @"; bannerType: %lu",
    [(SXAdvertisementPlacementType *)self bannerType]);
  uint64_t v5 = [(SXAdvertisementPlacementType *)self distanceFromMedia];
  [(SXAdvertisementPlacementType *)self distanceFromMedia];
  objc_msgSend(v3, "appendFormat:", @"; distanceFromMedia: %f - %lu", v5, v6);
  [v3 appendString:@">"];
  return (NSString *)v3;
}

@end