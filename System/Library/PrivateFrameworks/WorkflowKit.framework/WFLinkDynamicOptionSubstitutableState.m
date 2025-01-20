@interface WFLinkDynamicOptionSubstitutableState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5 bundleIdentifier:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)stateIsEquivalent:(id)a3;
- (BOOL)valueNeedsDisplayRepresentation;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (WFImage)image;
- (WFLinkDynamicOptionSubstitutableState)initWithValue:(id)a3 localizedTitle:(id)a4 localizedSubtitle:(id)a5 image:(id)a6;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFLinkDynamicOptionSubstitutableState

- (NSString)localizedTitle
{
  if (![(NSString *)self->_localizedTitle length])
  {
    v3 = [(WFVariableSubstitutableParameterState *)self value];
    v4 = [v3 title];
    objc_msgSend(v4, "wf_localizedString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedTitle = self->_localizedTitle;
    self->_localizedTitle = v5;
  }
  v7 = self->_localizedTitle;
  return v7;
}

- (NSString)localizedSubtitle
{
  if (![(NSString *)self->_localizedSubtitle length])
  {
    v3 = [(WFVariableSubstitutableParameterState *)self value];
    v4 = [v3 subtitle];
    objc_msgSend(v4, "wf_localizedString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedSubtitle = self->_localizedSubtitle;
    self->_localizedSubtitle = v5;
  }
  v7 = self->_localizedSubtitle;
  return v7;
}

- (WFImage)image
{
  image = self->_image;
  if (!image)
  {
    v4 = [(WFVariableSubstitutableParameterState *)self value];
    v5 = [v4 image];
    objc_msgSend(v5, "wf_image");
    v6 = (WFImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_image;
    self->_image = v6;

    image = self->_image;
  }
  return image;
}

- (WFLinkDynamicOptionSubstitutableState)initWithValue:(id)a3 localizedTitle:(id)a4 localizedSubtitle:(id)a5 image:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)WFLinkDynamicOptionSubstitutableState;
  v13 = [(WFVariableSubstitutableParameterState *)&v22 initWithValue:a3];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    localizedTitle = v13->_localizedTitle;
    v13->_localizedTitle = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    localizedSubtitle = v13->_localizedSubtitle;
    v13->_localizedSubtitle = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    image = v13->_image;
    v13->_image = (WFImage *)v18;

    v20 = v13;
  }

  return v13;
}

- (BOOL)valueNeedsDisplayRepresentation
{
  v3 = [(WFVariableSubstitutableParameterState *)self value];
  v4 = [v3 value];
  v5 = [v4 valueType];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(WFVariableSubstitutableParameterState *)self value];
    v7 = [v6 value];
    v8 = [v7 displayRepresentation];
    BOOL v9 = v8 == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"WFLinkDynamicOptionSubstitutableState.m", 81, @"Invalid parameter not satisfying: %@", @"[option isKindOfClass:[LNDynamicOption class]]" object file lineNumber description];
  }
  int v6 = [v5 containsSensitiveContent];
  v7 = (void *)MEMORY[0x1E4F1CA60];
  v8 = [v5 value];
  BOOL v9 = [v8 wfSerializedRepresentation];
  id v10 = [v7 dictionaryWithDictionary:v9];

  if (v6)
  {
    [v10 removeObjectForKey:@"title"];
    [v10 removeObjectForKey:@"symbol"];
    [v10 removeObjectForKey:@"image"];
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (BOOL)stateIsEquivalent:(id)a3
{
  id v4 = a3;
  id v5 = [(WFVariableSubstitutableParameterState *)self value];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v6 = v5;
    }
    else {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
  }
  id v7 = v6;

  v8 = [v4 value];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v9 = v8;
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  id v10 = v9;

  LOBYTE(v11) = 0;
  if (v7 && v10)
  {
    id v12 = [v7 value];
    v13 = [v10 value];
    char v14 = [v12 isEqual:v13];

    if (v14)
    {
      LOBYTE(v11) = 1;
      goto LABEL_103;
    }
    v15 = [v7 value];
    uint64_t v16 = [v15 valueType];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [v7 value];
      uint64_t v18 = [v17 valueType];
      v19 = [v10 value];
      v20 = [v19 valueType];
      int v21 = [v18 isEqual:v20];

      if (v21)
      {
        objc_super v22 = [v7 value];
        v23 = [v22 value];

        v24 = [v10 value];
        v25 = [v24 value];

        if (([v23 isTransient] & 1) == 0 && (objc_msgSend(v25, "isTransient") & 1) == 0)
        {
          uint64_t v26 = [v23 identifier];
          if (v26)
          {
            v27 = (void *)v26;
            v28 = [v25 identifier];

            if (v28)
            {
              id v29 = [v23 identifier];
              v30 = [v25 identifier];
              LOBYTE(v11) = [v29 isEqual:v30];
              goto LABEL_100;
            }
          }
        }
        if ([v23 isTransient] && objc_msgSend(v25, "isTransient"))
        {
          v47 = [v23 properties];
          v48 = [v25 properties];
          id v29 = v47;
          id v49 = v48;
          v30 = v49;
          if (v29 == v49)
          {
          }
          else
          {
            LOBYTE(v11) = 0;
            v50 = v49;
            id v46 = v29;
            if (!v29 || !v49) {
              goto LABEL_98;
            }
            int v11 = [v29 isEqualToArray:v49];

            if (!v11) {
              goto LABEL_100;
            }
          }
          v76 = [v23 managedAccountIdentifier];
          v77 = [v25 managedAccountIdentifier];
          id v46 = v76;
          id v78 = v77;
          v91 = v78;
          if (v46 != v78)
          {
            LOBYTE(v11) = 0;
            if (v46)
            {
              v79 = v78;
              id v80 = v46;
              if (v78)
              {
                int v11 = [v46 isEqualToString:v78];

                if (!v11) {
                  goto LABEL_97;
                }
                goto LABEL_86;
              }
            }
            else
            {
              v79 = v78;
              id v80 = 0;
            }
LABEL_96:

LABEL_97:
            v50 = v91;
LABEL_98:

            goto LABEL_99;
          }

LABEL_86:
          v84 = [v23 prototypeMangledTypeName];
          v85 = [v25 prototypeMangledTypeName];
          id v80 = v84;
          id v86 = v85;
          v79 = v86;
          if (v80 == v86)
          {
            LOBYTE(v11) = 1;
          }
          else
          {
            LOBYTE(v11) = 0;
            if (v80 && v86) {
              LOBYTE(v11) = [v80 isEqualToString:v86];
            }
          }

          goto LABEL_96;
        }
LABEL_54:
        LOBYTE(v11) = 0;
LABEL_102:

        goto LABEL_103;
      }
    }
    else
    {
    }
    v31 = [v7 value];
    v32 = [v31 valueType];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [v7 value];
      v34 = [v33 valueType];
      if ([v34 typeIdentifier] == 13)
      {
        v35 = [v7 value];
        v36 = [v35 valueType];
        v37 = [v10 value];
        v38 = [v37 valueType];
        int v89 = [v36 isEqual:v38];

        if (v89)
        {
          v39 = [v7 value];
          v23 = [v39 value];

          v40 = [v10 value];
          v25 = [v40 value];

          uint64_t v41 = [v23 type];
          if (v41 != [v25 type]) {
            goto LABEL_54;
          }
          v42 = [v23 name];
          v43 = [v25 name];
          id v29 = v42;
          id v44 = v43;
          v30 = v44;
          if (v29 == v44)
          {
          }
          else
          {
            LOBYTE(v11) = 0;
            v45 = v44;
            id v46 = v29;
            if (!v29 || !v44)
            {
LABEL_92:

LABEL_99:
              goto LABEL_100;
            }
            int v11 = [v29 isEqualToString:v44];

            if (!v11) {
              goto LABEL_100;
            }
          }
          v81 = [v23 identificationHint];
          v82 = [v25 identificationHint];
          id v46 = v81;
          id v83 = v82;
          v45 = v83;
          if (v46 == v83)
          {
            LOBYTE(v11) = 1;
          }
          else
          {
            LOBYTE(v11) = 0;
            if (v46 && v83) {
              LOBYTE(v11) = [v46 isEqualToString:v83];
            }
          }

          goto LABEL_92;
        }
LABEL_41:
        v51 = [v7 value];
        v52 = [v51 valueType];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v53 = [v7 value];
          v30 = [v53 valueType];
          if ([v30 typeIdentifier] == 12)
          {
            v54 = [v7 value];
            v55 = [v54 valueType];
            v56 = [v10 value];
            v57 = [v56 valueType];
            LODWORD(v88) = [v55 isEqual:v57];

            if (v88)
            {
              v58 = [v7 value];
              v23 = [v58 value];

              v59 = [v10 value];
              v25 = [v59 value];

              id v29 = [v23 fileURL];
              if (v29 || ([v25 fileURL], (v30 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v60 = [v23 filename];
                if (!v60 || ([v25 filename], (uint64_t v88 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  v71 = [v23 fileURL];
                  v72 = [v25 fileURL];
                  id v73 = v71;
                  id v74 = v72;
                  v75 = v74;
                  if (v73 == v74)
                  {
                    LOBYTE(v11) = 1;
                  }
                  else
                  {
                    LOBYTE(v11) = 0;
                    if (v73 && v74) {
                      LOBYTE(v11) = [v73 isEqual:v74];
                    }
                  }

                  v61 = (void *)v88;
                  if (!v60)
                  {
LABEL_77:

                    if (v29)
                    {
LABEL_101:

                      goto LABEL_102;
                    }
LABEL_100:

                    goto LABEL_101;
                  }
                }
                else
                {
                  v61 = 0;
                  LOBYTE(v11) = 0;
                }

                goto LABEL_77;
              }
              id v29 = 0;
LABEL_53:
              LOBYTE(v11) = 0;
              goto LABEL_100;
            }
LABEL_51:
            v23 = [v7 value];
            v25 = [v23 valueType];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_54;
            }
            id v29 = [v7 value];
            v30 = [v29 valueType];
            if (![v30 typeIdentifier])
            {
              v62 = [v7 value];
              v63 = [v62 valueType];
              v64 = [v10 value];
              v65 = [v64 valueType];
              int v90 = [v63 isEqual:v65];

              if (!v90)
              {
                LOBYTE(v11) = 0;
                goto LABEL_103;
              }
              v66 = [v7 value];
              v67 = [v66 value];

              v68 = [v7 value];
              v69 = [v68 value];

              id v29 = v67;
              id v70 = v69;
              if (v29 == v70)
              {
                LOBYTE(v11) = 1;
                v30 = v29;
                v25 = v29;
              }
              else
              {
                v30 = v70;
                LOBYTE(v11) = 0;
                if (v29 && v70) {
                  LOBYTE(v11) = [v29 isEqualToString:v70];
                }
                v25 = v30;
              }
              v23 = v29;
              goto LABEL_100;
            }
            goto LABEL_53;
          }
        }
        goto LABEL_51;
      }
    }
    goto LABEL_41;
  }
LABEL_103:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(WFVariableSubstitutableParameterState *)self value];
  if ([v3 containsSensitiveContent])
  {
    v9.receiver = self;
    v9.super_class = (Class)WFLinkDynamicOptionSubstitutableState;
    unint64_t v4 = [(WFVariableSubstitutableParameterState *)&v9 hash];
    id v5 = [v3 value];
    int v6 = [v5 displayRepresentation];
    unint64_t v7 = [v6 hash] ^ v4;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFLinkDynamicOptionSubstitutableState;
    unint64_t v7 = [(WFVariableSubstitutableParameterState *)&v10 hash];
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(WFVariableSubstitutableParameterState *)self value];
  if ([v5 containsSensitiveContent])
  {
    id v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unint64_t v7 = v6;
      }
      else {
        unint64_t v7 = 0;
      }
    }
    else
    {
      unint64_t v7 = 0;
    }
    id v9 = v7;

    objc_super v10 = [v9 value];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v11 = v10;
      }
      else {
        int v11 = 0;
      }
    }
    else
    {
      int v11 = 0;
    }
    id v12 = v11;

    v21.receiver = self;
    v21.super_class = (Class)WFLinkDynamicOptionSubstitutableState;
    if ([(WFVariableSubstitutableParameterState *)&v21 isEqual:v6])
    {
      v13 = [v5 value];
      char v14 = [v13 displayRepresentation];
      v15 = [v12 value];
      uint64_t v16 = [v15 displayRepresentation];
      id v17 = v14;
      id v18 = v16;
      v19 = v18;
      if (v17 == v18)
      {
        unsigned __int8 v8 = 1;
      }
      else
      {
        unsigned __int8 v8 = 0;
        if (v17 && v18) {
          unsigned __int8 v8 = [v17 isEqual:v18];
        }
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)WFLinkDynamicOptionSubstitutableState;
    unsigned __int8 v8 = [(WFVariableSubstitutableParameterState *)&v22 isEqual:v4];
  }

  return v8;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  int v11 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v11)
  {
    id v12 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = [v12 prompt];
      v9[2](v9, v13, 0);
    }
    else
    {

      char v14 = [v8 parameter];
      v15 = [v14 parameterMetadata];
      uint64_t v16 = [v15 valueType];

      uint64_t v17 = objc_msgSend(v16, "wf_objectClass");
      id v18 = [(WFVariableSubstitutableParameterState *)self variable];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v22[3] = &unk_1E6553BB0;
      id v25 = v10;
      uint64_t v26 = v17;
      id v23 = v16;
      id v24 = v14;
      id v19 = v14;
      id v12 = v16;
      [v18 getContentWithContext:v8 completionHandler:v22];
    }
  }
  else
  {
    v20 = [(WFVariableSubstitutableParameterState *)self value];
    objc_super v21 = [v20 value];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v21, 0);
  }
}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 numberOfItems])
  {
    unint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "wf_objectValueType");
    id v8 = [v5 items];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v13[3] = &unk_1E6553B88;
    uint64_t v16 = *(void *)(a1 + 56);
    id v14 = *(id *)(a1 + 40);
    id v15 = v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_11;
    v10[3] = &unk_1E6558040;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 48);
    id v9 = v7;
    objc_msgSend(v8, "if_flatMapAsynchronously:completionHandler:", v13, v10);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v6;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = [v9 displayRepresentation];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3;
  v15[3] = &unk_1E6553B60;
  uint64_t v21 = *(void *)(a1 + 48);
  id v16 = *(id *)(a1 + 32);
  id v17 = v6;
  id v20 = v7;
  id v18 = v10;
  id v19 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = v10;
  id v13 = v7;
  id v14 = v6;
  [v14 getObjectRepresentations:v15 forClass:v11];
}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v9;
  }
  else
  {
    id v6 = [v9 firstObject];
  }
  id v7 = v6;
  if (v5) {
    id v8 = 0;
  }
  else {
    id v8 = v6;
  }
  (*(void (**)(void, id, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v8, v5);
}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 domain];
  uint64_t v11 = *MEMORY[0x1E4F5AB08];
  if ([v10 isEqualToString:*MEMORY[0x1E4F5AB08]] && !objc_msgSend(v9, "code"))
  {
    uint64_t v15 = *(void *)(a1 + 72);
    uint64_t v16 = objc_opt_class();

    if (v15 == v16)
    {
      id v17 = [*(id *)(a1 + 32) parameterMetadata];
      int v18 = objc_msgSend(v17, "wf_isPersistentFileIdentifiableEntity");

      id v19 = *(void **)(a1 + 40);
      if (v18)
      {
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4;
        v38[3] = &unk_1E65586C8;
        id v39 = *(id *)(a1 + 64);
        [v19 getFileRepresentations:v38 forType:0];
        id v14 = v39;
      }
      else
      {
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_6;
        v35[3] = &unk_1E6553AC0;
        id v37 = *(id *)(a1 + 64);
        id v36 = v9;
        [v19 getObjectRepresentations:v35 forClass:objc_opt_class()];

        id v14 = v37;
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v12 = [v9 domain];
  if ([v12 isEqualToString:v11] && !objc_msgSend(v9, "code"))
  {
    uint64_t v20 = *(void *)(a1 + 72);
    uint64_t v21 = objc_opt_class();

    if (v20 == v21)
    {
      objc_super v22 = [*(id *)(a1 + 32) parameterMetadata];
      id v23 = [v22 typeSpecificMetadata];
      id v24 = [v23 objectForKeyedSubscript:@"LNValueTypeSpecificMetadataKeyLinkEnumerationMetadata"];

      id v25 = *(void **)(a1 + 40);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_8;
      v31[3] = &unk_1E6553B10;
      id v34 = *(id *)(a1 + 64);
      id v32 = v9;
      id v33 = v24;
      id v26 = v24;
      [v25 getObjectRepresentations:v31 forClass:objc_opt_class()];

      goto LABEL_11;
    }
  }
  else
  {
  }
  if (!v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_11;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_10;
  v27[3] = &unk_1E6553B38;
  id v28 = *(id *)(a1 + 48);
  id v29 = v8;
  id v30 = *(id *)(a1 + 56);
  id v13 = objc_msgSend(v7, "if_map:", v27);
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

  id v14 = v28;
LABEL_9:

LABEL_11:
}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "if_map:", &__block_literal_global_43779);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_6(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "if_compactMap:", &__block_literal_global_193);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

void __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_8(uint64_t a1, void *a2)
{
  if (a2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_9;
    v6[3] = &unk_1E6553AE8;
    id v7 = *(id *)(a1 + 40);
    id v4 = objc_msgSend(a2, "if_compactMap:", v6);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

id __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  if (!v6)
  {
    id v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F72DA0]);
      id v10 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
      uint64_t v11 = (void *)[v9 initWithKey:v10 table:0 bundleURL:0];

      id v6 = (id)[objc_alloc(MEMORY[0x1E4F72C00]) initWithTitle:v11 subtitle:0 image:0];
    }
    else
    {
      id v6 = 0;
    }
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F72E10]) initWithValue:v5 valueType:*(void *)(a1 + 48) displayRepresentation:v6];

  return v12;
}

id __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F72E10];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = objc_alloc(MEMORY[0x1E4F72CC0]);
  id v7 = [*(id *)(a1 + 32) identifier];
  id v8 = (void *)[v6 initWithEnumerationIdentifier:v7];
  id v9 = (void *)[v5 initWithValue:v4 valueType:v8];

  return v9;
}

id __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F72E10];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [MEMORY[0x1E4F72D18] stringValueType];
  id v6 = (void *)[v4 initWithValue:v3 valueType:v5];

  return v6;
}

id __98__WFLinkDynamicOptionSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend(MEMORY[0x1E4F30420], "wf_fileWithFileRepresentation:displayName:", a2, 0);
  id v3 = objc_alloc(MEMORY[0x1E4F72E10]);
  id v4 = [MEMORY[0x1E4F72CB8] fileValueType];
  id v5 = (void *)[v3 initWithValue:v2 valueType:v4];

  return v5;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5 bundleIdentifier:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v9;
    }
    else {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }
  id v14 = v13;
  id v15 = v11;
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = v16;

  int v18 = [v17 parameterMetadata];
  id v19 = [v18 valueType];

  if (!v19)
  {
    uint64_t v21 = [v14 objectForKeyedSubscript:@"valueType"];
    if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      objc_super v22 = 0;
      goto LABEL_26;
    }
    id v19 = v21;
  }
  id v20 = v14;
  if (!v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v20 = 0;
    }
    else {
      id v20 = v9;
    }
  }
  id v23 = [MEMORY[0x1E4F72E10] valueFromSerializedRepresentation:v20 valueType:v19 variableProvider:v10 parameter:v15 bundleIdentifier:v12];
  if (v23)
  {
    objc_super v22 = (void *)[objc_alloc(MEMORY[0x1E4F72C08]) initWithValue:v23 indentationLevel:0];
    [v17 dataSource];
    id v30 = v9;
    id v24 = v14;
    id v25 = v12;
    v27 = id v26 = v10;
    objc_msgSend(v22, "setContainsSensitiveContent:", objc_msgSend(v27, "enumeration:shouldStripSenstitiveContentFromValue:", v17, v22));

    id v10 = v26;
    id v12 = v25;
    id v14 = v24;
    id v9 = v30;
  }
  else
  {
    id v28 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v32 = "+[WFLinkDynamicOptionSubstitutableState valueFromSerializedRepresentation:variableProvider:parameter:bundleIdentifier:]";
      _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_ERROR, "%s Failed to deserialize dynamic option value", buf, 0xCu);
    }

    objc_super v22 = 0;
  }

LABEL_26:
  return v22;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  return (id)[a1 valueFromSerializedRepresentation:a3 variableProvider:a4 parameter:a5 bundleIdentifier:0];
}

@end