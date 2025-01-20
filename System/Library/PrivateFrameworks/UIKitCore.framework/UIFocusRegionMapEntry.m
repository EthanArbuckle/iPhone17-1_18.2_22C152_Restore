@interface UIFocusRegionMapEntry
@end

@implementation UIFocusRegionMapEntry

void __51___UIFocusRegionMapEntry_visualRepresentationColor__block_invoke()
{
  v9[7] = *MEMORY[0x1E4F143B8];
  v0 = +[UIColor greenColor];
  v1 = +[UIColor blueColor];
  v9[1] = v1;
  v2 = +[UIColor cyanColor];
  v9[2] = v2;
  v3 = +[UIColor magentaColor];
  v9[3] = v3;
  v4 = +[UIColor orangeColor];
  v9[4] = v4;
  v5 = +[UIColor purpleColor];
  v9[5] = v5;
  v6 = +[UIColor brownColor];
  v9[6] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:7];
  v8 = (void *)_MergedGlobals_23_0;
  _MergedGlobals_23_0 = v7;
}

void __57___UIFocusRegionMapEntry_visualRepresentationPatternType__block_invoke()
{
  v0 = (void *)qword_1EB25E6E8;
  qword_1EB25E6E8 = (uint64_t)&unk_1ED3EFAA0;
}

@end