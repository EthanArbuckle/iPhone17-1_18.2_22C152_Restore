@interface VUITraitBaseClass
+ (Class)uiTraitFrom:(Class)a3;
+ (id)uiTraitsFrom:(id)a3;
@end

@implementation VUITraitBaseClass

+ (id)uiTraitsFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      objc_msgSend(v4, "setObject:atIndexedSubscript:", +[VUITraitBaseClass uiTraitFrom:](VUITraitBaseClass, "uiTraitFrom:", objc_msgSend(v3, "objectAtIndexedSubscript:", v5)), v5);
      ++v5;
    }
    while (v5 < [v3 count]);
  }

  return v4;
}

+ (Class)uiTraitFrom:(Class)a3
{
  if ((Class)objc_opt_class() != a3 && (Class)objc_opt_class() != a3) {
    objc_opt_class();
  }
  v4 = objc_opt_class();
  return (Class)v4;
}

@end