@interface TSUWarning
+ (id)fontWarningWithMessage:(id)a3 fontNames:(id)a4;
+ (id)warningWithKind:(int64_t)a3 message:(id)a4;
+ (id)warningWithMessage:(id)a3;
+ (id)warningWithMessage:(id)a3 affectedObject:(id)a4;
+ (id)warningWithMessage:(id)a3 affectedObjects:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFontWarning;
- (NSDictionary)userInfo;
- (NSString)detailMessage;
- (NSString)message;
- (TSUWarning)initWithKind:(int64_t)a3 message:(id)a4;
- (id)affectedObjects;
- (int64_t)kind;
- (int64_t)severity;
- (unint64_t)hash;
- (void)addAffectedObjects:(id)a3;
- (void)setAffectedObjects:(id)a3;
- (void)setDetailMessage:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation TSUWarning

+ (id)warningWithMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithKind:0 message:v4];

  return v5;
}

+ (id)warningWithMessage:(id)a3 affectedObject:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    a4 = [MEMORY[0x263EFFA08] setWithObject:a4];
  }
  v7 = [a1 warningWithMessage:v6 affectedObjects:a4];

  return v7;
}

+ (id)warningWithMessage:(id)a3 affectedObjects:(id)a4
{
  id v6 = a4;
  v7 = [a1 warningWithMessage:a3];
  if ([v6 count]) {
    [v7 setAffectedObjects:v6];
  }

  return v7;
}

+ (id)warningWithKind:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithKind:a3 message:v6];

  return v7;
}

- (TSUWarning)initWithKind:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TSUWarning;
  v7 = [(TSUWarning *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_kind = a3;
    uint64_t v9 = [v6 copy];
    message = v8->_message;
    v8->_message = (NSString *)v9;
  }
  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_message hash];
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  v8 = TSUDynamicCast(v7, (uint64_t)v6);

  if (v8)
  {
    int64_t kind = self->_kind;
    if (kind == [v8 kind])
    {
      message = self->_message;
      v11 = [v8 message];
      if (message != v11)
      {
        objc_super v12 = self->_message;
        v3 = [v8 message];
        if (![(NSString *)v12 isEqualToString:v3])
        {
          char v13 = 0;
          goto LABEL_16;
        }
      }
      detailMessage = self->_detailMessage;
      v15 = [v8 detailMessage];
      if (detailMessage == v15
        || (v16 = self->_detailMessage,
            [v8 detailMessage],
            id v4 = objc_claimAutoreleasedReturnValue(),
            [(NSString *)v16 isEqualToString:v4]))
      {
        userInfo = self->_userInfo;
        uint64_t v18 = [v8 userInfo];
        if (userInfo == (NSDictionary *)v18)
        {

          char v13 = 1;
        }
        else
        {
          v19 = (void *)v18;
          v20 = self->_userInfo;
          v21 = [v8 userInfo];
          char v13 = [(NSDictionary *)v20 isEqualToDictionary:v21];
        }
        if (detailMessage == v15)
        {
LABEL_15:

          if (message == v11)
          {
LABEL_17:

            goto LABEL_18;
          }
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
        char v13 = 0;
      }

      goto LABEL_15;
    }
  }
  char v13 = 0;
LABEL_18:

  return v13;
}

- (int64_t)severity
{
  return self->_kind != 1;
}

- (id)affectedObjects
{
  v2 = [(NSDictionary *)self->_userInfo objectForKeyedSubscript:@"TSUWarningUserInfoAffectedObjectsKey"];
  v3 = (void *)[v2 copy];

  return v3;
}

- (void)setAffectedObjects:(id)a3
{
  userInfo = self->_userInfo;
  if (userInfo)
  {
    id v6 = a3;
    uint64_t v7 = (void *)[(NSDictionary *)userInfo mutableCopy];
  }
  else
  {
    v8 = (void *)MEMORY[0x263EFF9A0];
    id v9 = a3;
    uint64_t v7 = [v8 dictionary];
  }
  id v10 = v7;
  [v7 setObject:a3 forKeyedSubscript:@"TSUWarningUserInfoAffectedObjectsKey"];

  [(TSUWarning *)self setUserInfo:v10];
}

- (void)addAffectedObjects:(id)a3
{
  id v4 = a3;
  v5 = [(TSUWarning *)self affectedObjects];
  id v7 = v5;
  if (v5)
  {
    uint64_t v6 = [v5 setByAddingObjectsFromSet:v4];

    id v4 = (id)v6;
  }
  [(TSUWarning *)self setAffectedObjects:v4];
}

+ (id)fontWarningWithMessage:(id)a3 fontNames:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithKind:1 message:v7];

  if ([v6 count]) {
    [v8 setAffectedObjects:v6];
  }

  return v8;
}

- (BOOL)isFontWarning
{
  return self->_kind == 1;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)detailMessage
{
  return self->_detailMessage;
}

- (void)setDetailMessage:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_detailMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end