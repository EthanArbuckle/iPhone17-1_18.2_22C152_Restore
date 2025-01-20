@interface NSObject
- (BOOL)_maps_needsUpdateWithSelector:(SEL)a3;
- (CarChromeViewController)carChromeViewController;
- (IOSBasedChromeViewController)iosBasedChromeViewController;
- (IOSChromeViewController)iosChromeViewController;
- (MacChromeViewController)macChromeViewController;
- (void)_maps_setNeedsUpdate:(BOOL)a3 withSelector:(SEL)a4;
- (void)_maps_setNeedsUpdateWithSelector:(SEL)a3;
@end

@implementation NSObject

- (IOSChromeViewController)iosChromeViewController
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [self chromeViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return (IOSChromeViewController *)v5;
}

- (void)_maps_setNeedsUpdate:(BOOL)a3 withSelector:(SEL)a4
{
  BOOL v5 = a3;
  uint64_t v7 = objc_getAssociatedObject(self, off_1015E4088);
  id v8 = (id)v7;
  if (v5)
  {
    if (!v7)
    {
      id v8 = objc_alloc_init((Class)NSMutableSet);
      objc_setAssociatedObject(self, off_1015E4088, v8, (void *)1);
    }
    v9 = NSStringFromSelector(a4);
    [v8 addObject:v9];

    v10 = objc_getAssociatedObject(self, off_1015E4080);

    if (!v10)
    {
      objc_setAssociatedObject(self, off_1015E4080, &__kCFBooleanTrue, (void *)3);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008DEEC;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v11 = NSStringFromSelector(a4);
    [v8 removeObject:v11];
  }
}

- (void)_maps_setNeedsUpdateWithSelector:(SEL)a3
{
}

- (IOSBasedChromeViewController)iosBasedChromeViewController
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [self chromeViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return (IOSBasedChromeViewController *)v5;
}

- (CarChromeViewController)carChromeViewController
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [self chromeViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return (CarChromeViewController *)v5;
}

- (BOOL)_maps_needsUpdateWithSelector:(SEL)a3
{
  v4 = objc_getAssociatedObject(self, off_1015E4088);
  id v5 = NSStringFromSelector(a3);
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

- (MacChromeViewController)macChromeViewController
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [self chromeViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return (MacChromeViewController *)v5;
}

@end