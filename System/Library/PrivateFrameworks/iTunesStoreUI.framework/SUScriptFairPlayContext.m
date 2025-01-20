@interface SUScriptFairPlayContext
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)isOpen;
- (id)_accountViewController;
- (id)_className;
- (id)signData:(id)a3;
- (void)close;
@end

@implementation SUScriptFairPlayContext

- (id)_className
{
  return @"iTunesFairPlayContext";
}

- (BOOL)isOpen
{
  return objc_msgSend(-[SUScriptFairPlayContext _accountViewController](self, "_accountViewController"), "_mescalSession") != 0;
}

- (void)close
{
}

uint64_t __32__SUScriptFairPlayContext_close__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) _accountViewController];

  return [v1 _closeMescalSession];
}

- (id)signData:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__54;
  v10 = __Block_byref_object_dispose__54;
  uint64_t v11 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (a3 == 0) | objc_opt_isKindOfClass() & 1)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  id v4 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v4;
}

id __36__SUScriptFairPlayContext_signData___block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_accountViewController"), "_mescalSession");
  if (result)
  {
    v3 = objc_msgSend(result, "signData:error:", objc_msgSend(*(id *)(a1 + 40), "dataUsingEncoding:", 4), 0);
    id result = (id)[v3 length];
    if (result)
    {
      id result = (id)[v3 base64EncodedStringWithOptions:0];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
    }
  }
  return result;
}

- (id)_accountViewController
{
  return +[SUAccountViewController _latestAccountViewController];
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_59, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFairPlayContext;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_59 = (uint64_t)sel_close;
    unk_2681B5940 = @"close";
    qword_2681B5948 = (uint64_t)sel_signData_;
    unk_2681B5950 = @"signData";
  }
}

@end