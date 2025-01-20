@interface WFLinkEnumerationParameter
- (Class)singleStateClass;
- (NSArray)displayImages;
- (WFLinkEnumerationParameter)initWithDefinition:(id)a3;
- (id)accessoryImageForPossibleState:(id)a3;
@end

@implementation WFLinkEnumerationParameter

- (WFLinkEnumerationParameter)initWithDefinition:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFLinkEnumerationParameter;
  v5 = [(WFEnumerationParameter *)&v16 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"ItemImages"];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = getWFGeneralLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v18 = "WFEnforceClass";
        __int16 v19 = 2114;
        id v20 = v8;
        __int16 v21 = 2114;
        v22 = v11;
        __int16 v23 = 2114;
        uint64_t v24 = v7;
        id v12 = v11;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      v9 = 0;
    }
    else
    {
      v9 = (NSArray *)v8;
    }

    displayImages = v5->_displayImages;
    v5->_displayImages = v9;

    v14 = v5;
  }

  return v5;
}

- (id)accessoryImageForPossibleState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFEnumerationParameter *)self possibleStates];
  if (v5)
  {
    v6 = (void *)v5;
    uint64_t v7 = [(WFLinkEnumerationParameter *)self displayImages];
    uint64_t v8 = [v7 count];
    v9 = [(WFEnumerationParameter *)self possibleStates];
    uint64_t v10 = [v9 count];

    if (v8 == v10)
    {
      v11 = [(WFEnumerationParameter *)self possibleStates];
      unint64_t v12 = [v11 indexOfObject:v4];

      v13 = [(WFLinkEnumerationParameter *)self displayImages];
      unint64_t v14 = [v13 count];

      if (v12 < v14)
      {
        v15 = [(WFLinkEnumerationParameter *)self displayImages];
        objc_super v16 = [v15 objectAtIndexedSubscript:v12];

        if (v16)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = v16;

            goto LABEL_9;
          }
        }
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)WFLinkEnumerationParameter;
  id v17 = [(WFEnumerationParameter *)&v19 accessoryImageForPossibleState:v4];
LABEL_9:

  return v17;
}

- (NSArray)displayImages
{
  return self->_displayImages;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

@end