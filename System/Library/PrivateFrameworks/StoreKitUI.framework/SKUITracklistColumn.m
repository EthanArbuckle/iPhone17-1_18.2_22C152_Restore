@interface SKUITracklistColumn
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
- (void)description;
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

@implementation SKUITracklistColumn

- (void)setPreferredWidthForAttributedStrings:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUITracklistColumn setPreferredWidthForAttributedStrings:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v14)
  {

    id v16 = 0;
LABEL_19:
    float v23 = 0.0;
    goto LABEL_20;
  }
  uint64_t v15 = v14;
  id v16 = 0;
  uint64_t v17 = *(void *)v25;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v25 != v17) {
        objc_enumerationMutation(v13);
      }
      v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      if (v16)
      {
        unint64_t v20 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "length", (void)v24);
        if (v20 > [v16 length])
        {
          id v21 = v19;

          id v16 = v21;
        }
      }
      else
      {
        id v16 = v19;
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v15);

  if (!v16) {
    goto LABEL_19;
  }
  [v16 size];
  float v23 = v22;
LABEL_20:
  -[SKUITracklistColumn setPreferredWidth:](self, "setPreferredWidth:", ceilf(v23), (void)v24);
}

- (id)description
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUITracklistColumn *)v3 description];
      }
    }
  }
  uint64_t v11 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)SKUITracklistColumn;
  uint64_t v12 = [(SKUITracklistColumn *)&v15 description];
  id v13 = [v11 stringWithFormat:@"%@: [ID: %ld, Width: %.2f]", v12, self->_columnIdentifier, *(void *)&self->_width];

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUITracklistColumn copyWithZone:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v13 setColumnIdentifier:self->_columnIdentifier];
  [v13 setContentAlignment:self->_contentAlignment];
  [v13 setHeaderAlignment:self->_headerAlignment];
  [v13 setMaximumWidthFraction:self->_maximumWidthFraction];
  [v13 setPreferredWidth:self->_preferredWidth];
  [v13 setShowsPreviewControl:self->_showsPreviewControl];
  [v13 setSizesToFit:self->_sizesToFit];
  [v13 setWidth:self->_width];
  return v13;
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

- (void)setPreferredWidthForAttributedStrings:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)description
{
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end