@interface WFRemoteWidgetDataProvider
+ (id)enumerationParameterWithKey:(id)a3 action:(id)a4;
+ (id)linkActionFromRequest:(id)a3;
+ (void)handleReceivedData:(id)a3 responseHandler:(id)a4;
- (WFRemoteWidgetConnection)remoteWidgetConnection;
- (WFRemoteWidgetDataProvider)init;
- (void)remoteWidgetConnection:(id)a3 didReceiveData:(id)a4 responseHandler:(id)a5;
- (void)setRemoteWidgetConnection:(id)a3;
@end

@implementation WFRemoteWidgetDataProvider

- (void).cxx_destruct
{
}

- (void)setRemoteWidgetConnection:(id)a3
{
}

- (WFRemoteWidgetConnection)remoteWidgetConnection
{
  return self->_remoteWidgetConnection;
}

- (void)remoteWidgetConnection:(id)a3 didReceiveData:(id)a4 responseHandler:(id)a5
{
}

- (WFRemoteWidgetDataProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFRemoteWidgetDataProvider;
  v2 = [(WFRemoteWidgetDataProvider *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[WFRemoteWidgetConnection startListeningForIncomingConfigurations];
    remoteWidgetConnection = v2->_remoteWidgetConnection;
    v2->_remoteWidgetConnection = (WFRemoteWidgetConnection *)v3;

    [(WFRemoteWidgetConnection *)v2->_remoteWidgetConnection setListenerDelegate:v2];
    v5 = v2;
  }

  return v2;
}

+ (void)handleReceivedData:(id)a3 responseHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void *))a4;
  v6 = +[WFRemoteWidgetConfigurationRequest fromSecureData:a3];
  objc_super v7 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]";
    __int16 v37 = 2114;
    v38 = v6;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider received a request: %{public}@", buf, 0x16u);
  }

  switch([v6 requestType])
  {
    case 0:
      uint64_t v8 = [v6 intent];
      if (v8)
      {
        v9 = (void *)v8;
        v27 = [MEMORY[0x1E4F1CA20] currentLocale];
        v10 = [v27 languageCode];
        v11 = objc_opt_new();
        [v11 setLanguageCode:v10];
        id v34 = 0;
        v12 = [v9 widgetPlistableRepresentationWithParameters:v11 error:&v34];
        id v13 = v34;
        v14 = [[WFRemoteWidgetConfigurationLocalizedIntentResponse alloc] initWithLocalizedIntentRepresentation:v12 languageCode:v10 error:v13];
        v15 = getWFWidgetConfigurationLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]";
          __int16 v37 = 2114;
          v38 = v14;
          _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider is sending a response: %{public}@", buf, 0x16u);
        }

        v16 = [(WFRemoteWidgetConfigurationResponse *)v14 secureData];
        v5[2](v5, v16);

        goto LABEL_20;
      }
      v25 = getWFWidgetConfigurationLogObject();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      *(_DWORD *)buf = 136315394;
      v36 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]";
      __int16 v37 = 2114;
      v38 = v6;
      v26 = "%s WFRemoteWidgetDataProvider received a nil intent. Unable to localize. Request: %{public}@";
      goto LABEL_26;
    case 1:
      uint64_t v17 = [v6 intent];
      if (v17)
      {
        v9 = (void *)v17;
        v18 = [[WFIntentExecutor alloc] initWithIntent:v17 donateInteraction:0 groupIdentifier:0 requiresTrustCheck:0];
        v19 = [v6 parameterName];
        v20 = [v6 searchTerm];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __65__WFRemoteWidgetDataProvider_handleReceivedData_responseHandler___block_invoke;
        v32[3] = &unk_1E6557340;
        v33 = v5;
        [(WFIntentExecutor *)v18 getDynamicOptionsForParameterNamed:v19 searchTerm:v20 completionHandler:v32];

LABEL_19:
      }
      else
      {
        v25 = getWFWidgetConfigurationLogObject();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]";
          __int16 v37 = 2114;
          v38 = v6;
          v26 = "%s WFRemoteWidgetDataProvider received a nil intent. Unable to provide dynamic options. Request: %{public}@";
LABEL_26:
          _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);
        }
LABEL_27:

        v5[2](v5, 0);
        v9 = 0;
      }
LABEL_20:

LABEL_21:
      return;
    case 2:
      v9 = +[WFRemoteWidgetDataProvider linkActionFromRequest:v6];
      v18 = [v9 metadata];
      v21 = getWFWidgetConfigurationLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]";
        __int16 v37 = 2114;
        v38 = v18;
        _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider retrieved metadata: %{public}@", buf, 0x16u);
      }

      v22 = [[WFRemoteWidgetConfigurationLNActionMetadataResponse alloc] initWithMetadata:v18 error:0];
      v23 = getWFWidgetConfigurationLogObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]";
        __int16 v37 = 2114;
        v38 = v22;
        _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider is sending a response: %{public}@", buf, 0x16u);
      }

      v24 = [(WFRemoteWidgetConfigurationResponse *)v22 secureData];
      v5[2](v5, v24);
      goto LABEL_17;
    case 3:
      v9 = [v6 parameterName];
      v18 = +[WFRemoteWidgetDataProvider linkActionFromRequest:v6];
      v22 = +[WFRemoteWidgetDataProvider enumerationParameterWithKey:v9 action:v18];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __65__WFRemoteWidgetDataProvider_handleReceivedData_responseHandler___block_invoke_173;
      v30[3] = &unk_1E6556108;
      v31 = v5;
      [(WFIntentExecutor *)v18 loadDefaultResultForEnumeration:v22 completionHandler:v30];

      goto LABEL_18;
    case 4:
      v9 = [v6 parameterName];
      v18 = [v6 searchTerm];
      v22 = +[WFRemoteWidgetDataProvider linkActionFromRequest:v6];
      v24 = +[WFRemoteWidgetDataProvider enumerationParameterWithKey:v9 action:v22];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __65__WFRemoteWidgetDataProvider_handleReceivedData_responseHandler___block_invoke_176;
      v28[3] = &unk_1E654F1A0;
      v29 = v5;
      [(WFRemoteWidgetConfigurationLNActionMetadataResponse *)v22 loadDynamicResultForEnumeration:v24 searchTerm:v18 completionHandler:v28];

LABEL_17:
LABEL_18:

      goto LABEL_19;
    default:
      goto LABEL_21;
  }
}

void __65__WFRemoteWidgetDataProvider_handleReceivedData_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  id v6 = a3;
  objc_super v7 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    v12 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]_block_invoke";
    __int16 v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider retrieved the dynamic options: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v8 = [[WFRemoteWidgetConfigurationOptionsForParameterResponse alloc] initWithOptions:v5 error:v6];
  v9 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    v12 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]_block_invoke";
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider is sending a response: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v10 = [(WFRemoteWidgetConfigurationResponse *)v8 secureData];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__WFRemoteWidgetDataProvider_handleReceivedData_responseHandler___block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  id v6 = a3;
  objc_super v7 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    v12 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]_block_invoke";
    __int16 v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider retrieved the default option: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v8 = [[WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse alloc] initWithDefaultOption:v5 error:v6];
  v9 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    v12 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]_block_invoke";
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider is sending a response: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v10 = [(WFRemoteWidgetConfigurationResponse *)v8 secureData];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__WFRemoteWidgetDataProvider_handleReceivedData_responseHandler___block_invoke_176(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  id v6 = a3;
  objc_super v7 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    v12 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]_block_invoke";
    __int16 v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider retrieved dynamic options: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v8 = [[WFRemoteWidgetConfigurationLNOptionsForParameterResponse alloc] initWithResult:v5 error:v6];
  v9 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    v12 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]_block_invoke";
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider is sending a response: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v10 = [(WFRemoteWidgetConfigurationResponse *)v8 secureData];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)enumerationParameterWithKey:(id)a3 action:(id)a4
{
  id v5 = a3;
  id v6 = [a4 parameters];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__WFRemoteWidgetDataProvider_enumerationParameterWithKey_action___block_invoke;
  v10[3] = &unk_1E654F178;
  id v11 = v5;
  id v7 = v5;
  uint64_t v8 = objc_msgSend(v6, "if_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __65__WFRemoteWidgetDataProvider_enumerationParameterWithKey_action___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 key];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (id)linkActionFromRequest:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 actionIdentifier];
  id v5 = [v3 serializedParameters];

  id v6 = [WFLinkActionProvider alloc];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F72CD8]) initWithOptions:2];
  uint64_t v8 = [(WFLinkActionProvider *)v6 initWithMetadataProvider:v7];

  v9 = [[WFActionRequest alloc] initWithActionIdentifier:v4 serializedParameters:v5];
  v15[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [(WFActionProvider *)v8 createActionsForRequests:v10];

  id v11 = [(WFActionRequest *)v9 result];
  v12 = v11;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v12;
    }
    else {
      id v11 = 0;
    }
  }
  id v13 = v11;

  return v13;
}

@end