@interface SKUIGiftTemplateViewElement
- (SKUIGiftTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIItem)productItem;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)giftType;
@end

@implementation SKUIGiftTemplateViewElement

- (SKUIGiftTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftTemplateViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIGiftTemplateViewElement;
  v11 = [(SKUIViewElement *)&v17 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"type"];
    v11->_giftType = [v12 isEqualToString:@"product"];
    uint64_t v13 = [v8 getAttribute:@"buyParams"];
    productBuyParams = v11->_productBuyParams;
    v11->_productBuyParams = (NSString *)v13;

    v15 = [v8 getAttribute:@"data-content-id"];
    v11->_productItemIdentifier = [v15 longLongValue];
  }
  return v11;
}

- (SKUIItem)productItem
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [NSNumber numberWithLongLong:self->_productItemIdentifier];
  [v3 setObject:v4 forKey:*MEMORY[0x1E4FA8770]];

  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__55;
  v41 = __Block_byref_object_dispose__55;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__55;
  v35 = __Block_byref_object_dispose__55;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__55;
  v29 = __Block_byref_object_dispose__55;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__55;
  v23 = __Block_byref_object_dispose__55;
  id v24 = 0;
  v5 = [(SKUIViewElement *)self firstChildForElementType:66];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__SKUIGiftTemplateViewElement_productItem__block_invoke;
  v18[3] = &unk_1E6427DE0;
  v18[4] = &v31;
  v18[5] = &v37;
  v18[6] = &v19;
  v18[7] = &v25;
  [v5 enumerateChildrenUsingBlock:v18];
  uint64_t v6 = v20[5];
  if (v6) {
    [v3 setObject:v6 forKey:*MEMORY[0x1E4FA8748]];
  }
  if ([(id)v26[5] count])
  {
    v7 = [(id)v26[5] firstObject];
    [v3 setObject:v7 forKey:*MEMORY[0x1E4FA8700]];
  }
  if ((unint64_t)[(id)v26[5] count] >= 2)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C978]);
    id v9 = [(id)v26[5] objectAtIndex:1];
    id v10 = objc_msgSend(v8, "initWithObjects:", v9, 0);

    [v3 setObject:v10 forKey:*MEMORY[0x1E4FA8750]];
  }
  if (v38[5])
  {
    v43[0] = v38[5];
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    [v3 setObject:v11 forKey:*MEMORY[0x1E4FA8710]];
  }
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", self->_productBuyParams, @"buyParams", 0);
  uint64_t v13 = v12;
  uint64_t v14 = v32[5];
  if (v14) {
    [v12 setObject:v14 forKey:@"priceFormatted"];
  }
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v13, 0);
  [v3 setObject:v15 forKey:*MEMORY[0x1E4FA8790]];
  v16 = [[SKUIItem alloc] initWithLookupDictionary:v3];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v16;
}

void __42__SKUIGiftTemplateViewElement_productItem__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 elementType];
  if (v4 > 76)
  {
    if (v4 == 77)
    {
      if (!*(void *)(*(void *)(a1[4] + 8) + 40))
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __42__SKUIGiftTemplateViewElement_productItem__block_invoke_2;
        v29[3] = &unk_1E6422498;
        v29[4] = a1[4];
        [v3 enumerateChildrenUsingBlock:v29];
      }
    }
    else if (v4 == 138)
    {
      id v21 = v3;
      id v10 = v21;
      if (*(void *)(*(void *)(a1[6] + 8) + 40) || [v21 labelViewStyle] != 5)
      {
        v28 = [v10 text];
        v20 = [v28 string];

        if (v20) {
          [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v20];
        }
      }
      else
      {
        v20 = [v10 text];
        uint64_t v22 = [v20 string];
        uint64_t v23 = *(void *)(a1[6] + 8);
        id v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;
      }
      goto LABEL_19;
    }
  }
  else if (v4 == 13)
  {
    if (!*(void *)(*(void *)(a1[4] + 8) + 40))
    {
      id v10 = [v3 buttonText];
      uint64_t v25 = [v10 string];
      uint64_t v26 = *(void *)(a1[4] + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

LABEL_20:
    }
  }
  else if (v4 == 49 && !*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v6 = *(void *)(a1[5] + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = v3;
    id v9 = [v8 URL];
    id v10 = v9;
    if (v9)
    {
      v11 = *(void **)(*(void *)(a1[5] + 8) + 40);
      v12 = [v9 absoluteString];
      [v11 setObject:v12 forKey:@"url"];
    }
    [v8 size];
    uint64_t v14 = (uint64_t)v13;
    [v8 size];
    double v16 = v15;

    objc_super v17 = *(void **)(*(void *)(a1[5] + 8) + 40);
    v18 = [NSNumber numberWithInteger:v14];
    [v17 setObject:v18 forKey:@"height"];

    uint64_t v19 = *(void **)(*(void *)(a1[5] + 8) + 40);
    v20 = [NSNumber numberWithInteger:(uint64_t)v16];
    [v19 setObject:v20 forKey:@"width"];
LABEL_19:

    goto LABEL_20;
  }
}

void __42__SKUIGiftTemplateViewElement_productItem__block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 elementType] | 0x80;
  uint64_t v4 = v10;
  if (v3 == 141)
  {
    id v5 = v10;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [v5 buttonText];
      uint64_t v7 = [v6 string];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    uint64_t v4 = v10;
  }
}

- (id)applyUpdatesWithElement:(id)a3
{
  uint64_t v4 = (SKUIGiftTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIGiftTemplateViewElement;
  id v5 = [(SKUIViewElement *)&v10 applyUpdatesWithElement:v4];
  uint64_t v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_giftType = [(SKUIGiftTemplateViewElement *)v4 giftType];
    uint64_t v7 = (NSString *)[(NSString *)v4->_productBuyParams copy];
    productBuyParams = self->_productBuyParams;
    self->_productBuyParams = v7;

    self->_productItemIdentifier = v4->_productItemIdentifier;
  }

  return v6;
}

- (int64_t)giftType
{
  return self->_giftType;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end