@interface AddToNewsUIActivity
+ (id)activityWithTabDocument:(id)a3 error:(id *)a4;
+ (int64_t)activityCategory;
- (AddToNewsUIActivity)init;
- (AddToNewsUIActivity)initWithApplicationExtension:(id)a3 tabDocument:(id)a4;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (TabDocument)tabDocument;
- (void)prepareWithActivityItems:(id)a3;
- (void)setTabDocument:(id)a3;
@end

@implementation AddToNewsUIActivity

+ (int64_t)activityCategory
{
  return 1;
}

+ (id)activityWithTabDocument:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:@"com.apple.news.openinnews" error:a4];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 _plugIn];
    uint64_t v9 = [v8 userElection];

    if (!v9)
    {
      uint64_t v12 = 0;
      if (([v7 attemptOptIn:&v12] & 1) == 0) {
        NSLog((NSString *)@"Extension optIn failed");
      }
    }
    v10 = [[AddToNewsUIActivity alloc] initWithApplicationExtension:v7 tabDocument:v5];
  }
  else if (a4 && !*a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:0];
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (AddToNewsUIActivity)initWithApplicationExtension:(id)a3 tabDocument:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AddToNewsUIActivity;
  v8 = [(UIApplicationExtensionActivity *)&v12 initWithApplicationExtension:a3];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_tabDocument, a4);
    v10 = v9;
  }

  return v9;
}

- (AddToNewsUIActivity)init
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v4 = [(TabDocument *)self->_tabDocument URL];
  if (!objc_msgSend(v4, "safari_isHTTPFamilyURL")
    || [(TabDocument *)self->_tabDocument isPDFDocument]
    || [(TabDocument *)self->_tabDocument isDisplayingStandaloneImage])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    BOOL v5 = ![(TabDocument *)self->_tabDocument isDisplayingStandaloneMedia];
  }

  return v5;
}

- (void)prepareWithActivityItems:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(TabDocument *)self->_tabDocument titleForSharing];
  uint64_t v6 = [(TabDocument *)self->_tabDocument URL];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    goto LABEL_7;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F28C80]);
  uint64_t v10 = *MEMORY[0x1E4F28298];
  v22[0] = @"FRItemHasRSSFeed";
  v22[1] = v10;
  v23[0] = MEMORY[0x1E4F1CC28];
  id v11 = objc_alloc(MEMORY[0x1E4F28D78]);
  objc_super v12 = (void *)[v11 initWithItem:v5 typeIdentifier:*MEMORY[0x1E4F22688]];
  v21[0] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F28D78]);
  v14 = (void *)[v13 initWithItem:v7 typeIdentifier:*MEMORY[0x1E4F226F8]];
  v21[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v23[1] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v9 setUserInfo:v16];

  if (!v9)
  {
LABEL_7:
    v18.receiver = self;
    v18.super_class = (Class)AddToNewsUIActivity;
    [(UIApplicationExtensionActivity *)&v18 prepareWithActivityItems:v4];
  }
  else
  {
    id v20 = v9;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    v19.receiver = self;
    v19.super_class = (Class)AddToNewsUIActivity;
    [(UIApplicationExtensionActivity *)&v19 prepareWithActivityItems:v17];
  }
}

- (TabDocument)tabDocument
{
  return self->_tabDocument;
}

- (void)setTabDocument:(id)a3
{
}

- (void).cxx_destruct
{
}

@end