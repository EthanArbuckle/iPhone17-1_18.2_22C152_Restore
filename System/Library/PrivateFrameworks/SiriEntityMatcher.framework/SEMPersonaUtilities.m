@interface SEMPersonaUtilities
+ (BOOL)currentPersonaIsDefault;
+ (BOOL)enumerateAndAssumeAllUserPersonas:(id *)a3 usingBlock:(id)a4;
+ (BOOL)isUserPersonaIdentifier:(id)a3;
+ (id)allProfilesWithError:(id *)a3;
+ (id)currentPersonaIdentifier;
+ (void)runAsPersonaIdentifier:(id)a3 block:(id)a4;
@end

@implementation SEMPersonaUtilities

+ (id)currentPersonaIdentifier
{
  return 0;
}

+ (BOOL)currentPersonaIsDefault
{
  return 0;
}

+ (void)runAsPersonaIdentifier:(id)a3 block:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

+ (BOOL)isUserPersonaIdentifier:(id)a3
{
  return 0;
}

+ (id)allProfilesWithError:(id *)a3
{
  return 0;
}

+ (BOOL)enumerateAndAssumeAllUserPersonas:(id *)a3 usingBlock:(id)a4
{
  return a4 != 0;
}

@end