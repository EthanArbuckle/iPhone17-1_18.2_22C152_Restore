@interface UIScreen
- (int64_t)_music_sizeClass;
@end

@implementation UIScreen

- (int64_t)_music_sizeClass
{
  if (_music_sizeClass_sOnceToken != -1) {
    dispatch_once(&_music_sizeClass_sOnceToken, &__block_literal_global_64);
  }
  return _music_sizeClass_screenSizeClass;
}

void __45__UIScreen_ScreenSizeClass___music_sizeClass__block_invoke(id a1)
{
  v1 = +[UIScreen mainScreen];
  [v1 nativeBounds];
  double v3 = v2;
  double v5 = v4;

  MGGetFloat32Answer();
  float v7 = v6;
  int64_t v8 = ((unint64_t)v3 << 17) | (2 * (unint64_t)v5) | (v6 > 0.0);
  if (v8 <= 153359304)
  {
    if (v8 <= 100665343)
    {
      uint64_t v11 = 1;
      if (v8 > 83888351)
      {
        if (v8 == 83888352) {
          goto LABEL_52;
        }
        if (v8 == 98306668)
        {
          uint64_t v11 = 2;
          goto LABEL_52;
        }
      }
      else if (v8 == 41944000 || v8 == 83888000)
      {
        goto LABEL_52;
      }
      goto LABEL_51;
    }
    if (v8 <= 141561599)
    {
      if (v8 == 100665344) {
        goto LABEL_43;
      }
      uint64_t v12 = 108531201;
    }
    else
    {
      if (v8 == 141561600)
      {
        uint64_t v11 = 4;
        goto LABEL_52;
      }
      if (v8 == 141562441)
      {
        uint64_t v11 = 10;
        goto LABEL_52;
      }
      uint64_t v12 = 147460873;
    }
    if (v8 != v12) {
      goto LABEL_51;
    }
LABEL_37:
    uint64_t v11 = 3;
    goto LABEL_52;
  }
  if (v8 > 201330687)
  {
    if (v8 > 218632872)
    {
      switch(v8)
      {
        case 218632873:
          uint64_t v11 = 7;
          goto LABEL_52;
        case 268440920:
          uint64_t v11 = 8;
          goto LABEL_52;
        case 268440921:
          uint64_t v11 = 9;
          goto LABEL_52;
      }
      goto LABEL_51;
    }
    if (v8 != 201330688 && v8 != 218632544) {
      goto LABEL_51;
    }
LABEL_43:
    uint64_t v11 = 6;
    goto LABEL_52;
  }
  if (v8 > 162796800)
  {
    if (v8 == 162796801 || v8 == 168302005 || v8 == 169088473)
    {
      uint64_t v11 = 5;
      goto LABEL_52;
    }
    goto LABEL_51;
  }
  if (v8 == 153359305 || v8 == 154539001) {
    goto LABEL_37;
  }
LABEL_51:
  uint64_t v11 = 0;
LABEL_52:
  _music_sizeClass_screenSizeClass = v11;
  v16 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134218752;
    double v18 = v5;
    __int16 v19 = 2048;
    double v20 = v3;
    __int16 v21 = 1024;
    BOOL v22 = v7 > 0.0;
    __int16 v23 = 2048;
    uint64_t v24 = _music_sizeClass_screenSizeClass;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Reporting screen size as %f x %f with rounded corners %d which resolves to size class %ld", (uint8_t *)&v17, 0x26u);
  }
}

@end