@interface UISNotificationResponseAction
- (BOOL)isDefaultAction;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isLocal;
- (BOOL)isRemote;
- (UISNotificationResponseAction)initWithResponse:(id)a3 withHandler:(id)a4;
- (UISNotificationResponseAction)initWithXPCDictionary:(id)a3;
- (UNNotificationResponse)response;
- (id)_trigger;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)UIActionType;
@end

@implementation UISNotificationResponseAction

- (UISNotificationResponseAction)initWithResponse:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"UISNotificationResponseAction.m", 28, @"Invalid parameter not satisfying: %@", @"response" object file lineNumber description];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F62860]);
  [v9 setObject:v7 forSetting:1];
  if (v8)
  {
    v10 = [MEMORY[0x1E4F627D0] responderWithHandler:v8];
    v11 = v10;
    if (v10) {
      [v10 setQueue:MEMORY[0x1E4F14428]];
    }
  }
  else
  {
    v11 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)UISNotificationResponseAction;
  v12 = [(UISNotificationResponseAction *)&v17 initWithInfo:v9 responder:v11];
  if (v12)
  {
    uint64_t v13 = [v7 copy];
    response = v12->_response;
    v12->_response = (UNNotificationResponse *)v13;
  }
  return v12;
}

- (BOOL)isLocal
{
  return ![(UISNotificationResponseAction *)self isRemote];
}

- (BOOL)isRemote
{
  v2 = [(UISNotificationResponseAction *)self _trigger];
  NSClassFromString(&cfstr_Unpushnotifica.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isDefaultAction
{
  v2 = [(UISNotificationResponseAction *)self response];
  v3 = [v2 actionIdentifier];

  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v4 = (void *)_MergedGlobals_6;
  uint64_t v13 = _MergedGlobals_6;
  if (!_MergedGlobals_6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getUNNotificationDefaultActionIdentifierSymbolLoc_block_invoke;
    v9[3] = &unk_1E5735260;
    v9[4] = &v10;
    __getUNNotificationDefaultActionIdentifierSymbolLoc_block_invoke(v9);
    v4 = (void *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (v4)
  {
    char v5 = [v3 isEqualToString:*v4];

    return v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"NSString *const getUNNotificationDefaultActionIdentifier(void)"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"UISNotificationResponseAction.m", 19, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (id)_trigger
{
  v2 = [(UISNotificationResponseAction *)self response];
  v3 = [v2 notification];
  v4 = [v3 request];
  char v5 = [v4 trigger];

  return v5;
}

- (int64_t)UIActionType
{
  return 26;
}

- (UISNotificationResponseAction)initWithXPCDictionary:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UISNotificationResponseAction;
  v3 = [(UISNotificationResponseAction *)&v9 initWithXPCDictionary:a3];
  v4 = v3;
  if (v3)
  {
    char v5 = [(UISNotificationResponseAction *)v3 info];
    uint64_t v6 = [v5 objectForSetting:1];

    response = v4->_response;
    v4->_response = (UNNotificationResponse *)v6;
  }
  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"response";
  }
  else {
    return 0;
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 == 1)
  {
    id v7 = [(UNNotificationResponse *)self->_response description];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISNotificationResponseAction;
  if (-[UISNotificationResponseAction isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  }
}

- (UNNotificationResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
}

@end