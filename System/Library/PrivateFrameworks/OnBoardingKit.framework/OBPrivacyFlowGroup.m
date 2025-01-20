@interface OBPrivacyFlowGroup
+ (id)groupFlowsByCombinedHeader:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5;
- (NSArray)privacyFlows;
- (NSString)identifier;
- (OBPrivacyFlowGroup)init;
- (OBPrivacyFlowGroup)initWithIdentifier:(id)a3 privacyFlows:(id)a4;
- (void)setIdentifier:(id)a3;
- (void)setPrivacyFlows:(id)a3;
@end

@implementation OBPrivacyFlowGroup

- (OBPrivacyFlowGroup)initWithIdentifier:(id)a3 privacyFlows:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OBPrivacyFlowGroup;
  v9 = [(OBPrivacyFlowGroup *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_privacyFlows, a4);
  }

  return v10;
}

- (OBPrivacyFlowGroup)init
{
  return [(OBPrivacyFlowGroup *)self initWithIdentifier:0 privacyFlows:MEMORY[0x1E4F1CBF0]];
}

+ (id)groupFlowsByCombinedHeader:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v31 = a4;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = v6;
  uint64_t v33 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (!v33)
  {

LABEL_25:
    [v32 removeAllObjects];
    v25 = [[OBPrivacyFlowGroup alloc] initWithIdentifier:0 privacyFlows:v7];
    [v32 addObject:v25];
    goto LABEL_26;
  }
  char v8 = 0;
  id obj = v7;
  uint64_t v29 = *(void *)v41;
  do
  {
    for (uint64_t i = 0; i != v33; ++i)
    {
      if (*(void *)v41 != v29) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      char v11 = objc_msgSend(v10, "enablesGroupingInCombinedList", obj);
      uint64_t v12 = [v10 localizedCombinedHeaderForLanguage:v31 preferredDeviceType:a5];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v13 = v32;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v37;
        v35 = v10;
        char v34 = v11;
LABEL_8:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v36 + 1) + 8 * v17);
          v19 = [v18 identifier];
          if ([v19 isEqualToString:v12]) {
            break;
          }
          uint64_t v20 = [v18 identifier];
          uint64_t v21 = v20 | v12;

          if (!v21) {
            goto LABEL_17;
          }
          if (v15 == ++v17)
          {
            uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
            v10 = v35;
            char v11 = v34;
            if (v15) {
              goto LABEL_8;
            }
            goto LABEL_15;
          }
        }

LABEL_17:
        v22 = v18;

        v10 = v35;
        char v11 = v34;
        if (v22) {
          goto LABEL_19;
        }
      }
      else
      {
LABEL_15:
      }
      v22 = objc_alloc_init(OBPrivacyFlowGroup);
      [(OBPrivacyFlowGroup *)v22 setIdentifier:v12];
      [v13 addObject:v22];
LABEL_19:
      v8 |= v11;
      v23 = [(OBPrivacyFlowGroup *)v22 privacyFlows];
      v24 = [v23 arrayByAddingObject:v10];
      [(OBPrivacyFlowGroup *)v22 setPrivacyFlows:v24];
    }
    id v7 = obj;
    uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  }
  while (v33);

  if ((v8 & 1) == 0) {
    goto LABEL_25;
  }
  if ([v13 count] != 1) {
    goto LABEL_27;
  }
  v25 = [v13 firstObject];
  [(OBPrivacyFlowGroup *)v25 setIdentifier:0];
LABEL_26:

LABEL_27:
  v26 = (void *)[v32 copy];

  return v26;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)privacyFlows
{
  return self->_privacyFlows;
}

- (void)setPrivacyFlows:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyFlows, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end