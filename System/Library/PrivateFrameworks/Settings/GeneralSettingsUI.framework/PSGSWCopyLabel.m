@interface PSGSWCopyLabel
- (PSGSWCopyLabel)initWithCoder:(id)a3;
- (PSGSWCopyLabel)initWithFrame:(CGRect)a3;
- (UIEditMenuInteraction)editMenuInteraction;
- (void)_commonInit;
- (void)copy:(id)a3;
- (void)didLongPress:(id)a3;
- (void)setEditMenuInteraction:(id)a3;
@end

@implementation PSGSWCopyLabel

- (PSGSWCopyLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSGSWCopyLabel;
  v3 = -[PSGSWCopyLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    -[PSGSWCopyLabel _commonInit](v3);
  }
  return v4;
}

- (void)_commonInit
{
  if (a1)
  {
    [a1 setUserInteractionEnabled:1];
    v2 = (void *)[objc_alloc(MEMORY[0x263F82718]) initWithDelegate:0];
    v3 = (void *)a1[100];
    a1[100] = v2;
    id v4 = v2;

    [a1 addInteraction:v4];
    id v5 = (id)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:a1 action:sel_didLongPress_];

    [v5 setAllowedTouchTypes:&unk_26F103D48];
    [a1 addGestureRecognizer:v5];
  }
}

- (PSGSWCopyLabel)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSGSWCopyLabel;
  v3 = [(PSGSWCopyLabel *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    -[PSGSWCopyLabel _commonInit](v3);
  }
  return v4;
}

- (void)didLongPress:(id)a3
{
  [a3 locationInView:self];
  objc_msgSend(MEMORY[0x263F82710], "configurationWithIdentifier:sourcePoint:", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIEditMenuInteraction *)self->_editMenuInteraction presentEditMenuWithConfiguration:v4];
}

- (void)copy:(id)a3
{
  id v4 = [(PSGSWCopyLabel *)self text];
  v3 = [MEMORY[0x263F82A18] generalPasteboard];
  [v3 setString:v4];
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->_editMenuInteraction;
}

- (void)setEditMenuInteraction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end