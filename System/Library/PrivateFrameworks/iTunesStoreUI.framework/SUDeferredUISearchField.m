@interface SUDeferredUISearchField
- (BOOL)isDeferringInterfaceUpdates;
- (CGRect)frame;
- (float)paddingLeft;
- (float)paddingTop;
- (id)font;
- (id)placeholder;
- (id)text;
- (int64_t)clearButtonMode;
- (void)_commitDeferredInterfaceUpdates;
- (void)_saveCurrentStateAsDeferred;
- (void)dealloc;
- (void)setClearButtonMode:(int64_t)a3;
- (void)setDeferringInterfaceUpdates:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPaddingTop:(float)a3 paddingLeft:(float)a4;
- (void)setPlaceholder:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SUDeferredUISearchField

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUDeferredUISearchField;
  [(SUDeferredUISearchField *)&v3 dealloc];
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
      [(SUDeferredUISearchField *)self _saveCurrentStateAsDeferred];
    }
    self->_isDeferringInterfaceUpdates = a3;
    if (!a3)
    {
      [(SUDeferredUISearchField *)self _commitDeferredInterfaceUpdates];
    }
  }
}

- (int64_t)clearButtonMode
{
  if ([(SUDeferredUISearchField *)self isDeferringInterfaceUpdates]) {
    return self->_deferredClearButtonMode;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISearchField;
  return [(SUDeferredUISearchField *)&v4 clearButtonMode];
}

- (id)font
{
  if ([(SUDeferredUISearchField *)self isDeferringInterfaceUpdates]) {
    return self->_deferredFont;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISearchField;
  return [(SUDeferredUISearchField *)&v4 font];
}

- (CGRect)frame
{
  if ([(SUDeferredUISearchField *)self isDeferringInterfaceUpdates])
  {
    double x = self->_deferredFrame.origin.x;
    double y = self->_deferredFrame.origin.y;
    double width = self->_deferredFrame.size.width;
    double height = self->_deferredFrame.size.height;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISearchField;
    [(SUDeferredUISearchField *)&v7 frame];
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)paddingLeft
{
  if ([(SUDeferredUISearchField *)self isDeferringInterfaceUpdates]) {
    return self->_deferredPaddingLeft;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISearchField;
  [(SUDeferredUISearchField *)&v4 paddingLeft];
  return result;
}

- (float)paddingTop
{
  if ([(SUDeferredUISearchField *)self isDeferringInterfaceUpdates]) {
    return self->_deferredPaddingTop;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISearchField;
  [(SUDeferredUISearchField *)&v4 paddingTop];
  return result;
}

- (id)placeholder
{
  if ([(SUDeferredUISearchField *)self isDeferringInterfaceUpdates]) {
    return self->_deferredPlaceholder;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISearchField;
  return [(SUDeferredUISearchField *)&v4 placeholder];
}

- (void)setClearButtonMode:(int64_t)a3
{
  if ([(SUDeferredUISearchField *)self isDeferringInterfaceUpdates])
  {
    self->_deferredClearButtonMode = a3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUDeferredUISearchField;
    [(SUDeferredUISearchField *)&v5 setClearButtonMode:a3];
  }
}

- (void)setFont:(id)a3
{
  if ([(SUDeferredUISearchField *)self isDeferringInterfaceUpdates])
  {
    id deferredFont = self->_deferredFont;
    if (deferredFont != a3)
    {

      if (a3) {
        id v6 = a3;
      }
      else {
        id v6 = (id)[MEMORY[0x263EFF9D0] null];
      }
      self->_id deferredFont = v6;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISearchField;
    [(SUDeferredUISearchField *)&v7 setFont:a3];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(SUDeferredUISearchField *)self isDeferringInterfaceUpdates])
  {
    self->_deferredFrame.origin.double x = x;
    self->_deferredFrame.origin.double y = y;
    self->_deferredFrame.size.double width = width;
    self->_deferredFrame.size.double height = height;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUDeferredUISearchField;
    -[SUDeferredUISearchField setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (void)setPaddingTop:(float)a3 paddingLeft:(float)a4
{
  if ([(SUDeferredUISearchField *)self isDeferringInterfaceUpdates])
  {
    self->_deferredPaddingLeft = a4;
    self->_deferredPaddingTop = a3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SUDeferredUISearchField;
    *(float *)&double v7 = a3;
    *(float *)&double v8 = a4;
    [(UISearchField *)&v9 setPaddingTop:v7 paddingLeft:v8];
  }
}

- (void)setPlaceholder:(id)a3
{
  if ([(SUDeferredUISearchField *)self isDeferringInterfaceUpdates])
  {
    deferredPlaceholder = self->_deferredPlaceholder;
    if (deferredPlaceholder != a3)
    {

      if (a3) {
        id v6 = (NSString *)[a3 copy];
      }
      else {
        id v6 = (NSString *)(id)[MEMORY[0x263EFF9D0] null];
      }
      self->_deferredPlaceholder = v6;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISearchField;
    [(SUDeferredUISearchField *)&v7 setPlaceholder:a3];
  }
}

- (void)setText:(id)a3
{
  if ([(SUDeferredUISearchField *)self isDeferringInterfaceUpdates])
  {
    deferredText = self->_deferredText;
    if (deferredText != a3)
    {

      if (a3) {
        id v6 = (NSString *)[a3 copy];
      }
      else {
        id v6 = (NSString *)(id)[MEMORY[0x263EFF9D0] null];
      }
      self->_deferredText = v6;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISearchField;
    [(SUDeferredUISearchField *)&v7 setText:a3];
  }
}

- (id)text
{
  if ([(SUDeferredUISearchField *)self isDeferringInterfaceUpdates]) {
    return self->_deferredText;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISearchField;
  return [(SUDeferredUISearchField *)&v4 text];
}

- (void)_commitDeferredInterfaceUpdates
{
  [(SUDeferredUISearchField *)self setClearButtonMode:self->_deferredClearButtonMode];
  id deferredFont = self->_deferredFont;
  if (deferredFont == (id)[MEMORY[0x263EFF9D0] null]) {
    id v4 = 0;
  }
  else {
    id v4 = self->_deferredFont;
  }
  [(SUDeferredUISearchField *)self setFont:v4];
  -[SUDeferredUISearchField setFrame:](self, "setFrame:", self->_deferredFrame.origin.x, self->_deferredFrame.origin.y, self->_deferredFrame.size.width, self->_deferredFrame.size.height);
  *(float *)&double v5 = self->_deferredPaddingTop;
  *(float *)&double v6 = self->_deferredPaddingLeft;
  [(SUDeferredUISearchField *)self setPaddingTop:v5 paddingLeft:v6];
  deferredPlaceholder = self->_deferredPlaceholder;
  if (deferredPlaceholder == (NSString *)[MEMORY[0x263EFF9D0] null]) {
    double v8 = 0;
  }
  else {
    double v8 = self->_deferredPlaceholder;
  }
  [(SUDeferredUISearchField *)self setPlaceholder:v8];
  deferredText = self->_deferredText;
  if (deferredText == (NSString *)[MEMORY[0x263EFF9D0] null]) {
    v10 = 0;
  }
  else {
    v10 = self->_deferredText;
  }

  [(SUDeferredUISearchField *)self setText:v10];
}

- (void)_saveCurrentStateAsDeferred
{
  self->_deferredClearButtonMode = [(SUDeferredUISearchField *)self clearButtonMode];
  [(SUDeferredUISearchField *)self frame];
  self->_deferredFrame.origin.double x = v3;
  self->_deferredFrame.origin.double y = v4;
  self->_deferredFrame.size.double width = v5;
  self->_deferredFrame.size.double height = v6;
  [(SUDeferredUISearchField *)self paddingLeft];
  self->_deferredPaddingLeft = v7;
  [(SUDeferredUISearchField *)self paddingTop];
  self->_deferredPaddingTop = v8;

  self->_id deferredFont = [(SUDeferredUISearchField *)self font];
  self->_deferredPlaceholder = (NSString *)[(SUDeferredUISearchField *)self placeholder];

  self->_deferredText = (NSString *)[(SUDeferredUISearchField *)self text];
}

@end