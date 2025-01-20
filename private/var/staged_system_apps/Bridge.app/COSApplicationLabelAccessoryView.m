@interface COSApplicationLabelAccessoryView
- (COSApplicationLabelAccessoryView)initWithCoder:(id)a3;
- (COSApplicationLabelAccessoryView)initWithFrame:(CGRect)a3;
- (COSApplicationLabelAccessoryView)initWithLabelAccessoryType:(int64_t)a3;
@end

@implementation COSApplicationLabelAccessoryView

- (COSApplicationLabelAccessoryView)initWithLabelAccessoryType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)COSApplicationLabelAccessoryView;
  v4 = -[COSApplicationLabelAccessoryView initWithFrame:](&v10, "initWithFrame:", 0.0, 0.0, 8.0, 8.0);
  v5 = v4;
  if (v4)
  {
    v6 = [(COSApplicationLabelAccessoryView *)v4 layer];
    [v6 setAllowsGroupBlending:0];

    if (a3)
    {
      if (a3 == 1)
      {
        if (qword_10029AFB0 != -1) {
          dispatch_once(&qword_10029AFB0, &stru_1002442B8);
        }
        id v7 = objc_alloc((Class)UIImageView);
        id v8 = [v7 initWithImage:qword_10029AFA8];
        [v8 setFrame:CGRectMake(0.0, 0.0, 8.0, 8.0)];
      }
      else
      {
        id v8 = 0;
      }
      [(COSApplicationLabelAccessoryView *)v5 addSubview:v8];
    }
  }
  return v5;
}

- (COSApplicationLabelAccessoryView)initWithFrame:(CGRect)a3
{
  return -[COSApplicationLabelAccessoryView initWithLabelAccessoryType:](self, "initWithLabelAccessoryType:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (COSApplicationLabelAccessoryView)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"This class does not support unarchiving from a nib" userInfo:0];
  objc_exception_throw(v4);
}

@end