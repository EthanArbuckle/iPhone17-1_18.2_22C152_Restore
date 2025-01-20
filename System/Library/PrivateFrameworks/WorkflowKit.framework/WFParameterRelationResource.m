@interface WFParameterRelationResource
+ (BOOL)mustBeAvailableForDisplay;
- (NSArray)comparedValues;
- (NSString)parameterKey;
- (NSString)relation;
- (WFAction)action;
- (WFParameter)parameter;
- (WFParameterRelationResource)initWithParameterKey:(id)a3 parameterValues:(id)a4 relation:(id)a5;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)refreshAvailability;
- (void)setAction:(id)a3;
- (void)setParameter:(id)a3;
- (void)setupWithAction:(id)a3 parameter:(id)a4;
@end

@implementation WFParameterRelationResource

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parameter);
  objc_destroyWeak((id *)&self->_action);
}

- (void)setParameter:(id)a3
{
}

- (WFParameter)parameter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parameter);
  return (WFParameter *)WeakRetained;
}

- (void)setAction:(id)a3
{
}

- (WFAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAction *)WeakRetained;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5 = a4;
  v6 = [(WFParameterRelationResource *)self parameterKey];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    [(WFResource *)self refreshAvailabilityWithNotification];
  }
}

- (void)refreshAvailability
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v3 = [(WFParameterRelationResource *)self action];
  v4 = v3;
  if (!v3)
  {
    [(WFResource *)self updateAvailability:0 withError:0];
    goto LABEL_79;
  }
  if ([v3 isRunning]
    && ([v4 processedParameters], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = [v4 processedParameters];
    int v7 = [(WFParameterRelationResource *)self parameterKey];
    id v8 = [v6 objectForKey:v7];
  }
  else
  {
    v6 = [(WFParameterRelationResource *)self parameterKey];
    v9 = [v4 serializedParameterStateForKey:v6];
    if (!v9)
    {
      v11 = [(WFParameterRelationResource *)self parameter];
      v10 = [v11 defaultSerializedRepresentation];

      int v7 = 0;
      goto LABEL_10;
    }
    id v8 = v9;
    int v7 = v8;
  }
  v10 = v8;
LABEL_10:

  v12 = [(WFParameterRelationResource *)self parameter];
  id v13 = v10;
  id v14 = v12;
  v15 = v14;
  if (v14)
  {
    if ([v14 conformsToProtocol:&unk_1F234F128]) {
      id v14 = v15;
    }
    else {
      id v14 = 0;
    }
  }
  uint64_t v16 = [v14 codableAttribute];
  if (v16
    && (v17 = (void *)v16,
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v17,
        (isKindOfClass & 1) != 0))
  {
    id v19 = [v13 valueForKeyPath:@"identifier"];
  }
  else
  {
    id v19 = v13;
  }
  v20 = v19;

  v21 = [(WFParameterRelationResource *)self relation];
  if ([v21 isEqualToString:@"??"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v22 = [v20 length] == 0;
    }
    else {
      BOOL v22 = v20 == 0;
    }
    BOOL v29 = !v22;
    goto LABEL_35;
  }
  if ([v21 isEqualToString:@"!="])
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v23 = [(WFParameterRelationResource *)self comparedValues];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v52 != v26) {
            objc_enumerationMutation(v23);
          }
          if ([v20 isEqual:*(void *)(*((void *)&v51 + 1) + 8 * i)])
          {
            v30 = self;
            uint64_t v31 = 0;
            goto LABEL_77;
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }

    v28 = self;
    BOOL v29 = 1;
    goto LABEL_36;
  }
  if ([v21 isEqualToString:@"nil"])
  {
    BOOL v29 = v20 == 0;
LABEL_35:
    v28 = self;
    goto LABEL_36;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v23 = [(WFParameterRelationResource *)self comparedValues];
  uint64_t v32 = [v23 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (!v32) {
    goto LABEL_75;
  }
  uint64_t v33 = v32;
  uint64_t v34 = *(void *)v48;
  while (2)
  {
    for (uint64_t j = 0; j != v33; ++j)
    {
      if (*(void *)v48 != v34) {
        objc_enumerationMutation(v23);
      }
      v36 = *(void **)(*((void *)&v47 + 1) + 8 * j);
      if (objc_msgSend(v21, "isEqualToString:", @">", v44))
      {
        if ([v20 compare:v36] == 1) {
          goto LABEL_76;
        }
        continue;
      }
      if ([v21 isEqualToString:@">="])
      {
        if ([v20 compare:v36] == 1) {
          goto LABEL_76;
        }
LABEL_50:
        if ([v20 isEqual:v36]) {
          goto LABEL_76;
        }
        continue;
      }
      if ([v21 isEqualToString:@"<"])
      {
        if ([v20 compare:v36] == -1) {
          goto LABEL_76;
        }
      }
      else if ([v21 isEqualToString:@"<="])
      {
        if ([v20 compare:v36] == -1 || objc_msgSend(v20, "isEqual:", v36)) {
          goto LABEL_76;
        }
      }
      else
      {
        if (![v21 isEqualToString:@"⊃"]) {
          goto LABEL_50;
        }
        id v37 = v36;
        if (v37)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v38 = v37;
          }
          else {
            v38 = 0;
          }
        }
        else
        {
          v38 = 0;
        }
        id v39 = v38;

        if ([v39 length])
        {
          v44 = v39;
          id v40 = v20;
          id v45 = v37;
          if (v20)
          {
            v41 = v40;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v42 = v41;
            }
            else {
              v42 = 0;
            }
          }
          else
          {
            v42 = 0;
            v41 = v40;
          }
          id v43 = v42;

          char v46 = [v43 containsString:v45];
          if (v46)
          {
LABEL_76:
            v30 = self;
            uint64_t v31 = 1;
LABEL_77:
            -[WFResource updateAvailability:withError:](v30, "updateAvailability:withError:", v31, 0, v44);

            goto LABEL_78;
          }
        }
        else
        {
        }
      }
    }
    uint64_t v33 = [v23 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v33) {
      continue;
    }
    break;
  }
LABEL_75:

  v28 = self;
  BOOL v29 = 0;
LABEL_36:
  -[WFResource updateAvailability:withError:](v28, "updateAvailability:withError:", v29, 0, v44);
LABEL_78:

LABEL_79:
}

- (void)setupWithAction:(id)a3 parameter:(id)a4
{
  obuint64_t j = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 key];
    v10 = [(WFParameterRelationResource *)self parameterKey];
    char v11 = [v9 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"WFParameterRelationResource.m" lineNumber:82 description:@"Parameter key of relation resource must match the key of the parameter passed to setupWithAction:parameter:"];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  [WeakRetained removeEventObserver:self];

  objc_storeWeak((id *)&self->_action, obj);
  objc_storeWeak((id *)&self->_parameter, v8);
  [obj addEventObserver:self];
  [(WFResource *)self invalidateAvailability];
}

- (NSString)relation
{
  v2 = [(WFResource *)self definition];
  v3 = [v2 objectForKey:@"WFParameterRelation"];

  return (NSString *)v3;
}

- (NSString)parameterKey
{
  v2 = [(WFResource *)self definition];
  v3 = [v2 objectForKey:@"WFParameterKey"];

  return (NSString *)v3;
}

- (NSArray)comparedValues
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WFResource *)self definition];
  v4 = [v3 objectForKey:@"WFParameterValues"];

  id v5 = [(WFResource *)self definition];
  v6 = [v5 objectForKey:@"WFParameterValue"];

  if (v4)
  {
    id v7 = v4;
LABEL_5:
    id v8 = v7;
    goto LABEL_6;
  }
  if (v6)
  {
    v10[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    goto LABEL_5;
  }
  id v8 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_6:

  return (NSArray *)v8;
}

- (WFParameterRelationResource)initWithParameterKey:(id)a3 parameterValues:(id)a4 relation:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v16[0] = @"WFParameterKey";
  v16[1] = @"WFParameterValues";
  v17[0] = a3;
  v17[1] = a4;
  v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = a4;
  id v11 = a3;
  v12 = [v9 dictionaryWithObjects:v17 forKeys:v16 count:2];

  id v13 = (void *)[v12 mutableCopy];
  if (v8) {
    [v13 setObject:v8 forKeyedSubscript:@"WFParameterRelation"];
  }
  id v14 = [(WFResource *)self initWithDefinition:v13];

  return v14;
}

@end