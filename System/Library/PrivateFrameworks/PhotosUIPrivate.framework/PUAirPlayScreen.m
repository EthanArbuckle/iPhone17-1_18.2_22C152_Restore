@interface PUAirPlayScreen
+ (PUAirPlayScreen)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAirPlayScreen:(id)a3;
- (BOOL)isValid;
- (CGSize)size;
- (NSString)_typeName;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (PUAirPlayScreen)init;
- (PUAirPlayScreen)initWithScreen:(id)a3;
- (UIScreen)screen;
- (UIViewController)rootViewController;
- (UIWindow)_window;
- (id)_associatedWindowScene;
- (unint64_t)hash;
- (unint64_t)placeholderType;
- (unint64_t)type;
- (void)_setIdentifier:(id)a3;
- (void)_setScreen:(id)a3;
- (void)_setSize:(CGSize)a3;
- (void)_setType:(unint64_t)a3;
- (void)_setWindow:(id)a3;
- (void)_updateWindow;
- (void)dealloc;
- (void)setRootViewController:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PUAirPlayScreen

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__window, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

- (void)_setWindow:(id)a3
{
}

- (UIWindow)_window
{
  return self->__window;
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)_setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)_setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_setScreen:(id)a3
{
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUAirPlayScreen.m", 209, @"Invalid parameter not satisfying: %@", @"[settings isKindOfClass:[PUAirPlaySettings class]]" object file lineNumber description];
  }
  v10 = NSStringFromSelector(sel_compensateForOverscan);
  int v11 = [v7 isEqual:v10];

  if (v11)
  {
    [(PUAirPlayScreen *)self _updateWindow];
  }
}

- (void)_updateWindow
{
  v3 = PLAirPlayGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "Updating PUAirPlayScreen", buf, 2u);
  }

  v4 = [(PUAirPlayScreen *)self screen];
  v5 = [(PUAirPlayScreen *)self _associatedWindowScene];
  v6 = [(PUAirPlayScreen *)self _window];
  id v7 = [(PUAirPlayScreen *)self rootViewController];
  [v4 setOverscanCompensation:2];
  [v4 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = +[PUAirPlaySettings sharedInstance];
  int v17 = [v16 compensateForOverscan];

  if (v17)
  {
    [v4 overscanCompensationInsets];
    double v9 = v9 + v18;
    double v11 = v11 + v19;
    double v13 = v13 - (v18 + v20);
    double v15 = v15 - (v19 + v21);
  }
  if (!v4 || !v5)
  {
    v27 = PLAirPlayGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1AE9F8000, v27, OS_LOG_TYPE_DEFAULT, "\tUnderlying UIScreen is missing; discarding window and removing any content",
        v35,
        2u);
    }

    [(PUAirPlayScreen *)self _setWindow:0];
    id v7 = 0;
    goto LABEL_17;
  }
  if (!v6 && v7)
  {
    v22 = PLAirPlayGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_DEFAULT, "\tAirPlay screen has content but no window; creating one",
        v34,
        2u);
    }

    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1F48]) initWithWindowScene:v5];
    [(PUAirPlayScreen *)self _setWindow:v6];
    goto LABEL_12;
  }
  if (!v6 || v7)
  {
    if (v6 && v7)
    {
      v30 = [v6 rootViewController];

      if (v30 != v7)
      {
        v31 = PLAirPlayGetLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_1AE9F8000, v31, OS_LOG_TYPE_DEFAULT, "\tLoading new root controller in existing window", v32, 2u);
        }
      }
    }
    else if (!v7)
    {
LABEL_17:
      uint64_t v28 = 0;
      goto LABEL_18;
    }
LABEL_12:
    v23 = [v6 rootViewController];

    if (v23 != v7)
    {
      double v24 = *MEMORY[0x1E4F1DAD8];
      double v25 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v26 = [v7 view];
      objc_msgSend(v26, "setFrame:", v24, v25, v13, v15);
    }
    goto LABEL_17;
  }
  v29 = PLAirPlayGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1AE9F8000, v29, OS_LOG_TYPE_DEFAULT, "\tAirPlay screen has a window but no content; removing window from the UIScreen",
      v33,
      2u);
  }

  [(PUAirPlayScreen *)self _setWindow:0];
  id v7 = 0;
  uint64_t v28 = 1;
LABEL_18:
  objc_msgSend(v6, "setFrame:", v9, v11, v13, v15);
  [v6 setRootViewController:v7];
  [v6 setHidden:v28];
}

- (id)_associatedWindowScene
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(PUAirPlayScreen *)self screen];
  if (v2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v3 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", 0);
    v4 = [v3 connectedScenes];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v9;
            double v11 = [v10 screen];

            if (v11 == v2) {
              goto LABEL_13;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    id v10 = 0;
LABEL_13:
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isValid
{
  v3 = [(PUAirPlayScreen *)self screen];
  if (v3)
  {
    v4 = [(PUAirPlayScreen *)self _associatedWindowScene];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)_typeName
{
  unint64_t v2 = [(PUAirPlayScreen *)self type];
  if (v2 > 2) {
    return 0;
  }
  else {
    return &off_1E5F22FA0[v2]->isa;
  }
}

- (NSString)debugDescription
{
  v24.receiver = self;
  v24.super_class = (Class)PUAirPlayScreen;
  v3 = [(PUAirPlayScreen *)&v24 description];
  v4 = (void *)[v3 mutableCopy];

  BOOL v5 = [(PUAirPlayScreen *)self _typeName];
  [v4 appendFormat:@"\n\tType: %@", v5];

  [(PUAirPlayScreen *)self size];
  uint64_t v6 = NSStringFromCGSize(v26);
  [v4 appendFormat:@"\n\tSize: %@", v6];

  uint64_t v7 = [(PUAirPlayScreen *)self rootViewController];
  [v4 appendFormat:@"\n\tRoot: %@", v7];

  double v8 = [(PUAirPlayScreen *)self screen];
  double v9 = objc_msgSend(v8, "pl_briefDescription");
  [v4 appendFormat:@"\n\tBacking screen: %@", v9];

  id v10 = [(PUAirPlayScreen *)self _window];
  double v11 = objc_msgSend(v10, "pl_briefDescription");
  [v4 appendFormat:@"\n\tWindow: %@", v11];

  double v12 = [(PUAirPlayScreen *)self _window];
  [v12 frame];
  long long v13 = NSStringFromCGRect(v27);
  [v4 appendFormat:@"\n\t\tFrame: %@", v13];

  long long v14 = [(PUAirPlayScreen *)self _window];
  if ([v14 isHidden]) {
    long long v15 = @"YES";
  }
  else {
    long long v15 = @"NO";
  }
  [v4 appendFormat:@"\n\t\tHidden: %@", v15];

  long long v16 = [(PUAirPlayScreen *)self _window];
  int v17 = [v16 screen];
  uint64_t v18 = objc_msgSend(v17, "pl_briefDescription");
  [v4 appendFormat:@"\n\t\tScreen: %@", v18];

  double v19 = [(PUAirPlayScreen *)self screen];
  double v20 = [(PUAirPlayScreen *)self _window];
  double v21 = [v20 screen];
  if (v19 == v21) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  [v4 appendFormat:@"\n\tBacking and window screens match: %@", v22];

  return (NSString *)v4;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PUAirPlayScreen *)self _typeName];
  [(PUAirPlayScreen *)self size];
  uint64_t v7 = NSStringFromCGSize(v14);
  uint64_t v8 = [(PUAirPlayScreen *)self rootViewController];
  double v9 = (void *)v8;
  id v10 = @"nil";
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; type = %@; size = %@; rootViewController = %@>",
    v5,
    self,
    v6,
    v7,
  double v11 = v10);

  return (NSString *)v11;
}

- (void)setRootViewController:(id)a3
{
  BOOL v5 = (UIViewController *)a3;
  if (self->_rootViewController != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_rootViewController, a3);
    [(PUAirPlayScreen *)self _updateWindow];
    BOOL v5 = v6;
  }
}

- (unint64_t)placeholderType
{
  unint64_t v2 = [(PUAirPlayScreen *)self type];
  v3 = +[PUAirPlaySettings sharedInstance];
  v4 = v3;
  if (v2 == 2) {
    uint64_t v5 = [v3 placeholderForMirroredScreen];
  }
  else {
    uint64_t v5 = [v3 placeholderForSecondScreen];
  }
  unint64_t v6 = v5;

  return v6;
}

- (BOOL)isEqualToAirPlayScreen:(id)a3
{
  v4 = [a3 screen];
  uint64_t v5 = [(PUAirPlayScreen *)self screen];
  LOBYTE(self) = v4 == v5;

  return (char)self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PUAirPlayScreen *)self isEqualToAirPlayScreen:v4];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2 = [(PUAirPlayScreen *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)dealloc
{
  [(UIWindow *)self->__window setHidden:1];
  [(UIWindow *)self->__window setRootViewController:0];
  v3.receiver = self;
  v3.super_class = (Class)PUAirPlayScreen;
  [(PUAirPlayScreen *)&v3 dealloc];
}

- (PUAirPlayScreen)initWithScreen:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PUAirPlayScreen;
  unint64_t v6 = [(PUAirPlayScreen *)&v16 init];
  if (v6)
  {
    if (!v5)
    {
      long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v6, @"PUAirPlayScreen.m", 44, @"Invalid parameter not satisfying: %@", @"screen" object file lineNumber description];
    }
    [(PUAirPlayScreen *)v6 _setScreen:v5];
    uint64_t v7 = [v5 _displayID];
    [(PUAirPlayScreen *)v6 _setIdentifier:v7];

    [v5 bounds];
    -[PUAirPlayScreen _setSize:](v6, "_setSize:", v8, v9);
    id v10 = [(PUAirPlayScreen *)v6 screen];
    double v11 = [v10 mirroredScreen];

    if (v11) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    [(PUAirPlayScreen *)v6 _setType:v12];
    long long v13 = +[PUAirPlaySettings sharedInstance];
    [v13 addKeyObserver:v6];
  }
  return v6;
}

- (PUAirPlayScreen)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUAirPlayScreen.m", 35, @"%s is not available as initializer", "-[PUAirPlayScreen init]");

  abort();
}

+ (PUAirPlayScreen)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PUAirPlayScreen.m", 39, @"%s is not available as initializer", "+[PUAirPlayScreen new]");

  abort();
}

@end