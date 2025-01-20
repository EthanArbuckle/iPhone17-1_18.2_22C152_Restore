@interface _UILayerHostView
+ (Class)layerClass;
- (BOOL)inheritsSecurity;
- (_UILayerHostView)initWithCoder:(id)a3;
- (_UILayerHostView)initWithFrame:(CGRect)a3;
- (_UILayerHostView)initWithFrame:(CGRect)a3 pid:(int)a4 contextID:(unsigned int)a5;
- (unsigned)contextID;
- (void)setContextID:(unsigned int)a3;
- (void)setInheritsSecurity:(BOOL)a3;
- (void)setPid:(int)a3 contextID:(unsigned int)a4;
@end

@implementation _UILayerHostView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UILayerHostView)initWithFrame:(CGRect)a3
{
  return -[_UILayerHostView initWithFrame:pid:contextID:](self, "initWithFrame:pid:contextID:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UILayerHostView)initWithFrame:(CGRect)a3 pid:(int)a4 contextID:(unsigned int)a5
{
  v15.receiver = self;
  v15.super_class = (Class)_UILayerHostView;
  v7 = -[_UIVisibilityPropagationView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_uint64_t pid = a4;
    v7->_contextID = a5;
    if (a5)
    {
      v9 = [(_UILayerHostView *)v7 layerHost];
      [v9 setContextId:v8->_contextID];
    }
    uint64_t pid = v8->_pid;
    if ((int)pid >= 1 && v8->_contextID)
    {
      v11 = (void *)MEMORY[0x1E4F96478];
      v12 = _UISVisibilityEnvironmentForUIHostedWindowContextID();
      v13 = [v11 targetWithPid:pid environmentIdentifier:v12];
      -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)v8->super._interaction, v13);
    }
    -[_UIVisibilityPropagationInteraction _setVisibilityPropagationEnabled:]((uint64_t)v8->super._interaction, 1);
  }
  return v8;
}

- (_UILayerHostView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UILayerHostView;
  return [(_UIVisibilityPropagationView *)&v4 initWithCoder:a3];
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
}

- (void)setPid:(int)a3 contextID:(unsigned int)a4
{
  self->_uint64_t pid = a3;
  self->_contextID = a4;
  v5 = [(_UILayerHostView *)self layerHost];
  [v5 setContextId:self->_contextID];

  uint64_t pid = self->_pid;
  if ((int)pid >= 1 && self->_contextID)
  {
    v7 = (void *)MEMORY[0x1E4F96478];
    _UISVisibilityEnvironmentForUIHostedWindowContextID();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v8 = [v7 targetWithPid:pid environmentIdentifier:v10];
    -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)self->super._interaction, v8);
  }
  else
  {
    interaction = self->super._interaction;
    -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)interaction, 0);
  }
}

- (void)setInheritsSecurity:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UILayerHostView *)self layerHost];
  [v4 setInheritsSecurity:v3];
}

- (BOOL)inheritsSecurity
{
  v2 = [(_UILayerHostView *)self layerHost];
  char v3 = [v2 inheritsSecurity];

  return v3;
}

@end