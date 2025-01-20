@interface ICQLink
+ (BOOL)performAction:(int64_t)a3 parameters:(id)a4 options:(int64_t)a5;
+ (BOOL)supportsSecureCoding;
+ (ICQLink)linkWithText:(id)a3 action:(int64_t)a4 parameters:(id)a5;
+ (ICQLink)linkWithText:(id)a3 options:(int64_t)a4 action:(int64_t)a5 parameters:(id)a6;
+ (id)_icqDismissLinkForServerMessageParameters:(id)a3;
+ (id)urlRequestWithParams:(id)a3 options:(int64_t)a4;
+ (id)urlSession;
+ (void)addHeadersToRequest:(id)a3;
+ (void)addPOSTParams:(id)a3 toRequest:(id)a4;
+ (void)performAsyncHTTPPostCallWithURL:(id)a3 parameters:(id)a4;
+ (void)performHTTPGETCallWithParams:(id)a3 options:(int64_t)a4;
+ (void)performHTTPPOSTCallWithParams:(id)a3 options:(int64_t)a4;
+ (void)startDataTaskWithRequest:(id)a3;
- (BOOL)hasServerUIAction;
- (BOOL)performAction;
- (BOOL)performActionWithOptions:(int64_t)a3;
- (ICQLink)init;
- (ICQLink)initWithAction:(int64_t)a3;
- (ICQLink)initWithAction:(int64_t)a3 url:(id)a4;
- (ICQLink)initWithActionString:(id)a3;
- (ICQLink)initWithActionString:(id)a3 url:(id)a4;
- (ICQLink)initWithCoder:(id)a3;
- (ICQLink)initWithText:(id)a3 action:(int64_t)a4 parameters:(id)a5;
- (ICQLink)initWithText:(id)a3 options:(int64_t)a4 action:(int64_t)a5 parameters:(id)a6;
- (NSData)serverUIContent;
- (NSDictionary)parameters;
- (NSString)actionIdentifier;
- (NSString)purchaseAttribution;
- (NSString)text;
- (NSURL)actionURL;
- (NSURL)dynamicUIRouteURL;
- (NSURL)serverUIURL;
- (id)description;
- (int64_t)action;
- (int64_t)options;
- (void)dynamicUIRouteURL;
- (void)encodeWithCoder:(id)a3;
- (void)getCachedContentWithCompletion:(id)a3;
- (void)purchaseAttribution;
- (void)setActionIdentifier:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setServerUIContent:(id)a3;
- (void)setServerUIURL:(id)a3;
@end

@implementation ICQLink

+ (ICQLink)linkWithText:(id)a3 action:(int64_t)a4 parameters:(id)a5
{
  return (ICQLink *)[a1 linkWithText:a3 options:0 action:a4 parameters:a5];
}

+ (ICQLink)linkWithText:(id)a3 options:(int64_t)a4 action:(int64_t)a5 parameters:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)a1) initWithText:v11 options:a4 action:a5 parameters:v10];

  return (ICQLink *)v12;
}

- (ICQLink)init
{
  return [(ICQLink *)self initWithText:&stru_1F2DCE430 action:0 parameters:MEMORY[0x1E4F1CC08]];
}

- (ICQLink)initWithText:(id)a3 action:(int64_t)a4 parameters:(id)a5
{
  return [(ICQLink *)self initWithText:a3 options:0 action:a4 parameters:a5];
}

- (ICQLink)initWithText:(id)a3 options:(int64_t)a4 action:(int64_t)a5 parameters:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICQLink;
  v12 = [(ICQLink *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    text = v12->_text;
    v12->_text = (NSString *)v13;

    v12->_options = a4;
    v12->_action = a5;
    uint64_t v15 = [v11 copy];
    parameters = v12->_parameters;
    v12->_parameters = (NSDictionary *)v15;
  }
  return v12;
}

- (id)description
{
  v3 = NSString;
  text = self->_text;
  v5 = [NSNumber numberWithInteger:self->_options];
  v6 = _ICQStringForAction(self->_action);
  v7 = [v3 stringWithFormat:@"Text: %@, Options: %@, Action: %@, Parameters: %@, actionURL: %@", text, v5, v6, self->_parameters, self->_actionURL];

  return v7;
}

- (NSURL)serverUIURL
{
  v2 = [(NSDictionary *)self->_parameters valueForKey:@"openURL"];
  if (v2) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v2];
  }
  else {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (void)setServerUIURL:(id)a3
{
  parameters = self->_parameters;
  id v5 = a3;
  id v9 = (id)[(NSDictionary *)parameters mutableCopy];
  v6 = [v5 absoluteString];

  [v9 setObject:v6 forKeyedSubscript:@"openURL"];
  v7 = (NSDictionary *)[v9 copy];
  v8 = self->_parameters;
  self->_parameters = v7;
}

- (NSURL)actionURL
{
  actionURL = self->_actionURL;
  if (actionURL)
  {
    v3 = actionURL;
  }
  else
  {
    v3 = [(ICQLink *)self serverUIURL];
  }
  return v3;
}

- (NSURL)dynamicUIRouteURL
{
  p_parameters = (uint64_t *)&self->_parameters;
  v3 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"route"];
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v3];
  }
  else
  {
    id v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(ICQLink *)p_parameters dynamicUIRouteURL];
    }

    v4 = 0;
  }

  return (NSURL *)v4;
}

- (BOOL)hasServerUIAction
{
  int64_t v2 = [(ICQLink *)self action];
  return (unint64_t)(v2 - 105) <= 0x10 && ((1 << (v2 - 105)) & 0x12481) != 0 || v2 == 3;
}

- (NSString)purchaseAttribution
{
  p_parameters = (uint64_t *)&self->_parameters;
  v3 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"purchaseAttribution"];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(ICQLink *)p_parameters purchaseAttribution];
    }
  }
  return (NSString *)v4;
}

- (BOOL)performAction
{
  return [(ICQLink *)self performActionWithOptions:0];
}

- (BOOL)performActionWithOptions:(int64_t)a3
{
  id v5 = objc_opt_class();
  int64_t v6 = [(ICQLink *)self action];
  v7 = [(ICQLink *)self parameters];
  LOBYTE(a3) = [v5 performAction:v6 parameters:v7 options:a3];

  return a3;
}

+ (BOOL)performAction:(int64_t)a3 parameters:(id)a4 options:(int64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = v8;
  char isKindOfClass = 0;
  switch(a3)
  {
    case 'd':
      uint64_t v15 = _ICQGetLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "link - presenting manage storage in Settings", (uint8_t *)&v24, 2u);
      }

      _ICQOpenManageStorageInSettings();
      goto LABEL_28;
    case 'e':
    case 't':
    case 'u':
    case 'v':
LABEL_5:
      id v11 = _ICQGetLogSystem();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      v12 = _ICQStringForAction(a3);
      int v24 = 138412290;
      v25 = v12;
      uint64_t v13 = "ICQLink: performAction: %@ not handled";
      goto LABEL_7;
    case 'f':
    case 'j':
    case 'k':
    case 'l':
    case 'p':
    case 'q':
    case 'r':
    case 's':
      id v11 = _ICQGetLogSystem();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      v12 = _ICQStringForAction(a3);
      int v24 = 138412290;
      v25 = v12;
      uint64_t v13 = "ICQLink: performAction: %@ not handled since it requires context";
LABEL_7:
      _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v24, 0xCu);

LABEL_8:
LABEL_9:
      char isKindOfClass = 0;
      break;
    case 'g':
      _ICQOpenPrimaryPaymentInSettings();
      goto LABEL_28;
    case 'h':
      _ICQOpenCloudBackupInSettings();
      goto LABEL_28;
    case 'i':
LABEL_10:
      if ((a5 & 1) == 0) {
        goto LABEL_9;
      }
      v14 = _ICQGetLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "link - presenting purchase flow in Settings", (uint8_t *)&v24, 2u);
      }

      _ICQOpenPurchaseFlowInSettings();
LABEL_28:
      char isKindOfClass = 1;
      break;
    case 'm':
      v16 = _ICQGetLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, "link - presenting family setup in Settings", (uint8_t *)&v24, 2u);
      }

      _ICQOpenFamilySetupInSettings();
      goto LABEL_28;
    case 'n':
    case 'o':
    case 'w':
    case 'x':
    case 'y':
    case 'z':
      break;
    case '{':
LABEL_24:
      [a1 performHTTPPOSTCallWithParams:v9 options:a5];
      goto LABEL_9;
    case '|':
      [a1 performHTTPGETCallWithParams:v8 options:a5];
      goto LABEL_9;
    default:
      switch(a3)
      {
        case 1:
          v17 = [v8 objectForKeyedSubscript:@"openURL"];

          if (v17) {
            goto LABEL_24;
          }
          v23 = _ICQGetLogSystem();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v24) = 0;
            _os_log_impl(&dword_1D5851000, v23, OS_LOG_TYPE_DEFAULT, "ICQLink: performAction: ICQActionDismiss not handled", (uint8_t *)&v24, 2u);
          }

          goto LABEL_9;
        case 2:
          objc_super v18 = _ICQGetLogSystem();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v24) = 0;
            _os_log_impl(&dword_1D5851000, v18, OS_LOG_TYPE_DEFAULT, "link - offer rejected", (uint8_t *)&v24, 2u);
          }

          goto LABEL_28;
        case 3:
          goto LABEL_10;
        case 4:
        case 5:
          goto LABEL_5;
        case 6:
          v20 = [v8 objectForKeyedSubscript:@"URL"];
          v21 = _ICQGetLogSystem();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = 138412290;
            v25 = v20;
            _os_log_impl(&dword_1D5851000, v21, OS_LOG_TYPE_DEFAULT, "link - opening URL %@", (uint8_t *)&v24, 0xCu);
          }

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v22 = [MEMORY[0x1E4F1CB10] URLWithString:v20];

            v20 = (void *)v22;
          }
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass) {
            ICQOpenURL(v20);
          }

          goto LABEL_29;
        default:
          goto LABEL_29;
      }
  }
LABEL_29:

  return isKindOfClass & 1;
}

+ (id)urlSession
{
  int64_t v2 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:@"ICQFetchOfferURLSession"];
  objc_msgSend(v2, "set_appleIDContext:", v3);

  v4 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v2];

  return v4;
}

+ (id)urlRequestWithParams:(id)a3 options:(int64_t)a4
{
  char v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = [a3 objectForKeyedSubscript:@"openURL"];
  id v8 = [v6 URLWithString:v7];

  id v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "HTTP Call - server call to URL %@", (uint8_t *)&v12, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28E88] requestWithURL:v8 cachePolicy:1 timeoutInterval:30.0];
  [a1 addHeadersToRequest:v10];
  if ((v4 & 2) != 0)
  {
    [v10 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
    [v10 setValue:@"application/x-buddyml" forHTTPHeaderField:@"Accept"];
  }

  return v10;
}

+ (void)performAsyncHTTPPostCallWithURL:(id)a3 parameters:(id)a4
{
  int64_t v6 = (void *)MEMORY[0x1E4F28E88];
  id v7 = a4;
  id v8 = [v6 requestWithURL:a3 cachePolicy:1 timeoutInterval:30.0];
  [a1 addHeadersToRequest:v8];
  [a1 addPOSTParams:v7 toRequest:v8];

  [a1 startDataTaskWithRequest:v8];
}

+ (void)performHTTPPOSTCallWithParams:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  id v7 = [a1 urlRequestWithParams:v6 options:a4];
  [a1 addPOSTParams:v6 toRequest:v7];

  [a1 startDataTaskWithRequest:v7];
}

+ (void)performHTTPGETCallWithParams:(id)a3 options:(int64_t)a4
{
  id v5 = [a1 urlRequestWithParams:a3 options:a4];
  [a1 startDataTaskWithRequest:v5];
}

+ (void)startDataTaskWithRequest:(id)a3
{
  id v4 = a3;
  id v6 = [a1 urlSession];
  id v5 = [v6 dataTaskWithRequest:v4 completionHandler:&__block_literal_global_4];

  [v5 resume];
}

void __36__ICQLink_startDataTaskWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (v4)
  {
    id v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 localizedDescription];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Error making HTTP call to url: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

+ (void)addHeadersToRequest:(id)a3
{
  id v3 = a3;
  id v4 = [ICQRequestProvider alloc];
  id v5 = objc_opt_new();
  id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
  int v7 = [(ICQRequestProvider *)v4 initWithAccount:v6];

  [(ICQRequestProvider *)v7 addBasicHeadersToRequest:v3];
}

+ (void)addPOSTParams:(id)a3 toRequest:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v6 setHTTPMethod:@"POST"];
  [v6 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v11 = 0;
  int v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:&v11];
  id v8 = v11;
  if (v8)
  {
    uint64_t v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "Could not convert message body to JSON. Error: %@", buf, 0xCu);
    }

    id v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[ICQLink addPOSTParams:toRequest:]((uint64_t)v5, v10);
    }
  }
  else
  {
    [v6 setHTTPBody:v7];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeInteger:self->_action forKey:@"action"];
  [v5 encodeInteger:self->_options forKey:@"options"];
  [v5 encodeObject:self->_parameters forKey:@"parameters"];
  [v5 encodeObject:self->_actionURL forKey:@"actionURL"];
  [v5 encodeObject:self->_serverUIContent forKey:@"serverUIContent"];
}

- (ICQLink)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICQLink *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_action = [v4 decodeIntegerForKey:@"action"];
    v5->_options = [v4 decodeIntegerForKey:@"options"];
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:3];
    id v10 = objc_msgSend(v8, "setWithArray:", v9, v18, v19);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"parameters"];
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionURL"];
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverUIContent"];
    serverUIContent = v5->_serverUIContent;
    v5->_serverUIContent = (NSData *)v15;
  }
  return v5;
}

- (ICQLink)initWithActionString:(id)a3
{
  uint64_t v4 = _ICQActionForString(a3);
  uint64_t v5 = MEMORY[0x1E4F1CC08];
  return [(ICQLink *)self initWithText:&stru_1F2DCE430 options:0 action:v4 parameters:v5];
}

- (ICQLink)initWithActionString:(id)a3 url:(id)a4
{
  id v7 = a4;
  id v8 = [(ICQLink *)self initWithText:&stru_1F2DCE430 options:0 action:_ICQActionForString(a3) parameters:MEMORY[0x1E4F1CC08]];
  uint64_t v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_actionURL, a4);
  }

  return v9;
}

- (ICQLink)initWithAction:(int64_t)a3
{
  return [(ICQLink *)self initWithText:&stru_1F2DCE430 options:0 action:a3 parameters:MEMORY[0x1E4F1CC08]];
}

- (ICQLink)initWithAction:(int64_t)a3 url:(id)a4
{
  id v7 = a4;
  id v8 = [(ICQLink *)self initWithText:&stru_1F2DCE430 options:0 action:a3 parameters:MEMORY[0x1E4F1CC08]];
  uint64_t v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_actionURL, a4);
  }

  return v9;
}

- (void)getCachedContentWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = +[ICQLiftUICache sharedCache];
  uint64_t v5 = [(ICQLink *)self serverUIURL];
  [v6 fetchResponseForURL:v5 completion:v4];
}

- (NSString)text
{
  return self->_text;
}

- (int64_t)options
{
  return self->_options;
}

- (int64_t)action
{
  return self->_action;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSData)serverUIContent
{
  return self->_serverUIContent;
}

- (void)setServerUIContent:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
}

- (void)setActionURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_serverUIContent, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (id)_icqDismissLinkForServerMessageParameters:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"id", (void)v14);
          if ([v10 isEqualToString:@"cancel"])
          {
            uint64_t v11 = _ICQLinkForServerMessageParameterWithOptions(v9, 0);
            if (v11)
            {
              int v12 = (void *)v11;

              goto LABEL_17;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    if (!v3)
    {
      int v12 = 0;
      goto LABEL_18;
    }
    id v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v3;
      _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "links: expected array: invalid server message parameters:%@", buf, 0xCu);
    }
  }
  int v12 = 0;
LABEL_17:

LABEL_18:
  return v12;
}

- (void)dynamicUIRouteURL
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D5851000, a2, OS_LOG_TYPE_ERROR, "Unable to find dynamicUI route in params %@", (uint8_t *)&v3, 0xCu);
}

- (void)purchaseAttribution
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D5851000, a2, OS_LOG_TYPE_ERROR, "Unable to find dynamicUI purchase attribution in params %@", (uint8_t *)&v3, 0xCu);
}

+ (void)addPOSTParams:(uint64_t)a1 toRequest:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D5851000, a2, OS_LOG_TYPE_DEBUG, "Body: %@", (uint8_t *)&v2, 0xCu);
}

@end