@interface SDAirDropHandlerKeynoteLiveLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerKeynoteLiveLinks)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerKeynoteLiveLinks

- (SDAirDropHandlerKeynoteLiveLinks)initWithTransfer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SDAirDropHandlerKeynoteLiveLinks;
  v3 = [(SDAirDropHandler *)&v6 initWithTransfer:a3];
  if (v3)
  {
    v4 = +[LSBundleProxy bundleProxyForIdentifier:@"com.apple.Keynote"];
    [(SDAirDropHandler *)v3 setBundleProxy:v4];
  }
  return v3;
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustLinks]) {
    return 0;
  }
  v3 = [(SDAirDropHandler *)self bundleProxy];

  if (v3) {
    goto LABEL_4;
  }
  v4 = [SDAirDropHandlerWebLinks alloc];
  v5 = [(SDAirDropHandler *)self transfer];
  objc_super v6 = [(SDAirDropHandlerWebLinks *)v4 initWithTransfer:v5];
  webLinksHandler = self->_webLinksHandler;
  self->_webLinksHandler = v6;

  if (![(SDAirDropHandlerWebLinks *)self->_webLinksHandler canHandleTransfer]) {
    return 0;
  }
LABEL_4:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  v8 = [(SDAirDropHandler *)self transfer];
  v9 = [v8 completedURLs];

  v10 = (char *)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        if (!SFIsKeynoteLiveLink())
        {
          BOOL v14 = 0;
          goto LABEL_15;
        }
      }
      v11 = (char *)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_15:

  return v14;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerKeynoteLiveLinks;
  return (unint64_t)[(SDAirDropHandlerGenericLinks *)&v3 transferTypes] | 0x20000000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  v4 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:&off_100906D28];
  v5 = SFLocalizedStringForKey();
  objc_super v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v3);

  return v6;
}

- (void)updatePossibleActions
{
  webLinksHandler = self->_webLinksHandler;
  if (webLinksHandler)
  {
    [(SDAirDropHandlerGenericLinks *)webLinksHandler updatePossibleActions];
    id v4 = [(SDAirDropHandler *)self completionHandler];
    [(SDAirDropHandler *)self->_webLinksHandler setCompletionHandler:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SDAirDropHandlerKeynoteLiveLinks;
    [(SDAirDropHandlerGenericLinks *)&v5 updatePossibleActions];
  }
}

- (void).cxx_destruct
{
}

@end