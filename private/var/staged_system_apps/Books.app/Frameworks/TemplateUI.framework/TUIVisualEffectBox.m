@interface TUIVisualEffectBox
+ (unint64_t)blurEffectStyleFromString:(id)a3;
+ (unint64_t)defaultRole;
- (Class)layoutClass;
- (unint64_t)blurStyle;
- (void)setBlurStyle:(unint64_t)a3;
@end

@implementation TUIVisualEffectBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)defaultRole
{
  return 1;
}

+ (unint64_t)blurEffectStyleFromString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_2DF5C8 != -1)
  {
    dispatch_once(&qword_2DF5C8, &stru_254980);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(id)qword_2DF5C0 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

- (unint64_t)blurStyle
{
  return self->_blurStyle;
}

- (void)setBlurStyle:(unint64_t)a3
{
  self->_blurStyle = a3;
}

@end