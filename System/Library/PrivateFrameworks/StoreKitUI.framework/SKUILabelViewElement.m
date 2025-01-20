@interface SKUILabelViewElement
+ (BOOL)shouldParseChildDOMElements;
- (BOOL)containsLinks;
- (NSArray)badges;
- (NSArray)trailingBadges;
- (NSString)moreButtonTitle;
- (SKUILabelViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUILinkHandler)linkDelegate;
- (SKUIViewElementText)text;
- (id)_stringFromDateElement:(id)a3;
- (id)_stringFromDurationElement:(id)a3;
- (id)_stringFromNumberElement:(id)a3;
- (id)applyUpdatesWithElement:(id)a3;
- (id)uniquingMapKey;
- (int64_t)badgePlacement;
- (int64_t)labelViewStyle;
- (int64_t)numberOfLines;
- (int64_t)pageComponentType;
- (void)_createText:(id)a3;
- (void)_walkDOM:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (void)dealloc;
- (void)linkTapped:(id)a3 range:(_NSRange)a4;
- (void)setContainsLinks:(BOOL)a3;
- (void)setLinkDelegate:(id)a3;
@end

@implementation SKUILabelViewElement

- (SKUILabelViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v12) {
        -[SKUILabelViewElement initWithDOMElement:parent:elementFactory:](v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)SKUILabelViewElement;
  v20 = [(SKUIViewElement *)&v32 initWithDOMElement:v9 parent:v10 elementFactory:v11];
  if (v20)
  {
    v21 = [v9 tagName];
    v20->_labelViewStyle = SKUILabelViewStyleForString(v21);

    uint64_t v22 = [v9 getAttribute:@"moreLabel"];
    moreButtonTitle = v20->_moreButtonTitle;
    v20->_moreButtonTitle = (NSString *)v22;

    v24 = [v9 getAttribute:@"maxLines"];
    if ([v24 length]) {
      uint64_t v25 = [v24 integerValue];
    }
    else {
      uint64_t v25 = 1;
    }
    v20->_numberOfLines = v25;
    v20->_badgePlacement = 0;
    v26 = [v9 getAttribute:@"badgePlacement"];
    char v27 = [v26 isEqualToString:@"firstBaseline"];
    uint64_t v28 = 0;
    if ((v27 & 1) == 0)
    {
      if (![v26 isEqualToString:@"trailing"])
      {
LABEL_13:
        v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        domObjectsToViewElements = v20->_domObjectsToViewElements;
        v20->_domObjectsToViewElements = v29;

        [(SKUILabelViewElement *)v20 _walkDOM:v9 parent:v10 elementFactory:v11];
        objc_storeStrong((id *)&v20->_xml, a3);
        [(SKUILabelViewElement *)v20 _createText:v20->_xml];

        goto LABEL_14;
      }
      uint64_t v28 = 1;
    }
    v20->_badgePlacement = v28;
    goto LABEL_13;
  }
LABEL_14:

  return v20;
}

- (void)dealloc
{
  xml = self->_xml;
  if (xml)
  {
    v4 = [(SKUILabelViewElement *)self appDocument];
    SKUIViewElementTextDeadlockFix(xml, v4);

    v5 = self->_xml;
    self->_xml = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUILabelViewElement;
  [(SKUIViewElement *)&v6 dealloc];
}

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUILabelViewElement *)a3;
  v13.receiver = self;
  v13.super_class = (Class)SKUILabelViewElement;
  v5 = [(SKUIViewElement *)&v13 applyUpdatesWithElement:v4];
  if (v5 == self && v4 != self && v4 != 0)
  {
    self->_labelViewStyle = [(SKUILabelViewElement *)v4 labelViewStyle];
    v8 = [(SKUILabelViewElement *)v4 moreButtonTitle];
    moreButtonTitle = self->_moreButtonTitle;
    self->_moreButtonTitle = v8;

    self->_numberOfLines = [(SKUILabelViewElement *)v4 numberOfLines];
    id v10 = [(SKUILabelViewElement *)v4 text];
    text = self->_text;
    self->_text = v10;
  }

  return v5;
}

- (int64_t)pageComponentType
{
  return 5;
}

- (id)uniquingMapKey
{
  text = self->_text;
  if (text)
  {
    v3 = text;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SKUILabelViewElement;
    v3 = [(SKUIViewElement *)&v5 uniquingMapKey];
  }

  return v3;
}

- (SKUIViewElementText)text
{
  return self->_text;
}

- (void)linkTapped:(id)a3 range:(_NSRange)a4
{
  NSUInteger location = a4.location;
  objc_super v6 = [(IKTextParser *)self->_text attributedString];
  v7 = [v6 attribute:0x1F1C9A288 atIndex:location effectiveRange:&v9];

  if (v7)
  {
    v8 = [(NSMutableDictionary *)self->_linkToViewButtonElements objectForKey:v7];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v8 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:&__block_literal_global_68];
      }
    }
  }
}

- (void)_createText:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2(MEMORY[0x1E4F14428]);
  objc_super v5 = [MEMORY[0x1E4F1CA48] array];
  objc_super v6 = [MEMORY[0x1E4F1CA48] array];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__106;
  v19[4] = __Block_byref_object_dispose__106;
  id v20 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  objc_super v13 = __36__SKUILabelViewElement__createText___block_invoke;
  uint64_t v14 = &unk_1E642AF08;
  uint64_t v15 = self;
  id v7 = v5;
  id v16 = v7;
  id v8 = v6;
  id v17 = v8;
  uint64_t v18 = v19;
  uint64_t v9 = +[IKTextParser textWithDOMElement:v4 usingParseBlock:&v11];
  text = self->_text;
  self->_text = v9;

  if (objc_msgSend(v8, "count", v11, v12, v13, v14, v15)) {
    objc_storeStrong((id *)&self->_trailingBadges, v6);
  }
  if ([v7 count]) {
    objc_storeStrong((id *)&self->_badges, v5);
  }

  _Block_object_dispose(v19, 8);
}

__CFString *__36__SKUILabelViewElement__createText___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v62[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v8];
  id v10 = [*(id *)(*(void *)(a1 + 32) + 344) objectForKey:v9];
  uint64_t v11 = SKUILabelStringAttributesWithSpanElement(v10);
  uint64_t v12 = [v8 nodeName];
  if ([v12 isEqualToString:@"badge"])
  {
    id v13 = v7;
    *a4 = 1;
    id v14 = v10;
    uint64_t v15 = [[SKUIBadgeTextAttachment alloc] initWithViewElement:v14];
    if (v15)
    {
      [*(id *)(a1 + 40) addObject:v15];
      [*(id *)(a1 + 48) addObject:v15];
    }

    id v16 = 0;
    id v17 = 0;
    id v7 = v13;
    goto LABEL_19;
  }
  if ([v12 isEqualToString:@"button"])
  {
    id v51 = v7;
    *a4 = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 288) = 1;
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 312), *(id *)(a1 + 32));
    uint64_t v18 = NSString;
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)(v19 + 304);
    *(void *)(v19 + 304) = v20 + 1;
    v21 = objc_msgSend(v18, "stringWithFormat:", @"%li", v20);
    uint64_t v22 = *(void **)(*(void *)(a1 + 32) + 320);
    if (!v22)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = *(void **)(v24 + 320);
      *(void *)(v24 + 320) = v23;

      uint64_t v22 = *(void **)(*(void *)(a1 + 32) + 320);
    }
    [v22 setObject:v10 forKey:v21];
    v26 = [*(id *)(a1 + 32) _stringFromNumberElement:v8];
    char v27 = [v10 style];
    uint64_t v28 = [v27 ikColor];
    v29 = [v28 color];

    if (v29)
    {
      v61[0] = 0x1F1C9A2A8;
      v61[1] = 0x1F1C9A288;
      v62[0] = v29;
      v62[1] = v21;
      v30 = (void *)MEMORY[0x1E4F1C9E8];
      v31 = (void **)v62;
      objc_super v32 = v61;
      uint64_t v33 = 2;
    }
    else
    {
      uint64_t v59 = 0x1F1C9A288;
      v60 = v21;
      v30 = (void *)MEMORY[0x1E4F1C9E8];
      v31 = &v60;
      objc_super v32 = &v59;
      uint64_t v33 = 1;
    }
    v35 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:v33];
    id v17 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v26 attributes:v35];

    id v16 = 0;
    id v7 = v51;
    goto LABEL_19;
  }
  [*(id *)(a1 + 48) removeAllObjects];
  if ([v12 isEqualToString:@"number"])
  {
    *a4 = 1;
    uint64_t v34 = [*(id *)(a1 + 32) _stringFromNumberElement:v8];
LABEL_18:
    id v17 = (__CFString *)v34;
    id v16 = 0;
    goto LABEL_19;
  }
  if ([v12 isEqualToString:@"date"])
  {
    *a4 = 1;
    uint64_t v34 = [*(id *)(a1 + 32) _stringFromDateElement:v8];
    goto LABEL_18;
  }
  if ([v12 isEqualToString:@"duration"])
  {
    *a4 = 1;
    uint64_t v34 = [*(id *)(a1 + 32) _stringFromDurationElement:v8];
    goto LABEL_18;
  }
  if ([v12 isEqualToString:@"br"])
  {
    id v16 = 0;
    *a4 = 1;
    id v17 = @"\n";
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    uint64_t v37 = 0;
    if (![0 length])
    {
      if ([v12 isEqualToString:@"span"])
      {
        v48 = v12;
        v49 = v10;
        v50 = v9;
        id v52 = v7;
        [v8 childNodesAsArray];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v38 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v37 = 0;
          uint64_t v40 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v55 != v40) {
                objc_enumerationMutation(obj);
              }
              v42 = *(void **)(*((void *)&v54 + 1) + 8 * i);
              v43 = [v42 nodeName];
              int v44 = [v43 isEqualToString:@"#text"];

              if (v44)
              {
                if (!v37) {
                  uint64_t v37 = objc_opt_new();
                }
                v45 = [v42 textContent];
                uint64_t v46 = [(id)v37 stringByAppendingString:v45];

                *a4 = 0;
                uint64_t v37 = v46;
              }
            }
            uint64_t v39 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
          }
          while (v39);
        }
        else
        {
          uint64_t v37 = 0;
        }

        uint64_t v9 = v50;
        id v7 = v52;
        id v10 = v49;
        uint64_t v12 = v48;
      }
      else
      {
        uint64_t v37 = 0;
      }
    }
    if (v11 | v37)
    {
      v47 = &stru_1F1C879E8;
      if (v37) {
        v47 = (__CFString *)v37;
      }
      id v16 = v47;

      id v17 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16 attributes:v11];
    }
    else
    {
      id v16 = 0;
      id v17 = 0;
    }
  }
LABEL_19:

  return v17;
}

- (id)_stringFromDateElement:(id)a3
{
  id v3 = a3;
  if (!_stringFromDateElement__sOutputFormatter)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    objc_super v5 = (void *)_stringFromDateElement__sOutputFormatter;
    _stringFromDateElement__sOutputFormatter = (uint64_t)v4;

    [(id)_stringFromDateElement__sOutputFormatter setDateStyle:2];
    [(id)_stringFromDateElement__sOutputFormatter setTimeStyle:0];
  }
  objc_super v6 = [v3 textContent];
  id v7 = SKUIViewElementDateWithString(v6);
  if (v7)
  {
    id v8 = [(id)_stringFromDateElement__sOutputFormatter stringFromDate:v7];
  }
  else
  {
    id v8 = 0;
  }
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (id)_stringFromDurationElement:(id)a3
{
  id v3 = a3;
  if (!_stringFromDurationElement__sInputFormatter)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    objc_super v5 = (void *)_stringFromDurationElement__sInputFormatter;
    _stringFromDurationElement__sInputFormatter = (uint64_t)v4;
  }
  objc_super v6 = [v3 textContent];
  id v7 = [(id)_stringFromDurationElement__sInputFormatter numberFromString:v6];
  id v8 = v7;
  if (!v7)
  {
    id v17 = 0;
    goto LABEL_12;
  }
  uint64_t v9 = [v7 integerValue];
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = [v10 dateByAddingTimeInterval:(double)v9];
  uint64_t v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v13 = [v12 components:224 fromDate:v10 toDate:v11 options:0];
  if ([v13 hour] < 1)
  {
    id v14 = &_stringFromDurationElement__sOutputFormatter;
    id v15 = (id)_stringFromDurationElement__sOutputFormatter;
    if (!_stringFromDurationElement__sOutputFormatter)
    {
      uint64_t v16 = 192;
      goto LABEL_10;
    }
  }
  else
  {
    id v14 = &_stringFromDurationElement__sHourOutputFormatter;
    id v15 = (id)_stringFromDurationElement__sHourOutputFormatter;
    if (!_stringFromDurationElement__sHourOutputFormatter)
    {
      uint64_t v16 = 224;
LABEL_10:
      id v18 = objc_alloc_init(MEMORY[0x1E4F28C00]);
      id v19 = (id)*v14;
      *id v14 = (uint64_t)v18;

      [(id)*v14 setUnitsStyle:0];
      [(id)*v14 setZeroFormattingBehavior:0x10000];
      [(id)*v14 setFormattingContext:2];
      [(id)*v14 setAllowedUnits:v16];
      id v15 = (id)*v14;
    }
  }
  id v20 = v15;
  id v17 = [v20 stringFromDateComponents:v13];

LABEL_12:
  if (v17) {
    v21 = v17;
  }
  else {
    v21 = v6;
  }
  id v22 = v21;

  return v22;
}

- (id)_stringFromNumberElement:(id)a3
{
  id v3 = a3;
  if (!_stringFromNumberElement__sInputFormatter)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    objc_super v5 = (void *)_stringFromNumberElement__sInputFormatter;
    _stringFromNumberElement__sInputFormatter = (uint64_t)v4;
  }
  if (!_stringFromNumberElement__sOutputFormatter)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    id v7 = (void *)_stringFromNumberElement__sOutputFormatter;
    _stringFromNumberElement__sOutputFormatter = (uint64_t)v6;

    [(id)_stringFromNumberElement__sOutputFormatter setNumberStyle:1];
  }
  id v8 = [v3 textContent];
  uint64_t v9 = [(id)_stringFromNumberElement__sInputFormatter numberFromString:v8];
  if (v9)
  {
    id v10 = [(id)_stringFromNumberElement__sOutputFormatter stringFromNumber:v9];
  }
  else
  {
    id v10 = 0;
  }
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v8;
  }
  id v12 = v11;

  return v12;
}

- (void)_walkDOM:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 nodeName];
  if ([v11 isEqualToString:@"span"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || ([v11 isEqualToString:@"badge"] & 1) != 0
    || [v11 isEqualToString:@"button"])
  {
    id v12 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v8];
    id v13 = [v10 elementForDOMElement:v8 parent:v9];
    [(NSMutableDictionary *)self->_domObjectsToViewElements setObject:v13 forKey:v12];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = objc_msgSend(v8, "childNodesAsArray", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [(SKUILabelViewElement *)self _walkDOM:*(void *)(*((void *)&v19 + 1) + 8 * v18++) parent:v9 elementFactory:v10];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (NSArray)badges
{
  return self->_badges;
}

- (BOOL)containsLinks
{
  return self->_containsLinks;
}

- (void)setContainsLinks:(BOOL)a3
{
  self->_containsLinks = a3;
}

- (int64_t)labelViewStyle
{
  return self->_labelViewStyle;
}

- (SKUILinkHandler)linkDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkDelegate);

  return (SKUILinkHandler *)WeakRetained;
}

- (void)setLinkDelegate:(id)a3
{
}

- (NSString)moreButtonTitle
{
  return self->_moreButtonTitle;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (NSArray)trailingBadges
{
  return self->_trailingBadges;
}

- (int64_t)badgePlacement
{
  return self->_badgePlacement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xml, 0);
  objc_storeStrong((id *)&self->_trailingBadges, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_domObjectsToViewElements, 0);
  objc_storeStrong((id *)&self->_moreButtonTitle, 0);
  objc_storeStrong((id *)&self->_linkToViewButtonElements, 0);
  objc_destroyWeak((id *)&self->_linkDelegate);

  objc_storeStrong((id *)&self->_badges, 0);
}

- (void)initWithDOMElement:(uint64_t)a3 parent:(uint64_t)a4 elementFactory:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end