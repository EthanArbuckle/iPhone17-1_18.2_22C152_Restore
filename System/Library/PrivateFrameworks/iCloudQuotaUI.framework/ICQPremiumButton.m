@interface ICQPremiumButton
+ (id)buttonWithType:(int64_t)a3 link:(id)a4;
- (ICQLink)link;
- (void)setLink:(id)a3;
@end

@implementation ICQPremiumButton

+ (id)buttonWithType:(int64_t)a3 link:(id)a4
{
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___ICQPremiumButton;
  id v5 = a4;
  v6 = objc_msgSendSuper2(&v11, sel_buttonWithType_, a3);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v11.receiver, v11.super_class);
  v7 = [v6 titleLabel];
  v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v7 setFont:v8];

  v9 = [v6 titleLabel];
  [v9 setAdjustsFontForContentSizeCategory:1];

  [v6 setLink:v5];
  return v6;
}

- (void)setLink:(id)a3
{
  v6 = (ICQLink *)a3;
  if (self->_link != v6)
  {
    objc_storeStrong((id *)&self->_link, a3);
    id v5 = [(ICQLink *)v6 text];
    [(ICQPremiumButton *)self setTitle:v5 forState:0];
  }
}

- (ICQLink)link
{
  return self->_link;
}

- (void).cxx_destruct
{
}

@end