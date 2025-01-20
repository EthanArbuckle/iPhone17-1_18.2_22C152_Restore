@interface VUIMLUtilities
+ (int64_t)gridStyleConsideringAX:(int64_t)a3;
+ (int64_t)gridStyleForCSSStyle:(id)a3;
@end

@implementation VUIMLUtilities

+ (int64_t)gridStyleForCSSStyle:(id)a3
{
  id v3 = a3;
  if (gridStyleForCSSStyle__onceToken != -1) {
    dispatch_once(&gridStyleForCSSStyle__onceToken, &__block_literal_global_134);
  }
  v4 = [(id)gridStyleForCSSStyle__sGridStyleMap objectForKeyedSubscript:v3];
  if (v4)
  {
    v5 = [(id)gridStyleForCSSStyle__sGridStyleMap objectForKeyedSubscript:v3];
    int64_t v6 = [v5 integerValue];
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

+ (int64_t)gridStyleConsideringAX:(int64_t)a3
{
  if ([MEMORY[0x1E4FB3C20] isAXLargeEnabled:0])
  {
    int64_t v4 = a3 - 3;
    if (unint64_t)(a3 - 3) <= 5 && ((0x37u >> v4)) {
      return qword_1E38FE538[v4];
    }
  }
  return a3;
}

void __39__VUIMLUtilities_gridStyleForCSSStyle___block_invoke()
{
  v3[14] = *MEMORY[0x1E4F143B8];
  v2[0] = @"a";
  v2[1] = @"aa";
  v3[0] = &unk_1F3F3D4A8;
  v3[1] = &unk_1F3F3D4C0;
  v2[2] = @"b";
  v2[3] = @"c";
  v3[2] = &unk_1F3F3D4D8;
  v3[3] = &unk_1F3F3D4F0;
  v2[4] = @"d";
  v2[5] = @"dd";
  v3[4] = &unk_1F3F3D508;
  v3[5] = &unk_1F3F3D520;
  v2[6] = @"e";
  v2[7] = @"f";
  v3[6] = &unk_1F3F3D538;
  v3[7] = &unk_1F3F3D550;
  v2[8] = @"k";
  v2[9] = @"oc";
  v3[8] = &unk_1F3F3D568;
  v3[9] = &unk_1F3F3D580;
  v2[10] = @"tm";
  v2[11] = @"full";
  v3[10] = &unk_1F3F3D598;
  v3[11] = &unk_1F3F3D5B0;
  v2[12] = @"edgeToEdge";
  v2[13] = @"split";
  v3[12] = &unk_1F3F3D5C8;
  v3[13] = &unk_1F3F3D5E0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:14];
  v1 = (void *)gridStyleForCSSStyle__sGridStyleMap;
  gridStyleForCSSStyle__sGridStyleMap = v0;
}

@end