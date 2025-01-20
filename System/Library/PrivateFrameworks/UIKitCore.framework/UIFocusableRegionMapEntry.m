@interface UIFocusableRegionMapEntry
@end

@implementation UIFocusableRegionMapEntry

void __55___UIFocusableRegionMapEntry_visualRepresentationColor__block_invoke()
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v0 = +[UIColor colorWithHue:0.53 saturation:1.0 brightness:1.0 alpha:1.0];
  v1 = +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.54, 1.0, 1.0, 1.0, v0);
  v7[1] = v1;
  v2 = +[UIColor colorWithHue:0.55 saturation:1.0 brightness:1.0 alpha:1.0];
  v7[2] = v2;
  v3 = +[UIColor colorWithHue:0.56 saturation:1.0 brightness:1.0 alpha:1.0];
  v7[3] = v3;
  v4 = +[UIColor colorWithHue:0.57 saturation:1.0 brightness:1.0 alpha:1.0];
  v7[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  v6 = (void *)qword_1EB25E6F8;
  qword_1EB25E6F8 = v5;
}

void __55___UIFocusableRegionMapEntry_visualRepresentationColor__block_invoke_2()
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v0 = +[UIColor colorWithHue:0.75 saturation:1.0 brightness:1.0 alpha:1.0];
  v1 = +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.76, 1.0, 1.0, 1.0, v0);
  v7[1] = v1;
  v2 = +[UIColor colorWithHue:0.77 saturation:1.0 brightness:1.0 alpha:1.0];
  v7[2] = v2;
  v3 = +[UIColor colorWithHue:0.78 saturation:1.0 brightness:1.0 alpha:1.0];
  v7[3] = v3;
  v4 = +[UIColor colorWithHue:0.79 saturation:1.0 brightness:1.0 alpha:1.0];
  v7[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  v6 = (void *)qword_1EB25E708;
  qword_1EB25E708 = v5;
}

@end