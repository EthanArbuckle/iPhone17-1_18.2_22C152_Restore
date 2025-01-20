@interface _SBApplicationLaunchAlertInfo
- (id)description;
- (void)initWithBundleID:(void *)a1;
@end

@implementation _SBApplicationLaunchAlertInfo

- (void)initWithBundleID:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)_SBApplicationLaunchAlertInfo;
    id v5 = objc_msgSendSuper2(&v11, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v7 = (void *)a1[2];
      a1[2] = v6;

      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v9 = (void *)a1[3];
      a1[3] = v8;
    }
  }

  return a1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p [bundleID=%@, foregroundScenes=%@, alertItems=%@]>", v5, self, self->_bundleID, self->_foregroundScenes, self->_alertItems];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertItems, 0);
  objc_storeStrong((id *)&self->_foregroundScenes, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end