@interface SKUITomatoRatingViewElement
- (SKUITomatoRatingViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIViewElementText)ratingText;
- (float)tomatoRating;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)freshness;
@end

@implementation SKUITomatoRatingViewElement

- (SKUITomatoRatingViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUITomatoRatingViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUITomatoRatingViewElement;
  v11 = [(SKUIViewElement *)&v24 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"value"];
    [v12 floatValue];
    v11->_tomatoRating = v13;

    v14 = [v8 getAttribute:@"freshness"];
    if ([v14 length])
    {
      if (![v14 isEqualToString:@"certified"])
      {
        if ([v14 isEqualToString:@"fresh"]) {
          goto LABEL_13;
        }
        if ([v14 isEqualToString:@"rotten"]) {
          goto LABEL_15;
        }
LABEL_17:
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __72__SKUITomatoRatingViewElement_initWithDOMElement_parent_elementFactory___block_invoke;
        v22[3] = &unk_1E64242C0;
        v18 = v11;
        v23 = v18;
        uint64_t v19 = +[IKTextParser textWithDOMElement:v8 usingParseBlock:v22];
        ratingText = v18->_ratingText;
        v18->_ratingText = (SKUIViewElementText *)v19;

        goto LABEL_18;
      }
    }
    else
    {
      v15 = [v8 getAttribute:@"certified"];
      int v16 = [v15 BOOLValue];

      if (!v16)
      {
        if (v11->_tomatoRating >= 0.6)
        {
LABEL_13:
          uint64_t v17 = 1;
LABEL_16:
          v11->_freshness = v17;
          goto LABEL_17;
        }
LABEL_15:
        uint64_t v17 = 2;
        goto LABEL_16;
      }
    }
    v11->_freshness = 0;
    goto LABEL_17;
  }
LABEL_18:

  return v11;
}

id __72__SKUITomatoRatingViewElement_initWithDOMElement_parent_elementFactory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (!_block_invoke_sRatingFormatter)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v7 = (void *)_block_invoke_sRatingFormatter;
    _block_invoke_sRatingFormatter = (uint64_t)v6;

    [(id)_block_invoke_sRatingFormatter setNumberStyle:3];
    [(id)_block_invoke_sRatingFormatter setMaximumFractionDigits:0];
  }
  *a4 = 0;
  id v8 = objc_alloc(NSNumber);
  LODWORD(v9) = *(_DWORD *)(*(void *)(a1 + 32) + 288);
  id v10 = (void *)[v8 initWithFloat:v9];
  v11 = [(id)_block_invoke_sRatingFormatter stringFromNumber:v10];

  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUITomatoRatingViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUITomatoRatingViewElement;
  v5 = [(SKUIViewElement *)&v9 applyUpdatesWithElement:v4];
  id v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_freshness = [(SKUITomatoRatingViewElement *)v4 freshness];
    [(SKUITomatoRatingViewElement *)v4 tomatoRating];
    self->_tomatoRating = v7;
  }

  return v6;
}

- (int64_t)freshness
{
  return self->_freshness;
}

- (float)tomatoRating
{
  return self->_tomatoRating;
}

- (SKUIViewElementText)ratingText
{
  return self->_ratingText;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITomatoRatingViewElement initWithDOMElement:parent:elementFactory:]";
}

@end