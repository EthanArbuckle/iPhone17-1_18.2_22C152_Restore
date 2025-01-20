@interface WCRAppleAllowList
- (BOOL)contains:(id)a3;
- (NSSet)allowList;
- (NSString)localPath;
- (id)initFromFile:(id)a3;
- (void)setAllowList:(id)a3;
@end

@implementation WCRAppleAllowList

- (id)initFromFile:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WCRAppleAllowList;
  v6 = [(WCRAppleAllowList *)&v16 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  p_localPath = &v6->_localPath;
  objc_storeStrong((id *)&v6->_localPath, a3);
  v9 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v7->_localPath];
  v10 = [v9 objectForKey:@"Allow-List"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [NSString stringWithFormat:@"Failed to initialize Apple allow list at path %@: unknown format", *p_localPath];
    v14 = LABEL_8:;
    +[WCRLogging log:v14 withType:0];

    v13 = 0;
    goto LABEL_9;
  }
  uint64_t v11 = [MEMORY[0x263EFFA08] setWithArray:v10];
  allowList = v7->_allowList;
  v7->_allowList = (NSSet *)v11;

  if (!v7->_allowList)
  {
    [NSString stringWithFormat:@"Failed to initialize Apple allow list at path %@", *p_localPath];
    goto LABEL_8;
  }

LABEL_5:
  v13 = v7;
LABEL_9:

  return v13;
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  id v5 = [(WCRAppleAllowList *)self allowList];
  v6 = [v4 host];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (NSString)localPath
{
  return self->_localPath;
}

- (NSSet)allowList
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAllowList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowList, 0);
  objc_storeStrong((id *)&self->_localPath, 0);
}

@end