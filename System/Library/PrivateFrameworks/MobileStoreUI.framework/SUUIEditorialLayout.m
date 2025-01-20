@interface SUUIEditorialLayout
- (SUUIEditorialComponent)editorialComponent;
- (SUUIEditorialLayout)initWithEditorial:(id)a3 layoutCache:(id)a4;
- (SUUILayoutCache)layoutCache;
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

@implementation SUUIEditorialLayout

- (SUUIEditorialLayout)initWithEditorial:(id)a3 layoutCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUIEditorialLayout;
  v9 = [(SUUIEditorialLayout *)&v13 init];
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
  v4 = [(SUUILayoutCache *)self->_textLayoutCache layoutForIndex:"layoutForIndex:"];
LABEL_8:

  return v4;
}

- (double)layoutHeightForOrientation:(int64_t)a3 expanded:(BOOL)a4
{
  uint64_t v7 = [(SUUIEditorialLayout *)self bodyTextLayoutForOrientation:"bodyTextLayoutForOrientation:"];
  id v8 = [(SUUIEditorialLayout *)self linkLayoutForOrientation:a3];
  uint64_t v9 = [(SUUIEditorialLayout *)self titleTextLayoutForOrientation:a3];
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
    [(SUUIEditorialComponent *)editorial editorialStyle];
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
  v41[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F82670] currentDevice];
  if ([v3 userInterfaceIdiom] == 1)
  {
    BOOL v4 = self->_landscapeWidth > 0.00000011920929;
  }
  else
  {
    v5 = [MEMORY[0x263F82B60] mainScreen];
    [v5 bounds];
    BOOL v4 = v6 > 375.0 && self->_landscapeWidth > 0.00000011920929;
  }
  uint64_t v7 = [(SUUIEditorialComponent *)self->_editorial bodyText];
  if (v7)
  {
  }
  else
  {
    id v8 = [(SUUIEditorialComponent *)self->_editorial bodyAttributedText];

    if (!v8) {
      goto LABEL_12;
    }
  }
  textLayoutCache = self->_textLayoutCache;
  uint64_t v10 = [(SUUIEditorialLayout *)self _bodyTextLayoutRequestWithTotalWidth:self->_portraitWidth];
  v41[0] = v10;
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
  int64_t v12 = [(SUUILayoutCache *)textLayoutCache addLayoutRequests:v11];

  self->_portraitTextLayoutIndex = v12;
  if (v4)
  {
    double v13 = self->_textLayoutCache;
    double v14 = [(SUUIEditorialLayout *)self _bodyTextLayoutRequestWithTotalWidth:self->_landscapeWidth];
    v40 = v14;
    double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
    int64_t v16 = [(SUUILayoutCache *)v13 addLayoutRequests:v15];

    self->_int64_t landscapeTextLayoutIndex = v16;
  }
LABEL_12:
  double v17 = [(SUUIEditorialComponent *)self->_editorial titleText];

  if (v17)
  {
    v18 = self->_textLayoutCache;
    long long v19 = [(SUUIEditorialLayout *)self _titleTextLayoutRequestWithTotalWidth:self->_portraitWidth];
    v39 = v19;
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
    int64_t v21 = [(SUUILayoutCache *)v18 addLayoutRequests:v20];

    self->_portraitTitleLayoutIndex = v21;
    if (v4)
    {
      v22 = self->_textLayoutCache;
      v23 = [(SUUIEditorialLayout *)self _titleTextLayoutRequestWithTotalWidth:self->_landscapeWidth];
      v38 = v23;
      v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
      int64_t v25 = [(SUUILayoutCache *)v22 addLayoutRequests:v24];

      self->_landscapeTitleLayoutIndex = v25;
    }
  }
  v26 = [(SUUIEditorialComponent *)self->_editorial links];
  uint64_t v27 = [v26 count];

  if (v27)
  {
    v28 = self->_textLayoutCache;
    v29 = [(SUUIEditorialLayout *)self _linkLayoutRequestWithTotalWidth:self->_portraitWidth];
    v37 = v29;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
    int64_t v31 = [(SUUILayoutCache *)v28 addLayoutRequests:v30];

    self->_portraitLinkLayoutIndex = v31;
    if (v4)
    {
      v32 = self->_textLayoutCache;
      v33 = [(SUUIEditorialLayout *)self _linkLayoutRequestWithTotalWidth:self->_landscapeWidth];
      v36 = v33;
      v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
      int64_t v35 = [(SUUILayoutCache *)v32 addLayoutRequests:v34];

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
  BOOL v4 = [(SUUILayoutCache *)self->_textLayoutCache layoutForIndex:"layoutForIndex:"];
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
  uint64_t v4 = [(SUUILayoutCache *)self->_textLayoutCache layoutForIndex:"layoutForIndex:"];
LABEL_8:

  return v4;
}

- (id)_bodyTextLayoutRequestWithTotalWidth:(double)a3
{
  v5 = objc_alloc_init(SUUITextLayoutRequest);
  uint64_t v10 = 0;
  editorial = self->_editorial;
  if (editorial)
  {
    [(SUUIEditorialComponent *)editorial editorialStyle];
    editorial = self->_editorial;
  }
  uint64_t v7 = [(SUUIEditorialComponent *)editorial bodyAttributedText];
  [(SUUITextLayoutRequest *)v5 setAttributedText:v7];

  [(SUUITextLayoutRequest *)v5 setFontWeight:0];
  [(SUUITextLayoutRequest *)v5 setNumberOfLines:[(SUUIEditorialComponent *)self->_editorial maximumBodyLines]];
  id v8 = [(SUUIEditorialComponent *)self->_editorial bodyText];
  [(SUUITextLayoutRequest *)v5 setText:v8];

  [(SUUITextLayoutRequest *)v5 setTextAlignment:SUUICTTextAlignmentForPageComponentAlignment(v11)];
  [(SUUITextLayoutRequest *)v5 setWidth:a3];
  if (0.0 > 0.00000011921) {
    [(SUUITextLayoutRequest *)v5 setFontSize:0.0];
  }

  return v5;
}

- (id)_linkLayoutRequestWithTotalWidth:(double)a3
{
  v5 = objc_alloc_init(SUUIEditorialLinkLayoutRequest);
  double v6 = [(SUUIEditorialComponent *)self->_editorial links];
  [(SUUIEditorialLinkLayoutRequest *)v5 setLinks:v6];

  [(SUUIEditorialLinkLayoutRequest *)v5 setWidth:a3];

  return v5;
}

- (id)_titleTextLayoutRequestWithTotalWidth:(double)a3
{
  v5 = objc_alloc_init(SUUITextLayoutRequest);
  uint64_t v14 = 0;
  editorial = self->_editorial;
  if (editorial) {
    [(SUUIEditorialComponent *)editorial editorialStyle];
  }
  -[SUUITextLayoutRequest setFontWeight:](v5, "setFontWeight:", 0, v14);
  uint64_t v7 = [(SUUIEditorialComponent *)self->_editorial titleText];
  [(SUUITextLayoutRequest *)v5 setText:v7];

  [(SUUITextLayoutRequest *)v5 setTextAlignment:SUUICTTextAlignmentForPageComponentAlignment(v15)];
  [(SUUITextLayoutRequest *)v5 setWidth:a3];
  LODWORD(v8) = 0;
  if (0.0 <= 0.00000011921)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", v8);
    uint64_t v11 = [v10 userInterfaceIdiom];

    if (v11 == 1) {
      int64_t v12 = &kSUUITextBoxLayoutTitleFontSizeIPad;
    }
    else {
      int64_t v12 = &kSUUITextBoxLayoutTitleFontSizeIPhone;
    }
    double v9 = *(double *)v12;
  }
  else
  {
    double v9 = 0.0;
  }
  [(SUUITextLayoutRequest *)v5 setFontSize:v9];

  return v5;
}

- (SUUIEditorialComponent)editorialComponent
{
  return self->_editorial;
}

- (SUUILayoutCache)layoutCache
{
  return self->_textLayoutCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);

  objc_storeStrong((id *)&self->_editorial, 0);
}

@end