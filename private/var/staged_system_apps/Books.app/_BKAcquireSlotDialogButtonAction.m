@interface _BKAcquireSlotDialogButtonAction
+ (id)actionButtonWithTitle:(id)a3;
- (NSString)buyParams;
- (NSString)title;
- (int64_t)style;
- (void)setBuyParams:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation _BKAcquireSlotDialogButtonAction

+ (id)actionButtonWithTitle:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setTitle:v3];

  return v4;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buyParams, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end