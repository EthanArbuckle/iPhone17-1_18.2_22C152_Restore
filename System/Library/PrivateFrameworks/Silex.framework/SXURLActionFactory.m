@interface SXURLActionFactory
- (id)actionForURL:(id)a3;
- (id)actionForURL:(id)a3 analytics:(id)a4;
@end

@implementation SXURLActionFactory

- (id)actionForURL:(id)a3
{
  return [(SXURLActionFactory *)self actionForURL:a3 analytics:0];
}

- (id)actionForURL:(id)a3 analytics:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v7 = 0;
    goto LABEL_9;
  }
  if (([v5 hasTelephonyScheme] & 1) != 0
    || ([v5 isFaceTimeURL] & 1) != 0
    || [v5 isFaceTimeAudioURL])
  {
    v7 = [v5 host];

    if (!v7) {
      goto LABEL_9;
    }
    v8 = [SXPhoneNumberAction alloc];
    v9 = [v5 host];
    v7 = [(SXPhoneNumberAction *)v8 initWithPhoneNumber:v9];
    goto LABEL_7;
  }
  v11 = [v5 scheme];
  int v12 = [v11 isEqualToString:@"mailto"];

  if (v12)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v5 resolvingAgainstBaseURL:0];
    v13 = [v9 queryValueForName:@"to"];
    v14 = [v9 queryValueForName:@"subject"];
    v7 = [[SXEmailAction alloc] initWithRecipient:v13 subject:v14];

LABEL_7:
    goto LABEL_9;
  }
  v15 = [v5 scheme];
  int v16 = [v15 isEqualToString:@"webcal"];

  if (v16)
  {
    v7 = [v5 host];

    if (!v7) {
      goto LABEL_9;
    }
    v17 = [[SXWebCalAction alloc] initWithURL:v5];
    goto LABEL_25;
  }
  v18 = [v5 scheme];
  if ([v18 isEqualToString:@"action"])
  {
    v19 = [v5 host];
    int v20 = [v19 isEqualToString:@"close"];

    if (v20)
    {
      v17 = objc_alloc_init(SXCloseAction);
LABEL_25:
      v7 = (SXEmailAction *)v17;
      goto LABEL_9;
    }
  }
  else
  {
  }
  v21 = [v5 scheme];
  if (v21 || ([v5 host], (v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_24:
    v17 = [[SXLinkAction alloc] initWithURL:v5 analytics:v6];
    goto LABEL_25;
  }
  v22 = [v5 fragment];

  if (!v22) {
    goto LABEL_24;
  }
  v23 = [SXComponentBookmark alloc];
  v24 = [v5 fragment];
  v25 = [(SXComponentBookmark *)v23 initWithComponentIdentifier:v24];

  v7 = [[SXBookmarkAction alloc] initWithBookmark:v25];
LABEL_9:

  return v7;
}

@end