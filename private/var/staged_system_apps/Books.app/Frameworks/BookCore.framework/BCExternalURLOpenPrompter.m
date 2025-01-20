@interface BCExternalURLOpenPrompter
- (BCExternalURLOpenPrompter)init;
- (BCExternalURLOpenPrompter)initWithContext:(id)a3;
- (BCExternalURLOpenPrompterContext)context;
- (BCExternalURLOpenPrompterDelegate)delegate;
- (BOOL)_shouldShowPromptForURL:(id)a3;
- (BOOL)cacheResponses;
- (BOOL)maybePromptUserBeforeOpeningExternalURL:(id)a3 shouldThrottle:(BOOL)a4 promptContext:(id)a5 completion:(id)a6;
- (BUBlockCallThrottler)throttler;
- (NSString)cancelButtonTitle;
- (NSString)okButtonTitle;
- (NSString)promptMessage;
- (NSString)promptTitle;
- (id)_formattedMessageStringForURL:(id)a3;
- (id)dummyCacheValue;
- (id)responseCache;
- (void)_askUserIfShouldOpenURL:(id)a3 promptContext:(id)a4 completion:(id)a5;
- (void)setCacheResponses:(BOOL)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOkButtonTitle:(id)a3;
- (void)setPromptMessage:(id)a3;
- (void)setPromptTitle:(id)a3;
- (void)setThrottler:(id)a3;
@end

@implementation BCExternalURLOpenPrompter

- (BOOL)_shouldShowPromptForURL:(id)a3
{
  id v3 = a3;
  v4 = UIITunesStoreResolvedURLForHTTPURL();
  if (v4)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = [v3 scheme];
    v7 = [v6 lowercaseString];

    if (!v7) {
      goto LABEL_7;
    }
    v8 = +[NSURL supportediBooksInternalURLSchemes];
    unsigned __int8 v9 = [v8 containsObject:v7];

    v5 = +[NSURL supportediBooksStoreURLSchemes];
    unsigned __int8 v10 = [v5 containsObject:v7];

    unsigned __int8 v11 = [v7 isEqualToString:@"prefs"];
    LOBYTE(v5) = 0;
    if ((v9 & 1) == 0 && (v10 & 1) == 0 && (v11 & 1) == 0) {
LABEL_7:
    }
      LODWORD(v5) = [v3 isStoreURL] ^ 1;
  }
  return (char)v5;
}

- (id)_formattedMessageStringForURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSMutableAttributedString);
  v5 = [v3 absoluteString];

  id v6 = [v4 initWithString:v5];
  v7 = +[UIColor grayColor];
  [v6 addAttribute:NSForegroundColorAttributeName value:v7 range:0, [v6 length]];

  return v6;
}

- (void)_askUserIfShouldOpenURL:(id)a3 promptContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(BCExternalURLOpenPrompter *)self delegate];
  v12 = (void *)v11;
  if (v10 && v11)
  {
    v13 = [(BCExternalURLOpenPrompter *)self promptTitle];
    v14 = +[UIAlertController alertControllerWithTitle:v13 message:0 preferredStyle:1];

    [v14 setModalPresentationStyle:6];
    v15 = [(BCExternalURLOpenPrompter *)self promptMessage];
    id v16 = [v15 length];

    if (v16)
    {
      v17 = [(BCExternalURLOpenPrompter *)self promptMessage];
      [v14 setMessage:v17];
    }
    else
    {
      v17 = [(BCExternalURLOpenPrompter *)self _formattedMessageStringForURL:v8];
      [v14 _setAttributedMessage:v17];
    }

    v18 = [(BCExternalURLOpenPrompter *)self cancelButtonTitle];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_E6D5C;
    v25[3] = &unk_2C8FF8;
    id v19 = v10;
    id v26 = v19;
    v20 = +[UIAlertAction actionWithTitle:v18 style:1 handler:v25];
    [v14 addAction:v20];

    v21 = [(BCExternalURLOpenPrompter *)self okButtonTitle];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_E6D70;
    v23[3] = &unk_2C8FF8;
    id v24 = v19;
    v22 = +[UIAlertAction actionWithTitle:v21 style:0 handler:v23];
    [v14 addAction:v22];

    [v12 presentAlertController:v14 promptContext:v9];
  }
}

- (BCExternalURLOpenPrompter)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCExternalURLOpenPrompter;
  id v6 = [(BCExternalURLOpenPrompter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (BCExternalURLOpenPrompter)init
{
  id v3 = objc_alloc_init(BCExternalURLOpenPrompterContext);
  id v4 = [(BCExternalURLOpenPrompter *)self initWithContext:v3];

  return v4;
}

- (BUBlockCallThrottler)throttler
{
  throttler = self->_throttler;
  if (!throttler)
  {
    id v4 = (BUBlockCallThrottler *)objc_alloc_init((Class)BUBlockCallThrottler);
    id v5 = self->_throttler;
    self->_throttler = v4;

    throttler = self->_throttler;
  }

  return throttler;
}

- (id)responseCache
{
  v2 = [(BCExternalURLOpenPrompter *)self context];
  id v3 = [v2 responseCache];

  return v3;
}

- (id)dummyCacheValue
{
  v2 = [(BCExternalURLOpenPrompter *)self context];
  id v3 = [v2 dummyCacheValue];

  return v3;
}

- (BOOL)maybePromptUserBeforeOpeningExternalURL:(id)a3 shouldThrottle:(BOOL)a4 promptContext:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(BCExternalURLOpenPrompter *)self _shouldShowPromptForURL:v10])
  {
    v13 = [(BCExternalURLOpenPrompter *)self responseCache];
    v14 = [v13 objectForKey:v10];

    if (!v14)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_132AE4;
      v23[3] = &unk_2C99F0;
      void v23[4] = self;
      id v24 = v10;
      id v25 = v11;
      id v26 = v13;
      id v27 = v12;
      id v19 = v13;
      v20 = objc_retainBlock(v23);
      v21 = [(BCExternalURLOpenPrompter *)self throttler];
      v22 = v21;
      if (v8) {
        [v21 runBlockThrottled:v20];
      }
      else {
        [v21 runBlock:v20];
      }

      BOOL v17 = 0;
      goto LABEL_7;
    }
  }
  id v15 = objc_retainBlock(v12);
  id v16 = v15;
  if (v15) {
    (*((void (**)(id, uint64_t))v15 + 2))(v15, 1);
  }

  BOOL v17 = 1;
LABEL_7:

  return v17;
}

- (BOOL)cacheResponses
{
  v2 = [(BCExternalURLOpenPrompter *)self context];
  unsigned __int8 v3 = [v2 cacheResponses];

  return v3;
}

- (void)setCacheResponses:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BCExternalURLOpenPrompter *)self context];
  [v4 setCacheResponses:v3];
}

- (NSString)promptTitle
{
  return self->_promptTitle;
}

- (void)setPromptTitle:(id)a3
{
}

- (NSString)promptMessage
{
  return self->_promptMessage;
}

- (void)setPromptMessage:(id)a3
{
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
}

- (NSString)okButtonTitle
{
  return self->_okButtonTitle;
}

- (void)setOkButtonTitle:(id)a3
{
}

- (BCExternalURLOpenPrompterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCExternalURLOpenPrompterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setThrottler:(id)a3
{
}

- (BCExternalURLOpenPrompterContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_throttler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_okButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_promptMessage, 0);

  objc_storeStrong((id *)&self->_promptTitle, 0);
}

@end