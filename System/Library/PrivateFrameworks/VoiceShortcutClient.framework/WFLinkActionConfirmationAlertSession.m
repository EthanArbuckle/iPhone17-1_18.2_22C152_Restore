@interface WFLinkActionConfirmationAlertSession
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldShowPrompt;
- (LNActionMetadata)actionMetadata;
- (LNConfirmationActionName)confirmationActionName;
- (LNDialog)dialog;
- (LNViewSnippet)viewSnippet;
- (NSString)appBundleIdentifier;
- (NSString)dialogString;
- (NSXPCListenerEndpoint)endpoint;
- (WFLinkActionConfirmationAlertSession)initWithAppBundleIdentifier:(id)a3 actionMetadata:(id)a4 shouldShowPrompt:(BOOL)a5 dialog:(id)a6 dialogString:(id)a7 viewSnippet:(id)a8 confirmationActionName:(id)a9;
- (WFLinkActionConfirmationAlertSession)initWithCoder:(id)a3;
- (WFLinkActionConfirmationAlertSession)initWithXPCDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setEndpoint:(id)a3;
@end

@implementation WFLinkActionConfirmationAlertSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_confirmationActionName, 0);
  objc_storeStrong((id *)&self->_viewSnippet, 0);
  objc_storeStrong((id *)&self->_dialogString, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_actionMetadata, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

- (void)setEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (LNConfirmationActionName)confirmationActionName
{
  return self->_confirmationActionName;
}

- (LNViewSnippet)viewSnippet
{
  return self->_viewSnippet;
}

- (NSString)dialogString
{
  return self->_dialogString;
}

- (LNDialog)dialog
{
  return self->_dialog;
}

- (BOOL)shouldShowPrompt
{
  return self->_shouldShowPrompt;
}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  v4 = [MEMORY[0x1E4F4F870] coderWithMessage:xdict];
  v5 = [(NSString *)self->_appBundleIdentifier dataUsingEncoding:4];
  v6 = (const char *)[@"appBundleIdentifier" UTF8String];
  id v7 = v5;
  xpc_dictionary_set_data(xdict, v6, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
  [v4 encodeBool:self->_shouldShowPrompt forKey:@"shouldShowPrompt"];
  actionMetadata = self->_actionMetadata;
  if (actionMetadata) {
    [v4 encodeObject:actionMetadata forKey:@"actionMetadata"];
  }
  dialog = self->_dialog;
  if (dialog) {
    [v4 encodeObject:dialog forKey:@"dialog"];
  }
  dialogString = self->_dialogString;
  if (dialogString)
  {
    v11 = [(NSString *)dialogString dataUsingEncoding:4];

    v12 = (const char *)[@"dialogString" UTF8String];
    id v7 = v11;
    xpc_dictionary_set_data(xdict, v12, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
  }
  viewSnippet = self->_viewSnippet;
  if (viewSnippet) {
    [v4 encodeObject:viewSnippet forKey:@"viewSnippet"];
  }
  confirmationActionName = self->_confirmationActionName;
  if (confirmationActionName) {
    [v4 encodeObject:confirmationActionName forKey:@"confirmationActionName"];
  }
  endpoint = self->_endpoint;
  if (endpoint) {
    [v4 encodeObject:endpoint forKey:@"endpoint"];
  }
}

- (WFLinkActionConfirmationAlertSession)initWithXPCDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F870] coderWithMessage:v4];
  size_t length = 0;
  data = xpc_dictionary_get_data(v4, (const char *)[@"appBundleIdentifier" UTF8String], &length);
  if (length)
  {
    id v7 = data;
    id v8 = [NSString alloc];
    v9 = (void *)[v8 initWithBytes:v7 length:length encoding:4];
    v10 = [v5 decodeObjectOfClass:NSClassFromString((NSString *)@"LNActionMetadata") forKey:@"actionMetadata"];
    uint64_t v11 = [v5 decodeBoolForKey:@"shouldShowPrompt"];
    v12 = [v5 decodeObjectOfClass:NSClassFromString((NSString *)@"LNDialog") forKey:@"dialog"];
    size_t length = 0;
    v13 = xpc_dictionary_get_data(v4, (const char *)[@"dialogString" UTF8String], &length);
    if (length)
    {
      v14 = v13;
      id v15 = [NSString alloc];
      v16 = (void *)[v15 initWithBytes:v14 length:length encoding:4];
    }
    else
    {
      v16 = 0;
    }
    v18 = [v5 decodeObjectOfClass:NSClassFromString((NSString *)@"LNViewSnippet") forKey:@"viewSnippet"];
    v19 = [v5 decodeObjectOfClass:NSClassFromString((NSString *)@"LNConfirmationActionName") forKey:@"confirmationActionName"];
    v20 = [(WFLinkActionConfirmationAlertSession *)self initWithAppBundleIdentifier:v9 actionMetadata:v10 shouldShowPrompt:v11 dialog:v12 dialogString:v16 viewSnippet:v18 confirmationActionName:v19];
    if (v20)
    {
      uint64_t v21 = [v5 decodeObjectOfClass:NSClassFromString((NSString *)@"NSXPCListenerEndpoint") forKey:@"endpoint"];
      endpoint = v20->_endpoint;
      v20->_endpoint = (NSXPCListenerEndpoint *)v21;
    }
    self = v20;

    v17 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[WFLinkActionConfirmationAlertSession initWithXPCDictionary:]";
      _os_log_error_impl(&dword_1B3C5C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: appBundleIdentifier is empty.", buf, 0xCu);
    }
    v17 = 0;
  }

  return v17;
}

- (WFLinkActionConfirmationAlertSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionMetadata"];
  uint64_t v7 = [v4 decodeBoolForKey:@"shouldShowPrompt"];
  if ([v4 containsValueForKey:@"dialog"])
  {
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dialog"];
  }
  else
  {
    id v8 = 0;
  }
  if ([v4 containsValueForKey:@"dialogString"])
  {
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dialogString"];
  }
  else
  {
    v9 = 0;
  }
  if ([v4 containsValueForKey:@"viewSnippet"])
  {
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"viewSnippet"];
  }
  else
  {
    v10 = 0;
  }
  if ([v4 containsValueForKey:@"confirmationActionName"])
  {
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confirmationActionName"];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = [(WFLinkActionConfirmationAlertSession *)self initWithAppBundleIdentifier:v5 actionMetadata:v6 shouldShowPrompt:v7 dialog:v8 dialogString:v9 viewSnippet:v10 confirmationActionName:v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFLinkActionConfirmationAlertSession *)self appBundleIdentifier];
  [v4 encodeObject:v5 forKey:@"appBundleIdentifier"];

  v6 = [(WFLinkActionConfirmationAlertSession *)self actionMetadata];
  [v4 encodeObject:v6 forKey:@"actionMetadata"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFLinkActionConfirmationAlertSession shouldShowPrompt](self, "shouldShowPrompt"), @"shouldShowPrompt");
  uint64_t v7 = [(WFLinkActionConfirmationAlertSession *)self dialog];
  [v4 encodeObject:v7 forKey:@"dialog"];

  id v8 = [(WFLinkActionConfirmationAlertSession *)self dialogString];
  [v4 encodeObject:v8 forKey:@"dialogString"];

  v9 = [(WFLinkActionConfirmationAlertSession *)self viewSnippet];
  [v4 encodeObject:v9 forKey:@"viewSnippet"];

  id v10 = [(WFLinkActionConfirmationAlertSession *)self confirmationActionName];
  [v4 encodeObject:v10 forKey:@"confirmationActionName"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_appBundleIdentifier);
  objc_storeStrong((id *)(v4 + 24), self->_actionMetadata);
  *(unsigned char *)(v4 + 8) = self->_shouldShowPrompt;
  objc_storeStrong((id *)(v4 + 32), self->_dialog);
  objc_storeStrong((id *)(v4 + 40), self->_dialogString);
  objc_storeStrong((id *)(v4 + 48), self->_viewSnippet);
  objc_storeStrong((id *)(v4 + 56), self->_confirmationActionName);
  return (id)v4;
}

- (WFLinkActionConfirmationAlertSession)initWithAppBundleIdentifier:(id)a3 actionMetadata:(id)a4 shouldShowPrompt:(BOOL)a5 dialog:(id)a6 dialogString:(id)a7 viewSnippet:(id)a8 confirmationActionName:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)WFLinkActionConfirmationAlertSession;
  v18 = [(WFLinkActionConfirmationAlertSession *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_appBundleIdentifier, a3);
    objc_storeStrong((id *)&v19->_actionMetadata, a4);
    v19->_shouldShowPrompt = a5;
    objc_storeStrong((id *)&v19->_dialog, a6);
    objc_storeStrong((id *)&v19->_dialogString, a7);
    objc_storeStrong((id *)&v19->_viewSnippet, a8);
    objc_storeStrong((id *)&v19->_confirmationActionName, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end