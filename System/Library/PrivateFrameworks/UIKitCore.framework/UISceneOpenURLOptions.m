@interface UISceneOpenURLOptions
+ (id)_optionsFromDictionary:(id)a3;
+ (id)_optionsFromPayload:(id)a3 sourceProcessHandle:(id)a4;
- (BOOL)_openAsDownload;
- (BOOL)isEqual:(id)a3;
- (BOOL)openInPlace;
- (BSProcessHandle)_sourceProcessHandle;
- (NSString)sourceApplication;
- (UIEventAttribution)eventAttribution;
- (id)_initWithSourceApplication:(id)a3 processHandle:(id)a4 annotation:(id)a5 openInPlace:(BOOL)a6;
- (id)_initWithSourceApplication:(id)a3 processHandle:(id)a4 annotation:(id)a5 openInPlace:(BOOL)a6 eventAttribution:(id)a7 openAsDownload:(BOOL)a8 contentOwner:(int64_t)a9;
- (id)annotation;
- (id)description;
- (int64_t)_contentOwner;
- (unint64_t)hash;
@end

@implementation UISceneOpenURLOptions

+ (id)_optionsFromPayload:(id)a3 sourceProcessHandle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKey:@"UIApplicationLaunchOptionsSourceApplicationKey"];
  uint64_t v8 = [v5 objectForKey:@"UIApplicationOpenURLOptionsAnnotationKey"];
  uint64_t v9 = [v5 objectForKey:@"UIApplicationLaunchOptionsAnnotationKey"];
  v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v29 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_fault_impl(&dword_1853B0000, v29, OS_LOG_TYPE_FAULT, "Unexpected transition context. Annotation data set for both annotation keys", v32, 2u);
      }
    }
    else
    {
      v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_optionsFromPayload_sourceProcessHandle____s_category)+ 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "Unexpected transition context. Annotation data set for both annotation keys", buf, 2u);
      }
    }
  }
  if (v10) {
    v12 = v10;
  }
  else {
    v12 = (void *)v8;
  }
  uint64_t v13 = *MEMORY[0x1E4F22378];
  id v14 = v12;
  v15 = [v5 objectForKey:v13];
  unsigned int v30 = [v15 BOOLValue];

  v16 = [v5 objectForKey:@"_UISceneConnectionOptionsOpenAsDownload"];
  uint64_t v17 = [v16 BOOLValue];

  v18 = [v5 objectForKey:@"_UIApplicationOpenURLOptionsManagedContentKey"];
  uint64_t v19 = [v18 integerValue];

  v20 = [UIEventAttribution alloc];
  [v5 objectForKey:@"UIApplicationLaunchOptionsEventAttributionKey"];
  v21 = (void *)v8;
  v23 = v22 = v6;
  v24 = [(UIEventAttribution *)v20 initWithUISClickAttribution:v23];

  id v25 = [[UISceneOpenURLOptions alloc] _initWithSourceApplication:v7 processHandle:v22 annotation:v14 openInPlace:v30 eventAttribution:v24 openAsDownload:v17 contentOwner:v19];
  return v25;
}

+ (id)_optionsFromDictionary:(id)a3
{
  return +[UISceneOpenURLOptions _optionsFromPayload:a3 sourceProcessHandle:0];
}

- (id)_initWithSourceApplication:(id)a3 processHandle:(id)a4 annotation:(id)a5 openInPlace:(BOOL)a6
{
  return [(UISceneOpenURLOptions *)self _initWithSourceApplication:a3 processHandle:a4 annotation:a5 openInPlace:a6 eventAttribution:0 openAsDownload:0 contentOwner:0];
}

- (id)_initWithSourceApplication:(id)a3 processHandle:(id)a4 annotation:(id)a5 openInPlace:(BOOL)a6 eventAttribution:(id)a7 openAsDownload:(BOOL)a8 contentOwner:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v22 = a5;
  id v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)UISceneOpenURLOptions;
  uint64_t v19 = [(UISceneOpenURLOptions *)&v23 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sourceApp, a3);
    objc_storeStrong((id *)&v20->_sourceProcessHandle, a4);
    objc_storeStrong((id *)&v20->_annotation, a5);
    v20->_openInPlace = a6;
    objc_storeStrong((id *)&v20->_eventAttribution, a7);
    v20->_openAsDownload = a8;
    v20->_contentOwner = a9;
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UISceneOpenURLOptions *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v16 = 1;
  }
  else
  {
    id v6 = v4;
    v7 = objc_opt_class();
    if ([v7 isEqual:objc_opt_class()]
      && (unint64_t v8 = [(UISceneOpenURLOptions *)self hash], v8 == [(UISceneOpenURLOptions *)v6 hash])
      && ((sourceApp = self->_sourceApp, sourceApp == v6->_sourceApp)
       || sourceApp && -[NSString isEqual:](sourceApp, "isEqual:"))
      && ((sourceProcessHandle = self->_sourceProcessHandle, sourceProcessHandle == v6->_sourceProcessHandle)
       || sourceProcessHandle && -[BSProcessHandle isEqual:](sourceProcessHandle, "isEqual:"))
      && self->_annotation == v6->_annotation
      && (BOOL openInPlace = self->_openInPlace, openInPlace == [(UISceneOpenURLOptions *)v6 openInPlace]))
    {
      eventAttribution = self->_eventAttribution;
      uint64_t v13 = [(UISceneOpenURLOptions *)v6 eventAttribution];
      if (eventAttribution == v13
        && (BOOL openAsDownload = self->_openAsDownload,
            openAsDownload == [(UISceneOpenURLOptions *)v6 _openAsDownload]))
      {
        int64_t contentOwner = self->_contentOwner;
        BOOL v16 = contentOwner == [(UISceneOpenURLOptions *)v6 _contentOwner];
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sourceApp hash];
  uint64_t v4 = [self->_annotation hash] ^ v3;
  sourceProcessHandle = self->_sourceProcessHandle;
  if (sourceProcessHandle) {
    v4 ^= [(BSProcessHandle *)sourceProcessHandle hash];
  }
  return [(UIEventAttribution *)self->_eventAttribution hash] ^ v4;
}

- (id)description
{
  NSUInteger v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  if (self->_openInPlace) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; sourceApp: %@; annotation: %@; openInPlace: %@",
    v4,
    self,
    self->_sourceApp,
    self->_annotation,
  id v6 = v5);
  [v6 appendFormat:@"; _eventAttribution: %@", self->_eventAttribution];
  v7 = [NSString stringWithFormat:@"%@%@", v6, @">"];

  return v7;
}

- (NSString)sourceApplication
{
  return self->_sourceApp;
}

- (BSProcessHandle)_sourceProcessHandle
{
  return self->_sourceProcessHandle;
}

- (id)annotation
{
  return self->_annotation;
}

- (BOOL)openInPlace
{
  return self->_openInPlace;
}

- (BOOL)_openAsDownload
{
  return self->_openAsDownload;
}

- (int64_t)_contentOwner
{
  return self->_contentOwner;
}

- (UIEventAttribution)eventAttribution
{
  return self->_eventAttribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAttribution, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_sourceProcessHandle, 0);
  objc_storeStrong((id *)&self->_sourceApp, 0);
}

@end