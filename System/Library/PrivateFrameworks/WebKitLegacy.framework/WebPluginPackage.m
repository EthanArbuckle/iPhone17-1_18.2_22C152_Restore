@interface WebPluginPackage
- (BOOL)load;
- (Class)viewFactory;
- (WebPluginPackage)initWithPath:(id)a3;
- (id)bundle;
- (void)dealloc;
@end

@implementation WebPluginPackage

- (WebPluginPackage)initWithPath:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WebPluginPackage;
  id v4 = -[WebBasePluginPackage initWithPath:](&v10, sel_initWithPath_);
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28B50]);
    if (*((void *)v4 + 2))
    {
      uint64_t v6 = [v5 initWithPath:WTF::StringImpl::operator NSString *()];
      *((void *)v4 + 12) = v6;
      if (!v6) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v7 = [v5 initWithPath:&stru_1F3C7DA90];
      *((void *)v4 + 12) = v7;
      if (!v7)
      {
LABEL_9:

        return 0;
      }
    }
    if ((objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "_webkit_isCaseInsensitiveEqualToString:", @"webplugin") & 1) == 0)
    {
      UInt32 packageType = 0;
      CFBundleGetPackageInfo(*((CFBundleRef *)v4 + 10), &packageType, 0);
      if (packageType != 1463963724) {
        goto LABEL_9;
      }
    }
    if (([v4 getPluginInfoFromPLists] & 1) == 0) {
      goto LABEL_9;
    }
  }
  return (WebPluginPackage *)v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebPluginPackage;
  [(WebBasePluginPackage *)&v3 dealloc];
}

- (Class)viewFactory
{
  return [(NSBundle *)self->nsBundle principalClass];
}

- (BOOL)load
{
  if ([(NSBundle *)self->nsBundle isLoaded] || (BOOL v3 = [(NSBundle *)self->nsBundle load]))
  {
    v5.receiver = self;
    v5.super_class = (Class)WebPluginPackage;
    LOBYTE(v3) = [(WebBasePluginPackage *)&v5 load];
  }
  return v3;
}

- (id)bundle
{
  return self->nsBundle;
}

@end