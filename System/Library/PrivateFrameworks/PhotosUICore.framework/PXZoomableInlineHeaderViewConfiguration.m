@interface PXZoomableInlineHeaderViewConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)swapTitleAndSubtitle;
- (NSString)subtitle;
- (NSString)title;
- (PXZoomableInlineHeaderViewConfiguration)init;
- (PXZoomableInlineHeaderViewConfiguration)initWithTitle:(id)a3 subtitle:(id)a4 swapTitleAndSubtitle:(BOOL)a5 style:(unint64_t)a6;
- (unint64_t)hash;
- (unint64_t)style;
@end

@implementation PXZoomableInlineHeaderViewConfiguration

- (PXZoomableInlineHeaderViewConfiguration)initWithTitle:(id)a3 subtitle:(id)a4 swapTitleAndSubtitle:(BOOL)a5 style:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXZoomableInlineHeaderViewConfiguration;
  v13 = [(PXZoomableInlineHeaderViewConfiguration *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_title, a3);
    objc_storeStrong((id *)&v14->_subtitle, a4);
    v14->_swapTitleAndSubtitle = a5;
    v14->_style = a6;
  }

  return v14;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (BOOL)swapTitleAndSubtitle
{
  return self->_swapTitleAndSubtitle;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PXZoomableInlineHeaderViewConfiguration *)self style];
  v4 = [(PXZoomableInlineHeaderViewConfiguration *)self title];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [(PXZoomableInlineHeaderViewConfiguration *)self subtitle];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXZoomableInlineHeaderViewConfiguration *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(PXZoomableInlineHeaderViewConfiguration *)v5 style];
      if (v6 == [(PXZoomableInlineHeaderViewConfiguration *)self style])
      {
        id v7 = [(PXZoomableInlineHeaderViewConfiguration *)self title];
        id v8 = [(PXZoomableInlineHeaderViewConfiguration *)v5 title];
        if (v7 == v8)
        {
        }
        else
        {
          v9 = v8;
          char v10 = [v7 isEqual:v8];

          if ((v10 & 1) == 0) {
            goto LABEL_6;
          }
        }
        id v12 = [(PXZoomableInlineHeaderViewConfiguration *)self subtitle];
        v13 = [(PXZoomableInlineHeaderViewConfiguration *)v5 subtitle];
        if (v12 == v13) {
          char v11 = 1;
        }
        else {
          char v11 = [v12 isEqual:v13];
        }

        goto LABEL_14;
      }
LABEL_6:
      char v11 = 0;
LABEL_14:

      goto LABEL_15;
    }
    char v11 = 0;
  }
LABEL_15:

  return v11;
}

- (PXZoomableInlineHeaderViewConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXZoomableInlineHeaderView.m", 70, @"%s is not available as initializer", "-[PXZoomableInlineHeaderViewConfiguration init]");

  abort();
}

@end