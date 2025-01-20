@interface UIContextMenuTVPlatformMetrics
@end

@implementation UIContextMenuTVPlatformMetrics

UIColor *__39___UIContextMenuTVPlatformMetrics_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 userInterfaceStyle];
  BOOL v3 = v2 == 1000 || v2 == 2;
  double v4 = 0.25;
  if (!v3) {
    double v4 = 0.08;
  }
  return +[UIColor colorWithWhite:0.0 alpha:v4];
}

id __39___UIContextMenuTVPlatformMetrics_init__block_invoke_2(uint64_t a1, void *a2, char a3)
{
  if ((a3 & 8) != 0)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v4 = [a2 userInterfaceStyle];
    v5 = (id *)MEMORY[0x1E4F3A2E8];
    if (v4 != 2) {
      v5 = (id *)MEMORY[0x1E4F3A2E0];
    }
    id v6 = *v5;
  }
  return v6;
}

id __39___UIContextMenuTVPlatformMetrics_init__block_invoke_3(uint64_t a1, char a2, char a3)
{
  if ((a2 & 9) != 0)
  {
    if (a3) {
      +[UIColor systemRedColor];
    }
    else {
      +[UIColor whiteColor];
    }
  }
  else if ((a2 & 4) != 0)
  {
    +[UIColor colorWithDynamicProvider:&__block_literal_global_10_4];
  }
  else
  {
    +[UIColor clearColor];
  uint64_t v3 = };
  return v3;
}

UIColor *__39___UIContextMenuTVPlatformMetrics_init__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 userInterfaceStyle];
  BOOL v3 = v2 == 1000 || v2 == 2;
  double v4 = 0.0;
  if (v3) {
    double v4 = 1.0;
  }
  return +[UIColor colorWithWhite:v4 alpha:0.15];
}

id __39___UIContextMenuTVPlatformMetrics_init__block_invoke_5(uint64_t a1, char a2)
{
  if ((a2 & 2) != 0)
  {
    uint64_t v2 = +[UIColor secondaryLabelColor];
  }
  else
  {
    if ((a2 & 9) != 0) {
      +[UIColor blackColor];
    }
    else {
    uint64_t v2 = +[UIColor colorWithDynamicProvider:&__block_literal_global_15_2];
    }
  }
  return v2;
}

UIColor *__39___UIContextMenuTVPlatformMetrics_init__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 userInterfaceStyle];
  BOOL v3 = v2 == 1000 || v2 == 2;
  double v4 = 0.501960784;
  if (v3) {
    double v4 = 0.48627451;
  }
  return +[UIColor colorWithWhite:v4 alpha:1.0];
}

id __39___UIContextMenuTVPlatformMetrics_init__block_invoke_7(uint64_t a1, char a2)
{
  if ((a2 & 8) != 0) {
    +[UIColor whiteColor];
  }
  else {
  uint64_t v2 = +[UIColor systemRedColor];
  }
  return v2;
}

UIColor *__39___UIContextMenuTVPlatformMetrics_init__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 userInterfaceStyle];
  BOOL v3 = v2 == 1000 || v2 == 2;
  double v4 = 0.62745098;
  if (v3) {
    double v4 = 0.48627451;
  }
  return +[UIColor colorWithWhite:v4 alpha:1.0];
}

id __39___UIContextMenuTVPlatformMetrics_init__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 userInterfaceStyle];
  BOOL v3 = (void **)MEMORY[0x1E4F3A2E0];
  if (v2 == 2) {
    BOOL v3 = (void **)MEMORY[0x1E4F3A2E8];
  }
  double v4 = *v3;
  return v4;
}

id __39___UIContextMenuTVPlatformMetrics_init__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 userInterfaceStyle];
  int v3 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257508, @"TVContextMenu_DarkModeBackgroundHairlineAlpha");
  double v4 = 0;
  if (v3) {
    double v5 = 0.5;
  }
  else {
    double v5 = *(double *)&qword_1EB257510;
  }
  BOOL v6 = v2 == 1000 || v2 == 2;
  if (v6 && v5 > 0.0)
  {
    int v7 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_910, @"TVContextMenu_DarkModeBackgroundHairlineWhite");
    double v8 = *(double *)&qword_1EB257500;
    if (v7) {
      double v8 = 0.4;
    }
    double v4 = +[UIColor colorWithWhite:v8 alpha:v5];
  }
  return v4;
}

BOOL __39___UIContextMenuTVPlatformMetrics_init__block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 parameters];
  int v3 = [v2 effectiveShadowPath];
  BOOL v4 = v3 != 0;

  return v4;
}

BOOL __39___UIContextMenuTVPlatformMetrics_init__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 parameters];
  int v3 = [v2 visiblePath];
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __39___UIContextMenuTVPlatformMetrics_init__block_invoke_13()
{
  return 2;
}

uint64_t __39___UIContextMenuTVPlatformMetrics_init__block_invoke_14(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 1;
  if (a3) {
    uint64_t v3 = 2;
  }
  return v3 & (a2 << 60 >> 63);
}

double __39___UIContextMenuTVPlatformMetrics_init__block_invoke_15()
{
  return 20.0;
}

double __39___UIContextMenuTVPlatformMetrics_init__block_invoke_16()
{
  return 13.0;
}

BOOL __39___UIContextMenuTVPlatformMetrics_init__block_invoke_17(double a1)
{
  return a1 < 1300.0;
}

@end