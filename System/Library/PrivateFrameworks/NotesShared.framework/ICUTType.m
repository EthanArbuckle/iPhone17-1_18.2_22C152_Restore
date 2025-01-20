@interface ICUTType
+ (UTType)noteSpotlightType;
+ (id)typeWithIdentifier:(id)a3;
@end

@implementation ICUTType

+ (id)typeWithIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
    if (!v4)
    {
      v4 = [MEMORY[0x1E4F442D8] exportedTypeWithIdentifier:v3];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (UTType)noteSpotlightType
{
  return (UTType *)[a1 typeWithIdentifier:@"com.apple.notes.spotlightrecord"];
}

@end