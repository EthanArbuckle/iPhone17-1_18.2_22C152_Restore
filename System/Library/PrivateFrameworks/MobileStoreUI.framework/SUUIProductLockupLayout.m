@interface SUUIProductLockupLayout
- (BOOL)hasBottomRightElementWithRightAlignment;
- (CGSize)_sizeForSegmentedControl:(id)a3 width:(double)a4;
- (CGSize)_sizeForVerticalViewElements:(id)a3 width:(double)a4;
- (CGSize)_sizeForViewElement:(id)a3 width:(double)a4;
- (SUUIProductLockupLayout)initWithLockup:(id)a3 width:(double)a4 context:(id)a5;
- (SUUIProductLockupLayoutSizing)layoutWidthsForWidth:(SEL)a3;
- (SUUIProductLockupLayoutSizing)sizingToFitWidth:(SEL)a3;
- (double)bottomPaddingForViewElement:(id)a3;
- (double)metadataWidthForWidth:(double)a3;
- (double)topPaddingForViewElement:(id)a3;
- (id)viewElementsForSection:(int64_t)a3;
- (int64_t)bottomLeftLayoutStyle;
- (void)enumerateViewElementsForWidth:(double)a3 usingBlock:(id)a4;
@end

@implementation SUUIProductLockupLayout

- (SUUIProductLockupLayout)initWithLockup:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v55 = a3;
  id v54 = a5;
  v84.receiver = self;
  v84.super_class = (Class)SUUIProductLockupLayout;
  v56 = [(SUUIProductLockupLayout *)&v84 init];
  if (v56)
  {
    char v61 = [v55 containsElementGroups];
    objc_storeStrong((id *)&v56->_layoutContext, a5);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    p_bottomLeftViewElements = (void **)&v56->_bottomLeftViewElements;
    bottomLeftViewElements = v56->_bottomLeftViewElements;
    v56->_bottomLeftViewElements = v8;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    bottomRightViewElements = v56->_bottomRightViewElements;
    p_bottomRightViewElements = (id *)&v56->_bottomRightViewElements;
    v56->_bottomRightViewElements = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    middleLeftViewElements = v56->_middleLeftViewElements;
    p_middleLeftViewElements = (id *)&v56->_middleLeftViewElements;
    v56->_middleLeftViewElements = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    p_topLeftViewElements = (id *)&v56->_topLeftViewElements;
    topLeftViewElements = v56->_topLeftViewElements;
    v56->_topLeftViewElements = v15;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    topRightViewElements = v56->_topRightViewElements;
    p_topRightViewElements = (id *)&v56->_topRightViewElements;
    v56->_topRightViewElements = v18;

    uint64_t v78 = 0;
    v79 = (id *)&v78;
    uint64_t v80 = 0x3032000000;
    v81 = __Block_byref_object_copy__19;
    v82 = __Block_byref_object_dispose__19;
    v83 = v56->_bottomRightViewElements;
    uint64_t v72 = 0;
    v73 = (id *)&v72;
    uint64_t v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__19;
    v76 = __Block_byref_object_dispose__19;
    v77 = v56->_middleLeftViewElements;
    if (a4 < 512.0)
    {
      objc_storeStrong(v79 + 5, v56->_bottomRightViewElements);
      v20 = *p_bottomLeftViewElements;
      v21 = v73;
    }
    else
    {
      v56->_bottomLeftLayoutStyle = 2;
      v20 = v56->_bottomLeftViewElements;
      v21 = v79;
    }
    v22 = v21 + 5;
    id v23 = v20;
    v24 = *v22;
    *v22 = v23;

    id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __56__SUUIProductLockupLayout_initWithLockup_width_context___block_invoke;
    v66[3] = &unk_265402BA8;
    v26 = v56;
    BOOL v71 = a4 < 512.0;
    v67 = v26;
    v69 = &v78;
    v70 = &v72;
    id v27 = v25;
    id v68 = v27;
    [v55 enumerateChildrenUsingBlock:v66];
    v28 = (SUUIViewElement *)*p_topLeftViewElements;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v29 = v27;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v62 objects:v85 count:16];
    if (v30)
    {
      v57 = v26;
      uint64_t v31 = *(void *)v63;
      while (1)
      {
        uint64_t v32 = 0;
        while (2)
        {
          if (*(void *)v63 != v31) {
            objc_enumerationMutation(v29);
          }
          v33 = *(void **)(*((void *)&v62 + 1) + 8 * v32);
          v34 = [v33 style];
          uint64_t v35 = [v34 elementPosition];

          v36 = (id *)&v56->_bottomLeftViewElements;
          switch(v35)
          {
            case 2:
            case 6:
              v36 = (id *)&v56->_topLeftViewElements;
              goto LABEL_15;
            case 3:
            case 8:
              goto LABEL_15;
            case 4:
              v36 = (id *)&v56->_middleLeftViewElements;
              goto LABEL_15;
            case 7:
              v36 = (id *)&v56->_topRightViewElements;
              goto LABEL_15;
            case 9:
              v36 = (id *)&v56->_bottomRightViewElements;
LABEL_15:
              id v37 = *v36;
              if (!v37) {
                goto LABEL_17;
              }
              v38 = v37;
              [v37 addObject:v33];
              goto LABEL_52;
            default:
LABEL_17:
              uint64_t v39 = [v33 elementType];
              v38 = 0;
              if (v39 > 108)
              {
                if (v39 <= 134)
                {
                  v42 = (void **)&v56->_bottomRightViewElements;
                  if (v39 != 109)
                  {
                    if (v39 != 127) {
                      goto LABEL_52;
                    }
                    if (v28 != *p_topLeftViewElements)
                    {
                      if (v28 == *p_middleLeftViewElements)
                      {
                        id v43 = *p_bottomLeftViewElements;
                        goto LABEL_58;
                      }
LABEL_51:
                      v38 = 0;
                      goto LABEL_52;
                    }
                    id v43 = v73[5];
LABEL_58:
                    v48 = (SUUIViewElement *)v43;
                    productImageElement = v28;
                    v28 = v48;
LABEL_59:

                    goto LABEL_51;
                  }
LABEL_46:
                  v44 = *v42;
LABEL_47:
                  [v44 addObject:v33];
                  goto LABEL_51;
                }
                switch(v39)
                {
                  case 135:
                  case 144:
                    goto LABEL_48;
                  case 136:
                  case 137:
                  case 139:
                  case 140:
                  case 142:
                  case 143:
                    break;
                  case 138:
                    if (([v33 labelViewStyle] & 0xFFFFFFFFFFFFFFFELL) == 4) {
                      char v40 = 1;
                    }
                    else {
                      char v40 = v61;
                    }
                    if ((v40 & 1) == 0)
                    {
                      v41 = (SUUIViewElement *)v73[5];

                      v28 = v41;
                    }
                    goto LABEL_50;
                  case 141:
                    goto LABEL_45;
                  default:
                    if (v39 == 152) {
                      goto LABEL_55;
                    }
                    break;
                }
              }
              else
              {
                if (v39 > 48)
                {
                  if (v39 > 61)
                  {
                    if (v39 != 62)
                    {
                      if (v39 != 77) {
                        goto LABEL_52;
                      }
                      goto LABEL_45;
                    }
                  }
                  else
                  {
                    if (v39 == 49)
                    {
LABEL_55:
                      if (v57->_productImageElement) {
                        goto LABEL_51;
                      }
                      v46 = v33;
                      productImageElement = v57->_productImageElement;
                      v57->_productImageElement = v46;
                      goto LABEL_59;
                    }
                    if (v39 != 50) {
                      goto LABEL_52;
                    }
                  }
LABEL_48:
                  if ((v61 & 1) == 0)
                  {
                    v45 = (SUUIViewElement *)v73[5];

                    v28 = v45;
                  }
LABEL_50:
                  [(SUUIViewElement *)v28 addObject:v33];
                  goto LABEL_51;
                }
                if (v39 > 12)
                {
                  if (v39 != 13)
                  {
                    v44 = v28;
                    if (v39 != 48) {
                      goto LABEL_52;
                    }
                    goto LABEL_47;
                  }
LABEL_45:
                  v42 = v79 + 5;
                  goto LABEL_46;
                }
                if (v39 == 8 || v39 == 12) {
                  goto LABEL_48;
                }
              }
LABEL_52:

              if (v30 != ++v32) {
                continue;
              }
              uint64_t v49 = [v29 countByEnumeratingWithState:&v62 objects:v85 count:16];
              uint64_t v30 = v49;
              if (!v49) {
                goto LABEL_61;
              }
              break;
          }
          break;
        }
      }
    }
LABEL_61:

    if (![*p_bottomRightViewElements count])
    {
      id v50 = *p_bottomRightViewElements;
      id *p_bottomRightViewElements = 0;
    }
    if (![*p_middleLeftViewElements count])
    {
      id v51 = *p_middleLeftViewElements;
      id *p_middleLeftViewElements = 0;
    }
    if (![*p_topRightViewElements count])
    {
      id v52 = *p_topRightViewElements;
      id *p_topRightViewElements = 0;
    }
    _Block_object_dispose(&v72, 8);

    _Block_object_dispose(&v78, 8);
  }

  return v56;
}

void __56__SUUIProductLockupLayout_initWithLockup_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 77 && (objc_msgSend(v3, "isSimpleOffer") & 1) == 0)
  {
    *(void *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(a1 + 64) == 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 40));
  }
  [*(id *)(a1 + 40) addObject:v3];
}

- (double)bottomPaddingForViewElement:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 elementType];
  double v5 = 0.0;
  if (v4 > 76)
  {
    if (v4 != 77 && v4 != 109 && v4 != 141) {
      goto LABEL_12;
    }
LABEL_8:
    double v5 = 5.0;
    goto LABEL_12;
  }
  if (v4 != 8)
  {
    if (v4 != 13) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if ([v3 badgeType] == 1) {
    double v5 = 2.0;
  }
  else {
    double v5 = 0.0;
  }
LABEL_12:

  return v5;
}

- (void)enumerateViewElementsForWidth:(double)a3 usingBlock:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, SUUIViewElement *, uint64_t, uint64_t))a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v7 = 0;
  v8 = 0;
  uint64_t v9 = 0;
  v10 = 0;
  uint64_t v11 = 0;
  if (a3 > 0.00000011920929)
  {
    [(SUUIProductLockupLayout *)self layoutWidthsForWidth:a3];
    uint64_t v11 = v29[0];
    v10 = v30;
    uint64_t v7 = v32;
    v8 = middleLeftViewElements;
    uint64_t v9 = v36;
  }
  productImageElement = self->_productImageElement;
  if (productImageElement)
  {
    [(SUUIViewElementLayoutContext *)self->_layoutContext sizeForViewElement:self->_productImageElement width:a3];
    v6[2](v6, productImageElement, 3, (uint64_t)(v26 + 3));
  }
  uint64_t v13 = 0;
  topRightViewElements = self->_topRightViewElements;
  v29[0] = self->_topLeftViewElements;
  v29[1] = 4;
  uint64_t v30 = v8;
  uint64_t v31 = topRightViewElements;
  uint64_t v32 = 5;
  uint64_t v33 = v9;
  middleLeftViewElements = self->_middleLeftViewElements;
  uint64_t v35 = 2;
  uint64_t v36 = v7;
  bottomRightViewElements = self->_bottomRightViewElements;
  bottomLeftViewElements = self->_bottomLeftViewElements;
  uint64_t v38 = 0;
  uint64_t v39 = v11;
  char v40 = bottomRightViewElements;
  uint64_t v41 = 1;
  v42 = v10;
  do
  {
    if (*((unsigned char *)v26 + 24)) {
      break;
    }
    uint64_t v16 = v29[v13 + 2];
    v17 = (void *)v29[v13];
    uint64_t v18 = v29[v13 + 1];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __68__SUUIProductLockupLayout_enumerateViewElementsForWidth_usingBlock___block_invoke;
    v20[3] = &unk_265402BD0;
    v19 = v6;
    v22 = &v25;
    uint64_t v23 = v18;
    uint64_t v24 = v16;
    v21 = v19;
    [v17 enumerateObjectsUsingBlock:v20];

    v13 += 3;
  }
  while (v13 != 15);
  _Block_object_dispose(&v25, 8);
}

uint64_t __68__SUUIProductLockupLayout_enumerateViewElementsForWidth_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 56));
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (SUUIProductLockupLayoutSizing)layoutWidthsForWidth:(SEL)a3
{
  retstr->var3 = 0u;
  retstr->var4 = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  retstr->var0 = 0u;
  [(SUUIProductLockupLayout *)self metadataWidthForWidth:a4];
  double v7 = v6;
  retstr->var0.width = v6;
  retstr->var0.height = 0.0;
  -[SUUIProductLockupLayout _sizeForVerticalViewElements:width:](self, "_sizeForVerticalViewElements:width:", self->_bottomRightViewElements);
  double v9 = v8;
  retstr->var1.width = v8;
  retstr->var1.height = v10;
  retstr->var2.width = v7;
  retstr->var2.height = 0.0;
  retstr->var3.width = v7;
  retstr->var3.height = 0.0;
  [(SUUIProductLockupLayout *)self _sizeForVerticalViewElements:self->_topRightViewElements width:v7];
  retstr->var4.width = v11;
  retstr->var4.height = v12;
  if (v9 >= v11) {
    double v13 = v9;
  }
  else {
    double v13 = v11;
  }
  double v14 = v7;
  if (v11 > 0.00000011920929)
  {
    double v14 = v7 - v11 + -5.0;
    retstr->var3.width = v14;
  }
  if (v13 > 0.00000011920929) {
    retstr->var2.width = v7 - v13 + -5.0;
  }
  double v15 = v7;
  if (v9 > 0.00000011920929)
  {
    double v15 = v7 - v9 + -5.0;
    retstr->var0.width = v15;
  }
  uint64_t result = (SUUIProductLockupLayoutSizing *)[(SUUIProductLockupLayout *)self hasBottomRightElementWithRightAlignment];
  if (result)
  {
    if (v15 >= v14) {
      double v17 = v15;
    }
    else {
      double v17 = v14;
    }
    if (v14 > 0.00000011920929) {
      retstr->var4.width = v7 - v14 + -5.0;
    }
    if (v17 > 0.00000011920929) {
      retstr->var2.width = v7;
    }
    if (v15 > 0.00000011920929) {
      retstr->var1.width = v7 - v15 + -5.0;
    }
  }
  return result;
}

- (BOOL)hasBottomRightElementWithRightAlignment
{
  v2 = [(SUUIProductLockupLayout *)self viewElementsForSection:1];
  BOOL v3 = [v2 indexOfObjectPassingTest:&__block_literal_global_11] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

BOOL __66__SUUIProductLockupLayout_hasBottomRightElementWithRightAlignment__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 style];
  BOOL v3 = [v2 elementAlignment] == 3;

  return v3;
}

- (double)metadataWidthForWidth:(double)a3
{
  double v3 = a3;
  if (self->_productImageElement)
  {
    -[SUUIViewElementLayoutContext sizeForViewElement:width:](self->_layoutContext, "sizeForViewElement:width:", a3);
    return v3 - (v4 + 13.0);
  }
  return v3;
}

- (SUUIProductLockupLayoutSizing)sizingToFitWidth:(SEL)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  retstr->var3 = 0u;
  retstr->var4 = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  retstr->var0 = 0u;
  [(SUUIProductLockupLayout *)self metadataWidthForWidth:a4];
  double v7 = v6;
  -[SUUIProductLockupLayout _sizeForVerticalViewElements:width:](self, "_sizeForVerticalViewElements:width:", self->_bottomRightViewElements);
  double v9 = v8;
  retstr->var1.width = v8;
  retstr->var1.height = v10;
  [(SUUIProductLockupLayout *)self _sizeForVerticalViewElements:self->_topRightViewElements width:v7];
  double v12 = v11;
  retstr->var4.width = v11;
  retstr->var4.height = v13;
  double v14 = v7 - v11 + -5.0;
  if (v12 <= 0.00000011920929) {
    double v14 = v7;
  }
  [(SUUIProductLockupLayout *)self _sizeForVerticalViewElements:self->_topLeftViewElements width:v14];
  retstr->var3.width = v15;
  retstr->var3.height = v16;
  if (v9 >= v12) {
    double v17 = v9;
  }
  else {
    double v17 = v12;
  }
  if (v17 <= 0.00000011920929) {
    double v18 = v7;
  }
  else {
    double v18 = v7 - v17 + -5.0;
  }
  [(SUUIProductLockupLayout *)self _sizeForVerticalViewElements:self->_middleLeftViewElements width:v18];
  retstr->var2.width = v19;
  retstr->var2.height = v20;
  if (v9 > 0.00000011920929) {
    double v7 = v7 - v9 + -5.0;
  }
  if (self->_bottomLeftLayoutStyle == 2)
  {
    retstr->var0.width = v7;
    retstr->var0.height = 0.0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v21 = self->_bottomLeftViewElements;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v32;
      double v25 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          -[SUUIProductLockupLayout _sizeForViewElement:width:](self, "_sizeForViewElement:width:", *(void *)(*((void *)&v31 + 1) + 8 * i), v7, (void)v31);
          if (v25 < v27) {
            double v25 = v27;
          }
          retstr->var0.height = v25;
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v23);
    }
  }
  else
  {
    uint64_t result = (SUUIProductLockupLayoutSizing *)[(SUUIProductLockupLayout *)self _sizeForVerticalViewElements:self->_bottomLeftViewElements width:v7];
    retstr->var0.width = v29;
    retstr->var0.height = v30;
  }
  return result;
}

- (double)topPaddingForViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  double v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v5 = [v4 elementType];
  if (v5 == 8)
  {
    if ([v4 badgeType] == 1)
    {
      v17[3] = 3.0;
    }
    else
    {
      double v6 = [v4 style];
      double v7 = SUUIViewElementFontWithStyle(v6);

      if (v7)
      {
        [v7 _bodyLeading];
        double v9 = v8;
      }
      else
      {
        CGFloat v10 = SUUIFontForTextStyle(2);
        [v10 _bodyLeading];
        double v9 = v11;
      }
      [(SUUIViewElementLayoutContext *)self->_layoutContext sizeForBadgeElement:v4];
      v17[3] = v9 - v12;
    }
  }
  else if (v5 == 62)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __52__SUUIProductLockupLayout_topPaddingForViewElement___block_invoke;
    v15[3] = &unk_265402C18;
    v15[4] = self;
    v15[5] = &v16;
    [v4 enumerateChildrenUsingBlock:v15];
  }
  double v13 = v17[3];
  _Block_object_dispose(&v16, 8);

  return v13;
}

uint64_t __52__SUUIProductLockupLayout_topPaddingForViewElement___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) topPaddingForViewElement:a2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  *a3 = 1;
  return result;
}

- (id)viewElementsForSection:(int64_t)a3
{
  v5[1] = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0:
      bottomLeftViewElements = self->_bottomLeftViewElements;
      goto LABEL_9;
    case 1:
      bottomLeftViewElements = self->_bottomRightViewElements;
      goto LABEL_9;
    case 2:
      bottomLeftViewElements = self->_middleLeftViewElements;
      goto LABEL_9;
    case 3:
      if (self->_productImageElement)
      {
        v5[0] = self->_productImageElement;
        self = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
      }
      else
      {
        self = 0;
      }
      break;
    case 4:
      bottomLeftViewElements = self->_topLeftViewElements;
      goto LABEL_9;
    case 5:
      bottomLeftViewElements = self->_topRightViewElements;
LABEL_9:
      self = bottomLeftViewElements;
      break;
    default:
      break;
  }
  return self;
}

- (CGSize)_sizeForSegmentedControl:(id)a3 width:(double)a4
{
  id v5 = a3;
  uint64_t v6 = [[SUUISegmentedControlViewElementController alloc] initWithViewElement:v5];

  [(SUUISegmentedControlViewElementController *)v6 setDesiredSegmentWidth:40.0];
  double v7 = [(SUUISegmentedControlViewElementController *)v6 segmentedControlView];
  objc_msgSend(v7, "sizeThatFits:", a4, 1.79769313e308);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)_sizeForVerticalViewElements:(id)a3 width:(double)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  CGFloat v15 = (double *)&v14;
  uint64_t v16 = 0x3010000000;
  double v17 = "";
  long long v18 = *MEMORY[0x263F001B0];
  uint64_t v7 = [v6 count];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__SUUIProductLockupLayout__sizeForVerticalViewElements_width___block_invoke;
  v12[3] = &unk_265402C40;
  *(double *)&v12[7] = a4;
  v12[4] = self;
  v12[5] = &v14;
  v12[8] = v7;
  v12[6] = v13;
  [v6 enumerateObjectsUsingBlock:v12];
  double v8 = v15[4];
  double v9 = v15[5];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);

  double v10 = v8;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

void __62__SUUIProductLockupLayout__sizeForVerticalViewElements_width___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v18 = a2;
  [*(id *)(a1 + 32) _sizeForViewElement:v18 width:*(double *)(a1 + 56)];
  double v6 = v5;
  double v8 = v7;
  double v9 = [*(id *)(*(void *)(a1 + 32) + 32) textPropertiesForViewElement:v18 width:*(double *)(a1 + 56)];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v8
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 40);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  double v11 = *(double *)(v10 + 32);
  if (v11 < v6) {
    double v11 = v6;
  }
  *(double *)(v10 + 32) = v11;
  if (*(void *)(a1 + 64) - 1 > a3)
  {
    [*(id *)(a1 + 32) bottomPaddingForViewElement:v18];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v12
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 40);
  }
  if (a3)
  {
    [v9 desiredOffsetTop];
    double v14 = v13;
    [*(id *)(a1 + 32) topPaddingForViewElement:v18];
    if (v14 >= v15) {
      double v15 = v14;
    }
    float v16 = v15 - *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 40)
                                                                + fmaxf(roundf(v16), 0.0);
  }
  [v9 baselineOffsetFromBottom];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v17;
}

- (CGSize)_sizeForViewElement:(id)a3 width:(double)a4
{
  id v6 = a3;
  if ([v6 elementType] == 109) {
    [(SUUIProductLockupLayout *)self _sizeForSegmentedControl:v6 width:a4];
  }
  else {
    [(SUUIViewElementLayoutContext *)self->_layoutContext sizeForViewElement:v6 width:a4];
  }
  double v9 = v7;
  double v10 = v8;

  double v11 = v9;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int64_t)bottomLeftLayoutStyle
{
  return self->_bottomLeftLayoutStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topRightViewElements, 0);
  objc_storeStrong((id *)&self->_topLeftViewElements, 0);
  objc_storeStrong((id *)&self->_productImageElement, 0);
  objc_storeStrong((id *)&self->_middleLeftViewElements, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_bottomRightViewElements, 0);
  objc_storeStrong((id *)&self->_bottomLeftViewElements, 0);
}

@end