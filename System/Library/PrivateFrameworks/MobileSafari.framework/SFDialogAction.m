@interface SFDialogAction
+ (id)actionWithTitle:(id)a3 activatingKeyboardShortcut:(int64_t)a4 type:(int64_t)a5;
+ (id)actionWithTitle:(id)a3 activatingKeyboardShortcut:(int64_t)a4 type:(int64_t)a5 isPreferredAction:(BOOL)a6;
- (BOOL)hasCustomAction;
- (BOOL)isPreferredAction;
- (NSString)title;
- (SFDialogAction)initWithTitle:(id)a3 activatingKeyboardShortcut:(int64_t)a4 type:(int64_t)a5 isPreferredAction:(BOOL)a6;
- (int64_t)actionType;
- (int64_t)activatingKeyboardShortcut;
- (void)setCustomAction:(id)a3;
- (void)triggerCustomAction;
@end

@implementation SFDialogAction

+ (id)actionWithTitle:(id)a3 activatingKeyboardShortcut:(int64_t)a4 type:(int64_t)a5
{
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithTitle:v8 activatingKeyboardShortcut:a4 type:a5 isPreferredAction:0];

  return v9;
}

+ (id)actionWithTitle:(id)a3 activatingKeyboardShortcut:(int64_t)a4 type:(int64_t)a5 isPreferredAction:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithTitle:v10 activatingKeyboardShortcut:a4 type:a5 isPreferredAction:v6];

  return v11;
}

- (SFDialogAction)initWithTitle:(id)a3 activatingKeyboardShortcut:(int64_t)a4 type:(int64_t)a5 isPreferredAction:(BOOL)a6
{
  id v11 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFDialogAction;
  v12 = [(SFDialogAction *)&v16 init];
  v13 = v12;
  if (v12)
  {
    v12->_activatingKeyboardShortcut = a4;
    v12->_actionType = a5;
    objc_storeStrong((id *)&v12->_title, a3);
    v13->_isPreferredAction = a6;
    v14 = v13;
  }

  return v13;
}

- (BOOL)hasCustomAction
{
  return self->_customAction != 0;
}

- (void)setCustomAction:(id)a3
{
  v4 = _Block_copy(a3);
  id customAction = self->_customAction;
  self->_id customAction = v4;
}

- (void)triggerCustomAction
{
}

- (int64_t)activatingKeyboardShortcut
{
  return self->_activatingKeyboardShortcut;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isPreferredAction
{
  return self->_isPreferredAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_customAction, 0);
}

@end