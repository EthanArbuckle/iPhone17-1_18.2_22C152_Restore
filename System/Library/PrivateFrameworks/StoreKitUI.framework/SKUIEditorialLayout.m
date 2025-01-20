@interface SKUIEditorialLayout
- (SKUIEditorialComponent)editorialComponent;
- (SKUIEditorialLayout)initWithEditorial:(id)a3 layoutCache:(id)a4;
- (SKUILayoutCache)layoutCache;
- (double)layoutHeightForOrientation:(int64_t)a3 expanded:(BOOL)a4;
- (id)_bodyTextLayoutRequestWithTotalWidth:(double)a3;
- (id)_linkLayoutRequestWithTotalWidth:(double)a3;
- (id)_titleTextLayoutRequestWithTotalWidth:(double)a3;
- (id)bodyTextLayoutForOrientation:(int64_t)a3;
- (id)linkLayoutForOrientation:(int64_t)a3;
- (id)titleTextLayoutForOrientation:(int64_t)a3;
- (void)enqueueLayoutRequests;
- (void)setLayoutWidth:(double)a3 forOrientation:(int64_t)a4;
@end

@implementation SKUIEditorialLayout

- (SKUIEditorialLayout)initWithEditorial:(id)a3 layoutCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIEditorialLayout initWithEditorial:layoutCache:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIEditorialLayout;
  v9 = [(SKUIEditorialLayout *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_editorial, a3);
    objc_storeStrong((id *)&v10->_textLayoutCache, a4);
    int64x2_t v11 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&v10->_landscapeLinkLayoutIndex = v11;
    v10->_landscapeTitleLayoutIndex = 0x7FFFFFFFFFFFFFFFLL;
    *(int64x2_t *)&v10->_portraitLinkLayoutIndex = v11;
    v10->_portraitTitleLayoutIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)bodyTextLayoutForOrientation:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
LABEL_6:
      v4 = 0;
      goto LABEL_8;
    }
    int64_t landscapeTextLayoutIndex = self->_landscapeTextLayoutIndex;
  }
  else
  {
    int64_t landscapeTextLayoutIndex = self->_portraitTextLayoutIndex;
  }
  if (landscapeTextLayoutIndex == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_6;
  }
  v4 = [(SKUILayoutCache *)self->_textLayoutCache layoutForIndex:"layoutForIndex:"];
LABEL_8:

  return v4;
}

- (double)layoutHeightForOrientation:(int64_t)a3 expanded:(BOOL)a4
{
  uint64_t v7 = [(SKUIEditorialLayout *)self bodyTextLayoutForOrientation:"bodyTextLayoutForOrientation:"];
  id v8 = [(SKUIEditorialLayout *)self linkLayoutForOrientation:a3];
  uint64_t v9 = [(SKUIEditorialLayout *)self titleTextLayoutForOrientation:a3];
  uint64_t v10 = v9;
  if (!v7 && !v8 && !v9)
  {
    double v11 = 80.0;
    goto LABEL_18;
  }
  float v21 = 0.0;
  long long v19 = 0u;
  uint64_t v20 = 0;
  editorial = self->_editorial;
  if (editorial) {
    [(SKUIEditorialComponent *)editorial editorialStyle];
  }
  if (v7)
  {
    if (a4 || ![(id)v7 requiresTruncation]) {
      objc_msgSend((id)v7, "textSize", v19, v20);
    }
    else {
      [(id)v7 truncatedSize];
    }
    double v11 = v13;
    if (v10) {
      goto LABEL_13;
    }
  }
  else
  {
    double v11 = 0.0;
    if (v10)
    {
LABEL_13:
      objc_msgSend((id)v10, "textSize", v19, v20);
      double v11 = v11 + v14 + v21;
    }
  }
  if (v8)
  {
    double v15 = *((float *)&v20 + 1);
    if (!(v7 | v10)) {
      double v15 = -0.0;
    }
    double v16 = v11 + v15;
    objc_msgSend(v8, "totalSize", v19, v20);
    double v11 = v17 + v16;
  }
LABEL_18:

  return v11;
}

- (void)enqueueLayoutRequests
{
  v41[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v3 userInterfaceIdiom] == 1)
  {
    BOOL v4 = self->_landscapeWidth > 0.00000011920929;
  }
  else
  {
    v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 bounds];
    BOOL v4 = v6 > 375.0 && self->_landscapeWidth > 0.00000011920929;
  }
  uint64_t v7 = [(SKUIEditorialComponent *)self->_editorial bodyText];
  if (v7)
  {
  }
  else
  {
    id v8 = [(SKUIEditorialComponent *)self->_editorial bodyAttributedText];

    if (!v8) {
      goto LABEL_12;
    }
  }
  textLayoutCache = self->_textLayoutCache;
  uint64_t v10 = [(SKUIEditorialLayout *)self _bodyTextLayoutRequestWithTotalWidth:self->_portraitWidth];
  v41[0] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  int64_t v12 = [(SKUILayoutCache *)textLayoutCache addLayoutRequests:v11];

  self->_portraitTextLayoutIndex = v12;
  if (v4)
  {
    double v13 = self->_textLayoutCache;
    double v14 = [(SKUIEditorialLayout *)self _bodyTextLayoutRequestWithTotalWidth:self->_landscapeWidth];
    v40 = v14;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    int64_t v16 = [(SKUILayoutCache *)v13 addLayoutRequests:v15];

    self->_int64_t landscapeTextLayoutIndex = v16;
  }
LABEL_12:
  double v17 = [(SKUIEditorialComponent *)self->_editorial titleText];

  if (v17)
  {
    v18 = self->_textLayoutCache;
    long long v19 = [(SKUIEditorialLayout *)self _titleTextLayoutRequestWithTotalWidth:self->_portraitWidth];
    v39 = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    int64_t v21 = [(SKUILayoutCache *)v18 addLayoutRequests:v20];

    self->_portraitTitleLayoutIndex = v21;
    if (v4)
    {
      v22 = self->_textLayoutCache;
      v23 = [(SKUIEditorialLayout *)self _titleTextLayoutRequestWithTotalWidth:self->_landscapeWidth];
      v38 = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
      int64_t v25 = [(SKUILayoutCache *)v22 addLayoutRequests:v24];

      self->_landscapeTitleLayoutIndex = v25;
    }
  }
  v26 = [(SKUIEditorialComponent *)self->_editorial links];
  uint64_t v27 = [v26 count];

  if (v27)
  {
    v28 = self->_textLayoutCache;
    v29 = [(SKUIEditorialLayout *)self _linkLayoutRequestWithTotalWidth:self->_portraitWidth];
    v37 = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    int64_t v31 = [(SKUILayoutCache *)v28 addLayoutRequests:v30];

    self->_portraitLinkLayoutIndex = v31;
    if (v4)
    {
      v32 = self->_textLayoutCache;
      v33 = [(SKUIEditorialLayout *)self _linkLayoutRequestWithTotalWidth:self->_landscapeWidth];
      v36 = v33;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      int64_t v35 = [(SKUILayoutCache *)v32 addLayoutRequests:v34];

      self->_landscapeLinkLayoutIndex = v35;
    }
  }
}

- (id)linkLayoutForOrientation:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
LABEL_6:
      BOOL v4 = 0;
      goto LABEL_8;
    }
    int64_t landscapeLinkLayoutIndex = self->_landscapeLinkLayoutIndex;
  }
  else
  {
    int64_t landscapeLinkLayoutIndex = self->_portraitLinkLayoutIndex;
  }
  if (landscapeLinkLayoutIndex == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_6;
  }
  BOOL v4 = [(SKUILayoutCache *)self->_textLayoutCache layoutForIndex:"layoutForIndex:"];
LABEL_8:

  return v4;
}

- (void)setLayoutWidth:(double)a3 forOrientation:(int64_t)a4
{
  if (a4 == 1)
  {
    uint64_t v4 = 40;
  }
  else
  {
    if (a4) {
      return;
    }
    uint64_t v4 = 72;
  }
  *(double *)((char *)&self->super.isa + v4) = a3;
}

- (id)titleTextLayoutForOrientation:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
LABEL_6:
      uint64_t v4 = 0;
      goto LABEL_8;
    }
    int64_t landscapeTitleLayoutIndex = self->_landscapeTitleLayoutIndex;
  }
  else
  {
    int64_t landscapeTitleLayoutIndex = self->_portraitTitleLayoutIndex;
  }
  if (landscapeTitleLayoutIndex == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_6;
  }
  uint64_t v4 = [(SKUILayoutCache *)self->_textLayoutCache layoutForIndex:"layoutForIndex:"];
LABEL_8:

  return v4;
}

- (id)_bodyTextLayoutRequestWithTotalWidth:(double)a3
{
  v5 = objc_alloc_init(SKUITextLayoutRequest);
  uint64_t v10 = 0;
  editorial = self->_editorial;
  if (editorial)
  {
    [(SKUIEditorialComponent *)editorial editorialStyle];
    editorial = self->_editorial;
  }
  uint64_t v7 = [(SKUIEditorialComponent *)editorial bodyAttributedText];
  [(SKUITextLayoutRequest *)v5 setAttributedText:v7];

  [(SKUITextLayoutRequest *)v5 setFontWeight:0];
  [(SKUITextLayoutRequest *)v5 setNumberOfLines:[(SKUIEditorialComponent *)self->_editorial maximumBodyLines]];
  id v8 = [(SKUIEditorialComponent *)self->_editorial bodyText];
  [(SKUITextLayoutRequest *)v5 setText:v8];

  [(SKUITextLayoutRequest *)v5 setTextAlignment:SKUICTTextAlignmentForPageComponentAlignment(v11)];
  [(SKUITextLayoutRequest *)v5 setWidth:a3];
  if (0.0 > 0.00000011921) {
    [(SKUITextLayoutRequest *)v5 setFontSize:0.0];
  }

  return v5;
}

- (id)_linkLayoutRequestWithTotalWidth:(double)a3
{
  v5 = objc_alloc_init(SKUIEditorialLinkLayoutRequest);
  double v6 = [(SKUIEditorialComponent *)self->_editorial links];
  [(SKUIEditorialLinkLayoutRequest *)v5 setLinks:v6];

  [(SKUIEditorialLinkLayoutRequest *)v5 setWidth:a3];

  return v5;
}

- (id)_titleTextLayoutRequestWithTotalWidth:(double)a3
{
  v5 = objc_alloc_init(SKUITextLayoutRequest);
  uint64_t v14 = 0;
  editorial = self->_editorial;
  if (editorial) {
    [(SKUIEditorialComponent *)editorial editorialStyle];
  }
  -[SKUITextLayoutRequest setFontWeight:](v5, "setFontWeight:", 0, v14);
  uint64_t v7 = [(SKUIEditorialComponent *)self->_editorial titleText];
  [(SKUITextLayoutRequest *)v5 setText:v7];

  [(SKUITextLayoutRequest *)v5 setTextAlignment:SKUICTTextAlignmentForPageComponentAlignment(v15)];
  [(SKUITextLayoutRequest *)v5 setWidth:a3];
  LODWORD(v8) = 0;
  if (0.0 <= 0.00000011921)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", v8);
    uint64_t v11 = [v10 userInterfaceIdiom];

    if (v11 == 1) {
      int64_t v12 = &kSKUITextBoxLayoutTitleFontSizeIPad;
    }
    else {
      int64_t v12 = &kSKUITextBoxLayoutTitleFontSizeIPhone;
    }
    double v9 = *(double *)v12;
  }
  else
  {
    double v9 = 0.0;
  }
  [(SKUITextLayoutRequest *)v5 setFontSize:v9];

  return v5;
}

- (SKUIEditorialComponent)editorialComponent
{
  return self->_editorial;
}

- (SKUILayoutCache)layoutCache
{
  return self->_textLayoutCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);

  objc_storeStrong((id *)&self->_editorial, 0);
}

- (void)initWithEditorial:layoutCache:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIEditorialLayout initWithEditorial:layoutCache:]";
}

@end