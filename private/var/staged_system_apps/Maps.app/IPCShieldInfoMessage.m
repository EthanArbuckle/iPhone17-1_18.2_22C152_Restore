@interface IPCShieldInfoMessage
+ (id)ipcMessageForShieldInfo:(id)a3;
- (IPCShieldInfoMessage)initWithDictionary:(id)a3;
- (NSString)shieldStringID;
- (NSString)shieldText;
- (id)description;
- (id)dictionaryValue;
- (id)shieldInfo;
- (int)shieldID;
- (void)setShieldID:(int)a3;
- (void)setShieldStringID:(id)a3;
- (void)setShieldText:(id)a3;
@end

@implementation IPCShieldInfoMessage

+ (id)ipcMessageForShieldInfo:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(IPCShieldInfoMessage);
  -[IPCShieldInfoMessage setShieldID:](v4, "setShieldID:", [v3 shieldID]);
  v5 = [v3 shieldStringID];
  [(IPCShieldInfoMessage *)v4 setShieldStringID:v5];

  v6 = [v3 shieldText];

  [(IPCShieldInfoMessage *)v4 setShieldText:v6];

  return v4;
}

- (id)shieldInfo
{
  uint64_t v3 = [(IPCShieldInfoMessage *)self shieldID];
  v4 = [(IPCShieldInfoMessage *)self shieldStringID];
  v5 = [(IPCShieldInfoMessage *)self shieldText];
  v6 = +[NavSignShieldInfo shieldWithID:v3 stringID:v4 text:v5];

  return v6;
}

- (IPCShieldInfoMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IPCShieldInfoMessage;
  v5 = [(IPCMessageObject *)&v10 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"kIPCShieldInfoMessageShieldIDKey"];
    -[IPCShieldInfoMessage setShieldID:](v5, "setShieldID:", [v6 integerValue]);

    v7 = [v4 objectForKeyedSubscript:@"kIPCShieldInfoMessageShieldStringIDKey"];
    [(IPCShieldInfoMessage *)v5 setShieldStringID:v7];

    v8 = [v4 objectForKeyedSubscript:@"kIPCShieldInfoMessageShieldTextKey"];
    [(IPCShieldInfoMessage *)v5 setShieldText:v8];
  }
  return v5;
}

- (id)dictionaryValue
{
  v12.receiver = self;
  v12.super_class = (Class)IPCShieldInfoMessage;
  uint64_t v3 = [(IPCMessageObject *)&v12 dictionaryValue];
  id v4 = [v3 mutableCopy];

  v5 = +[NSNumber numberWithInt:[(IPCShieldInfoMessage *)self shieldID]];
  [v4 setObject:v5 forKeyedSubscript:@"kIPCShieldInfoMessageShieldIDKey"];

  v6 = [(IPCShieldInfoMessage *)self shieldStringID];
  id v7 = [v6 copy];
  [v4 setObject:v7 forKeyedSubscript:@"kIPCShieldInfoMessageShieldStringIDKey"];

  v8 = [(IPCShieldInfoMessage *)self shieldText];
  id v9 = [v8 copy];
  [v4 setObject:v9 forKeyedSubscript:@"kIPCShieldInfoMessageShieldTextKey"];

  id v10 = [v4 copy];

  return v10;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)IPCShieldInfoMessage;
  uint64_t v3 = [(IPCShieldInfoMessage *)&v9 description];
  id v4 = +[NSNumber numberWithInt:[(IPCShieldInfoMessage *)self shieldID]];
  v5 = [(IPCShieldInfoMessage *)self shieldStringID];
  v6 = [(IPCShieldInfoMessage *)self shieldText];
  id v7 = +[NSString stringWithFormat:@"%@             shieldID : {%@}             shieldStringID : {%@}             shieldText : {%@}", v3, v4, v5, v6];

  return v7;
}

- (int)shieldID
{
  return self->_shieldID;
}

- (void)setShieldID:(int)a3
{
  self->_shieldID = a3;
}

- (NSString)shieldStringID
{
  return self->_shieldStringID;
}

- (void)setShieldStringID:(id)a3
{
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (void)setShieldText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldText, 0);

  objc_storeStrong((id *)&self->_shieldStringID, 0);
}

@end