@interface TCMessageException
+ (id)exceptionWithMessage:(id)a3;
+ (id)exceptionWithUntaggedMessage:(id)a3;
+ (id)nsError:(id)a3 domain:(id)a4;
+ (void)initialize;
+ (void)raise:(id)a3;
+ (void)raiseUntaggedMessage:(id)a3;
- (TCMessageException)initWithMessage:(id)a3;
- (TCMessageException)initWithUntaggedMessage:(id)a3;
- (id)description;
- (id)getEntry;
@end

@implementation TCMessageException

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && (initAllMessages(void)::alreadyDone & 1) == 0)
  {
    initAllMessages(void)::alreadyDone = 1;
    objc_opt_class();
  }
}

- (TCMessageException)initWithMessage:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TCMessageException;
  v5 = [(TCMessageException *)&v12 initWithName:@"TCMessageException" reason:0 userInfo:0];
  if (v5)
  {
    v6 = [TCMessageEntry alloc];
    uint64_t v7 = [v4 messageTag];
    v8 = [v4 messageText];
    uint64_t v9 = [(TCMessageEntry *)v6 initWithTag:v7 affectedObject:0 text:v8 parameters:&v13];
    m_entry = v5->m_entry;
    v5->m_entry = (TCMessageEntry *)v9;
  }
  return v5;
}

- (TCMessageException)initWithUntaggedMessage:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCMessageException;
  v5 = [(TCMessageException *)&v9 initWithName:@"TCMessageException" reason:0 userInfo:0];
  if (v5)
  {
    v6 = [[TCMessageEntry alloc] initWithTag:0xFFFFFFFFLL affectedObject:0 text:v4 parameters:&v10];
    m_entry = v5->m_entry;
    v5->m_entry = v6;
  }
  return v5;
}

+ (id)exceptionWithMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithName:@"TCMessageException" reason:0 userInfo:0];
  if (v5)
  {
    v6 = [TCMessageEntry alloc];
    uint64_t v7 = [v4 messageTag];
    v8 = [v4 messageText];
    uint64_t v9 = [(TCMessageEntry *)v6 initWithTag:v7 affectedObject:0 text:v8 parameters:&v13];
    uint64_t v10 = (void *)v5[5];
    v5[5] = v9;
  }
  return v5;
}

+ (id)exceptionWithUntaggedMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithName:@"TCMessageException" reason:0 userInfo:0];
  if (v5)
  {
    v6 = [[TCMessageEntry alloc] initWithTag:0xFFFFFFFFLL affectedObject:0 text:v4 parameters:&v10];
    uint64_t v7 = (void *)v5[5];
    v5[5] = v6;
  }
  return v5;
}

- (id)getEntry
{
  return self->m_entry;
}

+ (void)raise:(id)a3
{
  id v3 = a3;
  id v4 = +[TCMessageException exceptionWithName:@"TCMessageException" reason:0 userInfo:0];
  v5 = [TCMessageEntry alloc];
  uint64_t v6 = [v3 messageTag];
  uint64_t v7 = [v3 messageText];
  uint64_t v8 = [(TCMessageEntry *)v5 initWithTag:v6 affectedObject:0 text:v7 parameters:&v10];
  uint64_t v9 = (void *)v4[5];
  v4[5] = v8;

  [v4 raise];
}

+ (void)raiseUntaggedMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[TCMessageException exceptionWithName:@"TCMessageException" reason:0 userInfo:0];
  v5 = [[TCMessageEntry alloc] initWithTag:0xFFFFFFFFLL affectedObject:0 text:v3 parameters:&v7];
  uint64_t v6 = (void *)v4[5];
  v4[5] = v5;

  [v4 raise];
}

- (id)description
{
  v2 = NSString;
  id v3 = [(TCMessageEntry *)self->m_entry description];
  id v4 = [v2 stringWithFormat:@"TCMessageException: %@", v3];

  return v4;
}

+ (id)nsError:(id)a3 domain:(id)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [v5 getEntry];
  uint64_t v8 = [v7 getMessageText];
  if (!v8)
  {

    goto LABEL_10;
  }
  uint64_t v9 = [(id)TCUnknownProblemMessage messageText];
  char v10 = [v8 isEqualToString:v9];

  if (v10)
  {
LABEL_10:
    v19 = [v5 name];
    int v20 = [v19 isEqualToString:*MEMORY[0x263EFF570]];

    if (v20)
    {
      uint64_t v21 = [(id)TCOutOfMemoryMessage messageText];

      uint64_t v8 = (void *)v21;
    }
    uint64_t v12 = 0;
    v14 = 0;
    v17 = 0;
    v16 = (void *)MEMORY[0x263F087E8];
    goto LABEL_13;
  }
  v11 = [v5 getEntry];
  LODWORD(v12) = [v11 getMessageTag];

  uint64_t v13 = [v5 getEntry];
  v14 = [v13 getAdditionalText];

  if ([v8 isEqualToString:@"TCUserCancelled"])
  {
    v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
    if (v15) {
      goto LABEL_16;
    }
  }
  v16 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = (int)v12;
  if (v14)
  {
    uint64_t v23 = *MEMORY[0x263F08338];
    v24[0] = v14;
    v17 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    char v18 = 0;
    goto LABEL_14;
  }
  v17 = 0;
LABEL_13:
  char v18 = 1;
LABEL_14:
  v15 = objc_msgSend(v16, "tsu_errorWithDomain:code:alertTitle:alertMessage:userInfo:", v6, v12, v8, v14, v17);
  if ((v18 & 1) == 0) {

  }
LABEL_16:
  return v15;
}

- (void).cxx_destruct
{
}

@end