@interface TUIToggleBox
+ (void)setupSize;
- (Class)layoutClass;
- (NSString)title;
- (void)setTitle:(id)a3;
@end

@implementation TUIToggleBox

+ (void)setupSize
{
  if (qword_2DF368 != -1) {
    dispatch_once(&qword_2DF368, &stru_252D40);
  }
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end