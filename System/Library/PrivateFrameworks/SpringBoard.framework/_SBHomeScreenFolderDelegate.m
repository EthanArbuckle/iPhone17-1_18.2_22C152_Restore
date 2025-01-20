@interface _SBHomeScreenFolderDelegate
- (BOOL)respondsToSelector:(SEL)a3;
- (SBFolderControllerDelegate)forwardingTarget;
- (_SBHomeScreenFolderDelegate)initWithForwardingTarget:(id)a3;
- (id)backgroundViewForDockForRootFolderController:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (int64_t)dockStyle;
- (void)setDockStyle:(int64_t)a3;
- (void)setForwardingTarget:(id)a3;
@end

@implementation _SBHomeScreenFolderDelegate

- (_SBHomeScreenFolderDelegate)initWithForwardingTarget:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)_SBHomeScreenFolderDelegate;
    v6 = [(_SBHomeScreenFolderDelegate *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_forwardingTarget, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v5 = self->_forwardingTarget;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_SBHomeScreenFolderDelegate;
    id v5 = [(_SBHomeScreenFolderDelegate *)&v7 forwardingTargetForSelector:a3];
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SBHomeScreenFolderDelegate;
  if (-[_SBHomeScreenFolderDelegate respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (id)backgroundViewForDockForRootFolderController:(id)a3
{
  int64_t v3 = [(_SBHomeScreenFolderDelegate *)self dockStyle];
  switch(v3)
  {
    case 2:
      id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      v6 = (void *)MEMORY[0x1E4F428B8];
      double v7 = 0.2;
LABEL_7:
      uint64_t v5 = [v6 colorWithWhite:v7 alpha:0.6];
      goto LABEL_8;
    case 1:
      id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      v6 = (void *)MEMORY[0x1E4F428B8];
      double v7 = 0.8;
      goto LABEL_7;
    case 0:
      id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      uint64_t v5 = [MEMORY[0x1E4F428B8] colorWithDynamicProvider:&__block_literal_global_296];
LABEL_8:
      v8 = (void *)v5;
      [v4 setBackgroundColor:v5];

      goto LABEL_10;
  }
  id v4 = 0;
LABEL_10:
  return v4;
}

- (SBFolderControllerDelegate)forwardingTarget
{
  return self->_forwardingTarget;
}

- (void)setForwardingTarget:(id)a3
{
}

- (int64_t)dockStyle
{
  return self->_dockStyle;
}

- (void)setDockStyle:(int64_t)a3
{
  self->_dockStyle = a3;
}

- (void).cxx_destruct
{
}

@end