@interface UIFont
- (id)bkEffectiveFontForText:(id)a3;
@end

@implementation UIFont

- (id)bkEffectiveFontForText:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4)
  {
    v11.length = (CFIndex)[(__CFString *)v4 length];
    v11.location = 0;
    CTFontRef v6 = CTFontCreateForString((CTFontRef)self, v5, v11);
    if (v6) {
      v7 = (UIFont *)v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  if (v7) {
    v8 = v7;
  }
  else {
    v8 = self;
  }
  v9 = v8;

  return v9;
}

@end