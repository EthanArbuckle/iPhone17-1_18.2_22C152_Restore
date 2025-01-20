@interface WFCodableAttributeBackedSubstitutableState
+ (id)processingValueClasses;
- (INCodableAttribute)codableAttribute;
- (INStringLocalizer)stringLocalizer;
- (NSString)readableSubtitle;
- (NSString)readableTitle;
- (WFCodableAttributeBackedSubstitutableState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFCodableAttributeBackedSubstitutableState)initWithValue:(id)a3 codableAttribute:(id)a4 stringLocalizer:(id)a5;
- (id)serializedRepresentation;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
- (void)resizeDisplayImageIfNecessary:(id)a3;
- (void)setReadableSubtitle:(id)a3;
- (void)setReadableTitle:(id)a3;
@end

@implementation WFCodableAttributeBackedSubstitutableState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringLocalizer, 0);
  objc_storeStrong((id *)&self->_codableAttribute, 0);
  objc_storeStrong((id *)&self->_readableSubtitle, 0);
  objc_storeStrong((id *)&self->_readableTitle, 0);
}

- (INStringLocalizer)stringLocalizer
{
  return self->_stringLocalizer;
}

- (INCodableAttribute)codableAttribute
{
  return self->_codableAttribute;
}

- (void)setReadableSubtitle:(id)a3
{
}

- (void)setReadableTitle:(id)a3
{
}

- (void)resizeDisplayImageIfNecessary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 displayImage];
  if (v4)
  {
    v5 = [v3 displayImage];
    v6 = [v5 _imageData];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      v8 = [v3 displayImage];
      CFDataRef v9 = [v8 _imageData];

      CGImageSourceRef v10 = CGImageSourceCreateWithData(v9, 0);
      if (v10)
      {
        v11 = v10;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __76__WFCodableAttributeBackedSubstitutableState_resizeDisplayImageIfNecessary___block_invoke;
        aBlock[3] = &__block_descriptor_40_e5_v8__0l;
        aBlock[4] = v10;
        v12 = (void (**)(void))_Block_copy(aBlock);
        CFStringRef Type = CGImageSourceGetType(v11);
        if (Type)
        {
          v14 = [MEMORY[0x1E4F442D8] typeWithIdentifier:Type];
          if (v14)
          {
            WFImageSizeFromImageSource();
            if (v16 >= 100.0 || v15 >= 100.0)
            {
              v17 = [MEMORY[0x1E4FB4718] typeWithUTType:v14];
              v18 = WFResizedImageFromImageSource();

              v19 = [v18 data];
              if ([v19 length])
              {
                v20 = [MEMORY[0x1E4F304C0] imageWithImageData:v19];
                [v3 setDisplayImage:v20];
              }
              else
              {
                v20 = getWFGeneralLogObject();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v23 = "-[WFCodableAttributeBackedSubstitutableState resizeDisplayImageIfNecessary:]";
                  _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_FAULT, "%s Unable to resize oversized display image provided by custom intent.", buf, 0xCu);
                }
              }
            }
          }
        }
        v12[2](v12);
      }
    }
  }
}

void __76__WFCodableAttributeBackedSubstitutableState_resizeDisplayImageIfNecessary___block_invoke(uint64_t a1)
{
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  CFDataRef v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  v11 = [v8 parameter];
  v12 = [v11 codableAttribute];

  v13 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v13)
  {
    v14 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      double v15 = [v14 prompt];
      v9[2](v9, v15, 0);
    }
    else
    {

      double v16 = [(WFVariableSubstitutableParameterState *)self variable];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __103__WFCodableAttributeBackedSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v18[3] = &unk_1E6556C08;
      id v20 = v10;
      id v19 = v12;
      [v16 getContentWithContext:v8 completionHandler:v18];

      v14 = v20;
    }
  }
  else
  {
    v17 = [(WFVariableSubstitutableParameterState *)self value];
    v14 = objc_msgSend(v12, "wf_processedParameterValueForValue:", v17);

    (*((void (**)(id, void *, void))v10 + 2))(v10, v14, 0);
  }
}

void __103__WFCodableAttributeBackedSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v4 = [*(id *)(a1 + 32) supportsDynamicEnumeration] ^ 1;
    }
    else {
      char v4 = 0;
    }
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "wf_contentItemClass");
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __103__WFCodableAttributeBackedSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v6[3] = &unk_1E6555060;
    id v8 = *(id *)(a1 + 40);
    char v9 = v4;
    id v7 = v3;
    [v7 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __103__WFCodableAttributeBackedSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7 && !v9)
  {
    v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_7:
    v11();
    goto LABEL_8;
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__WFCodableAttributeBackedSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3;
  v13[3] = &unk_1E6558C90;
  v12 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  [v12 getStringRepresentation:v13];

LABEL_8:
}

void __103__WFCodableAttributeBackedSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  if (v10)
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F30568];
    id v6 = a3;
    id v7 = (id)[[v5 alloc] initWithIdentifier:0 displayString:v10];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void (**)(uint64_t, void, id))(v8 + 16);
    id v7 = a3;
    v9(v8, 0, v7);
  }
}

- (id)serializedRepresentation
{
  id v3 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v3)
  {
    id v4 = [(WFVariableSubstitutableParameterState *)self variable];
    uint64_t v5 = WFSerializedVariableObject(v4);
  }
  else
  {
    id v6 = [(WFVariableSubstitutableParameterState *)self value];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(WFCodableAttributeBackedSubstitutableState *)self resizeDisplayImageIfNecessary:v6];
      }
    }

    id v4 = objc_alloc_init(MEMORY[0x1E4F30520]);
    id v7 = [(WFVariableSubstitutableParameterState *)self value];
    uint64_t v8 = [(WFCodableAttributeBackedSubstitutableState *)self codableAttribute];
    uint64_t v5 = [v4 encodeObject:v7 withCodableAttribute:v8];
  }
  return v5;
}

- (WFCodableAttributeBackedSubstitutableState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = WFDeserializedVariableObject(v8, v9, v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self = [(WFVariableSubstitutableParameterState *)self initWithVariable:v11];
      v12 = self;
      goto LABEL_14;
    }
  }
  id v13 = v10;
  id v14 = v13;
  if (v13)
  {
    if ([v13 conformsToProtocol:&unk_1F234F128]) {
      double v15 = v14;
    }
    else {
      double v15 = 0;
    }
  }
  else
  {
    double v15 = 0;
  }
  id v16 = v15;

  v11 = [v16 codableAttribute];
  v17 = [v16 stringLocalizer];

  id v18 = objc_alloc_init(MEMORY[0x1E4F30518]);
  id v19 = [v18 decodeWithCodableAttribute:v11 from:v8];
  if (v19)
  {
    self = [(WFCodableAttributeBackedSubstitutableState *)self initWithValue:v19 codableAttribute:v11 stringLocalizer:v17];
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

LABEL_14:
  return v12;
}

- (WFCodableAttributeBackedSubstitutableState)initWithValue:(id)a3 codableAttribute:(id)a4 stringLocalizer:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFCodableAttributeBackedSubstitutableState;
  v11 = [(WFVariableSubstitutableParameterState *)&v15 initWithValue:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_codableAttribute, a4);
    objc_storeStrong((id *)&v12->_stringLocalizer, a5);
    id v13 = v12;
  }

  return v12;
}

- (NSString)readableSubtitle
{
  readableSubtitle = self->_readableSubtitle;
  if (!readableSubtitle)
  {
    id v4 = [(WFVariableSubstitutableParameterState *)self value];
    uint64_t v5 = [(WFCodableAttributeBackedSubstitutableState *)self stringLocalizer];
    id v6 = v5;
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
    }
    id v7 = [(WFCodableAttributeBackedSubstitutableState *)self codableAttribute];
    id v8 = [v7 metadata];
    objc_msgSend(v4, "_intents_readableSubtitleWithLocalizer:metadata:", v6, v8);
    id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v10 = self->_readableSubtitle;
    self->_readableSubtitle = v9;

    if (!v5) {
    readableSubtitle = self->_readableSubtitle;
    }
  }
  return readableSubtitle;
}

- (NSString)readableTitle
{
  readableTitle = self->_readableTitle;
  if (!readableTitle)
  {
    id v4 = [(WFVariableSubstitutableParameterState *)self value];
    uint64_t v5 = [(WFCodableAttributeBackedSubstitutableState *)self stringLocalizer];
    id v6 = v5;
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
    }
    id v7 = [(WFCodableAttributeBackedSubstitutableState *)self codableAttribute];
    id v8 = [v7 metadata];
    objc_msgSend(v4, "_intents_readableTitleWithLocalizer:metadata:", v6, v8);
    id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v10 = self->_readableTitle;
    self->_readableTitle = v9;

    if (!v5) {
    readableTitle = self->_readableTitle;
    }
  }
  return readableTitle;
}

+ (id)processingValueClasses
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  return v2;
}

@end