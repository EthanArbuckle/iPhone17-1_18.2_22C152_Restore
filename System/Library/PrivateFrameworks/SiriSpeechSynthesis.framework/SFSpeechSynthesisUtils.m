@interface SFSpeechSynthesisUtils
+ (BOOL)isInternalBuild;
+ (double)absoluteTimeToSecond:(unint64_t)a3;
+ (id)footprintStringFromFootprint:(int64_t)a3;
+ (id)genderStringFromGender:(int64_t)a3;
+ (id)typeStringFromType:(int64_t)a3;
+ (int64_t)footprintFromString:(id)a3;
+ (int64_t)genderFromString:(id)a3;
+ (int64_t)typeFromString:(id)a3;
@end

@implementation SFSpeechSynthesisUtils

+ (double)absoluteTimeToSecond:(unint64_t)a3
{
  if (absoluteTimeToSecond__onceToken != -1) {
    dispatch_once(&absoluteTimeToSecond__onceToken, &__block_literal_global_1411);
  }
  return *(double *)&absoluteTimeToSecond__clockFactor * (double)a3;
}

double __47__SFSpeechSynthesisUtils_absoluteTimeToSecond___block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1 / 1000000000.0;
  absoluteTimeToSecond__clockFactor = *(void *)&result;
  return result;
}

+ (int64_t)typeFromString:(id)a3
{
  v3 = [a3 lowercaseString];
  v4 = [@"vocalizer" lowercaseString];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    int64_t v6 = 1;
  }
  else
  {
    v7 = [@"gryphon" lowercaseString];
    char v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      int64_t v6 = 2;
    }
    else
    {
      v9 = [@"neural" lowercaseString];
      int v10 = [v3 isEqualToString:v9];

      if (v10) {
        int64_t v6 = 3;
      }
      else {
        int64_t v6 = 0;
      }
    }
  }

  return v6;
}

+ (id)typeStringFromType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"undefined";
  }
  else {
    return off_26489E9F0[a3 - 1];
  }
}

+ (int64_t)footprintFromString:(id)a3
{
  v3 = [a3 lowercaseString];
  v4 = [@"beta" lowercaseString];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    int64_t v6 = -1;
  }
  else
  {
    v7 = [@"compact" lowercaseString];
    char v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      int64_t v6 = 1;
    }
    else
    {
      v9 = [@"premium" lowercaseString];
      char v10 = [v3 isEqualToString:v9];

      if (v10)
      {
        int64_t v6 = 2;
      }
      else
      {
        v11 = [@"premiumhigh" lowercaseString];
        int v12 = [v3 isEqualToString:v11];

        if (v12) {
          int64_t v6 = 3;
        }
        else {
          int64_t v6 = 0;
        }
      }
    }
  }

  return v6;
}

+ (id)footprintStringFromFootprint:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4) {
    return @"undefined";
  }
  else {
    return off_26489E9C8[a3 + 1];
  }
}

+ (int64_t)genderFromString:(id)a3
{
  v3 = [a3 lowercaseString];
  v4 = [@"male" lowercaseString];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    int64_t v6 = 1;
  }
  else
  {
    v7 = [@"female" lowercaseString];
    int v8 = [v3 isEqualToString:v7];

    if (v8) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 0;
    }
  }

  return v6;
}

+ (id)genderStringFromGender:(int64_t)a3
{
  v3 = @"undefined";
  if (a3 == 2) {
    v3 = @"female";
  }
  if (a3 == 1) {
    return @"male";
  }
  else {
    return v3;
  }
}

+ (BOOL)isInternalBuild
{
  return MEMORY[0x270F95FB8](@"InternalBuild", a2);
}

@end