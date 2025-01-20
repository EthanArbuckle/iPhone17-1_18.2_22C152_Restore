@interface UITraitArtworkSubtype
+ (BOOL)_isPrivate;
+ (BOOL)affectsColorAppearance;
+ (BOOL)defaultValueRepresentsUnspecified;
+ (NSString)identifier;
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation UITraitArtworkSubtype

+ (int64_t)defaultValue
{
  return 0;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"ArtworkSubtype";
}

+ (NSString)identifier
{
  return (NSString *)@"UITraitArtworkSubtype";
}

+ (BOOL)affectsColorAppearance
{
  return 0;
}

+ (BOOL)_isPrivate
{
  return 1;
}

@end