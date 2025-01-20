@interface BFFLinkHandler
- (BFFLinkHandler)init;
- (UIButton)button;
- (id)handler;
- (void)buttonPressed:(id)a3;
- (void)setButton:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation BFFLinkHandler

- (BFFLinkHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)BFFLinkHandler;
  v2 = [(BFFLinkHandler *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F824E8] buttonWithType:1];
    button = v2->_button;
    v2->_button = (UIButton *)v3;

    v5 = [(UIButton *)v2->_button titleLabel];
    [v5 setAdjustsFontSizeToFitWidth:1];
    [v5 setTextAlignment:1];
    [v5 setNumberOfLines:0];
    [(UIButton *)v2->_button setExclusiveTouch:1];
    [(UIButton *)v2->_button addTarget:v2 action:sel_buttonPressed_ forControlEvents:64];
  }
  return v2;
}

- (void)buttonPressed:(id)a3
{
  v4 = [(BFFLinkHandler *)self handler];

  if (v4)
  {
    v5 = [(BFFLinkHandler *)self handler];
    v5[2]();
  }
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end