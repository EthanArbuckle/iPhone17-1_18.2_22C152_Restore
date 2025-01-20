@interface SXSuggestedArticlesPlacementType
+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4;
+ (id)valueClassBlockForPropertyWithName:(id)a3;
- (NSString)description;
- (unint64_t)themeWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXSuggestedArticlesPlacementType

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"conditional"])
  {
    v5 = &__block_literal_global_14;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXSuggestedArticlesPlacementType;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __71__SXSuggestedArticlesPlacementType_valueClassBlockForPropertyWithName___block_invoke()
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
    v11.super_class = (Class)&OBJC_METACLASS___SXSuggestedArticlesPlacementType;
    uint64_t v8 = objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
  }
  v9 = (void *)v8;

  return (Class)v9;
}

- (unint64_t)themeWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4 != 3) {
    goto LABEL_8;
  }
  if (([v5 isEqualToString:@"dark"] & 1) == 0)
  {
    if ([v6 isEqualToString:@"light"])
    {
      unint64_t v7 = 2;
      goto LABEL_9;
    }
    if ([v6 isEqualToString:@"white"])
    {
      unint64_t v7 = 3;
      goto LABEL_9;
    }
LABEL_8:
    unint64_t v7 = 0;
    goto LABEL_9;
  }
  unint64_t v7 = 1;
LABEL_9:

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; enabled: %d",
    [(SXSuggestedArticlesPlacementType *)self enabled]);
  id v4 = [(SXSuggestedArticlesPlacementType *)self layout];
  [v3 appendFormat:@"; layout: %@", v4];

  objc_msgSend(v3, "appendFormat:", @"; theme: %lu", -[SXSuggestedArticlesPlacementType theme](self, "theme"));
  [v3 appendString:@">"];
  return (NSString *)v3;
}

@end