@interface SDAutoUnlockMacIconCache
- (id)_userDefaultsKeyForHash:(id)a3;
- (id)iconImageDataForHash:(id)a3;
- (void)cacheIconImageData:(id)a3 hash:(id)a4 appName:(id)a5;
@end

@implementation SDAutoUnlockMacIconCache

- (id)iconImageDataForHash:(id)a3
{
  id v4 = a3;
  v5 = [(SDAutoUnlockMacIconCache *)self _userDefaultsKeyForHash:v4];
  v6 = +[NSUserDefaults standardUserDefaults];
  v7 = [v6 objectForKey:v5];
  if (!v7)
  {
    if (dword_100969498 > 50 || dword_100969498 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_13;
    }
LABEL_9:
    LogPrintF();
LABEL_13:
    id v10 = 0;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (dword_100969498 > 90 || dword_100969498 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  CFDataGetTypeID();
  v8 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  v9 = CFDictionaryGetTypedValue();
  if (dword_100969498 <= 50 && (dword_100969498 != -1 || _LogCategory_Initialize()))
  {
    [v8 length];
    LogPrintF();
  }
  id v10 = v8;

LABEL_19:

  return v10;
}

- (void)cacheIconImageData:(id)a3 hash:(id)a4 appName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SDAutoUnlockMacIconCache *)self _userDefaultsKeyForHash:v9];
  v14[0] = @"AutoUnlockImageData";
  v14[1] = @"AutoUnlockAppName";
  v15[0] = v8;
  v15[1] = v10;
  v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v13 = +[NSUserDefaults standardUserDefaults];
  [v13 setObject:v12 forKey:v11];
  [v13 synchronize];
  if (dword_100969498 <= 90 && (dword_100969498 != -1 || _LogCategory_Initialize()))
  {
    [v8 length];
    LogPrintF();
  }
}

- (id)_userDefaultsKeyForHash:(id)a3
{
  v3 = SFHexStringForData();
  id v4 = +[NSString stringWithFormat:@"%@-%@", @"AUIconCacheItem", v3];

  return v4;
}

@end