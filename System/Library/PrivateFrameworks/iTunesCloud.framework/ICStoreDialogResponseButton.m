@interface ICStoreDialogResponseButton
- (BOOL)isDefaultButton;
- (ICStoreDialogResponseButton)initWithType:(int64_t)a3 isDefaultButton:(BOOL)a4 title:(id)a5 action:(id)a6;
- (ICStoreDialogResponseButtonAction)action;
- (NSString)title;
- (int64_t)type;
@end

@implementation ICStoreDialogResponseButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (ICStoreDialogResponseButtonAction)action
{
  return self->_action;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isDefaultButton
{
  return self->_isDefaultButton;
}

- (int64_t)type
{
  return self->_type;
}

- (ICStoreDialogResponseButton)initWithType:(int64_t)a3 isDefaultButton:(BOOL)a4 title:(id)a5 action:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICStoreDialogResponseButton;
  v12 = [(ICStoreDialogResponseButton *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    v12->_isDefaultButton = a4;
    uint64_t v14 = [v10 copy];
    title = v13->_title;
    v13->_title = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    action = v13->_action;
    v13->_action = (ICStoreDialogResponseButtonAction *)v16;
  }
  return v13;
}

@end