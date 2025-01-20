@interface CAMLLoader
- (CAMLLoader)init;
- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4;
- (NSCache)resourceCache;
- (id)CAMLParser:(id)a3 resourceForURL:(id)a4;
- (id)loadCAMLFile:(id)a3;
- (void)CAMLParser:(id)a3 didLoadResource:(id)a4 fromURL:(id)a5;
- (void)setResourceCache:(id)a3;
@end

@implementation CAMLLoader

- (CAMLLoader)init
{
  v6.receiver = self;
  v6.super_class = (Class)CAMLLoader;
  v2 = [(CAMLLoader *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    resourceCache = v2->_resourceCache;
    v2->_resourceCache = v3;

    [(NSCache *)v2->_resourceCache setEvictsObjectsWhenApplicationEntersBackground:0];
  }
  return v2;
}

- (id)loadCAMLFile:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v5 = a3;
  objc_super v6 = (void *)[[v4 alloc] initWithContentsOfURL:v5 options:1 error:0];
  [MEMORY[0x1E4F39CF8] begin];
  objc_msgSend(MEMORY[0x1E4F39CF8], "activateBackground:", objc_msgSend(MEMORY[0x1E4F29060], "isMainThread") ^ 1);
  id v7 = objc_alloc_init(MEMORY[0x1E4F39BF8]);
  [v7 setDelegate:self];
  v8 = [v5 URLByDeletingLastPathComponent];

  v9 = [v8 URLByDeletingLastPathComponent];
  [v7 setBaseURL:v9];

  [v7 parseData:v6];
  v10 = [v7 result];
  [MEMORY[0x1E4F39CF8] commit];

  return v10;
}

- (id)CAMLParser:(id)a3 resourceForURL:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_super v6 = [(NSCache *)self->_resourceCache objectForKey:v5];
  if (!v6)
  {
    id v7 = [v5 path];
    int v8 = [v7 hasSuffix:@".heic"];

    if (v8)
    {
      v9 = [v5 lastPathComponent];
      v10 = [v9 stringByDeletingPathExtension];

      v11 = WUBundle();
      v12 = [v5 pathExtension];
      v13 = [v11 URLForResource:v10 withExtension:v12 subdirectory:@"Mica"];

      CFDataRef v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v13];
      v15 = CGImageSourceCreateWithData(v14, 0);
      uint64_t v21 = *MEMORY[0x1E4F2FF18];
      v22[0] = MEMORY[0x1E4F1CC38];
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1]);
      CFRelease(v15);
      objc_super v6 = ImageAtIndex;
      if (v6)
      {
        [(NSCache *)self->_resourceCache setObject:v6 forKey:v5];
      }
      else
      {
        v17 = NSString;
        v18 = [v5 path];
        v19 = [v17 stringWithFormat:@"Asset is missing: %@", v18];
      }
      CGImageRelease(v6);
    }
    else
    {
      objc_super v6 = 0;
    }
  }

  return v6;
}

- (void)CAMLParser:(id)a3 didLoadResource:(id)a4 fromURL:(id)a5
{
}

- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4
{
  id v4 = a4;
  id v5 = (void *)ClassSubstitutions___classSubstitutions;
  if (!ClassSubstitutions___classSubstitutions)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v19 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v20, "initWithObjectsAndKeys:", v19, @"LKState", v18, @"LKEventHandler", v6, @"LKStateAddAnimation", v7, @"LKStateAddElement", v8, @"LKStateElement", v9, @"LKStateRemoveAnimation", v10, @"LKStateRemoveElement", v11, @"LKStateSetValue", v12,
            @"LKStateSetProperty",
            v13,
            @"LKStateTransition",
            objc_opt_class(),
            @"LKStateTransitionElement",
            0);
    v15 = (void *)ClassSubstitutions___classSubstitutions;
    ClassSubstitutions___classSubstitutions = v14;

    id v5 = (void *)ClassSubstitutions___classSubstitutions;
  }
  v16 = [v5 objectForKey:v4];

  return (Class)v16;
}

- (NSCache)resourceCache
{
  return self->_resourceCache;
}

- (void)setResourceCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end