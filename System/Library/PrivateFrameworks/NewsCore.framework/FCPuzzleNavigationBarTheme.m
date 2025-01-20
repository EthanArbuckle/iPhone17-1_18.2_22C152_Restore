@interface FCPuzzleNavigationBarTheme
- (FCColor)barButtonItemBackgroundColor;
- (FCColor)barButtonItemBackgroundDarkModeColor;
- (FCColor)barButtonItemTintColor;
- (FCColor)barButtonItemTintDarkModeColor;
- (FCColor)navigationBarBackgroundColor;
- (FCColor)navigationBarBackgroundDarkModeColor;
- (FCColor)rankForegroundColor;
- (FCColor)rankForegroundDarkModeColor;
- (FCColor)shareTextForegroundColor;
- (FCPuzzleNavigationBarTheme)initWithNavigationBarBackgroundColor:(id)a3 navigationBarBackgroundDarkModeColor:(id)a4 rankForegroundColor:(id)a5 rankForegroundDarkModeColor:(id)a6 barButtonItemTintColor:(id)a7 barButtonItemTintDarkModeColor:(id)a8 barButtonItemBackgroundColor:(id)a9 barButtonItemBackgroundDarkModeColor:(id)a10 shareTextForegroundColor:(id)a11;
@end

@implementation FCPuzzleNavigationBarTheme

- (FCPuzzleNavigationBarTheme)initWithNavigationBarBackgroundColor:(id)a3 navigationBarBackgroundDarkModeColor:(id)a4 rankForegroundColor:(id)a5 rankForegroundDarkModeColor:(id)a6 barButtonItemTintColor:(id)a7 barButtonItemTintDarkModeColor:(id)a8 barButtonItemBackgroundColor:(id)a9 barButtonItemBackgroundDarkModeColor:(id)a10 shareTextForegroundColor:(id)a11
{
  id v35 = a3;
  id v17 = a4;
  id obj = a5;
  id v34 = a5;
  id v18 = a6;
  id v32 = a7;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v36.receiver = self;
  v36.super_class = (Class)FCPuzzleNavigationBarTheme;
  v24 = [(FCPuzzleNavigationBarTheme *)&v36 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_navigationBarBackgroundColor, a3);
    if (v17) {
      v26 = v17;
    }
    else {
      v26 = v35;
    }
    objc_storeStrong((id *)&v25->_navigationBarBackgroundDarkModeColor, v26);
    objc_storeStrong((id *)&v25->_rankForegroundColor, obj);
    if (v18) {
      v27 = v18;
    }
    else {
      v27 = v34;
    }
    objc_storeStrong((id *)&v25->_rankForegroundDarkModeColor, v27);
    objc_storeStrong((id *)&v25->_barButtonItemTintColor, v32);
    if (v20) {
      v28 = v20;
    }
    else {
      v28 = v19;
    }
    objc_storeStrong((id *)&v25->_barButtonItemTintDarkModeColor, v28);
    objc_storeStrong((id *)&v25->_barButtonItemBackgroundColor, a9);
    if (v22) {
      v29 = v22;
    }
    else {
      v29 = v21;
    }
    objc_storeStrong((id *)&v25->_barButtonItemBackgroundDarkModeColor, v29);
    objc_storeStrong((id *)&v25->_shareTextForegroundColor, a11);
  }

  return v25;
}

- (FCColor)navigationBarBackgroundColor
{
  return self->_navigationBarBackgroundColor;
}

- (FCColor)navigationBarBackgroundDarkModeColor
{
  return self->_navigationBarBackgroundDarkModeColor;
}

- (FCColor)rankForegroundColor
{
  return self->_rankForegroundColor;
}

- (FCColor)rankForegroundDarkModeColor
{
  return self->_rankForegroundDarkModeColor;
}

- (FCColor)barButtonItemTintColor
{
  return self->_barButtonItemTintColor;
}

- (FCColor)barButtonItemTintDarkModeColor
{
  return self->_barButtonItemTintDarkModeColor;
}

- (FCColor)barButtonItemBackgroundColor
{
  return self->_barButtonItemBackgroundColor;
}

- (FCColor)barButtonItemBackgroundDarkModeColor
{
  return self->_barButtonItemBackgroundDarkModeColor;
}

- (FCColor)shareTextForegroundColor
{
  return self->_shareTextForegroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareTextForegroundColor, 0);
  objc_storeStrong((id *)&self->_barButtonItemBackgroundDarkModeColor, 0);
  objc_storeStrong((id *)&self->_barButtonItemBackgroundColor, 0);
  objc_storeStrong((id *)&self->_barButtonItemTintDarkModeColor, 0);
  objc_storeStrong((id *)&self->_barButtonItemTintColor, 0);
  objc_storeStrong((id *)&self->_rankForegroundDarkModeColor, 0);
  objc_storeStrong((id *)&self->_rankForegroundColor, 0);
  objc_storeStrong((id *)&self->_navigationBarBackgroundDarkModeColor, 0);
  objc_storeStrong((id *)&self->_navigationBarBackgroundColor, 0);
}

@end