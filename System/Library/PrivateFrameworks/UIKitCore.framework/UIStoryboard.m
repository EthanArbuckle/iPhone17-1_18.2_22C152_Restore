@interface UIStoryboard
+ (UIStoryboard)storyboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil;
- (BOOL)containsNibNamed:(id)a3;
- (NSBundle)bundle;
- (NSDictionary)identifierToExternalStoryboardReferenceMap;
- (NSDictionary)identifierToNibNameMap;
- (NSMutableDictionary)identifierToUINibMap;
- (NSString)designatedEntryPointIdentifier;
- (NSString)designatedMenuIdentifier;
- (NSString)name;
- (NSString)storyboardFileName;
- (UIStoryboard)initWithBundle:(id)a3 storyboardFileName:(id)a4 identifierToNibNameMap:(id)a5 identifierToExternalStoryboardReferenceMap:(id)a6 designatedEntryPointIdentifier:(id)a7 designatedMenuIdentifier:(id)a8;
- (UIStoryboardSegueTemplate)__currentStoryboardSegueTemplate;
- (UIViewController)instantiateInitialViewController;
- (UIViewController)instantiateInitialViewControllerWithCreator:(UIStoryboardViewControllerCreator)block;
- (UIViewController)instantiateViewControllerWithIdentifier:(NSString *)identifier;
- (UIViewController)instantiateViewControllerWithIdentifier:(NSString *)identifier creator:(UIStoryboardViewControllerCreator)block;
- (id)__currentSender;
- (id)__currentStoryboardSegueCreator;
- (id)__reallyInstantiateViewControllerWithIdentifier:(id)a3 creator:(id)a4 storyboardSegueTemplate:(id)a5 sender:(id)a6;
- (id)_instantiateInitialMenu;
- (id)_instantiateInitialViewControllerWithCreator:(id)a3 storyboardSegueTemplate:(id)a4 sender:(id)a5;
- (id)_instantiateViewControllerReferencedByPlaceholderWithIdentifier:(id)a3 storyboardSegueTemplate:(id)a4 sender:(id)a5;
- (id)_instantiateViewControllerWithIdentifier:(id)a3 creator:(id)a4 storyboardSegueTemplate:(id)a5 sender:(id)a6;
- (id)identifierForStringsFile;
- (id)nibForStoryboardNibNamed:(id)a3;
- (id)nibForViewControllerWithIdentifier:(id)a3;
- (id)referencedStoryboardForExternalReferenceInfo:(id)a3;
- (void)dealloc;
- (void)set__currentSender:(id)a3;
- (void)set__currentStoryboardSegueCreator:(id)a3;
- (void)set__currentStoryboardSegueTemplate:(id)a3;
@end

@implementation UIStoryboard

- (BOOL)containsNibNamed:(id)a3
{
  return [(NSBundle *)[(UIStoryboard *)self bundle] pathForResource:a3 ofType:@"nib" inDirectory:[(UIStoryboard *)self storyboardFileName]] != 0;
}

- (id)nibForStoryboardNibNamed:(id)a3
{
  if (![a3 length]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIStoryboard.m", 133, @"Invalid parameter not satisfying: %@", @"[nibName length] > 0");
  }
  v6 = [[UINib alloc] initWithNibName:a3 directory:[(UIStoryboard *)self storyboardFileName] bundle:[(UIStoryboard *)self bundle]];
  [(UINib *)v6 setIdentifierForStringsFile:[(UIStoryboard *)self identifierForStringsFile]];
  return v6;
}

- (NSString)storyboardFileName
{
  return self->storyboardFileName;
}

- (NSBundle)bundle
{
  return self->bundle;
}

- (id)identifierForStringsFile
{
  v3 = [(UIStoryboard *)self bundle];
  v4 = [(UIStoryboard *)self name];
  return [(NSBundle *)v3 pathForResource:v4 ofType:@"storyboardc"];
}

- (NSString)name
{
  v2 = [(UIStoryboard *)self storyboardFileName];
  return [(NSString *)v2 stringByDeletingPathExtension];
}

+ (UIStoryboard)storyboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil
{
  if ([(NSString *)name length])
  {
    if (storyboardBundleOrNil) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"UIStoryboard.m", 100, @"Invalid parameter not satisfying: %@", @"[name length] > 0");
  if (!storyboardBundleOrNil) {
LABEL_3:
  }
    storyboardBundleOrNil = (NSBundle *)[MEMORY[0x1E4F28B50] mainBundle];
LABEL_4:
  v8 = [(NSBundle *)storyboardBundleOrNil pathForResource:name ofType:@"storyboardc"];
  if (!v8)
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    uint64_t v16 = [NSString stringWithFormat:@"Could not find a storyboard named '%@' in bundle %@", name, storyboardBundleOrNil];
    v17 = v14;
    uint64_t v18 = v15;
    goto LABEL_12;
  }
  v9 = v8;
  v10 = [(NSString *)name stringByAppendingPathExtension:@"storyboardc"];
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithContentsOfFile:", -[NSString stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", @"Info-8.0+.plist"));
  if (!v11)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithContentsOfFile:", -[NSString stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", @"Info.plist"));
    if (!v11)
    {
      v19 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v20 = *MEMORY[0x1E4F1C3C8];
      uint64_t v16 = [NSString stringWithFormat:@"There doesn't seem to be a valid compiled storyboard at path '%@'", v9];
      v17 = v19;
      uint64_t v18 = v20;
LABEL_12:
      objc_exception_throw((id)[v17 exceptionWithName:v18 reason:v16 userInfo:0]);
    }
  }
  v12 = (UIStoryboard *)objc_autorelease((id)objc_msgSend(objc_alloc((Class)a1), "initWithBundle:storyboardFileName:identifierToNibNameMap:identifierToExternalStoryboardReferenceMap:designatedEntryPointIdentifier:designatedMenuIdentifier:", storyboardBundleOrNil, v10, objc_msgSend(v11, "objectForKey:", @"UIViewControllerIdentifiersToNibNames"), objc_msgSend(v11, "objectForKey:", @"UIViewControllerIdentifiersToExternalStoryboardReferences"), objc_msgSend(v11, "objectForKey:", @"UIStoryboardDesignatedEntryPointIdentifier"), objc_msgSend(v11,
                                                 "objectForKey:",
                                                 @"UIStoryboardDesignatedMenuIdentifier")));

  return v12;
}

- (UIStoryboard)initWithBundle:(id)a3 storyboardFileName:(id)a4 identifierToNibNameMap:(id)a5 identifierToExternalStoryboardReferenceMap:(id)a6 designatedEntryPointIdentifier:(id)a7 designatedMenuIdentifier:(id)a8
{
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
LABEL_8:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIStoryboard.m", 74, @"Invalid parameter not satisfying: %@", @"nibNameMap != nil");
    if (a4) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIStoryboard.m", 73, @"Invalid parameter not satisfying: %@", @"aBundle != nil");
  if (!a5) {
    goto LABEL_8;
  }
LABEL_3:
  if (a4) {
    goto LABEL_4;
  }
LABEL_9:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIStoryboard.m", 75, @"Invalid parameter not satisfying: %@", @"initialStoryboardFileName != nil");
LABEL_4:
  v18.receiver = self;
  v18.super_class = (Class)UIStoryboard;
  uint64_t v16 = [(UIStoryboard *)&v18 init];
  if (v16)
  {
    v16->bundle = (NSBundle *)a3;
    v16->storyboardFileName = (NSString *)[a4 copy];
    v16->identifierToNibNameMap = (NSDictionary *)[a5 copy];
    v16->identifierToExternalStoryboardReferenceMap = (NSDictionary *)[a6 copy];
    v16->designatedEntryPointIdentifier = (NSString *)[a7 copy];
    v16->designatedMenuIdentifier = (NSString *)[a8 copy];
  }
  return v16;
}

- (UIViewController)instantiateInitialViewController
{
  return [(UIStoryboard *)self instantiateInitialViewControllerWithCreator:0];
}

- (UIViewController)instantiateInitialViewControllerWithCreator:(UIStoryboardViewControllerCreator)block
{
  return (UIViewController *)[(UIStoryboard *)self _instantiateInitialViewControllerWithCreator:block storyboardSegueTemplate:0 sender:0];
}

- (id)_instantiateViewControllerWithIdentifier:(id)a3 creator:(id)a4 storyboardSegueTemplate:(id)a5 sender:(id)a6
{
  [(UIStoryboard *)self set__currentStoryboardSegueTemplate:a5];
  [(UIStoryboard *)self set__currentSender:a6];
  [(UIStoryboard *)self set__currentStoryboardSegueCreator:a4];
  v10 = [(UIStoryboard *)self instantiateViewControllerWithIdentifier:a3];
  [(UIStoryboard *)self set__currentStoryboardSegueCreator:0];
  [(UIStoryboard *)self set__currentStoryboardSegueTemplate:0];
  [(UIStoryboard *)self set__currentSender:0];
  return v10;
}

- (void)set__currentStoryboardSegueTemplate:(id)a3
{
  self->___currentStoryboardSegueTemplate = (UIStoryboardSegueTemplate *)a3;
}

- (void)set__currentStoryboardSegueCreator:(id)a3
{
  self->___currentStoryboardSegueCreator = a3;
}

- (void)set__currentSender:(id)a3
{
  self->___currentSender = a3;
}

- (UIViewController)instantiateViewControllerWithIdentifier:(NSString *)identifier
{
  v5 = [(UIStoryboard *)self __currentStoryboardSegueTemplate];
  id v6 = [(UIStoryboard *)self __currentSender];
  id v7 = [(UIStoryboard *)self __currentStoryboardSegueCreator];
  [(UIStoryboard *)self set__currentStoryboardSegueCreator:0];
  [(UIStoryboard *)self set__currentStoryboardSegueTemplate:0];
  [(UIStoryboard *)self set__currentSender:0];
  return (UIViewController *)[(UIStoryboard *)self __reallyInstantiateViewControllerWithIdentifier:identifier creator:v7 storyboardSegueTemplate:v5 sender:v6];
}

- (id)__reallyInstantiateViewControllerWithIdentifier:(id)a3 creator:(id)a4 storyboardSegueTemplate:(id)a5 sender:(id)a6
{
  id v12 = -[UIStoryboard nibForViewControllerWithIdentifier:](self, "nibForViewControllerWithIdentifier:");
  if (!v12) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Storyboard (%@) doesn't contain a view controller with identifier '%@'", self, a3), 0 reason userInfo]);
  }
  v13 = v12;
  v14 = objc_alloc_init(UIStoryboardScene);
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:self forKey:@"UIStoryboardPlaceholder"];
  uint64_t v16 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:v15 forKey:@"UINibExternalObjects"];
  v17 = v16;
  if (a5) {
    [v16 setObject:a5 forKey:@"UINibSourceSegueTemplate"];
  }
  if (a6) {
    [v17 setObject:a6 forKey:@"UINibPerformSegueSender"];
  }
  if (a4) {
    [v17 setObject:a4 forKey:@"UINibPerformSegueCreator"];
  }
  [v13 instantiateWithOwner:v14 options:v17];
  [v17 removeAllObjects];
  id v18 = [(UIStoryboardScene *)v14 sceneViewController];
  if (!v18) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIStoryboard.m", 238, @"Could not load the scene view controller for identifier '%@'", a3);
  }
  if (![v18 storyboardIdentifier]) {
    [v18 setStoryboardIdentifier:a3];
  }
  return v18;
}

- (id)nibForViewControllerWithIdentifier:(id)a3
{
  if (![a3 length]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIStoryboard.m", 140, @"Invalid parameter not satisfying: %@", @"[identifier length] > 0");
  }
  id v6 = (id)[(NSMutableDictionary *)self->identifierToUINibMap objectForKey:a3];
  if (!v6)
  {
    id v7 = [(NSDictionary *)[(UIStoryboard *)self identifierToNibNameMap] objectForKey:a3];
    if (v7)
    {
      id v6 = [(UIStoryboard *)self nibForStoryboardNibNamed:v7];
      identifierToUINibMap = self->identifierToUINibMap;
      if (!identifierToUINibMap)
      {
        identifierToUINibMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        self->identifierToUINibMap = identifierToUINibMap;
      }
      [(NSMutableDictionary *)identifierToUINibMap setObject:v6 forKey:a3];
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (NSDictionary)identifierToNibNameMap
{
  return self->identifierToNibNameMap;
}

- (UIStoryboardSegueTemplate)__currentStoryboardSegueTemplate
{
  return self->___currentStoryboardSegueTemplate;
}

- (id)__currentStoryboardSegueCreator
{
  return self->___currentStoryboardSegueCreator;
}

- (id)__currentSender
{
  return self->___currentSender;
}

- (id)_instantiateInitialViewControllerWithCreator:(id)a3 storyboardSegueTemplate:(id)a4 sender:(id)a5
{
  id result = [(UIStoryboard *)self designatedEntryPointIdentifier];
  if (result)
  {
    v10 = [(UIStoryboard *)self designatedEntryPointIdentifier];
    return [(UIStoryboard *)self _instantiateViewControllerWithIdentifier:v10 creator:a3 storyboardSegueTemplate:a4 sender:a5];
  }
  return result;
}

- (NSString)designatedEntryPointIdentifier
{
  return self->designatedEntryPointIdentifier;
}

- (id)_instantiateInitialMenu
{
  id result = [(UIStoryboard *)self designatedMenuIdentifier];
  if (result)
  {
    id v5 = result;
    id result = [(UIStoryboard *)self nibForViewControllerWithIdentifier:result];
    if (result)
    {
      id v6 = result;
      id v7 = objc_alloc_init(UIStoryboardScene);
      [v6 instantiateWithOwner:v7 options:0];
      id result = [(UIStoryboardScene *)v7 sceneViewController];
      if (!result)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIStoryboard.m", 186, @"Could not load the scene command menu for identifier '%@'", v5);
        return 0;
      }
    }
  }
  return result;
}

- (NSString)designatedMenuIdentifier
{
  return self->designatedMenuIdentifier;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIStoryboard;
  [(UIStoryboard *)&v3 dealloc];
}

- (id)referencedStoryboardForExternalReferenceInfo:(id)a3
{
  uint64_t v5 = [a3 objectForKey:@"UIReferencedStoryboardName"];
  if (!v5) {
    return self;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [a3 objectForKey:@"UIReferencedBundleIdentifier"];
  if (v7) {
    v8 = (NSBundle *)[MEMORY[0x1E4F28B50] bundleWithIdentifier:v7];
  }
  else {
    v8 = [(UIStoryboard *)self bundle];
  }
  return +[UIStoryboard storyboardWithName:v6 bundle:v8];
}

- (id)_instantiateViewControllerReferencedByPlaceholderWithIdentifier:(id)a3 storyboardSegueTemplate:(id)a4 sender:(id)a5
{
  id v10 = [(NSDictionary *)[(UIStoryboard *)self identifierToExternalStoryboardReferenceMap] objectForKey:a3];
  if (!v10) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIStoryboard.m", 169, @"Could not find reference info for placeholder with identifier '%@'", a3);
  }
  id v11 = [(UIStoryboard *)self referencedStoryboardForExternalReferenceInfo:v10];
  uint64_t v12 = [v10 objectForKey:@"UIReferencedControllerIdentifier"];
  if (v12)
  {
    return (id)[v11 _instantiateViewControllerWithIdentifier:v12 creator:0 storyboardSegueTemplate:a4 sender:a5];
  }
  else
  {
    return (id)[v11 _instantiateInitialViewControllerWithCreator:0 storyboardSegueTemplate:a4 sender:a5];
  }
}

- (UIViewController)instantiateViewControllerWithIdentifier:(NSString *)identifier creator:(UIStoryboardViewControllerCreator)block
{
  return (UIViewController *)[(UIStoryboard *)self _instantiateViewControllerWithIdentifier:identifier creator:block storyboardSegueTemplate:0 sender:0];
}

- (NSDictionary)identifierToExternalStoryboardReferenceMap
{
  return self->identifierToExternalStoryboardReferenceMap;
}

- (NSMutableDictionary)identifierToUINibMap
{
  return self->identifierToUINibMap;
}

@end