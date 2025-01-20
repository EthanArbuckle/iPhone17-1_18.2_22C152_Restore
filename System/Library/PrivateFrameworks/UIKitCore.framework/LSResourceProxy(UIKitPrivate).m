@interface LSResourceProxy(UIKitPrivate)
+ (double)_applicationIconCanvasSize;
+ (uint64_t)_compareApplicationIconCanvasSize:()UIKitPrivate withSize:;
@end

@implementation LSResourceProxy(UIKitPrivate)

+ (double)_applicationIconCanvasSize
{
  int v0 = _LSResourceProxyGetDeviceType_sDeviceType;
  if (_LSResourceProxyGetDeviceType_sDeviceType == -1)
  {
    UIUserInterfaceIdiom v1 = [+[UIDevice currentDevice] userInterfaceIdiom];
    if (v1)
    {
      if (v1 == UIUserInterfaceIdiomPad)
      {
        [+[UIScreen mainScreen] scale];
        if (v2 == 1.0) {
          int v0 = 4;
        }
        else {
          int v0 = 8;
        }
      }
      else
      {
        int v0 = 0;
      }
    }
    else
    {
      [+[UIScreen mainScreen] scale];
      if (v3 == 1.0) {
        int v0 = 1;
      }
      else {
        int v0 = 2;
      }
    }
    _LSResourceProxyGetDeviceType_sDeviceType = v0;
  }
  switch(v0)
  {
    case 2:
      return 120.0;
    case 8:
      return 152.0;
    case 4:
      return 76.0;
  }
  return 57.0;
}

+ (uint64_t)_compareApplicationIconCanvasSize:()UIKitPrivate withSize:
{
  [MEMORY[0x1E4F22478] _applicationIconCanvasSize];
  double v10 = vabdd_f64(a1, v8);
  double v11 = vabdd_f64(a2, v9);
  double v12 = vabdd_f64(a3, v8);
  double v13 = vabdd_f64(a4, v9);
  BOOL v14 = v11 < v13 && v10 < v12;
  uint64_t v15 = 1;
  if (!v14) {
    uint64_t v15 = -1;
  }
  BOOL v16 = a2 <= v9 || a1 <= v8;
  uint64_t v17 = 1;
  if (v16) {
    uint64_t v17 = -1;
  }
  if (a2 == a4 && a1 == a3) {
    uint64_t v17 = 0;
  }
  if (v10 == v12 && v11 == v13) {
    return v17;
  }
  else {
    return v15;
  }
}

@end