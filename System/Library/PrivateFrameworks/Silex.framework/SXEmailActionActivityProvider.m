@interface SXEmailActionActivityProvider
- (SXEmailActionActivityProvider)initWithMailPresenter:(id)a3;
- (SXMailPresenter)mailPresenter;
- (id)activityGroupForAction:(id)a3;
- (void)composeMailTo:(id)a3 subject:(id)a4;
@end

@implementation SXEmailActionActivityProvider

- (SXEmailActionActivityProvider)initWithMailPresenter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXEmailActionActivityProvider;
  v6 = [(SXEmailActionActivityProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mailPresenter, a3);
  }

  return v7;
}

- (id)activityGroupForAction:(id)a3
{
  id v4 = a3;
  id v5 = [SXActionActivityGroup alloc];
  v6 = [v4 recipient];
  v7 = [(SXActionActivityGroup *)v5 initWithTitle:v6];

  v8 = [(SXEmailActionActivityProvider *)self mailPresenter];
  uint64_t v9 = [v8 canComposeMail] ^ 1;

  v10 = [SXBlockActionActivity alloc];
  v11 = SXBundle();
  v12 = [v11 localizedStringForKey:@"New Message" value:&stru_26D5311C0 table:0];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __56__SXEmailActionActivityProvider_activityGroupForAction___block_invoke;
  v25 = &unk_2646512B0;
  v26 = self;
  id v27 = v4;
  id v13 = v4;
  v14 = [(SXBlockActionActivity *)v10 initWithLabel:v12 type:v9 block:&v22];
  -[SXActionActivityGroup addActivity:](v7, "addActivity:", v14, v22, v23, v24, v25, v26);

  v15 = [SXPasteboardActionActivity alloc];
  v16 = SXBundle();
  v17 = [v16 localizedStringForKey:@"Copy" value:&stru_26D5311C0 table:0];
  v18 = [MEMORY[0x263F1C840] generalPasteboard];
  v19 = [v13 recipient];
  v20 = [(SXPasteboardActionActivity *)v15 initWithLabel:v17 type:1 pasteboard:v18 string:v19];
  [(SXActionActivityGroup *)v7 addActivity:v20];

  return v7;
}

void __56__SXEmailActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) recipient];
  v3 = [*(id *)(a1 + 40) subject];
  [v2 composeMailTo:v4 subject:v3];
}

- (void)composeMailTo:(id)a3 subject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = [[SXPresentableMail alloc] initWithRecipient:v7 subject:v6];

  v8 = [(SXEmailActionActivityProvider *)self mailPresenter];
  [v8 presentMail:v9];
}

- (SXMailPresenter)mailPresenter
{
  return self->_mailPresenter;
}

- (void).cxx_destruct
{
}

@end