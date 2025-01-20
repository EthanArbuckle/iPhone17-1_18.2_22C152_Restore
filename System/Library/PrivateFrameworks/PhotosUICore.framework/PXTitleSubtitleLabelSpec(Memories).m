@interface PXTitleSubtitleLabelSpec(Memories)
+ (id)memoriesTitleSubtitleSpecForContext:()Memories;
+ (id)memoriesTitleSubtitleSpecForTileKind:()Memories featureSpec:boundedByRect:;
+ (id)memoriesTitleSubtitleSpecForTileKind:()Memories gadgetSpec:boundedByRect:;
+ (id)memoriesTitleSubtitleSpecForTileKind:()Memories viewMode:boundedByRect:;
+ (id)memoriesTitleSubtitleSpecForViewSpecDescriptor:()Memories featureSpec:;
@end

@implementation PXTitleSubtitleLabelSpec(Memories)

+ (id)memoriesTitleSubtitleSpecForContext:()Memories
{
  id v4 = objc_alloc_init((Class)off_1E5DA9618);
  v5 = objc_msgSend(off_1E5DA6FD0, "memoriesLabelSpecForLabelKind:tileKind:specSet:variant:boundedBy:shouldScale:", 0, *(void *)a3, *((void *)a3 + 1), *((void *)a3 + 2), *((unsigned __int8 *)a3 + 88), a3[3], a3[4], a3[5], a3[6]);
  [v4 setTitleLabelSpec:v5];

  v6 = objc_msgSend(off_1E5DA6FD0, "memoriesLabelSpecForLabelKind:tileKind:specSet:variant:boundedBy:shouldScale:", 1, *(void *)a3, *((void *)a3 + 1), *((void *)a3 + 2), *((unsigned __int8 *)a3 + 88), a3[3], a3[4], a3[5], a3[6]);
  [v4 setSubtitleLabelSpec:v6];

  +[PXMemoriesFontsSpec baselineDistanceForFontSet:specSet:variant:size:shouldScale:](PXMemoriesFontsSpec, "baselineDistanceForFontSet:specSet:variant:size:shouldScale:", 2, *((void *)a3 + 1), *((void *)a3 + 2), *((unsigned __int8 *)a3 + 88), a3[5], a3[6]);
  objc_msgSend(v4, "setDistanceBetweenTitleBaselineAndSubtitleBaseline:");
  +[PXMemoriesFontsSpec paddingForFontSet:specSet:variant:layoutMargins:width:shouldScale:forHeaderTile:](PXMemoriesFontsSpec, "paddingForFontSet:specSet:variant:layoutMargins:width:shouldScale:forHeaderTile:", 2, *((void *)a3 + 1), *((void *)a3 + 2), *((unsigned __int8 *)a3 + 88), *(void *)a3 == 4, a3[7], a3[8], a3[9], a3[10], a3[5]);
  objc_msgSend(v4, "setPadding:");
  return v4;
}

+ (id)memoriesTitleSubtitleSpecForTileKind:()Memories viewMode:boundedByRect:
{
  memset(v29, 0, sizeof(v29));
  id v14 = a8;
  uint64_t v15 = [v14 specSet];
  uint64_t v16 = [v14 variant];
  [v14 layoutMargins];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;

  v27[0] = a7;
  v27[1] = v15;
  v27[2] = v16;
  *(double *)&v27[3] = a2;
  *(double *)&v27[4] = a3;
  *(double *)&v27[5] = a4;
  *(double *)&v27[6] = a5;
  v27[7] = v18;
  v27[8] = v20;
  v27[9] = v22;
  v27[10] = v24;
  char v28 = 1;
  v25 = [a1 memoriesTitleSubtitleSpecForContext:v27];

  return v25;
}

+ (id)memoriesTitleSubtitleSpecForTileKind:()Memories gadgetSpec:boundedByRect:
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  _TitleSubtitleContextMakeGadgetSpec(a7, a8, (uint64_t)&v12, a2, a3, a4, a5);
  v11[2] = v14;
  v11[3] = v15;
  v11[4] = v16;
  v11[5] = v17;
  v11[0] = v12;
  v11[1] = v13;
  v9 = [a1 memoriesTitleSubtitleSpecForContext:v11];
  return v9;
}

+ (id)memoriesTitleSubtitleSpecForTileKind:()Memories featureSpec:boundedByRect:
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  _TitleSubtitleContextMakeFeatureSpec(a7, a8, (uint64_t)&v12, a2, a3, a4, a5);
  v11[2] = v14;
  v11[3] = v15;
  v11[4] = v16;
  v11[5] = v17;
  v11[0] = v12;
  v11[1] = v13;
  v9 = [a1 memoriesTitleSubtitleSpecForContext:v11];
  return v9;
}

+ (id)memoriesTitleSubtitleSpecForViewSpecDescriptor:()Memories featureSpec:
{
  double v6 = *a3;
  id v7 = a4;
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v10 = a3[2];
  double v11 = a3[3];
  if ((unint64_t)(*(void *)&v6 - 1900) >= 0x64) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = (LOBYTE(v6) - 108) % 0xFu;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  _TitleSubtitleContextMakeFeatureSpec(v12, v7, (uint64_t)&v16, v8, v9, v10, v11);

  v15[2] = v18;
  v15[3] = v19;
  v15[4] = v20;
  v15[5] = v21;
  v15[0] = v16;
  v15[1] = v17;
  long long v13 = [a1 memoriesTitleSubtitleSpecForContext:v15];
  return v13;
}

@end