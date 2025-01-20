@interface CMMapper
- (CMMapper)init;
- (CMMapper)initWithParent:(id)a3;
- (CMMapper)parent;
- (NSString)fileName;
- (OCDDocument)document;
- (id)archiver;
- (id)root;
- (void)addAttribute:(id)a3 toNode:(id)a4 value:(id)a5;
- (void)addStyle:(id)a3 withName:(id)a4;
- (void)addStyleUsingGlobalCacheTo:(id)a3 style:(id)a4;
- (void)addStyleUsingGlobalCacheTo:(id)a3 style:(id)a4 embedStyle:(BOOL)a5;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapStylesheetAt:(id)a3 stylesheet:(id)a4;
- (void)mapWithState:(id)a3;
- (void)setFileName:(id)a3;
@end

@implementation CMMapper

- (CMMapper)initWithParent:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMMapper;
  v5 = [(CMMapper *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mParent, v4);
    uint64_t v7 = [v4 root];
    v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = v4;
    }
    objc_storeWeak((id *)&v6->mRoot, v9);
  }
  return v6;
}

- (void)addStyleUsingGlobalCacheTo:(id)a3 style:(id)a4
{
  id v9 = a3;
  v6 = [a4 cssStyleString];
  if ([v6 length])
  {
    uint64_t v7 = [(CMMapper *)self archiver];
    v8 = [v7 addCssStyle:v6];

    if (v8) {
      [(CMMapper *)self addAttribute:0x26EBF96F8 toNode:v9 value:v8];
    }
    else {
      [(CMMapper *)self addAttribute:0x26EBFB938 toNode:v9 value:v6];
    }
  }
}

- (void)addAttribute:(id)a3 toNode:(id)a4 value:(id)a5
{
  id v8 = a4;
  uint64_t v7 = +[OIXMLAttribute attributeWithName:a3 stringValue:a5];
  [v8 addAttribute:v7];
}

- (void)addStyleUsingGlobalCacheTo:(id)a3 style:(id)a4 embedStyle:(BOOL)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a5)
  {
    v10 = [v8 cssStyleString];
    [(CMMapper *)self addAttribute:@"style" toNode:v11 value:v10];
  }
  else
  {
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v11 style:v8];
  }
}

- (id)root
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mRoot);
  return WeakRetained;
}

- (CMMapper)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParent);
  return (CMMapper *)WeakRetained;
}

- (id)archiver
{
  mArchiver = self->mArchiver;
  if (mArchiver)
  {
    v3 = mArchiver;
  }
  else
  {
    p_mRoot = &self->mRoot;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mRoot);
    int v6 = [WeakRetained conformsToProtocol:&unk_26ECDA8A0];

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_mRoot);
      v3 = [v7 archiver];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)mapStylesheetAt:(id)a3 stylesheet:(id)a4
{
  id v7 = a3;
  v5 = +[OIXMLElement elementWithType:17 stringValue:a4];
  int v6 = +[OIXMLAttribute attributeWithName:0x26EC11B98 stringValue:0x26EC18D18];
  [v5 addAttribute:v6];

  [v7 addChild:v5];
}

- (CMMapper)init
{
  return [(CMMapper *)self initWithParent:0];
}

- (void)addStyle:(id)a3 withName:(id)a4
{
  id v8 = a4;
  int v6 = [a3 cssStyleString];
  id v7 = [(CMMapper *)self archiver];
  [v7 addCssStyle:v6 withName:v8];
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"CMMapper.mm", 99, @"Please implement -[%@ %@]", v6, v7 object file lineNumber description];
}

- (void)mapWithState:(id)a3
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, @"CMMapper.mm", 105, @"Please implement -[%@ %@]", v5, v6 object file lineNumber description];
}

- (OCDDocument)document
{
  return self->_document;
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFileName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->mArchiver, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_destroyWeak((id *)&self->mRoot);
  objc_destroyWeak((id *)&self->mParent);
}

@end