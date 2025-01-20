@interface SDAirDropHandlerFailed
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (NSString)errorDetailedString;
- (NSString)errorString;
- (id)suitableContentsDescription;
- (id)suitableContentsTitle;
- (void)activate;
@end

@implementation SDAirDropHandlerFailed

- (void)activate
{
  v3 = [(SDAirDropHandler *)self transfer];
  [v3 setCancelAction:0];

  v4 = [(SDAirDropHandler *)self transfer];
  [v4 setSelectedAction:0];

  v5 = [(SDAirDropHandler *)self transfer];
  [v5 setPossibleActions:0];

  v6.receiver = self;
  v6.super_class = (Class)SDAirDropHandlerFailed;
  [(SDAirDropHandler *)&v6 activate];
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (NSString)errorString
{
  v3 = [(SDAirDropHandler *)self transfer];
  [v3 transferState];

  v4 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:0];
  v5 = SFLocalizedStringForKey();

  objc_super v6 = [(SDAirDropHandler *)self senderName];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);

  return (NSString *)v7;
}

- (NSString)errorDetailedString
{
  v3 = [(SDAirDropHandler *)self transfer];
  id v4 = [v3 transferState];

  if (v4 == (id)9
    && ([(SDAirDropHandler *)self transfer],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 error],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 code],
        v6,
        v5,
        v7 == (id)-2))
  {
    v8 = SFLocalizedStringForKey();
  }
  else
  {
    v8 = 0;
  }

  return (NSString *)v8;
}

- (id)suitableContentsTitle
{
  return [(SDAirDropHandlerFailed *)self errorString];
}

- (id)suitableContentsDescription
{
  return [(SDAirDropHandlerFailed *)self errorDetailedString];
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

@end