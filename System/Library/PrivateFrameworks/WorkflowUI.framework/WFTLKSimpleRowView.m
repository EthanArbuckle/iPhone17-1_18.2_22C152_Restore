@interface WFTLKSimpleRowView
- (void)observedPropertiesChanged;
@end

@implementation WFTLKSimpleRowView

- (void)observedPropertiesChanged
{
  v35.receiver = self;
  v35.super_class = (Class)WFTLKSimpleRowView;
  [(TLKSimpleRowView *)&v35 observedPropertiesChanged];
  v3 = [(TLKSimpleRowView *)self leadingImage];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(TLKSimpleRowView *)self trailingImage];
    BOOL v4 = v5 != 0;
  }
  v6 = [(TLKSimpleRowView *)self leadingSubtitle];
  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    v8 = [(TLKSimpleRowView *)self trailingSubtitle];
    BOOL v7 = v8 != 0;
  }
  v9 = [(TLKSimpleRowView *)self leadingImage];
  [v9 size];
  double v11 = v10;

  v12 = [(TLKSimpleRowView *)self leadingImage];
  if (v12)
  {
    BOOL v13 = 0;
  }
  else
  {
    v14 = [(TLKSimpleRowView *)self leadingTitle];
    if (v14)
    {
      v15 = [(TLKSimpleRowView *)self trailingTitle];
      if (v15)
      {
        BOOL v13 = 0;
      }
      else
      {
        v16 = [(TLKSimpleRowView *)self trailingSubtitle];
        if (v16)
        {
          BOOL v13 = 0;
        }
        else
        {
          v17 = [(TLKSimpleRowView *)self trailingImage];
          [v17 size];
          if (v19 == 29.0 && v18 == 29.0)
          {
            BOOL v13 = 1;
          }
          else
          {
            v20 = [(TLKSimpleRowView *)self trailingImage];
            if ([v20 isTemplate])
            {
              v34 = [(TLKSimpleRowView *)self trailingImage];
              [v34 size];
              if (v21 <= 29.0)
              {
                BOOL v13 = 1;
              }
              else
              {
                v33 = [(TLKSimpleRowView *)self trailingImage];
                [v33 size];
                BOOL v13 = v22 <= 29.0;
              }
            }
            else
            {
              BOOL v13 = 0;
            }
          }
        }
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  v23 = [(TLKSimpleRowView *)self leadingTitle];
  if (v23)
  {
    v24 = [(TLKSimpleRowView *)self leadingSubtitle];
    if (v24)
    {
      v25 = [(TLKSimpleRowView *)self trailingTitle];
      if (v25)
      {
        BOOL v26 = 0;
      }
      else
      {
        v27 = [(TLKSimpleRowView *)self trailingSubtitle];
        if (v27)
        {
          BOOL v26 = 0;
        }
        else
        {
          v28 = [(TLKSimpleRowView *)self leadingImage];
          if (v28)
          {
            v29 = [(TLKSimpleRowView *)self trailingImage];
            BOOL v26 = v11 <= 18.0 && v29 == 0;
          }
          else
          {
            BOOL v26 = 0;
          }
        }
      }
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  if (!v13 && !v26 && !v7 && !v4)
  {
    v31 = [MEMORY[0x263F7E3A0] cachedFontForTextStyle:*MEMORY[0x263F835D0] isShort:1 isBold:0];
    v32 = [(TLKSimpleRowView *)self leadingTitleLabel];
    [v32 setFont:v31];
  }
}

@end