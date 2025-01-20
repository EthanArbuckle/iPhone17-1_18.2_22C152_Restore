@interface TILexicon
+ (BOOL)supportsSecureCoding;
+ (id)lexiconWithEntries:(id)a3;
+ (void)requestLexiconFromBundlePath:(id)a3 completionHandler:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)entries;
- (TILexicon)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TILexicon

- (void).cxx_destruct
{
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)encodeWithCoder:(id)a3
{
  entries = self->_entries;
  if (entries) {
    [a3 encodeObject:entries forKey:@"entries"];
  }
}

- (TILexicon)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TILexicon;
  v5 = [(TILexicon *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"entries"];
    entries = v5->_entries;
    v5->_entries = (NSArray *)v9;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v6 = [(TILexicon *)self entries];
    uint64_t v7 = [v5 entries];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(TILexicon *)self entries];
      uint64_t v9 = [v5 entries];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(TILexicon);
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_entries copyItems:1];
  entries = v4->_entries;
  v4->_entries = (NSArray *)v5;

  return v4;
}

+ (void)requestLexiconFromBundlePath:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    if (v5)
    {
      if (requestLexiconFromBundlePath_completionHandler__onceToken != -1) {
        dispatch_once(&requestLexiconFromBundlePath_completionHandler__onceToken, &__block_literal_global_859);
      }
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.TextInput.lexicon-server" options:4096];
      uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDC549B8];
      [v8 setRemoteObjectInterface:v9];

      [v8 _setQueue:requestLexiconFromBundlePath_completionHandler____xpc_queue];
      [v8 resume];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __60__TILexicon_requestLexiconFromBundlePath_completionHandler___block_invoke_2;
      v13[3] = &unk_1E55599D8;
      id v10 = v7;
      id v14 = v10;
      v11 = [v8 remoteObjectProxyWithErrorHandler:v13];
      objc_super v12 = v11;
      if (v11) {
        [v11 requestLexiconFromBundlePath:v5 completionHandler:v10];
      }
      else {
        (*((void (**)(id, void))v10 + 2))(v10, 0);
      }
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

uint64_t __60__TILexicon_requestLexiconFromBundlePath_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_Uiinputviewcon.isa, a2);
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void __60__TILexicon_requestLexiconFromBundlePath_completionHandler___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.TextInput.lexicon-request", v2);
  v1 = (void *)requestLexiconFromBundlePath_completionHandler____xpc_queue;
  requestLexiconFromBundlePath_completionHandler____xpc_queue = (uint64_t)v0;
}

+ (id)lexiconWithEntries:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end