@interface STUIStatusBarVisualProvider_RoundierPad
+ (NSDirectionalEdgeInsets)edgeInsets;
- (id)normalRoundFont;
- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3;
@end

@implementation STUIStatusBarVisualProvider_RoundierPad

- (id)normalRoundFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = *(void **)&algn_1EC05EFC8[48];
  if (*(void *)&algn_1EC05EFC8[48]) {
    BOOL v4 = byte_1EC05EFAF == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EC05EFAF = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:*MEMORY[0x1E4FB0938] weight:12.0 design:*MEMORY[0x1E4FB09D0]];
    v6 = *(void **)&algn_1EC05EFC8[48];
    *(void *)&algn_1EC05EFC8[48] = v5;

    v3 = *(void **)&algn_1EC05EFC8[48];
  }
  return v3;
}

+ (NSDirectionalEdgeInsets)edgeInsets
{
  double v2 = 0.0;
  double v3 = 25.0;
  double v4 = 0.0;
  double v5 = 26.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[STUIStatusBarBatteryItem iconDisplayIdentifier];
  if ((id)v5 == v4)
  {
  }
  else
  {
    v6 = (void *)v5;
    id v7 = +[STUIStatusBarBatteryItem staticIconDisplayIdentifier];

    if (v7 != v4)
    {
      v11.receiver = self;
      v11.super_class = (Class)STUIStatusBarVisualProvider_RoundierPad;
      v8 = [(STUIStatusBarVisualProvider_Pad *)&v11 overriddenStyleAttributesForDisplayItemWithIdentifier:v4];
      goto LABEL_6;
    }
  }
  v8 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
  v9 = [(STUIStatusBarVisualProvider_RoundierPad *)self normalRoundFont];
  [v8 setFont:v9];

LABEL_6:
  return v8;
}

@end