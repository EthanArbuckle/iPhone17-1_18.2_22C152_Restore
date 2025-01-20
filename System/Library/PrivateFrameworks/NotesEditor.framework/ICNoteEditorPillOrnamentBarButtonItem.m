@interface ICNoteEditorPillOrnamentBarButtonItem
- (BOOL)isUsedInPillOrnament;
- (UIButton)button;
- (UIToolTipInteraction)toolTipInteraction;
- (id)menu;
- (void)performButtonAction;
- (void)setAction:(SEL)a3;
- (void)setImage:(id)a3;
- (void)setMenu:(id)a3;
- (void)setTitle:(id)a3;
- (void)setToolTipInteraction:(id)a3;
- (void)setUsedInPillOrnament:(BOOL)a3;
@end

@implementation ICNoteEditorPillOrnamentBarButtonItem

- (id)menu
{
  if ([(ICNoteEditorPillOrnamentBarButtonItem *)self isUsedInPillOrnament])
  {
    v3 = [(ICNoteEditorPillOrnamentBarButtonItem *)self button];
    v4 = [v3 menu];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
    v4 = [(ICNoteEditorPillOrnamentBarButtonItem *)&v6 menu];
  }

  return v4;
}

- (void)setAction:(SEL)a3
{
  if ([(ICNoteEditorPillOrnamentBarButtonItem *)self isUsedInPillOrnament])
  {
    if ([(ICNoteEditorPillOrnamentBarButtonItem *)self action])
    {
      v5 = [(ICNoteEditorPillOrnamentBarButtonItem *)self button];
      v11.receiver = self;
      v11.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      objc_super v6 = [(ICNoteEditorPillOrnamentBarButtonItem *)&v11 target];
      v10.receiver = self;
      v10.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      objc_msgSend(v5, "removeTarget:action:forControlEvents:", v6, -[ICNoteEditorPillOrnamentBarButtonItem action](&v10, sel_action), 0x2000);
    }
    if (a3)
    {
      v7 = [(ICNoteEditorPillOrnamentBarButtonItem *)self button];
      [v7 addTarget:self action:sel_performButtonAction forControlEvents:0x2000];
    }
    v9 = self;
    v8 = (objc_super *)&v9;
  }
  else
  {
    v12.receiver = self;
    v8 = &v12;
  }
  v8->super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
  -[objc_super setAction:](v8, sel_setAction_, a3, v9);
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
  [(ICNoteEditorPillOrnamentBarButtonItem *)&v8 setImage:v4];
  if ([(ICNoteEditorPillOrnamentBarButtonItem *)self isUsedInPillOrnament])
  {
    v5 = [(ICNoteEditorPillOrnamentBarButtonItem *)self button];
    objc_super v6 = [v5 configuration];

    [v6 setImage:v4];
    v7 = [(ICNoteEditorPillOrnamentBarButtonItem *)self button];
    [v7 setConfiguration:v6];
  }
}

- (void)setMenu:(id)a3
{
  id v4 = a3;
  if ([(ICNoteEditorPillOrnamentBarButtonItem *)self isUsedInPillOrnament])
  {
    v5 = [(ICNoteEditorPillOrnamentBarButtonItem *)self button];
    [v5 setMenu:v4];

    objc_super v6 = [(ICNoteEditorPillOrnamentBarButtonItem *)self button];
    [v6 setShowsMenuAsPrimaryAction:v4 != 0];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
    [(ICNoteEditorPillOrnamentBarButtonItem *)&v7 setMenu:v4];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
  [(ICNoteEditorPillOrnamentBarButtonItem *)&v12 setTitle:v4];
  if ([(ICNoteEditorPillOrnamentBarButtonItem *)self isUsedInPillOrnament]
    && [v4 length])
  {
    v5 = [(ICNoteEditorPillOrnamentBarButtonItem *)self toolTipInteraction];

    if (v5)
    {
      objc_super v6 = [(ICNoteEditorPillOrnamentBarButtonItem *)self toolTipInteraction];
      [v6 setDefaultToolTip:v4];
    }
    else
    {
      v9 = (void *)[objc_alloc(MEMORY[0x263F82D68]) initWithDefaultToolTip:v4];
      [(ICNoteEditorPillOrnamentBarButtonItem *)self setToolTipInteraction:v9];

      objc_super v10 = [(ICNoteEditorPillOrnamentBarButtonItem *)self button];
      objc_super v11 = [(ICNoteEditorPillOrnamentBarButtonItem *)self toolTipInteraction];
      [v10 addInteraction:v11];
    }
  }
  else
  {
    objc_super v7 = [(ICNoteEditorPillOrnamentBarButtonItem *)self button];
    objc_super v8 = [(ICNoteEditorPillOrnamentBarButtonItem *)self toolTipInteraction];
    [v7 removeInteraction:v8];

    [(ICNoteEditorPillOrnamentBarButtonItem *)self setToolTipInteraction:0];
  }
}

- (UIToolTipInteraction)toolTipInteraction
{
  return self->_toolTipInteraction;
}

- (void)setToolTipInteraction:(id)a3
{
}

- (UIButton)button
{
  if ([(ICNoteEditorPillOrnamentBarButtonItem *)self isUsedInPillOrnament])
  {
    objc_opt_class();
    v6.receiver = self;
    v6.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
    v3 = [(ICNoteEditorPillOrnamentBarButtonItem *)&v6 customView];
    id v4 = ICDynamicCast();
  }
  else
  {
    id v4 = 0;
  }

  return (UIButton *)v4;
}

- (BOOL)isUsedInPillOrnament
{
  return self->_usedInPillOrnament;
}

- (void)setUsedInPillOrnament:(BOOL)a3
{
  if (self->_usedInPillOrnament != a3)
  {
    self->_usedInPillOrnament = a3;
    if (a3)
    {
      id v4 = [MEMORY[0x263F824F0] borderlessButtonConfiguration];
      v5 = [MEMORY[0x263F825C8] labelColor];
      [v4 setBaseForegroundColor:v5];

      v22.receiver = self;
      v22.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      objc_super v6 = [(ICNoteEditorPillOrnamentBarButtonItem *)&v22 image];
      [v4 setImage:v6];

      objc_super v7 = [MEMORY[0x263F824E8] buttonWithConfiguration:v4 primaryAction:0];
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v7 addTarget:self action:sel_performButtonAction forControlEvents:0x2000];
      v21.receiver = self;
      v21.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      objc_super v8 = [(ICNoteEditorPillOrnamentBarButtonItem *)&v21 menu];
      [v7 setMenu:v8];

      v20.receiver = self;
      v20.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      v9 = [(ICNoteEditorPillOrnamentBarButtonItem *)&v20 menu];
      [v7 setShowsMenuAsPrimaryAction:v9 != 0];

      objc_super v10 = [(ICNoteEditorPillOrnamentBarButtonItem *)self title];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        id v12 = objc_alloc(MEMORY[0x263F82D68]);
        v13 = [(ICNoteEditorPillOrnamentBarButtonItem *)self title];
        v14 = (void *)[v12 initWithDefaultToolTip:v13];
        [(ICNoteEditorPillOrnamentBarButtonItem *)self setToolTipInteraction:v14];

        v15 = [(ICNoteEditorPillOrnamentBarButtonItem *)self toolTipInteraction];
        [v7 addInteraction:v15];
      }
      v19.receiver = self;
      v19.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      [(ICNoteEditorPillOrnamentBarButtonItem *)&v19 setCustomView:v7];
    }
    else
    {
      v16 = [(ICNoteEditorPillOrnamentBarButtonItem *)self button];
      v17 = [(ICNoteEditorPillOrnamentBarButtonItem *)self toolTipInteraction];
      [v16 removeInteraction:v17];

      [(ICNoteEditorPillOrnamentBarButtonItem *)self setToolTipInteraction:0];
      v18.receiver = self;
      v18.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      [(ICNoteEditorPillOrnamentBarButtonItem *)&v18 setCustomView:0];
    }
  }
}

- (void)performButtonAction
{
  v17.receiver = self;
  v17.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
  v3 = [(ICNoteEditorPillOrnamentBarButtonItem *)&v17 target];
  id v4 = ICProtocolCast();

  if (v4)
  {
    v5 = [v4 presentingViewController];
    objc_super v6 = objc_msgSend(v5, "ic_window");

    [v6 makeKeyWindow];
  }
  v16.receiver = self;
  v16.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
  id v7 = [(ICNoteEditorPillOrnamentBarButtonItem *)&v16 action];
  if (v7)
  {
    id v8 = v7;
    v15.receiver = self;
    v15.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
    v9 = [(ICNoteEditorPillOrnamentBarButtonItem *)&v15 target];
    objc_super v10 = (void (*)(void *, id, ICNoteEditorPillOrnamentBarButtonItem *))[v9 methodForSelector:v8];

    if (v10)
    {
      v14.receiver = self;
      v14.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      uint64_t v11 = [(ICNoteEditorPillOrnamentBarButtonItem *)&v14 target];
      v13.receiver = self;
      v13.super_class = (Class)ICNoteEditorPillOrnamentBarButtonItem;
      id v12 = [(ICNoteEditorPillOrnamentBarButtonItem *)&v13 action];
      v10(v11, v12, self);
    }
  }
}

- (void).cxx_destruct
{
}

@end