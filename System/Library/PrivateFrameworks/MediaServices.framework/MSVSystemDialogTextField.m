@interface MSVSystemDialogTextField
+ (id)textFieldWithTitle:(id)a3;
+ (id)textFieldWithTitle:(id)a3 secure:(BOOL)a4;
- (BOOL)isSecure;
- (MSVSystemDialogTextField)initWithTitle:(id)a3;
- (NSString)title;
- (int64_t)keyboardType;
- (void)setKeyboardType:(int64_t)a3;
- (void)setSecure:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation MSVSystemDialogTextField

- (void).cxx_destruct
{
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (MSVSystemDialogTextField)initWithTitle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSVSystemDialogTextField;
  v5 = [(MSVSystemDialogTextField *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_secure = 0;
  }

  return v5;
}

+ (id)textFieldWithTitle:(id)a3 secure:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [[MSVSystemDialogTextField alloc] initWithTitle:v5];

  [(MSVSystemDialogTextField *)v6 setSecure:v4];
  return v6;
}

+ (id)textFieldWithTitle:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[MSVSystemDialogTextField alloc] initWithTitle:v3];

  return v4;
}

@end