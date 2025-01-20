@interface VSTwoFactorEntryButton
- (NSString)text;
- (NSString)type;
- (VSTwoFactorEntryButton)init;
- (void)setText:(id)a3;
- (void)setType:(id)a3;
@end

@implementation VSTwoFactorEntryButton

- (VSTwoFactorEntryButton)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSTwoFactorEntryButton;
  v2 = [(VSTwoFactorEntryButton *)&v6 init];
  v3 = v2;
  if (v2)
  {
    text = v2->_text;
    v2->_text = (NSString *)&stru_26F361E90;

    objc_storeStrong((id *)&v3->_type, @"default");
  }
  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end