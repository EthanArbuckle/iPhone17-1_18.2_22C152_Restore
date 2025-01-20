@interface WFChooseFromListDialogRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsMultipleSelection;
- (NSArray)items;
- (NSString)emptyStateMessage;
- (NSString)message;
- (NSString)parameterKey;
- (NSXPCConnection)xpcConnection;
- (NSXPCListenerEndpoint)dataStoreEndpoint;
- (WFChooseFromListDialogRequest)initWithCoder:(id)a3;
- (WFChooseFromListDialogRequest)initWithItems:(id)a3 allowsMultipleSelection:(BOOL)a4 message:(id)a5 attribution:(id)a6 prompt:(id)a7 parameterKey:(id)a8;
- (WFDialogButton)cancelButton;
- (WFDialogButton)doneButton;
- (WFDialogListItemStore)dataStore;
- (WFListDisplayConfiguration)displayConfiguration;
- (id)requestByCompactingRequest;
- (void)encodeWithCoder:(id)a3;
- (void)setDataStoreEndpoint:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation WFChooseFromListDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_parameterKey, 0);
  objc_storeStrong((id *)&self->_dataStoreEndpoint, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (void)setDataStoreEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)dataStoreEndpoint
{
  return self->_dataStoreEndpoint;
}

- (WFDialogButton)cancelButton
{
  return self->_cancelButton;
}

- (WFDialogButton)doneButton
{
  return self->_doneButton;
}

- (void)setDisplayConfiguration:(id)a3
{
}

- (WFListDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (NSString)message
{
  return self->_message;
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (NSArray)items
{
  return self->_items;
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WFChooseFromListDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v12 encodeWithCoder:v4];
  v5 = [(WFChooseFromListDialogRequest *)self items];
  [v4 encodeObject:v5 forKey:@"items"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFChooseFromListDialogRequest allowsMultipleSelection](self, "allowsMultipleSelection"), @"allowsMultipleSelection");
  v6 = [(WFChooseFromListDialogRequest *)self message];
  [v4 encodeObject:v6 forKey:@"message"];

  v7 = [(WFChooseFromListDialogRequest *)self doneButton];
  [v4 encodeObject:v7 forKey:@"doneButton"];

  v8 = [(WFChooseFromListDialogRequest *)self cancelButton];
  [v4 encodeObject:v8 forKey:@"cancelButton"];

  v9 = [(WFChooseFromListDialogRequest *)self dataStoreEndpoint];
  [v4 encodeObject:v9 forKey:@"dataStoreEndpoint"];

  v10 = [(WFChooseFromListDialogRequest *)self displayConfiguration];
  [v4 encodeObject:v10 forKey:@"displayConfiguration"];

  v11 = [(WFChooseFromListDialogRequest *)self parameterKey];
  [v4 encodeObject:v11 forKey:@"parameterKey"];
}

- (WFChooseFromListDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WFChooseFromListDialogRequest;
  v5 = [(WFDialogRequest *)&v25 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"items"];
    items = v5->_items;
    v5->_items = (NSArray *)v9;

    v5->_allowsMultipleSelection = [v4 decodeBoolForKey:@"allowsMultipleSelection"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doneButton"];
    doneButton = v5->_doneButton;
    v5->_doneButton = (WFDialogButton *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancelButton"];
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (WFDialogButton *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataStoreEndpoint"];
    dataStoreEndpoint = v5->_dataStoreEndpoint;
    v5->_dataStoreEndpoint = (NSXPCListenerEndpoint *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayConfiguration"];
    displayConfiguration = v5->_displayConfiguration;
    v5->_displayConfiguration = (WFListDisplayConfiguration *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterKey"];
    parameterKey = v5->_parameterKey;
    v5->_parameterKey = (NSString *)v21;

    v23 = v5;
  }

  return v5;
}

- (id)requestByCompactingRequest
{
  v3 = [(WFChooseFromListDialogRequest *)self items];
  unint64_t v4 = [v3 count];

  if (v4 > 0x64)
  {
    id v6 = objc_alloc((Class)objc_opt_class());
    uint64_t v7 = [(WFChooseFromListDialogRequest *)self items];
    v8 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, 100);
    uint64_t v9 = [v7 objectsAtIndexes:v8];
    BOOL v10 = [(WFChooseFromListDialogRequest *)self allowsMultipleSelection];
    uint64_t v11 = [(WFChooseFromListDialogRequest *)self message];
    objc_super v12 = [(WFDialogRequest *)self attribution];
    uint64_t v13 = [(WFDialogRequest *)self prompt];
    v14 = [(WFChooseFromListDialogRequest *)self parameterKey];
    v5 = (WFChooseFromListDialogRequest *)[v6 initWithItems:v9 allowsMultipleSelection:v10 message:v11 attribution:v12 prompt:v13 parameterKey:v14];
  }
  else
  {
    v5 = self;
  }
  return v5;
}

- (NSString)emptyStateMessage
{
  return (NSString *)WFLocalizedString(@"No options available.");
}

- (WFDialogListItemStore)dataStore
{
  v3 = [(WFChooseFromListDialogRequest *)self xpcConnection];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    v5 = [(WFChooseFromListDialogRequest *)self dataStoreEndpoint];
    id v6 = (void *)[v4 initWithListenerEndpoint:v5];
    [(WFChooseFromListDialogRequest *)self setXpcConnection:v6];

    uint64_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0CD9738];
    v8 = [(WFChooseFromListDialogRequest *)self xpcConnection];
    [v8 setRemoteObjectInterface:v7];

    uint64_t v9 = [(WFChooseFromListDialogRequest *)self xpcConnection];
    [v9 resume];
  }
  BOOL v10 = [(WFChooseFromListDialogRequest *)self xpcConnection];
  uint64_t v11 = [v10 remoteObjectProxy];

  return (WFDialogListItemStore *)v11;
}

- (WFChooseFromListDialogRequest)initWithItems:(id)a3 allowsMultipleSelection:(BOOL)a4 message:(id)a5 attribution:(id)a6 prompt:(id)a7 parameterKey:(id)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  v29.receiver = self;
  v29.super_class = (Class)WFChooseFromListDialogRequest;
  uint64_t v17 = [(WFDialogRequest *)&v29 initWithAttribution:a6 prompt:a7];
  if (!v17) {
    goto LABEL_13;
  }
  uint64_t v18 = [v14 copy];
  items = v17->_items;
  v17->_items = (NSArray *)v18;

  v17->_allowsMultipleSelection = v12;
  uint64_t v20 = [v15 copy];
  message = v17->_message;
  v17->_message = (NSString *)v20;

  if (v12)
  {
    v22 = +[WFDialogButton doneButton];
  }
  else
  {
    v22 = 0;
  }
  objc_storeStrong((id *)&v17->_doneButton, v22);
  if (v12)
  {

LABEL_9:
    v24 = +[WFDialogButton cancelButton];
    int v23 = 1;
    goto LABEL_10;
  }
  if (![(NSArray *)v17->_items count]) {
    goto LABEL_9;
  }
  int v23 = 0;
  v24 = 0;
LABEL_10:
  objc_storeStrong((id *)&v17->_cancelButton, v24);
  if (v23) {

  }
  uint64_t v25 = [v16 copy];
  parameterKey = v17->_parameterKey;
  v17->_parameterKey = (NSString *)v25;

  v27 = v17;
LABEL_13:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end