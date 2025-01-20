@interface _UINonHostingVisibilityPropagationView
- (NSString)environmentIdentifier;
- (_UINonHostingVisibilityPropagationView)init;
- (_UINonHostingVisibilityPropagationView)initWithCoder:(id)a3;
- (_UINonHostingVisibilityPropagationView)initWithFrame:(CGRect)a3;
- (_UINonHostingVisibilityPropagationView)initWithFrame:(CGRect)a3 pid:(int)a4 environmentIdentifier:(id)a5;
- (int)pid;
@end

@implementation _UINonHostingVisibilityPropagationView

- (_UINonHostingVisibilityPropagationView)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UINonHostingVisibilityPropagationView.m", 21, @"%s is not allowed on %@", "-[_UINonHostingVisibilityPropagationView init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (_UINonHostingVisibilityPropagationView)initWithFrame:(CGRect)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v5 handleFailureInMethod:a2, self, @"_UINonHostingVisibilityPropagationView.m", 26, @"%s is not allowed on %@", "-[_UINonHostingVisibilityPropagationView initWithFrame:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (_UINonHostingVisibilityPropagationView)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"_UINonHostingVisibilityPropagationView.m", 31, @"%s is not allowed on %@", "-[_UINonHostingVisibilityPropagationView initWithCoder:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (_UINonHostingVisibilityPropagationView)initWithFrame:(CGRect)a3 pid:(int)a4 environmentIdentifier:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)_UINonHostingVisibilityPropagationView;
  v7 = -[_UIVisibilityPropagationView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_pid = a4;
    objc_storeStrong((id *)&v7->_environmentIdentifier, a5);
    if (v8->_pid >= 1 && [(NSString *)v8->_environmentIdentifier length])
    {
      v9 = [MEMORY[0x1E4F96478] targetWithPid:v8->_pid environmentIdentifier:v8->_environmentIdentifier];
      -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)v8->super._interaction, v9);
    }
    -[_UIVisibilityPropagationInteraction _setVisibilityPropagationEnabled:]((uint64_t)v8->super._interaction, 1);
  }
  return v8;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)environmentIdentifier
{
  return self->_environmentIdentifier;
}

- (void).cxx_destruct
{
}

@end