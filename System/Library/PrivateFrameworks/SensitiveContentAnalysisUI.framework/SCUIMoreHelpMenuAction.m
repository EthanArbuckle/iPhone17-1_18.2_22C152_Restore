@interface SCUIMoreHelpMenuAction
+ (id)action:(id)a3 iconSystemName:(id)a4 destructive:(BOOL)a5 actionID:(int64_t)a6;
- (BOOL)destructive;
- (NSString)iconSystemName;
- (NSString)title;
- (int64_t)actionID;
- (void)setActionID:(int64_t)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setIconSystemName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SCUIMoreHelpMenuAction

+ (id)action:(id)a3 iconSystemName:(id)a4 destructive:(BOOL)a5 actionID:(int64_t)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  [v11 setTitle:v10];

  [v11 setDestructive:v7];
  [v11 setActionID:a6];
  [v11 setIconSystemName:v9];

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)iconSystemName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIconSystemName:(id)a3
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
  objc_storeStrong((id *)&self->_iconSystemName, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end