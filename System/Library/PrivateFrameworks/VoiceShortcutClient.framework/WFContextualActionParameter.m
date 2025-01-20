@interface WFContextualActionParameter
+ (BOOL)supportsSecureCoding;
- (BOOL)isActionInput;
- (BOOL)isAskEachTime;
- (BOOL)isEqual:(id)a3;
- (NSString)displayString;
- (NSString)type;
- (NSString)wfParameterKey;
- (WFContextualActionParameter)initWithCoder:(id)a3;
- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 askEachTime:(BOOL)a6;
- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 askEachTime:(BOOL)a6 askEachTimeCollectionFilter:(id)a7;
- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 isActionInput:(BOOL)a6;
- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 wfSerializedRepresentation:(id)a6;
- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 wfSerializedRepresentation:(id)a6 askEachTime:(BOOL)a7 askEachTimeCollectionFilter:(id)a8 actionInput:(BOOL)a9;
- (WFDisambiguationCollectionFilter)askEachTimeCollectionFilter;
- (WFPropertyListObject)wfSerializedRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContextualActionParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_askEachTimeCollectionFilter, 0);
  objc_storeStrong((id *)&self->_wfSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_wfParameterKey, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (BOOL)isActionInput
{
  return self->_actionInput;
}

- (WFDisambiguationCollectionFilter)askEachTimeCollectionFilter
{
  return self->_askEachTimeCollectionFilter;
}

- (BOOL)isAskEachTime
{
  return self->_askEachTime;
}

- (WFPropertyListObject)wfSerializedRepresentation
{
  return self->_wfSerializedRepresentation;
}

- (NSString)wfParameterKey
{
  return self->_wfParameterKey;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (NSString)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  type = self->_type;
  id v5 = a3;
  [v5 encodeObject:type forKey:@"type"];
  [v5 encodeObject:self->_displayString forKey:@"displayString"];
  [v5 encodeObject:self->_wfParameterKey forKey:@"wfParameterKey"];
  [v5 encodeObject:self->_wfSerializedRepresentation forKey:@"wfSerializedRepresentation"];
  [v5 encodeBool:self->_askEachTime forKey:@"askEachTime"];
  [v5 encodeObject:self->_askEachTimeCollectionFilter forKey:@"askEachTimeCollectionFilter"];
  [v5 encodeBool:self->_actionInput forKey:@"actionInput"];
}

- (WFContextualActionParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wfParameterKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayString"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"askEachTimeCollectionFilter"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"wfSerializedRepresentation"];

  uint64_t v15 = [v4 decodeBoolForKey:@"askEachTime"];
  char v16 = [v4 decodeBoolForKey:@"actionInput"];

  if (v5)
  {
    LOBYTE(v20) = v16;
    v17 = (void *)v21;
    self = [(WFContextualActionParameter *)self initWithType:v5 displayString:v6 wfParameterKey:v21 wfSerializedRepresentation:v14 askEachTime:v15 askEachTimeCollectionFilter:v7 actionInput:v20];
    v18 = self;
  }
  else
  {
    v18 = 0;
    v17 = (void *)v21;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFContextualActionParameter *)a3;
  id v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_48:

      goto LABEL_49;
    }
    v7 = [(WFContextualActionParameter *)v6 type];
    v8 = [(WFContextualActionParameter *)self type];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_46;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_47:

        goto LABEL_48;
      }
    }
    char v16 = [(WFContextualActionParameter *)v6 wfParameterKey];
    v17 = [(WFContextualActionParameter *)self wfParameterKey];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_45;
      }
      int v21 = [v14 isEqualToString:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    v22 = [(WFContextualActionParameter *)v6 displayString];
    v23 = [(WFContextualActionParameter *)self displayString];
    id v20 = v22;
    id v24 = v23;
    v19 = v24;
    id v46 = v20;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24) {
        goto LABEL_44;
      }
      int v12 = [v20 isEqualToString:v24];

      if (!v12) {
        goto LABEL_45;
      }
    }
    v44 = v19;
    v26 = [(WFContextualActionParameter *)v6 wfSerializedRepresentation];
    v27 = [(WFContextualActionParameter *)self wfSerializedRepresentation];
    id v20 = v26;
    id v28 = v27;
    id v29 = v20;
    v45 = v28;
    if (v20 != v28)
    {
      LOBYTE(v12) = 0;
      if (v20)
      {
        v30 = v28;
        if (v28)
        {
          int v31 = [v20 isEqual:v28];

          if (!v31) {
            goto LABEL_31;
          }
LABEL_30:
          BOOL v32 = [(WFContextualActionParameter *)v6 isAskEachTime];
          if (v32 != [(WFContextualActionParameter *)self isAskEachTime])
          {
LABEL_31:
            LOBYTE(v12) = 0;
LABEL_43:
            v19 = v44;
            v25 = v45;
LABEL_44:

            id v20 = v46;
LABEL_45:

            goto LABEL_46;
          }
          v33 = [(WFContextualActionParameter *)v6 askEachTimeCollectionFilter];
          v34 = [(WFContextualActionParameter *)self askEachTimeCollectionFilter];
          id v35 = v33;
          id v36 = v34;
          v43 = v35;
          if (v35 == v36)
          {
            id v42 = v36;
          }
          else
          {
            if (!v35 || !v36)
            {
              id v39 = v36;

              v30 = v39;
              LOBYTE(v12) = 0;
              id v29 = v20;
              id v20 = v43;
              goto LABEL_42;
            }
            v37 = v36;
            int v41 = [v43 isEqual:v36];
            id v42 = v37;

            if (!v41)
            {
              LOBYTE(v12) = 0;
LABEL_40:
              id v29 = v20;
              v30 = v42;
              id v20 = v43;
              goto LABEL_42;
            }
          }
          BOOL v38 = [(WFContextualActionParameter *)v6 isActionInput];
          int v12 = v38 ^ [(WFContextualActionParameter *)self isActionInput] ^ 1;
          goto LABEL_40;
        }
      }
      else
      {
        v30 = v28;
        id v20 = 0;
      }
LABEL_42:

      id v20 = v29;
      goto LABEL_43;
    }

    goto LABEL_30;
  }
  LOBYTE(v12) = 1;
LABEL_49:

  return v12;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = [(WFContextualActionParameter *)self type];

  if (v4)
  {
    id v5 = [(WFContextualActionParameter *)self type];
    id v6 = (id)[v3 combineContentsOfPropertyListObject:v5];
  }
  v7 = [(WFContextualActionParameter *)self wfParameterKey];

  if (v7)
  {
    v8 = [(WFContextualActionParameter *)self wfParameterKey];
    id v9 = (id)[v3 combineContentsOfPropertyListObject:v8];
  }
  id v10 = [(WFContextualActionParameter *)self displayString];

  if (v10)
  {
    uint64_t v11 = [(WFContextualActionParameter *)self displayString];
    id v12 = (id)[v3 combineContentsOfPropertyListObject:v11];
  }
  v13 = [(WFContextualActionParameter *)self wfSerializedRepresentation];

  if (v13)
  {
    id v14 = [(WFContextualActionParameter *)self wfSerializedRepresentation];
    id v15 = (id)[v3 combineContentsOfPropertyListObject:v14];
  }
  id v16 = (id)objc_msgSend(v3, "combineBool:", -[WFContextualActionParameter isAskEachTime](self, "isAskEachTime"));
  v17 = [(WFContextualActionParameter *)self askEachTimeCollectionFilter];

  if (v17)
  {
    id v18 = [(WFContextualActionParameter *)self askEachTimeCollectionFilter];
    id v19 = (id)[v3 combineContentsOfPropertyListObject:v18];
  }
  id v20 = (id)objc_msgSend(v3, "combineBool:", -[WFContextualActionParameter isActionInput](self, "isActionInput"));
  unint64_t v21 = [v3 finalize];

  return v21;
}

- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 isActionInput:(BOOL)a6
{
  LOBYTE(v7) = a6;
  return [(WFContextualActionParameter *)self initWithType:a3 displayString:a4 wfParameterKey:a5 wfSerializedRepresentation:0 askEachTime:0 askEachTimeCollectionFilter:0 actionInput:v7];
}

- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 askEachTime:(BOOL)a6 askEachTimeCollectionFilter:(id)a7
{
  LOBYTE(v8) = 0;
  return [(WFContextualActionParameter *)self initWithType:a3 displayString:a4 wfParameterKey:a5 wfSerializedRepresentation:0 askEachTime:a6 askEachTimeCollectionFilter:a7 actionInput:v8];
}

- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 askEachTime:(BOOL)a6
{
  LOBYTE(v7) = 0;
  return [(WFContextualActionParameter *)self initWithType:a3 displayString:a4 wfParameterKey:a5 wfSerializedRepresentation:0 askEachTime:a6 askEachTimeCollectionFilter:0 actionInput:v7];
}

- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 wfSerializedRepresentation:(id)a6
{
  LOBYTE(v7) = 0;
  return [(WFContextualActionParameter *)self initWithType:a3 displayString:a4 wfParameterKey:a5 wfSerializedRepresentation:a6 askEachTime:0 askEachTimeCollectionFilter:0 actionInput:v7];
}

- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 wfSerializedRepresentation:(id)a6 askEachTime:(BOOL)a7 askEachTimeCollectionFilter:(id)a8 actionInput:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  if (!v16)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"WFContextualActionParameter.m", 25, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];
  }
  v31.receiver = self;
  v31.super_class = (Class)WFContextualActionParameter;
  unint64_t v21 = [(WFContextualActionParameter *)&v31 init];
  if (v21)
  {
    uint64_t v22 = [v16 copy];
    type = v21->_type;
    v21->_type = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    displayString = v21->_displayString;
    v21->_displayString = (NSString *)v24;

    uint64_t v26 = [v18 copy];
    wfParameterKey = v21->_wfParameterKey;
    v21->_wfParameterKey = (NSString *)v26;

    objc_storeStrong((id *)&v21->_wfSerializedRepresentation, a6);
    v21->_askEachTime = a7;
    objc_storeStrong((id *)&v21->_askEachTimeCollectionFilter, a8);
    v21->_actionInput = a9;
    id v28 = v21;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end