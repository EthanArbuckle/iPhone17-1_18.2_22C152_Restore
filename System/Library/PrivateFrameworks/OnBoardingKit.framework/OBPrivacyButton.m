@interface OBPrivacyButton
+ (id)buttonWithType:(int64_t)a3;
- (BOOL)underlineLinks;
- (void)setUnderlineLinks:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation OBPrivacyButton

+ (id)buttonWithType:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___OBPrivacyButton;
  v3 = objc_msgSendSuper2(&v5, sel_buttonWithType_, a3);
  return v3;
}

- (void)tintColorDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)OBPrivacyButton;
  [(OBPrivacyButton *)&v10 tintColorDidChange];
  BOOL v3 = [(OBPrivacyButton *)self underlineLinks];
  v4 = [(OBPrivacyButton *)self titleLabel];
  objc_super v5 = [v4 attributedText];
  v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = *MEMORY[0x1E4FB0808];
  uint64_t v8 = [v6 length];
  if (v3) {
    objc_msgSend(v6, "addAttribute:value:range:", v7, &unk_1EEC37910, 0, v8);
  }
  else {
    objc_msgSend(v6, "removeAttribute:range:", v7, 0, v8);
  }
  v9 = [(OBPrivacyButton *)self titleLabel];
  [v9 setAttributedText:v6];
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

@end