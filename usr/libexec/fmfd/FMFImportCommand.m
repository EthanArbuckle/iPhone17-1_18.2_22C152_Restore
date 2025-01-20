@interface FMFImportCommand
- (FMFImportCommand)initWithClientSession:(id)a3 mappingPacketToken:(id)a4;
- (NSString)mappingPacketToken;
- (NSString)responseId;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)processCommandResponse:(id)a3;
- (void)setMappingPacketToken:(id)a3;
- (void)setResponseId:(id)a3;
@end

@implementation FMFImportCommand

- (FMFImportCommand)initWithClientSession:(id)a3 mappingPacketToken:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMFImportCommand;
  v7 = [(FMFBaseCmd *)&v10 initWithClientSession:a3];
  v8 = v7;
  if (v6 && v7)
  {
    [(FMFImportCommand *)v7 setMappingPacketToken:v6];
  }
  else
  {
    [(FMFBaseCmd *)v7 initFailed];

    v8 = 0;
  }

  return v8;
}

- (id)pathSuffix
{
  return @"import";
}

- (id)jsonBodyDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)FMFImportCommand;
  v3 = [(FMFBaseCmd *)&v6 jsonBodyDictionary];
  v4 = [(FMFImportCommand *)self mappingPacketToken];
  [v3 setObject:v4 forKey:@"url"];

  return v3;
}

- (void)processCommandResponse:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FMFImportCommand;
  [(FMFBaseCmd *)&v16 processCommandResponse:v4];
  v5 = [v4 objectForKey:@"id"];
  uint64_t v6 = +[NSNull null];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    v8 = [v4 objectForKey:@"id"];

    if (v8)
    {
      [(FMFImportCommand *)self setResponseId:v8];
      goto LABEL_12;
    }
  }
  v9 = [v4 objectForKey:@"commandResponse"];
  objc_super v10 = +[NSNull null];
  if (v9 == v10)
  {
    v8 = 0;
  }
  else
  {
    v8 = [v4 objectForKey:@"commandResponse"];
  }

  v11 = [v8 objectForKey:@"url"];
  v12 = +[NSNull null];
  if (v11 == v12)
  {
    v13 = 0;
  }
  else
  {
    v13 = [v8 objectForKey:@"url"];
  }

  v14 = [v13 componentsSeparatedByString:@"/"];
  v15 = [v14 lastObject];

  [(FMFImportCommand *)self setResponseId:v15];
LABEL_12:
}

- (NSString)responseId
{
  return self->_responseId;
}

- (void)setResponseId:(id)a3
{
}

- (NSString)mappingPacketToken
{
  return self->_mappingPacketToken;
}

- (void)setMappingPacketToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingPacketToken, 0);

  objc_storeStrong((id *)&self->_responseId, 0);
}

@end