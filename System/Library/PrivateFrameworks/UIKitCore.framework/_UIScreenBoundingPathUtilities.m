@interface _UIScreenBoundingPathUtilities
+ (id)boundingPathUtilitiesForScreen:(id)a3;
- (UIScreen)_screen;
- (_UIScreenBoundingPathUtilities)initWithScreen:(id)a3;
- (id)boundingPathForWindow:(id)a3;
- (void)setScreen:(id)a3;
@end

@implementation _UIScreenBoundingPathUtilities

- (UIScreen)_screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);
  return (UIScreen *)WeakRetained;
}

+ (id)boundingPathUtilitiesForScreen:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_UIScreenComplexBoundingPathUtilities isScreenSupported:v3];
  v5 = off_1E52D5E98;
  if (v4) {
    v5 = off_1E52D5E90;
  }
  v6 = (void *)[objc_alloc(*v5) initWithScreen:v3];

  return v6;
}

- (_UIScreenBoundingPathUtilities)initWithScreen:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIScreenBoundingPathUtilities;
  v5 = [(_UIScreenBoundingPathUtilities *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_screen, v4);
  }

  return v6;
}

- (id)boundingPathForWindow:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  objc_super v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"_UIScreenBoundingPathUtilities.m", 44, @"%@ must provide a concrete implementation of %@", v7, v8 object file lineNumber description];

  return 0;
}

- (void)setScreen:(id)a3
{
}

- (void).cxx_destruct
{
}

@end