@interface NSBundle(PersonaUI)
+ (id)pr_personaUIBundle;
@end

@implementation NSBundle(PersonaUI)

+ (id)pr_personaUIBundle
{
  if (pr_personaUIBundle_onceToken != -1) {
    dispatch_once(&pr_personaUIBundle_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)pr_personaUIBundle_personaUIBundle;
  return v0;
}

@end