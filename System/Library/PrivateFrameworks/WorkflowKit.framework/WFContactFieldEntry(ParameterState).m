@interface WFContactFieldEntry(ParameterState)
- (id)initWithSerializedRepresentation:()ParameterState variableProvider:parameter:;
- (id)serializedRepresentation;
- (uint64_t)containedVariables;
- (void)processWithContext:()ParameterState userInputRequiredHandler:valueHandler:;
@end

@implementation WFContactFieldEntry(ParameterState)

- (uint64_t)containedVariables
{
  return MEMORY[0x1E4F1CBF0];
}

- (void)processWithContext:()ParameterState userInputRequiredHandler:valueHandler:
{
  v7 = a5;
  id v8 = [a1 underlyingObject];
  ((void (**)(void, id, void))a5)[2](v7, v8, 0);
}

- (id)serializedRepresentation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if ([a1 type])
  {
    v2 = [a1 underlyingObject];
    if ([v2 conformsToProtocol:&unk_1F2335D88])
    {
      id v3 = [v2 wfSerializedRepresentation];
    }
    else
    {
      id v3 = v2;
    }
    v4 = v3;
    if (v3)
    {
      v8[0] = @"EntryType";
      v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "type"));
      v8[1] = @"SerializedEntry";
      v9[0] = v6;
      v9[1] = v4;
      v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v2 = [a1 contact];
    v4 = [v2 wfSerializedRepresentation];
    v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5ABC8]];
  }

  return v5;
}

- (id)initWithSerializedRepresentation:()ParameterState variableProvider:parameter:
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a1 = (id)[a1 initWithHandleString:v4];
    id v5 = a1;
  }
  else
  {
    uint64_t v6 = objc_opt_class();
    v7 = WFEnforceClass(v4, v6);
    id v8 = v7;
    if (v7)
    {
      v9 = [v7 objectForKey:@"EntryType"];
      uint64_t v10 = objc_opt_class();
      v11 = WFEnforceClass(v9, v10);

      if (v11)
      {
        uint64_t v12 = [v11 integerValue];
        v13 = [v8 objectForKey:@"SerializedEntry"];
        if (v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v14 = v13;
          }
          else {
            v14 = 0;
          }
        }
        else
        {
          v14 = 0;
        }
        id v17 = v14;

        switch(v12)
        {
          case 1:
            v18 = [MEMORY[0x1E4F5A9D0] objectWithWFSerializedRepresentation:v17];
            v19 = (void *)[a1 initWithPhoneNumber:v18];
            break;
          case 2:
            v18 = [MEMORY[0x1E4F5A8E0] objectWithWFSerializedRepresentation:v17];
            v19 = (void *)[a1 initWithEmailAddress:v18];
            break;
          case 3:
            v20 = [v8 objectForKey:@"SerializedEntry"];
            uint64_t v21 = objc_opt_class();
            v18 = WFEnforceClass(v20, v21);

            v19 = (void *)[a1 initWithCustomHandle:v18];
            break;
          case 4:
            v18 = [MEMORY[0x1E4F5A990] objectWithWFSerializedRepresentation:v17];
            v19 = (void *)[a1 initWithMessageGroup:v18];
            break;
          default:
            goto LABEL_15;
        }
        a1 = v19;

        id v5 = a1;
      }
      else
      {
        v15 = (void *)MEMORY[0x1E4F5A7F0];
        uint64_t v23 = *MEMORY[0x1E4F5ABC8];
        v24[0] = v8;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
        id v17 = [v15 objectWithWFSerializedRepresentation:v16];

        if (v17)
        {
          a1 = (id)[a1 initWithContact:v17];
          id v5 = a1;
        }
        else
        {
LABEL_15:
          id v5 = 0;
        }
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

@end