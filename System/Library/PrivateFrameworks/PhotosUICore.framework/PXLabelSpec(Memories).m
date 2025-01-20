@interface PXLabelSpec(Memories)
+ (id)_memoriesLabelSpecForContext:()Memories;
+ (id)memoriesLabelSpecForLabelKind:()Memories descriptor:featureSpec:;
+ (id)memoriesLabelSpecForLabelKind:()Memories tileKind:featureSpec:boundedByRect:;
+ (id)memoriesLabelSpecForLabelKind:()Memories tileKind:gadgetSpec:boundedByRect:;
+ (id)memoriesLabelSpecForLabelKind:()Memories tileKind:specSet:variant:boundedBy:shouldScale:;
@end

@implementation PXLabelSpec(Memories)

+ (id)_memoriesLabelSpecForContext:()Memories
{
  v4 = +[PXKitSettings sharedInstance];
  id v5 = objc_alloc_init((Class)off_1E5DA6FD0);
  v6 = +[PXMemoriesFontsSpec textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:](PXMemoriesFontsSpec, "textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:", 2, *((void *)a3 + 2), *(void *)a3, *((void *)a3 + 3), *((unsigned __int8 *)a3 + 64), a3[6], a3[7]);
  [v5 setTextAttributes:v6];

  v7 = +[PXMemoriesFontsSpec textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:](PXMemoriesFontsSpec, "textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:", 1, *((void *)a3 + 2), *(void *)a3, *((void *)a3 + 3), *((unsigned __int8 *)a3 + 64), a3[6], a3[7]);
  [v5 setFallbackTextAttributes:v7];

  v8 = [MEMORY[0x1E4FB1618] whiteColor];
  [v5 setTextColor:v8];

  objc_msgSend(v5, "setTextAlignment:", objc_msgSend(MEMORY[0x1E4F1CA20], "px_currentLeadingTextAlignment"));
  [v5 setVerticalAlignment:1];
  objc_msgSend(v5, "setCapitalization:", +[PXMemoriesFontsSpec capitalizationStyleForLabelKind:](PXMemoriesFontsSpec, "capitalizationStyleForLabelKind:", *(void *)a3));
  objc_msgSend(v5, "setNumberOfLines:", +[PXMemoriesFontsSpec numberOfLinesForLabelKind:](PXMemoriesFontsSpec, "numberOfLinesForLabelKind:", *(void *)a3));
  objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", objc_msgSend(v4, "defaultTextAutoscalingEnabled"));
  [v4 defaultTextMinimumScaleFactor];
  objc_msgSend(v5, "setMinimumScaleFactor:");
  objc_msgSend(v5, "setAllowTruncation:", objc_msgSend(v4, "defaultTextTruncationEnabled"));
  [v4 defaultTruncatedTextMinimumScaleFactor];
  objc_msgSend(v5, "setMinimumTruncatedScaleFactor:");

  return v5;
}

+ (id)memoriesLabelSpecForLabelKind:()Memories tileKind:gadgetSpec:boundedByRect:
{
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  _LabelContextMakeGadgetSpec(a7, a8, a9, (uint64_t)&v13, a1, a2, a3, a4);
  v11[2] = v15;
  v11[3] = v16;
  uint64_t v12 = v17;
  v11[0] = v13;
  v11[1] = v14;
  v9 = [off_1E5DA6FD0 _memoriesLabelSpecForContext:v11];
  return v9;
}

+ (id)memoriesLabelSpecForLabelKind:()Memories tileKind:featureSpec:boundedByRect:
{
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  _LabelContextMakeFeatureSpec(a7, a8, a9, (uint64_t)&v13, a1, a2, a3, a4);
  v11[2] = v15;
  v11[3] = v16;
  uint64_t v12 = v17;
  v11[0] = v13;
  v11[1] = v14;
  v9 = [off_1E5DA6FD0 _memoriesLabelSpecForContext:v11];
  return v9;
}

+ (id)memoriesLabelSpecForLabelKind:()Memories descriptor:featureSpec:
{
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v5 = a4[1];
  long long v8 = *a4;
  long long v9 = v5;
  _LabelContextMakeDescriptor(a3, (uint64_t *)&v8, a5, (uint64_t)&v13);
  long long v10 = v15;
  long long v11 = v16;
  uint64_t v12 = v17;
  long long v8 = v13;
  long long v9 = v14;
  v6 = [off_1E5DA6FD0 _memoriesLabelSpecForContext:&v8];
  return v6;
}

+ (id)memoriesLabelSpecForLabelKind:()Memories tileKind:specSet:variant:boundedBy:shouldScale:
{
  v13[0] = a7;
  v13[1] = a8;
  v13[2] = a9;
  v13[3] = a10;
  *(double *)&v13[4] = a1;
  *(double *)&v13[5] = a2;
  *(double *)&v13[6] = a3;
  *(double *)&v13[7] = a4;
  v13[8] = a11;
  long long v11 = [off_1E5DA6FD0 _memoriesLabelSpecForContext:v13];
  return v11;
}

@end