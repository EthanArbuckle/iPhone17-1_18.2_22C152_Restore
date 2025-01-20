@interface SUUITracklistColumn
- (BOOL)showsPreviewControl;
- (BOOL)sizesToFit;
- (double)maximumWidthFraction;
- (double)preferredWidth;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)columnIdentifier;
- (int64_t)contentAlignment;
- (int64_t)headerAlignment;
- (void)setColumnIdentifier:(int64_t)a3;
- (void)setContentAlignment:(int64_t)a3;
- (void)setHeaderAlignment:(int64_t)a3;
- (void)setMaximumWidthFraction:(double)a3;
- (void)setPreferredWidth:(double)a3;
- (void)setPreferredWidthForAttributedStrings:(id)a3;
- (void)setShowsPreviewControl:(BOOL)a3;
- (void)setSizesToFit:(BOOL)a3;
- (void)setWidth:(double)a3;
@end

@implementation SUUITracklistColumn

- (void)setPreferredWidthForAttributedStrings:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  float v6 = 0.0;
  if (v5)
  {
    uint64_t v7 = v5;
    id v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (v8)
        {
          unint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) length];
          if (v12 > [v8 length])
          {
            id v13 = v11;

            id v8 = v13;
          }
        }
        else
        {
          id v8 = v11;
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
    if (v8)
    {
      [v8 size];
      float v6 = v14;
    }
  }
  else
  {
    id v8 = 0;
  }
  [(SUUITracklistColumn *)self setPreferredWidth:ceilf(v6)];
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SUUITracklistColumn;
  id v4 = [(SUUITracklistColumn *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: [ID: %ld, Width: %.2f]", v4, self->_columnIdentifier, *(void *)&self->_width];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setColumnIdentifier:self->_columnIdentifier];
  [v4 setContentAlignment:self->_contentAlignment];
  [v4 setHeaderAlignment:self->_headerAlignment];
  [v4 setMaximumWidthFraction:self->_maximumWidthFraction];
  [v4 setPreferredWidth:self->_preferredWidth];
  [v4 setShowsPreviewControl:self->_showsPreviewControl];
  [v4 setSizesToFit:self->_sizesToFit];
  [v4 setWidth:self->_width];
  return v4;
}

- (int64_t)columnIdentifier
{
  return self->_columnIdentifier;
}

- (void)setColumnIdentifier:(int64_t)a3
{
  self->_columnIdentifier = a3;
}

- (int64_t)contentAlignment
{
  return self->_contentAlignment;
}

- (void)setContentAlignment:(int64_t)a3
{
  self->_contentAlignment = a3;
}

- (int64_t)headerAlignment
{
  return self->_headerAlignment;
}

- (void)setHeaderAlignment:(int64_t)a3
{
  self->_headerAlignment = a3;
}

- (double)maximumWidthFraction
{
  return self->_maximumWidthFraction;
}

- (void)setMaximumWidthFraction:(double)a3
{
  self->_maximumWidthFraction = a3;
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (BOOL)showsPreviewControl
{
  return self->_showsPreviewControl;
}

- (void)setShowsPreviewControl:(BOOL)a3
{
  self->_showsPreviewControl = a3;
}

- (BOOL)sizesToFit
{
  return self->_sizesToFit;
}

- (void)setSizesToFit:(BOOL)a3
{
  self->_sizesToFit = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

@end