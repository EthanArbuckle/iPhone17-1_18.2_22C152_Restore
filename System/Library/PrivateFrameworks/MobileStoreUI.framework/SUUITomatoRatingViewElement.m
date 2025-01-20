@interface SUUITomatoRatingViewElement
- (SUUITomatoRatingViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIViewElementText)ratingText;
- (float)tomatoRating;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)freshness;
@end

@implementation SUUITomatoRatingViewElement

- (SUUITomatoRatingViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUUITomatoRatingViewElement;
  v9 = [(SUUIViewElement *)&v22 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"value"];
    [v10 floatValue];
    v9->_tomatoRating = v11;

    v12 = [v8 getAttribute:@"freshness"];
    if ([v12 length])
    {
      if (![v12 isEqualToString:@"certified"])
      {
        if ([v12 isEqualToString:@"fresh"]) {
          goto LABEL_9;
        }
        if ([v12 isEqualToString:@"rotten"]) {
          goto LABEL_11;
        }
LABEL_13:
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __72__SUUITomatoRatingViewElement_initWithDOMElement_parent_elementFactory___block_invoke;
        v20[3] = &unk_2654032C0;
        v16 = v9;
        v21 = v16;
        uint64_t v17 = +[IKTextParser textWithDOMElement:v8 usingParseBlock:v20];
        ratingText = v16->_ratingText;
        v16->_ratingText = (SUUIViewElementText *)v17;

        goto LABEL_14;
      }
    }
    else
    {
      v13 = [v8 getAttribute:@"certified"];
      int v14 = [v13 BOOLValue];

      if (!v14)
      {
        if (v9->_tomatoRating >= 0.6)
        {
LABEL_9:
          uint64_t v15 = 1;
LABEL_12:
          v9->_freshness = v15;
          goto LABEL_13;
        }
LABEL_11:
        uint64_t v15 = 2;
        goto LABEL_12;
      }
    }
    v9->_freshness = 0;
    goto LABEL_13;
  }
LABEL_14:

  return v9;
}

id __72__SUUITomatoRatingViewElement_initWithDOMElement_parent_elementFactory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (!_block_invoke_sRatingFormatter)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
    v7 = (void *)_block_invoke_sRatingFormatter;
    _block_invoke_sRatingFormatter = (uint64_t)v6;

    [(id)_block_invoke_sRatingFormatter setNumberStyle:3];
    [(id)_block_invoke_sRatingFormatter setMaximumFractionDigits:0];
  }
  *a4 = 0;
  id v8 = objc_alloc(NSNumber);
  LODWORD(v9) = *(_DWORD *)(*(void *)(a1 + 32) + 288);
  v10 = (void *)[v8 initWithFloat:v9];
  float v11 = [(id)_block_invoke_sRatingFormatter stringFromNumber:v10];

  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUITomatoRatingViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUITomatoRatingViewElement;
  v5 = [(SUUIViewElement *)&v9 applyUpdatesWithElement:v4];
  id v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_freshness = [(SUUITomatoRatingViewElement *)v4 freshness];
    [(SUUITomatoRatingViewElement *)v4 tomatoRating];
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

- (SUUIViewElementText)ratingText
{
  return self->_ratingText;
}

- (void).cxx_destruct
{
}

@end