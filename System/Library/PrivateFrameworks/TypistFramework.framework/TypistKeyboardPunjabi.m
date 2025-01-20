@interface TypistKeyboardPunjabi
- (id)addAccentKeyAction:(id)a3;
- (id)getPostfixKey:(id)a3;
- (id)init:(id)a3 options:(id)a4;
@end

@implementation TypistKeyboardPunjabi

- (id)init:(id)a3 options:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardPunjabi;
  return [(TypistKeyboard *)&v5 init:a3 options:a4 locale:@"pa"];
}

- (id)getPostfixKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 _referenceBounds];
  if (CGRectGetHeight(v10) <= 1194.0 || [(TypistKeyboard *)self isFloating])
  {

LABEL_4:
    v6 = (__CFString *)v4;
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"ਇ"])
  {
  }
  else
  {
    char v8 = [v4 isEqualToString:@"ਈ"];

    if ((v8 & 1) == 0) {
      goto LABEL_4;
    }
  }
  v6 = @"ੲ";
LABEL_5:

  return v6;
}

- (id)addAccentKeyAction:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 _referenceBounds];
  if (CGRectGetHeight(v17) <= 1194.0)
  {

    goto LABEL_7;
  }
  BOOL v6 = [(TypistKeyboard *)self isFloating];

  if (v6)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  if (![v4 isEqualToString:@"ਇ"])
  {
    if ([v4 isEqualToString:@"ਈ"])
    {
      uint64_t v13 = [(TypistKeyboard *)self findKeyOnAnyPlane:@"ੀ"];
      char v8 = (void *)v13;
      if (v13)
      {
        uint64_t v14 = v13;
        v9 = (void *)MEMORY[0x263EFF8C0];
        CGRect v10 = &v14;
        goto LABEL_14;
      }
LABEL_15:
      v11 = 0;
      goto LABEL_16;
    }
    goto LABEL_7;
  }
  uint64_t v7 = [(TypistKeyboard *)self findKeyOnAnyPlane:@"ਿ"];
  char v8 = (void *)v7;
  if (!v7) {
    goto LABEL_15;
  }
  v15[0] = v7;
  v9 = (void *)MEMORY[0x263EFF8C0];
  CGRect v10 = v15;
LABEL_14:
  v11 = [v9 arrayWithObjects:v10 count:1];
LABEL_16:

LABEL_8:
  return v11;
}

@end