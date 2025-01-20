@interface SNNMILOperation
- (NSArray)attributes;
- (NSArray)inputs;
- (NSArray)outputs;
- (NSString)opName;
- (SNNMILOperation)initWithOperatorName:(id)a3 inputs:(id)a4 attributes:(id)a5 outputs:(id)a6;
- (id)attributeWithName:(id)a3;
- (id)inputWithName:(id)a3;
@end

@implementation SNNMILOperation

- (SNNMILOperation)initWithOperatorName:(id)a3 inputs:(id)a4 attributes:(id)a5 outputs:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SNNMILOperation;
  v15 = [(SNNMILOperation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_opName, a3);
    objc_storeStrong((id *)&v16->_inputs, a4);
    objc_storeStrong((id *)&v16->_attributes, a5);
    objc_storeStrong((id *)&v16->_outputs, a6);
  }

  return v16;
}

- (id)inputWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(SNNMILOperation *)self inputs];
  v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 name];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          v6 = [v9 value];
          goto LABEL_11;
        }
      }
      v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)attributeWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(SNNMILOperation *)self attributes];
  v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 name];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          v6 = [v9 value];
          goto LABEL_11;
        }
      }
      v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)opName
{
  return self->_opName;
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_opName, 0);
}

@end