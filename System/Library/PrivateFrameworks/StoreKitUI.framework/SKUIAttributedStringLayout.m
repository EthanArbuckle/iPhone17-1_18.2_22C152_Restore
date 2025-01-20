@interface SKUIAttributedStringLayout
- (BOOL)usesTallCharacterSet;
- (CGSize)boundingSize;
- (NSAttributedString)attributedString;
- (NSShadow)shadow;
- (NSStringDrawingContext)stringDrawingContext;
- (SKUIAttributedStringLayout)initWithLayoutRequest:(id)a3;
- (UIEdgeInsets)edgeInsetsForShadow;
- (double)baselineOffset;
- (double)firstBaselineOffset;
- (double)topInset;
- (int64_t)numberOfLines;
@end

@implementation SKUIAttributedStringLayout

- (SKUIAttributedStringLayout)initWithLayoutRequest:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIAttributedStringLayout initWithLayoutRequest:]();
  }
  v61.receiver = self;
  v61.super_class = (Class)SKUIAttributedStringLayout;
  v5 = [(SKUIAttributedStringLayout *)&v61 init];
  if (v5)
  {
    uint64_t v6 = [v4 attributedString];
    attributedString = v5->_attributedString;
    v5->_attributedString = (NSAttributedString *)v6;

    v8 = (NSStringDrawingContext *)objc_alloc_init(MEMORY[0x1E4FB0860]);
    context = v5->_context;
    v5->_context = v8;

    uint64_t v10 = [v4 numberOfLines];
    [(NSStringDrawingContext *)v5->_context setCachesLayout:1];
    [(NSStringDrawingContext *)v5->_context setMaximumNumberOfLines:v10];
    -[NSStringDrawingContext setWantsBaselineOffset:](v5->_context, "setWantsBaselineOffset:", [v4 wantsBaselineOffset]);
    [(NSStringDrawingContext *)v5->_context setWrapsForTruncationMode:v10 != 1];
    [v4 width];
    double v12 = v11;
    -[NSAttributedString boundingRectWithSize:options:context:](v5->_attributedString, "boundingRectWithSize:options:context:", 33, v5->_context);
    float v15 = v14;
    double v16 = ceilf(v15);
    if (v12 < v16) {
      double v16 = v12;
    }
    v5->_boundingSize.width = v16;
    v5->_boundingSize.float height = v13;
    if (initWithLayoutRequest__sOnce != -1) {
      dispatch_once(&initWithLayoutRequest__sOnce, &__block_literal_global_60);
    }
    v17 = [(NSAttributedString *)v5->_attributedString string];
    uint64_t v18 = [v17 rangeOfCharacterFromSet:initWithLayoutRequest__sTallCharactersSet];

    v19 = (long long *)MEMORY[0x1E4FB2848];
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5->_usesTallCharacterSet = 1;
      uint64_t v55 = 0;
      v56 = (double *)&v55;
      uint64_t v57 = 0x4010000000;
      v58 = &unk_1C1D0F257;
      long long v20 = v19[1];
      long long v59 = *v19;
      long long v60 = v20;
      v21 = v5->_attributedString;
      uint64_t v22 = [(NSAttributedString *)v21 length];
      uint64_t v23 = *MEMORY[0x1E4FB06F8];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke_2;
      v54[3] = &unk_1E642A338;
      v54[4] = &v55;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v21, "enumerateAttribute:inRange:options:usingBlock:", v23, 0, v22, 0, v54);
      double v24 = v56[4];
      v5->_boundingSize.float height = v5->_boundingSize.height + v56[6] + v24;
      v5->_topInset = v24;
      _Block_object_dispose(&v55, 8);
    }
    v25 = v5->_attributedString;
    uint64_t v26 = *MEMORY[0x1E4FB0758];
    uint64_t v27 = [(NSAttributedString *)v25 length];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke_3;
    v52[3] = &unk_1E642A360;
    v28 = v5;
    v53 = v28;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v25, "enumerateAttribute:inRange:options:usingBlock:", v26, 0, v27, 0, v52);
    uint64_t v55 = 0;
    v56 = (double *)&v55;
    uint64_t v57 = 0x2020000000;
    v58 = 0;
    v29 = v5->_attributedString;
    uint64_t v30 = [(NSAttributedString *)v29 length];
    uint64_t v31 = *MEMORY[0x1E4FB0738];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke_4;
    v51[3] = &unk_1E642A388;
    v51[4] = &v55;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v29, "enumerateAttribute:inRange:options:usingBlock:", v31, 0, v30, 0, v51);
    long long v32 = v19[1];
    *(_OWORD *)&v28->_edgeInsetsForShadow.top = *v19;
    *(_OWORD *)&v28->_edgeInsetsForShadow.bottom = v32;
    shadow = v28->_shadow;
    if (shadow)
    {
      [(NSShadow *)shadow shadowOffset];
      double v35 = v34;
      [(NSShadow *)v28->_shadow shadowBlurRadius];
      double v37 = -v35;
      if (v35 >= 0.0) {
        double v37 = v35;
      }
      double v38 = v37 + v36;
      if (*((void *)v56 + 3) == 1)
      {
        v28->_edgeInsetsForShadow.right = v38 * 0.5;
        v28->_edgeInsetsForShadow.left = v38 * 0.5;
      }
      [(NSShadow *)v28->_shadow shadowOffset];
      uint64_t v39 = 80;
      if (v40 < 0.0) {
        uint64_t v39 = 64;
      }
      *(double *)((char *)&v28->super.isa + v39) = v38;
      [(NSShadow *)v28->_shadow shadowOffset];
      double v42 = v41;
      [(NSShadow *)v28->_shadow shadowBlurRadius];
      double v44 = v43;
      [(NSShadow *)v28->_shadow shadowOffset];
      double v46 = -v42;
      if (v42 >= 0.0) {
        double v46 = v42;
      }
      double v47 = v46 + v44;
      uint64_t v48 = 72;
      if (v45 < 0.0) {
        uint64_t v48 = 56;
      }
      *(double *)((char *)&v28->super.isa + v48) = v47;
    }
    float height = v5->_boundingSize.height;
    v5->_boundingSize.float height = ceilf(height);
    _Block_object_dispose(&v55, 8);
  }
  return v5;
}

void __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke()
{
  v0 = (void *)CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  v1 = (void *)[v0 mutableCopy];

  v2 = (void *)initWithLayoutRequest__sTallCharactersSet;
  initWithLayoutRequest__sTallCharactersSet = (uint64_t)v1;
}

uint64_t __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke_2(uint64_t a1)
{
  long long v11 = *MEMORY[0x1E4FB2848];
  long long v12 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  uint64_t result = CTFontGetLanguageAwareOutsets();
  if (result)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    double v4 = *(double *)(v3 + 48);
    if (v4 < *(double *)&v12) {
      double v4 = *(double *)&v12;
    }
    *(double *)(v3 + 48) = v4;
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    double v6 = *(double *)(v5 + 40);
    if (v6 < *((double *)&v11 + 1)) {
      double v6 = *((double *)&v11 + 1);
    }
    *(double *)(v5 + 40) = v6;
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    double v8 = *(double *)(v7 + 56);
    if (v8 < *((double *)&v12 + 1)) {
      double v8 = *((double *)&v12 + 1);
    }
    *(double *)(v7 + 56) = v8;
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    double v10 = *(double *)(v9 + 32);
    if (v10 < *(double *)&v11) {
      double v10 = *(double *)&v11;
    }
    *(double *)(v9 + 32) = v10;
  }
  return result;
}

void __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *a5 = 1;
}

uint64_t __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 alignment];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a5 = 1;
  return result;
}

- (double)baselineOffset
{
  [(NSStringDrawingContext *)self->_context baselineOffset];
  return v3 + self->_topInset;
}

- (double)firstBaselineOffset
{
  [(NSStringDrawingContext *)self->_context firstBaselineOffset];
  return v3 + self->_topInset;
}

- (int64_t)numberOfLines
{
  return [(NSStringDrawingContext *)self->_context numberOfLineFragments];
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (CGSize)boundingSize
{
  double width = self->_boundingSize.width;
  double height = self->_boundingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSStringDrawingContext)stringDrawingContext
{
  return self->_context;
}

- (BOOL)usesTallCharacterSet
{
  return self->_usesTallCharacterSet;
}

- (UIEdgeInsets)edgeInsetsForShadow
{
  double top = self->_edgeInsetsForShadow.top;
  double left = self->_edgeInsetsForShadow.left;
  double bottom = self->_edgeInsetsForShadow.bottom;
  double right = self->_edgeInsetsForShadow.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (double)topInset
{
  return self->_topInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_attributedString, 0);
}

- (void)initWithLayoutRequest:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIAttributedStringLayout initWithLayoutRequest:]";
}

@end