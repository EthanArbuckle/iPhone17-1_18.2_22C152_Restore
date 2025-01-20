@interface USUIInterventionScreenAction
+ (id)action:(id)a3 primary:(BOOL)a4 actionID:(int64_t)a5;
- (BOOL)primary;
- (NSString)title;
- (int64_t)actionID;
- (void)setActionID:(int64_t)a3;
- (void)setPrimary:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation USUIInterventionScreenAction

+ (id)action:(id)a3 primary:(BOOL)a4 actionID:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setTitle:v7];

  [v8 setPrimary:v6];
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

- (BOOL)primary
{
  return self->_primary;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
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