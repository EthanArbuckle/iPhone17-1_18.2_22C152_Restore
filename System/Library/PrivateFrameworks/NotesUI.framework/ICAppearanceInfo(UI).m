@interface ICAppearanceInfo(UI)
+ (id)currentInfo;
- (double)navigationBarAlpha;
- (id)defaultTraitCollection;
- (void)performAsDefaultAppearance:()UI;
@end

@implementation ICAppearanceInfo(UI)

- (double)navigationBarAlpha
{
  return 0.98;
}

- (id)defaultTraitCollection
{
  uint64_t v1 = [a1 type];
  if (!v1)
  {
    uint64_t v2 = 1;
    goto LABEL_5;
  }
  if (v1 == 1)
  {
    uint64_t v2 = 2;
LABEL_5:
    v3 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:v2];
    goto LABEL_7;
  }
  v3 = 0;
LABEL_7:
  v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 scale];
  double v6 = v5;

  double v7 = 2.0;
  if (v6 >= 2.0) {
    double v7 = v6;
  }
  v8 = [MEMORY[0x1E4FB1E20] traitCollectionWithDisplayScale:v7];
  v9 = objc_msgSend(v3, "ic_traitCollectionByAppendingNonNilTraitCollection:", v8);

  return v9;
}

+ (id)currentInfo
{
  v0 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  uint64_t v1 = objc_msgSend(v0, "ic_appearanceInfo");

  return v1;
}

- (void)performAsDefaultAppearance:()UI
{
  id v4 = a3;
  id v5 = [a1 defaultTraitCollection];
  objc_msgSend(v5, "ic_performAsCurrent:", v4);
}

@end