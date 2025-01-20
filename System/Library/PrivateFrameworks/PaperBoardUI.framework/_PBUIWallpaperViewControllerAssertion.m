@interface _PBUIWallpaperViewControllerAssertion
- (BOOL)isInvalidated;
- (NSString)description;
- (NSString)reason;
- (PBUIWallpaperViewController)wallpaperViewController;
- (_PBUIWallpaperViewControllerAssertion)initWithWallpaperViewController:(id)a3 type:(int64_t)a4 reason:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)type;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation _PBUIWallpaperViewControllerAssertion

- (_PBUIWallpaperViewControllerAssertion)initWithWallpaperViewController:(id)a3 type:(int64_t)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_PBUIWallpaperViewControllerAssertion;
  v10 = [(_PBUIWallpaperViewControllerAssertion *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_wallpaperViewController, v8);
    v11->_type = a4;
    uint64_t v12 = [v9 copy];
    reason = v11->_reason;
    v11->_reason = (NSString *)v12;
  }
  return v11;
}

- (void)invalidate
{
  if (![(_PBUIWallpaperViewControllerAssertion *)self isInvalidated])
  {
    [(_PBUIWallpaperViewControllerAssertion *)self setInvalidated:1];
    id v3 = [(_PBUIWallpaperViewControllerAssertion *)self wallpaperViewController];
    [v3 _invalidateWallpaperAssertion:self];
  }
}

- (void)dealloc
{
  if (![(_PBUIWallpaperViewControllerAssertion *)self isInvalidated])
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PBUIWallpaperViewController.m", 2074, @"Wallpaper assertion type %ld \"%@\" was not invalidated before dealloc!", self->_type, self->_reason object file lineNumber description];
  }
  [(_PBUIWallpaperViewControllerAssertion *)self invalidate];
  v5.receiver = self;
  v5.super_class = (Class)_PBUIWallpaperViewControllerAssertion;
  [(_PBUIWallpaperViewControllerAssertion *)&v5 dealloc];
}

- (NSString)description
{
  return (NSString *)[(_PBUIWallpaperViewControllerAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_PBUIWallpaperViewControllerAssertion *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(_PBUIWallpaperViewControllerAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(_PBUIWallpaperViewControllerAssertion *)self succinctDescriptionBuilder];
  objc_super v5 = [(_PBUIWallpaperViewControllerAssertion *)self wallpaperViewController];
  id v6 = (id)[v4 appendPointer:v5 withName:@"wallpaperViewController"];

  id v7 = (id)objc_msgSend(v4, "appendInteger:withName:", -[_PBUIWallpaperViewControllerAssertion type](self, "type"), @"type");
  id v8 = [(_PBUIWallpaperViewControllerAssertion *)self reason];
  id v9 = (id)[v4 appendObject:v8 withName:@"reason"];

  id v10 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[_PBUIWallpaperViewControllerAssertion isInvalidated](self, "isInvalidated"), @"isInvalidated", 1);
  return v4;
}

- (PBUIWallpaperViewController)wallpaperViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperViewController);
  return (PBUIWallpaperViewController *)WeakRetained;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_wallpaperViewController);
}

@end