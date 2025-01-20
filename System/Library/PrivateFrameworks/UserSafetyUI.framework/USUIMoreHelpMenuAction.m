@interface USUIMoreHelpMenuAction
+ (id)action:(id)a3 destructive:(BOOL)a4 actionID:(int64_t)a5;
- (BOOL)destructive;
- (NSString)title;
- (int64_t)actionID;
- (void)setActionID:(int64_t)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation USUIMoreHelpMenuAction

+ (id)action:(id)a3 destructive:(BOOL)a4 actionID:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setTitle:v7];

  [v8 setDestructive:v6];
  [v8 setActionID:a5];
  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (int64_t)actionID
{
  return self->_actionID;
}

- (void)setActionID:(int64_t)a3
{
  self->_actionID = a3;
}

- (void).cxx_destruct
{
}

@end