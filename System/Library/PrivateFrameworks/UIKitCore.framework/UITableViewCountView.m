@interface UITableViewCountView
- (UITableViewCountView)initWithFrame:(CGRect)a3 withCountString:(id)a4 withCount:(int64_t)a5;
- (int64_t)count;
- (void)setCount:(int64_t)a3;
- (void)setCountString:(id)a3 withCount:(int64_t)a4;
@end

@implementation UITableViewCountView

- (UITableViewCountView)initWithFrame:(CGRect)a3 withCountString:(id)a4 withCount:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UITableViewCountView;
  v12 = -[UILabel initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    v13 = +[UIColor grayColor];
    [(UILabel *)v12 setTextColor:v13];

    v14 = [off_1E52D39B8 systemFontOfSize:20.0];
    [(UILabel *)v12 setFont:v14];

    [(UILabel *)v12 setUserInteractionEnabled:0];
    [(UILabel *)v12 setTextAlignment:1];
    [(UIView *)v12 setBackgroundColor:0];
    [(UITableViewCountView *)v12 setCountString:v11 withCount:a5];
  }

  return v12;
}

- (void)setCountString:(id)a3 withCount:(int64_t)a4
{
  v6 = (NSString *)[a3 copy];
  countString = self->_countString;
  self->_countString = v6;

  [(UITableViewCountView *)self setCount:a4];
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
  double v4 = 0.0;
  if (a3 > 19) {
    double v4 = 1.0;
  }
  [(UIView *)self setAlpha:v4];
  countString = self->_countString;
  id v26 = 0;
  v6 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", countString, @"%d", &v26, self->_count);
  id v7 = v26;
  v8 = v7;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (!v9)
  {
    v10 = self->_countString;
    id v25 = v7;
    v6 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, @"%u", &v25, self->_count);
    id v11 = v25;

    v8 = v11;
  }
  if (v6) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v8 == 0;
  }
  if (!v12)
  {
    v13 = self->_countString;
    id v24 = v8;
    v6 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, @"%ld", &v24, self->_count);
    id v14 = v24;

    v8 = v14;
  }
  if (v6) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v8 == 0;
  }
  if (!v15)
  {
    objc_super v16 = self->_countString;
    id v23 = v8;
    v6 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, @"%lu", &v23, self->_count);
    id v17 = v23;

    v8 = v17;
  }
  if (v6) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = v8 == 0;
  }
  if (!v18)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v21 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "Unrecognized format string presented to setCountString:. The count label will not be updated.", buf, 2u);
      }
    }
    else
    {
      v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setCount____s_category) + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Unrecognized format string presented to setCountString:. The count label will not be updated.", buf, 2u);
      }
    }
  }
  [(UILabel *)self setText:v6];
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
}

@end