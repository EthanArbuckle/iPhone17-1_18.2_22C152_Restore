@interface WFRemoteExecutionKeyValuePair
- (NSString)key;
- (WFRemoteExecutionKeyValuePair)initWithKey:(id)a3 value:(id)a4;
- (id)value;
@end

@implementation WFRemoteExecutionKeyValuePair

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (id)value
{
  return self->_value;
}

- (NSString)key
{
  return self->_key;
}

- (WFRemoteExecutionKeyValuePair)initWithKey:(id)a3 value:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFRemoteExecutionKeyValuePair.m", 16, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFRemoteExecutionKeyValuePair.m", 17, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFRemoteExecutionKeyValuePair;
  v11 = [(WFRemoteExecutionKeyValuePair *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_key, a3);
    objc_storeStrong(&v12->_value, a4);
    v13 = v12;
  }

  return v12;
}

@end