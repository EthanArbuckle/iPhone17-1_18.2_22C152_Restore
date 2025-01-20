@interface SUDeferredUIButton
- (BOOL)isDeferringInterfaceUpdates;
- (BOOL)isEnabled;
- (CGRect)frame;
- (id)imageForState:(unint64_t)a3;
- (id)titleForState:(unint64_t)a3;
- (void)_commitDeferredInterfaceUpdates;
- (void)_saveCurrentStateAsDeferred;
- (void)_saveImagesAsDeferred;
- (void)_saveTitlesAsDeferred;
- (void)dealloc;
- (void)setDeferringInterfaceUpdates:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
@end

@implementation SUDeferredUIButton

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUDeferredUIButton;
  [(SUDeferredUIButton *)&v3 dealloc];
}

- (BOOL)isDeferringInterfaceUpdates
{
  return self->_isDeferringInterfaceUpdates;
}

- (void)setDeferringInterfaceUpdates:(BOOL)a3
{
  if (self->_isDeferringInterfaceUpdates != a3)
  {
    if (!self->_isDeferringInterfaceUpdates) {
      [(SUDeferredUIButton *)self _saveCurrentStateAsDeferred];
    }
    self->_isDeferringInterfaceUpdates = a3;
    if (!a3)
    {
      [(SUDeferredUIButton *)self _commitDeferredInterfaceUpdates];
    }
  }
}

- (CGRect)frame
{
  if ([(SUDeferredUIButton *)self isDeferringInterfaceUpdates])
  {
    double x = self->_deferredFrame.origin.x;
    double y = self->_deferredFrame.origin.y;
    double width = self->_deferredFrame.size.width;
    double height = self->_deferredFrame.size.height;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUIButton;
    [(SUDeferredUIButton *)&v7 frame];
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isEnabled
{
  if ([(SUDeferredUIButton *)self isDeferringInterfaceUpdates]) {
    return self->_deferredEnabled;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUIButton;
  return [(SUDeferredUIButton *)&v4 isEnabled];
}

- (id)imageForState:(unint64_t)a3
{
  if ([(SUDeferredUIButton *)self isDeferringInterfaceUpdates])
  {
    id v5 = (id)-[NSMutableDictionary objectForKey:](self->_deferredImages, "objectForKey:", [NSNumber numberWithInteger:a3]);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUDeferredUIButton;
    id v5 = [(SUDeferredUIButton *)&v8 imageForState:a3];
  }
  v6 = v5;
  if (v5 == (id)[MEMORY[0x263EFF9D0] null]) {
    return 0;
  }
  else {
    return v6;
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUDeferredUIButton *)self isDeferringInterfaceUpdates])
  {
    self->_deferredEnabled = v3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUDeferredUIButton;
    [(SUDeferredUIButton *)&v5 setEnabled:v3];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(SUDeferredUIButton *)self isDeferringInterfaceUpdates])
  {
    self->_deferredFrame.origin.double x = x;
    self->_deferredFrame.origin.double y = y;
    self->_deferredFrame.size.double width = width;
    self->_deferredFrame.size.double height = height;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUDeferredUIButton;
    -[SUDeferredUIButton setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  if (![(SUDeferredUIButton *)self isDeferringInterfaceUpdates])
  {
    v9.receiver = self;
    v9.super_class = (Class)SUDeferredUIButton;
    [(SUDeferredUIButton *)&v9 setImage:a3 forState:a4];
    return;
  }
  deferredImages = self->_deferredImages;
  if (!deferredImages)
  {
    deferredImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->_deferredImages = deferredImages;
    if (a3) {
      goto LABEL_4;
    }
LABEL_9:
    a3 = (id)[MEMORY[0x263EFF9D0] null];
    goto LABEL_4;
  }
  if (!a3) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v8 = [NSNumber numberWithInteger:a4];

  [(NSMutableDictionary *)deferredImages setObject:a3 forKey:v8];
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  if (![(SUDeferredUIButton *)self isDeferringInterfaceUpdates])
  {
    v9.receiver = self;
    v9.super_class = (Class)SUDeferredUIButton;
    [(SUDeferredUIButton *)&v9 setTitle:a3 forState:a4];
    return;
  }
  deferredTitles = self->_deferredTitles;
  if (!deferredTitles)
  {
    deferredTitles = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->_deferredTitles = deferredTitles;
    if (a3) {
      goto LABEL_4;
    }
LABEL_9:
    a3 = (id)[MEMORY[0x263EFF9D0] null];
    goto LABEL_4;
  }
  if (!a3) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v8 = [NSNumber numberWithInteger:a4];

  [(NSMutableDictionary *)deferredTitles setObject:a3 forKey:v8];
}

- (id)titleForState:(unint64_t)a3
{
  if ([(SUDeferredUIButton *)self isDeferringInterfaceUpdates])
  {
    id v5 = (id)-[NSMutableDictionary objectForKey:](self->_deferredTitles, "objectForKey:", [NSNumber numberWithInteger:a3]);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUDeferredUIButton;
    id v5 = [(SUDeferredUIButton *)&v8 titleForState:a3];
  }
  v6 = v5;
  if (v5 == (id)[MEMORY[0x263EFF9D0] null]) {
    return 0;
  }
  else {
    return v6;
  }
}

- (void)_commitDeferredInterfaceUpdates
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(SUDeferredUIButton *)self setEnabled:self->_deferredEnabled];
  -[SUDeferredUIButton setFrame:](self, "setFrame:", self->_deferredFrame.origin.x, self->_deferredFrame.origin.y, self->_deferredFrame.size.width, self->_deferredFrame.size.height);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  deferredImages = self->_deferredImages;
  uint64_t v4 = [(NSMutableDictionary *)deferredImages countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(deferredImages);
        }
        objc_super v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v9 = [(NSMutableDictionary *)self->_deferredImages objectForKey:v8];
        if (v9 == [MEMORY[0x263EFF9D0] null]) {
          uint64_t v9 = 0;
        }
        -[SUDeferredUIButton setImage:forState:](self, "setImage:forState:", v9, [v8 integerValue]);
      }
      uint64_t v5 = [(NSMutableDictionary *)deferredImages countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  self->_deferredImages = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  deferredTitles = self->_deferredTitles;
  uint64_t v11 = [(NSMutableDictionary *)deferredTitles countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(deferredTitles);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * j);
        uint64_t v16 = [(NSMutableDictionary *)self->_deferredTitles objectForKey:v15];
        if (v16 == [MEMORY[0x263EFF9D0] null]) {
          uint64_t v16 = 0;
        }
        -[SUDeferredUIButton setTitle:forState:](self, "setTitle:forState:", v16, [v15 integerValue]);
      }
      uint64_t v12 = [(NSMutableDictionary *)deferredTitles countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  self->_deferredTitles = 0;
}

- (void)_saveCurrentStateAsDeferred
{
  self->_deferredEnabled = [(SUDeferredUIButton *)self isEnabled];
  [(SUDeferredUIButton *)self frame];
  self->_deferredFrame.origin.double x = v3;
  self->_deferredFrame.origin.double y = v4;
  self->_deferredFrame.size.double width = v5;
  self->_deferredFrame.size.double height = v6;
  [(SUDeferredUIButton *)self _saveImagesAsDeferred];

  [(SUDeferredUIButton *)self _saveTitlesAsDeferred];
}

- (void)_saveImagesAsDeferred
{
  deferredImages = self->_deferredImages;
  if (!deferredImages)
  {
    deferredImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->_deferredImages = deferredImages;
  }
  [(NSMutableDictionary *)deferredImages removeAllObjects];
  id v4 = [(SUDeferredUIButton *)self imageForState:0];
  if (v4) {
    -[NSMutableDictionary setObject:forKey:](self->_deferredImages, "setObject:forKey:", v4, [NSNumber numberWithInteger:0]);
  }
  id v5 = [(SUDeferredUIButton *)self imageForState:1];
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](self->_deferredImages, "setObject:forKey:", v5, [NSNumber numberWithInteger:1]);
  }
  id v6 = [(SUDeferredUIButton *)self imageForState:2];
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](self->_deferredImages, "setObject:forKey:", v6, [NSNumber numberWithInteger:2]);
  }
  id v7 = [(SUDeferredUIButton *)self imageForState:4];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = self->_deferredImages;
    uint64_t v10 = [NSNumber numberWithInteger:4];
    [(NSMutableDictionary *)v9 setObject:v8 forKey:v10];
  }
}

- (void)_saveTitlesAsDeferred
{
  deferredTitles = self->_deferredTitles;
  if (!deferredTitles)
  {
    deferredTitles = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->_deferredTitles = deferredTitles;
  }
  [(NSMutableDictionary *)deferredTitles removeAllObjects];
  id v4 = [(SUDeferredUIButton *)self titleForState:0];
  if (v4) {
    -[NSMutableDictionary setObject:forKey:](self->_deferredTitles, "setObject:forKey:", v4, [NSNumber numberWithInteger:0]);
  }
  id v5 = [(SUDeferredUIButton *)self titleForState:1];
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](self->_deferredTitles, "setObject:forKey:", v5, [NSNumber numberWithInteger:1]);
  }
  id v6 = [(SUDeferredUIButton *)self titleForState:2];
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](self->_deferredTitles, "setObject:forKey:", v6, [NSNumber numberWithInteger:2]);
  }
  id v7 = [(SUDeferredUIButton *)self titleForState:4];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = self->_deferredTitles;
    uint64_t v10 = [NSNumber numberWithInteger:4];
    [(NSMutableDictionary *)v9 setObject:v8 forKey:v10];
  }
}

@end