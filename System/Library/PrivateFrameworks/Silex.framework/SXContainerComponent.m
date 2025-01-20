@interface SXContainerComponent
+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4;
+ (id)objectValueClassBlockForPropertyWithName:(id)a3;
+ (id)purgeClassBlockForPropertyWithName:(id)a3;
+ (id)typeString;
- (BOOL)allowAutoplacedAdsWithValue:(id)a3 withType:(int)a4;
- (BOOL)requiresLinkedContent;
@end

@implementation SXContainerComponent

+ (id)purgeClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"components"])
  {
    v5 = +[SXJSONObjectComponentSupport shared];
    v6 = [v5 purgeClassBlock];
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SXContainerComponent;
    v6 = objc_msgSendSuper2(&v8, sel_purgeClassBlockForPropertyWithName_, v4);
  }

  return v6;
}

+ (id)objectValueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"components"])
  {
    v5 = +[SXJSONObjectComponentSupport shared];
    v6 = [v5 objectValueClassBlock];
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SXContainerComponent;
    v6 = objc_msgSendSuper2(&v8, sel_objectValueClassBlockForPropertyWithName_, v4);
  }

  return v6;
}

+ (id)typeString
{
  return @"container";
}

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:v6])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v8 = [v7 objectForKey:@"type"];
      if (([v8 isEqualToString:@"collection"] & 1) != 0
        || [v8 isEqualToString:@"horizontal_stack"])
      {
        v9 = objc_opt_class();

        goto LABEL_8;
      }
    }
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___SXContainerComponent;
  v9 = objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
LABEL_8:

  return (Class)v9;
}

- (BOOL)allowAutoplacedAdsWithValue:(id)a3 withType:(int)a4
{
  id v6 = a3;
  char v7 = [(SXComponent *)self role] != 8 && [(SXComponent *)self role] != 37;
  if (a4 == 2) {
    char v7 = [v6 BOOLValue];
  }

  return v7;
}

- (BOOL)requiresLinkedContent
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(SXContainerComponent *)self components];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) requiresLinkedContent])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

@end