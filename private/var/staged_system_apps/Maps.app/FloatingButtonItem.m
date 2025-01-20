@interface FloatingButtonItem
+ (FloatingButtonItem)separatorItem;
- (BOOL)isSeparator;
- (FloatingButtonItem)initWithButton:(id)a3 option:(int64_t)a4;
- (UIButton)button;
- (int64_t)option;
- (void)setButton:(id)a3;
@end

@implementation FloatingButtonItem

- (BOOL)isSeparator
{
  return self->_isSeparator;
}

- (UIButton)button
{
  return self->_button;
}

- (int64_t)option
{
  return self->_option;
}

- (FloatingButtonItem)initWithButton:(id)a3 option:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FloatingButtonItem;
  v8 = [(FloatingButtonItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_button, a3);
    v9->_option = a4;
  }

  return v9;
}

+ (FloatingButtonItem)separatorItem
{
  if (qword_10160EC78 != -1) {
    dispatch_once(&qword_10160EC78, &stru_1012E95A8);
  }
  v2 = (void *)qword_10160EC70;

  return (FloatingButtonItem *)v2;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end