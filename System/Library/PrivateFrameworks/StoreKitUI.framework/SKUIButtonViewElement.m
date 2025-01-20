@interface SKUIButtonViewElement
- (BOOL)autoIncrementCount;
- (BOOL)isBigHitButton;
- (BOOL)isDisabledButSelectable;
- (BOOL)isEnabled;
- (BOOL)isSelected;
- (BOOL)isToggled;
- (BOOL)showOnDemand;
- (BOOL)suppressCloudRestore;
- (IKViewElementStyle)buttonTitleStyle;
- (NSString)badgeResourceName;
- (NSString)bundleIdentifier;
- (NSString)confirmationText;
- (NSString)nonToggledText;
- (NSString)playItemIdentifier;
- (NSString)sizeVariant;
- (NSString)toggleItemIdentifier;
- (NSString)toggledText;
- (NSString)variantIdentifier;
- (SKUIButtonViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIBuyButtonDescriptor)buyButtonDescriptor;
- (SKUIImageViewElement)additionalButtonImage;
- (SKUIImageViewElement)buttonImage;
- (SKUIStoreIdentifier)storeIdentifier;
- (SKUIViewElementText)buttonText;
- (double)bigHitSize;
- (id)_parseButtonText;
- (id)applyUpdatesWithElement:(id)a3;
- (id)description;
- (id)personalizationLibraryItems;
- (int64_t)buttonViewSubType;
- (int64_t)buttonViewType;
- (int64_t)dataPlaybackId;
- (int64_t)itemIdentifier;
- (int64_t)pageComponentType;
- (unint64_t)elementType;
- (void)dealloc;
- (void)setBuyButtonDescriptor:(id)a3;
- (void)setToggled:(BOOL)a3;
@end

@implementation SKUIButtonViewElement

- (SKUIButtonViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
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
        -[SKUIButtonViewElement initWithDOMElement:parent:elementFactory:](v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
  v82.receiver = self;
  v82.super_class = (Class)SKUIButtonViewElement;
  v20 = [(SKUIViewElement *)&v82 initWithDOMElement:v9 parent:v10 elementFactory:v11];
  if (v20)
  {
    id v70 = v11;
    id v71 = v10;
    v21 = [v9 getAttribute:@"type"];
    v20->_buttonViewType = SKUIButtonViewTypeForString(v21);

    v22 = [v9 getAttribute:@"sub-type"];
    unsigned int v23 = [v22 isEqualToString:@"toggle"];

    v20->_buttonViewSubType = v23;
    uint64_t v24 = [v9 getAttribute:@"size-variant"];
    sizeVariant = v20->_sizeVariant;
    v20->_sizeVariant = (NSString *)v24;

    uint64_t v26 = [v9 getAttribute:@"confirm-text"];
    confirmationText = v20->_confirmationText;
    v20->_confirmationText = (NSString *)v26;

    v28 = [v9 getAttribute:@"data-content-id"];
    v20->_itemIdentifier = [v28 longLongValue];

    v29 = [[SKUIStoreIdentifier alloc] initWithLongLong:v20->_itemIdentifier];
    storeIdentifier = v20->_storeIdentifier;
    v20->_storeIdentifier = v29;

    objc_storeStrong((id *)&v20->_xml, a3);
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2020000000;
    char v81 = 0;
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __66__SKUIButtonViewElement_initWithDOMElement_parent_elementFactory___block_invoke;
    v77[3] = &unk_1E6422498;
    v77[4] = &v78;
    [(SKUIViewElement *)v20 enumerateChildrenUsingBlock:v77];
    if (!*((unsigned char *)v79 + 24))
    {
      uint64_t v31 = [(SKUIButtonViewElement *)v20 _parseButtonText];
      buttonText = v20->_buttonText;
      v20->_buttonText = (SKUIViewElementText *)v31;
    }
    v74 = [v9 getAttribute:@"data-feed-url"];
    if ([v74 length]) {
      [(SKUIStoreIdentifier *)v20->_storeIdentifier setPodcastFeedURLIdentifier:v74];
    }
    uint64_t v33 = [v9 getAttribute:@"bundle-id"];
    bundleIdentifier = v20->_bundleIdentifier;
    v20->_bundleIdentifier = (NSString *)v33;

    if ([(NSString *)v20->_bundleIdentifier length]) {
      [(SKUIStoreIdentifier *)v20->_storeIdentifier setBundleIdentifier:v20->_bundleIdentifier];
    }
    v35 = [v9 getAttribute:@"selected"];
    v20->_selected = [v35 BOOLValue];

    v72 = [v9 getAttribute:@"badge"];
    if (v72)
    {
      v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v72];
      uint64_t v37 = [v36 host];
      badgeResourceName = v20->_badgeResourceName;
      v20->_badgeResourceName = (NSString *)v37;
    }
    v39 = [v9 getAttribute:@"disabled"];
    v69 = v39;
    if ([v39 length]) {
      int v40 = [v39 BOOLValue] ^ 1;
    }
    else {
      LOBYTE(v40) = -1;
    }
    v20->_enabled = v40;
    v41 = [v9 getAttribute:@"data-type"];
    v75 = [v9 getAttribute:@"data-variant"];
    if ([v41 length])
    {
      v76 = v41;
      if (([(__CFString *)v76 isEqualToString:@"redownload"] & 1) != 0
        || ([(__CFString *)v76 isEqualToString:@"get"] & 1) != 0
        || ([(__CFString *)v76 isEqualToString:@"preorder"] & 1) != 0
        || ([(__CFString *)v76 isEqualToString:@"purchased"] & 1) != 0)
      {
      }
      else
      {
        int v68 = [(__CFString *)v76 isEqualToString:@"update"];

        if (!v68) {
          goto LABEL_26;
        }
      }
      v76 = @"buy";
    }
    else
    {
      v76 = 0;
    }

LABEL_26:
    if ([v75 length] && !objc_msgSend(v75, "isEqualToString:", @"PLUS"))
    {
      if (v76 && v75)
      {
        uint64_t v44 = [[NSString alloc] initWithFormat:@"%@_%@", v76, v75, v69];
        variantIdentifier = v20->_variantIdentifier;
        v20->_variantIdentifier = (NSString *)v44;
        goto LABEL_34;
      }
    }
    else
    {

      v75 = 0;
    }
    if (!v76)
    {
LABEL_35:
      if (v20->_buttonViewType == 12)
      {
        uint64_t v45 = [v9 getAttribute:@"data-content-id"];
        playItemIdentifier = v20->_playItemIdentifier;
        v20->_playItemIdentifier = (NSString *)v45;
      }
      if (v20->_buttonViewSubType == 1)
      {
        uint64_t v47 = [v9 getAttribute:@"toggled-text"];
        toggledText = v20->_toggledText;
        v20->_toggledText = (NSString *)v47;

        uint64_t v49 = [v9 getAttribute:@"non-toggled-text"];
        nonToggledText = v20->_nonToggledText;
        v20->_nonToggledText = (NSString *)v49;
      }
      v73 = [v9 getAttribute:@"big-hit-size"];
      if ([v73 length] && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v73 floatValue];
        v20->_bigHitSize = v51;
      }
      v52 = [v9 getAttribute:@"big-hit"];
      if ([v52 length])
      {
        v53 = [v52 lowercaseString];
        v20->_bigHitButton = [v53 isEqualToString:@"true"];
      }
      v54 = [v9 getAttribute:@"show-on-demand"];
      if ([v54 length])
      {
        v55 = [v54 lowercaseString];
        v20->_showOnDemand = [v55 isEqualToString:@"true"];
      }
      v56 = [v9 getAttribute:@"toggled"];
      if ([v56 length])
      {
        v57 = [v56 lowercaseString];
        v20->_toggled = [v57 isEqualToString:@"true"];
      }
      v58 = [v9 getAttribute:@"toggle-id"];
      if ([v58 length])
      {
        uint64_t v59 = [v9 getAttribute:@"toggle-id"];
        toggleItemIdentifier = v20->_toggleItemIdentifier;
        v20->_toggleItemIdentifier = (NSString *)v59;
      }
      v61 = [v9 getAttribute:@"auto-increment-count"];
      if ([v61 length])
      {
        v62 = [v61 lowercaseString];
        v20->_autoIncrementCount = [v62 isEqualToString:@"true"];
      }
      v63 = [v9 getAttribute:@"disabled-but-selectable"];
      if ([v63 length])
      {
        v64 = [v63 lowercaseString];
        v20->_disabledButSelectable = [v64 isEqualToString:@"true"];
      }
      v65 = [v9 getAttribute:@"suppress-cloud-restore"];
      if ([v65 length])
      {
        v66 = [v65 lowercaseString];
        v20->_suppressCloudRestore = [v66 isEqualToString:@"true"];
      }
      _Block_object_dispose(&v78, 8);
      id v11 = v70;
      id v10 = v71;
      goto LABEL_57;
    }
    v42 = v76;
    variantIdentifier = v20->_variantIdentifier;
    v20->_variantIdentifier = &v42->isa;
LABEL_34:

    goto LABEL_35;
  }
LABEL_57:

  return v20;
}

void __66__SKUIButtonViewElement_initWithDOMElement_parent_elementFactory___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  if ([v7 elementType] == 138)
  {
    v5 = [v7 elementName];
    int v6 = [v5 isEqualToString:@"span"];

    if (v6)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

- (void)dealloc
{
  xml = self->_xml;
  if (xml)
  {
    v4 = [(SKUIButtonViewElement *)self appDocument];
    SKUIViewElementTextDeadlockFix(xml, v4);

    v5 = self->_xml;
    self->_xml = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIButtonViewElement;
  [(SKUIViewElement *)&v6 dealloc];
}

- (SKUIImageViewElement)buttonImage
{
  return (SKUIImageViewElement *)[(SKUIViewElement *)self firstChildForElementType:49];
}

- (SKUIImageViewElement)additionalButtonImage
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__53;
  id v9 = __Block_byref_object_dispose__53;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SKUIButtonViewElement_additionalButtonImage__block_invoke;
  v4[3] = &unk_1E64224C0;
  v4[4] = v11;
  v4[5] = &v5;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(v11, 8);

  return (SKUIImageViewElement *)v2;
}

void __46__SKUIButtonViewElement_additionalButtonImage__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if ([a2 elementType] == 49)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(unsigned char *)(v6 + 24))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }
    else
    {
      *(unsigned char *)(v6 + 24) = 1;
    }
  }
}

- (SKUIViewElementText)buttonText
{
  buttonText = self->_buttonText;
  if (!buttonText)
  {
    v4 = [(SKUIButtonViewElement *)self _parseButtonText];
    uint64_t v5 = self->_buttonText;
    self->_buttonText = v4;

    buttonText = self->_buttonText;
  }

  return buttonText;
}

- (IKViewElementStyle)buttonTitleStyle
{
  id v2 = [(SKUIViewElement *)self firstChildForElementType:138];
  v3 = v2;
  if (v2
    && ([v2 elementName],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isEqualToString:@"span"],
        v4,
        (v5 & 1) == 0))
  {
    uint64_t v6 = [v3 style];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (IKViewElementStyle *)v6;
}

- (SKUIBuyButtonDescriptor)buyButtonDescriptor
{
  unint64_t v3 = [(SKUIButtonViewElement *)self buttonViewType] - 2;
  if (v3 <= 7 && ((0x87u >> v3) & 1) != 0)
  {
    uint64_t v5 = qword_1C1CCBEB0[v3];
    buyButtonDescriptor = self->_buyButtonDescriptor;
    if (!buyButtonDescriptor)
    {
      uint64_t v7 = objc_alloc_init(SKUIBuyButtonDescriptor);
      v8 = self->_buyButtonDescriptor;
      self->_buyButtonDescriptor = v7;

      buyButtonDescriptor = self->_buyButtonDescriptor;
    }
    [(SKUIBuyButtonDescriptor *)buyButtonDescriptor setButtonType:v5];
    id v9 = self->_buyButtonDescriptor;
    id v10 = [(SKUIButtonViewElement *)self buttonText];
    id v11 = [v10 string];
    [(SKUIBuyButtonDescriptor *)v9 setButtonText:v11];

    char v12 = self->_buyButtonDescriptor;
    uint64_t v13 = [(SKUIButtonViewElement *)self confirmationText];
    [(SKUIBuyButtonDescriptor *)v12 setConfirmationText:v13];

    [(SKUIBuyButtonDescriptor *)self->_buyButtonDescriptor setElementType:[(SKUIButtonViewElement *)self elementType]];
    [(SKUIBuyButtonDescriptor *)self->_buyButtonDescriptor setItemIdentifier:[(SKUIButtonViewElement *)self itemIdentifier]];
    uint64_t v14 = self->_buyButtonDescriptor;
    uint64_t v15 = [(SKUIButtonViewElement *)self storeIdentifier];
    [(SKUIBuyButtonDescriptor *)v14 setStoreIdentifier:v15];

    uint64_t v16 = self->_buyButtonDescriptor;
    uint64_t v17 = [(SKUIButtonViewElement *)self variantIdentifier];
    [(SKUIBuyButtonDescriptor *)v16 setVariantIdentifier:v17];

    [(SKUIBuyButtonDescriptor *)self->_buyButtonDescriptor setShouldSuppressCloudRestore:[(SKUIButtonViewElement *)self suppressCloudRestore]];
    v4 = self->_buyButtonDescriptor;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIButtonViewElement *)a3;
  v26.receiver = self;
  v26.super_class = (Class)SKUIButtonViewElement;
  uint64_t v5 = [(SKUIViewElement *)&v26 applyUpdatesWithElement:v4];
  uint64_t v6 = v5;
  if (v4 == self || v5 != self)
  {
    if (v5 == self) {
      goto LABEL_7;
    }
    bundleIdentifier = [(SKUIButtonViewElement *)self buyButtonDescriptor];
    [(SKUIButtonViewElement *)v4 setBuyButtonDescriptor:bundleIdentifier];
  }
  else
  {
    uint64_t v7 = [(SKUIButtonViewElement *)v4 badgeResourceName];
    badgeResourceName = self->_badgeResourceName;
    self->_badgeResourceName = v7;

    id v9 = [(SKUIButtonViewElement *)v4 buttonText];
    buttonText = self->_buttonText;
    self->_buttonText = v9;

    self->_buttonViewType = [(SKUIButtonViewElement *)v4 buttonViewType];
    id v11 = [(SKUIButtonViewElement *)v4 buyButtonDescriptor];
    buyButtonDescriptor = self->_buyButtonDescriptor;
    self->_buyButtonDescriptor = v11;

    uint64_t v13 = [(SKUIButtonViewElement *)v4 confirmationText];
    confirmationText = self->_confirmationText;
    self->_confirmationText = v13;

    self->_enabled = v4->_enabled;
    self->_itemIdentifier = [(SKUIButtonViewElement *)v4 itemIdentifier];
    uint64_t v15 = [(SKUIButtonViewElement *)v4 nonToggledText];
    nonToggledText = self->_nonToggledText;
    self->_nonToggledText = v15;

    self->_selected = [(SKUIButtonViewElement *)v4 isSelected];
    uint64_t v17 = [(SKUIButtonViewElement *)v4 storeIdentifier];
    storeIdentifier = self->_storeIdentifier;
    self->_storeIdentifier = v17;

    uint64_t v19 = [(SKUIButtonViewElement *)v4 toggledText];
    toggledText = self->_toggledText;
    self->_toggledText = v19;

    v21 = [(SKUIButtonViewElement *)v4 variantIdentifier];
    variantIdentifier = self->_variantIdentifier;
    self->_variantIdentifier = v21;

    unsigned int v23 = [(SKUIButtonViewElement *)v4 bundleIdentifier];
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v23;
  }

LABEL_7:

  return v6;
}

- (id)description
{
  unint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SKUIButtonViewElement;
  v4 = [(SKUIButtonViewElement *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: Type: %ld, ID: %lld, Variant: %@", v4, self->_buttonViewType, self->_itemIdentifier, self->_variantIdentifier];

  return v5;
}

- (unint64_t)elementType
{
  unint64_t v2 = self->_buttonViewType - 2;
  if (v2 > 7) {
    return 12;
  }
  else {
    return qword_1C1CCBEF0[v2];
  }
}

- (BOOL)isEnabled
{
  int enabled = self->_enabled;
  if (enabled != 255) {
    return enabled != 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIButtonViewElement;
  return [(SKUIViewElement *)&v4 isEnabled];
}

- (int64_t)pageComponentType
{
  return 24;
}

- (id)personalizationLibraryItems
{
  if (self->_itemIdentifier)
  {
    unint64_t v3 = objc_alloc_init(SKUILibraryItem);
    [(SKUILibraryItem *)v3 setStoreIdentifier:self->_storeIdentifier];
    objc_super v4 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (id)_parseButtonText
{
  xml = self->_xml;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__SKUIButtonViewElement__parseButtonText__block_invoke;
  v5[3] = &unk_1E64242C0;
  v5[4] = self;
  unint64_t v3 = +[IKTextParser textWithDOMElement:xml usingParseBlock:v5];

  return v3;
}

id __41__SKUIButtonViewElement__parseButtonText__block_invoke(uint64_t a1, uint64_t a2, void *a3, BOOL *a4)
{
  id v6 = a3;
  objc_super v7 = [v6 nodeName];
  int v8 = [v7 isEqual:@"span"];

  if (v8)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [v6 getAttribute:*MEMORY[0x1E4F6EE70]];
    id v11 = [v9 elementWithIdentifier:v10];

    if (v11)
    {
      char v12 = SKUILabelStringAttributesWithSpanElement(v11);
      id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v14 = [v6 textContent];
      uint64_t v15 = (void *)[v13 initWithString:v14 attributes:v12];
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  *a4 = v15 == 0;

  return v15;
}

- (BOOL)autoIncrementCount
{
  return self->_autoIncrementCount;
}

- (BOOL)isBigHitButton
{
  return self->_bigHitButton;
}

- (double)bigHitSize
{
  return self->_bigHitSize;
}

- (void)setBuyButtonDescriptor:(id)a3
{
}

- (int64_t)buttonViewType
{
  return self->_buttonViewType;
}

- (int64_t)buttonViewSubType
{
  return self->_buttonViewSubType;
}

- (NSString)confirmationText
{
  return self->_confirmationText;
}

- (NSString)nonToggledText
{
  return self->_nonToggledText;
}

- (NSString)toggledText
{
  return self->_toggledText;
}

- (NSString)badgeResourceName
{
  return self->_badgeResourceName;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (SKUIStoreIdentifier)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)dataPlaybackId
{
  return self->_dataPlaybackId;
}

- (NSString)playItemIdentifier
{
  return self->_playItemIdentifier;
}

- (NSString)sizeVariant
{
  return self->_sizeVariant;
}

- (BOOL)showOnDemand
{
  return self->_showOnDemand;
}

- (NSString)toggleItemIdentifier
{
  return self->_toggleItemIdentifier;
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (BOOL)isDisabledButSelectable
{
  return self->_disabledButSelectable;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isToggled
{
  return self->_toggled;
}

- (void)setToggled:(BOOL)a3
{
  self->_toggled = a3;
}

- (BOOL)suppressCloudRestore
{
  return self->_suppressCloudRestore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleItemIdentifier, 0);
  objc_storeStrong((id *)&self->_sizeVariant, 0);
  objc_storeStrong((id *)&self->_playItemIdentifier, 0);
  objc_storeStrong((id *)&self->_xml, 0);
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong((id *)&self->_toggleItemIdentfier, 0);
  objc_storeStrong((id *)&self->_toggledText, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_nonToggledText, 0);
  objc_storeStrong((id *)&self->_confirmationText, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptor, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);

  objc_storeStrong((id *)&self->_badgeResourceName, 0);
}

- (void)initWithDOMElement:(uint64_t)a3 parent:(uint64_t)a4 elementFactory:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end