@interface SUScriptFacebookSession
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (SUScriptFacebookSession)initWithAppleAccount:(id)a3;
- (id)_className;
- (id)hasAccounts;
- (id)scriptAttributeKeys;
- (unint64_t)likeStatusFlagFriendCount;
- (unint64_t)likeStatusFlagFriends;
- (unint64_t)likeStatusFlagGlobalCount;
- (unint64_t)likeStatusFlagMe;
- (void)dealloc;
- (void)fetchLikeStatusForURL:(id)a3 flags:(id)a4 completionFunction:(id)a5;
- (void)likeURL:(id)a3 completionFunction:(id)a4;
- (void)unlikeURL:(id)a3 completionFunction:(id)a4;
@end

@implementation SUScriptFacebookSession

- (SUScriptFacebookSession)initWithAppleAccount:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptFacebookSession;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_account = (SUScriptAppleAccount *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptFacebookSession;
  [(SUScriptObject *)&v3 dealloc];
}

- (void)fetchLikeStatusForURL:(id)a3 flags:(id)a4 completionFunction:(id)a5
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass())))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
      v10 = (void *)[objc_alloc(NSURL) initWithString:a3];
      if (self->_account)
      {
        v11 = (void *)ISWeakLinkedClassForString();
        v12 = [(SUScriptAppleAccount *)self->_account nativeAccount];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __74__SUScriptFacebookSession_fetchLikeStatusForURL_flags_completionFunction___block_invoke;
        v17[3] = &unk_2648150C8;
        v17[4] = v9;
        v17[5] = a5;
        [v11 fetchLikeStatusForURL:v10 flags:a4 account:v12 completion:v17];
      }
      else
      {
        v14 = (void *)[(id)ISWeakLinkedClassForString() sharedSession];
        uint64_t v15 = [a4 integerValue];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __74__SUScriptFacebookSession_fetchLikeStatusForURL_flags_completionFunction___block_invoke_2;
        v16[3] = &unk_2648150C8;
        v16[4] = v9;
        v16[5] = a5;
        [v14 fetchLikeStatusForURL:v10 flags:v15 completion:v16];
      }

      return;
    }
    v13 = (void *)MEMORY[0x263F1FA90];
  }
  else
  {
    v13 = (void *)MEMORY[0x263F1FA90];
  }

  [v13 throwException:@"Invalid argument"];
}

void __74__SUScriptFacebookSession_fetchLikeStatusForURL_flags_completionFunction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) object];
  uint64_t v7 = *(void *)(a1 + 40);

  _callTwoArgumentFunction(v7, v6, a2, a3);
}

void __74__SUScriptFacebookSession_fetchLikeStatusForURL_flags_completionFunction___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) object];
  uint64_t v7 = *(void *)(a1 + 40);

  _callTwoArgumentFunction(v7, v6, a2, a3);
}

- (void)likeURL:(id)a3 completionFunction:(id)a4
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v8 = (void *)MEMORY[0x263F1FA90];
  if (isKindOfClass)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
      v10 = (void *)[objc_alloc(NSURL) initWithString:a3];
      if (self->_account)
      {
        v11 = (void *)ISWeakLinkedClassForString();
        v12 = [(SUScriptAppleAccount *)self->_account nativeAccount];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __54__SUScriptFacebookSession_likeURL_completionFunction___block_invoke;
        v15[3] = &unk_264813D70;
        v15[4] = v9;
        v15[5] = a4;
        [v11 likeURL:v10 account:v12 completion:v15];
      }
      else
      {
        v13 = (void *)[(id)ISWeakLinkedClassForString() sharedSession];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __54__SUScriptFacebookSession_likeURL_completionFunction___block_invoke_2;
        v14[3] = &unk_264813D70;
        v14[4] = v9;
        v14[5] = a4;
        [v13 likeURL:v10 completion:v14];
      }

      return;
    }
    v8 = (void *)MEMORY[0x263F1FA90];
  }

  [v8 throwException:@"Invalid argument"];
}

void __54__SUScriptFacebookSession_likeURL_completionFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) object];
  uint64_t v5 = *(void *)(a1 + 40);

  _callOneArgumentFunction(v5, v4, a2);
}

void __54__SUScriptFacebookSession_likeURL_completionFunction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) object];
  uint64_t v5 = *(void *)(a1 + 40);

  _callOneArgumentFunction(v5, v4, a2);
}

- (void)unlikeURL:(id)a3 completionFunction:(id)a4
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v8 = (void *)MEMORY[0x263F1FA90];
  if (isKindOfClass)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
      v10 = (void *)[objc_alloc(NSURL) initWithString:a3];
      if (self->_account)
      {
        v11 = (void *)ISWeakLinkedClassForString();
        v12 = [(SUScriptAppleAccount *)self->_account nativeAccount];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __56__SUScriptFacebookSession_unlikeURL_completionFunction___block_invoke;
        v15[3] = &unk_264813D70;
        v15[4] = v9;
        v15[5] = a4;
        [v11 unlikeURL:v10 account:v12 completion:v15];
      }
      else
      {
        v13 = (void *)[(id)ISWeakLinkedClassForString() sharedSession];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __56__SUScriptFacebookSession_unlikeURL_completionFunction___block_invoke_2;
        v14[3] = &unk_264813D70;
        v14[4] = v9;
        v14[5] = a4;
        [v13 unlikeURL:v10 completion:v14];
      }

      return;
    }
    v8 = (void *)MEMORY[0x263F1FA90];
  }

  [v8 throwException:@"Invalid argument"];
}

void __56__SUScriptFacebookSession_unlikeURL_completionFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) object];
  uint64_t v5 = *(void *)(a1 + 40);

  _callOneArgumentFunction(v5, v4, a2);
}

void __56__SUScriptFacebookSession_unlikeURL_completionFunction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) object];
  uint64_t v5 = *(void *)(a1 + 40);

  _callOneArgumentFunction(v5, v4, a2);
}

- (id)_className
{
  return @"iTunesFacebookSession";
}

- (id)hasAccounts
{
  v2 = (void *)ISWeakLinkedClassForString();
  int v3 = objc_msgSend((id)objc_msgSend(v2, "serviceForServiceType:", SUSLServiceTypeFacebook()), "hasAccounts");
  uint64_t v4 = (id *)MEMORY[0x263EFFB40];
  if (!v3) {
    uint64_t v4 = (id *)MEMORY[0x263EFFB38];
  }
  return *v4;
}

- (unint64_t)likeStatusFlagFriendCount
{
  return 4;
}

- (unint64_t)likeStatusFlagFriends
{
  return 8;
}

- (unint64_t)likeStatusFlagGlobalCount
{
  return 2;
}

- (unint64_t)likeStatusFlagMe
{
  return 1;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_74, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFacebookSession;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_57, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFacebookSession;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptFacebookSession;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_74 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_57 = (uint64_t)sel_fetchLikeStatusForURL_flags_completionFunction_;
    *(void *)algn_2681B58B8 = @"fetchLikeStatus";
    qword_2681B58C0 = (uint64_t)sel_likeURL_completionFunction_;
    unk_2681B58C8 = @"likeURL";
    qword_2681B58D0 = (uint64_t)sel_unlikeURL_completionFunction_;
    unk_2681B58D8 = @"unlikeURL";
    __KeyMapping_74 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"hasAccounts", @"STATUS_FLAG_FRIEND_COUNT", @"likeStatusFlagFriendCount", @"STATUS_FLAG_FRIENDS", @"likeStatusFlagFriends", @"STATUS_FLAG_GLOBAL_COUNT", @"likeStatusFlagGlobalCount", @"STATUS_FLAG_ME", @"likeStatusFlagMe", 0);
  }
}

@end