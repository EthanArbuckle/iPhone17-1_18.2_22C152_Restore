@interface TUIButtonBoxLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- (id)collectLinkEntities;
@end

@implementation TUIButtonBoxLayout

- (id)collectLinkEntities
{
  v2 = [(TUILayout *)self box];
  v3 = [v2 linkEntities];

  return v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  v4 = [(TUILayout *)self box];
  v5 = +[TUIButtonBox _metricsForButtonType:](TUIButtonBox, "_metricsForButtonType:", [v4 effectiveButtonTypeForLayout]);

  if (v5)
  {
    [v5 contentHeight];
    if (v6 <= -3.40282347e38)
    {
      uint64_t v9 = 0x7FC00000FF7FFFFFLL;
    }
    else
    {
      BOOL v7 = v6 < 3.40282347e38;
      float v8 = v6;
      if (v7) {
        uint64_t v9 = LODWORD(v8) | 0x7FC0000000000000;
      }
      else {
        uint64_t v9 = 0x7FC000007F7FFFFFLL;
      }
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUIButtonBoxLayout;
    uint64_t v9 = (uint64_t)[($881BB7C90C7D0DFCC1492E3DC022A30F *)&v11 computeIntrinsicHeight];
  }

  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)v9;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  v4 = [(TUILayout *)self box];
  id v5 = [v4 effectiveButtonTypeForLayout];

  double v6 = +[TUIButtonBox _metricsForButtonType:v5];
  [v6 contentWidthPadding];
  BOOL v7 = [(TUILayout *)self box];
  float v8 = [v7 stateButtonAttributesMap];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"default"];

  if (v6 && v9)
  {
    objc_super v11 = [v9 title];
    [v11 tui_widthAsTitle];
    double v13 = v12;

    if (v13 <= -3.40282347e38)
    {
      uint64_t v10 = 0x7FC00000FF7FFFFFLL;
    }
    else if (v13 < 3.40282347e38)
    {
      *(float *)&unsigned int v14 = v13;
      uint64_t v10 = v14 | 0x7FC0000000000000;
    }
    else
    {
      uint64_t v10 = 0x7FC000007F7FFFFFLL;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)TUIButtonBoxLayout;
    uint64_t v10 = (uint64_t)[($881BB7C90C7D0DFCC1492E3DC022A30F *)&v16 computeIntrinsicWidth];
  }

  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)v10;
}

@end