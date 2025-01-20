@interface UIFocusContainerGuideMapEntry
@end

@implementation UIFocusContainerGuideMapEntry

void __59___UIFocusContainerGuideMapEntry_visualRepresentationColor__block_invoke()
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v0 = +[UIColor colorWithHue:0.6 saturation:1.0 brightness:1.0 alpha:1.0];
  v1 = +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.61, 1.0, 1.0, 1.0, v0);
  v7[1] = v1;
  v2 = +[UIColor colorWithHue:0.62 saturation:1.0 brightness:1.0 alpha:1.0];
  v7[2] = v2;
  v3 = +[UIColor colorWithHue:0.63 saturation:1.0 brightness:1.0 alpha:1.0];
  v7[3] = v3;
  v4 = +[UIColor colorWithHue:0.64 saturation:1.0 brightness:1.0 alpha:1.0];
  v7[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  v6 = (void *)qword_1EB25E718;
  qword_1EB25E718 = v5;
}

@end