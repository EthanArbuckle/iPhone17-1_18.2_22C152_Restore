@interface IPCLoadDirectionsMessage
- (BOOL)originIsWatch;
- (IPCLoadDirectionsMessage)initWithDictionary:(id)a3;
- (NSData)routeContextData;
- (NSData)routePersistentData;
- (NSURL)url;
- (id)description;
- (id)dictionaryValue;
- (void)setOriginIsWatch:(BOOL)a3;
- (void)setRouteContextData:(id)a3;
- (void)setRoutePersistentData:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation IPCLoadDirectionsMessage

- (IPCLoadDirectionsMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IPCLoadDirectionsMessage;
  v5 = [(IPCMessageObject *)&v13 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"kIPCLoadDirectionsMessageURL"];

    if (v6)
    {
      v7 = [v4 objectForKeyedSubscript:@"kIPCLoadDirectionsMessageURL"];
      v8 = +[NSURL URLWithString:v7];
      [(IPCLoadDirectionsMessage *)v5 setUrl:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"kIPCLoadDirectionsMessageOriginIsWatch"];
    -[IPCLoadDirectionsMessage setOriginIsWatch:](v5, "setOriginIsWatch:", [v9 BOOLValue]);

    v10 = [v4 objectForKeyedSubscript:@"kIPCLoadDirectionsMessageRouteContextData"];
    [(IPCLoadDirectionsMessage *)v5 setRouteContextData:v10];

    v11 = [v4 objectForKeyedSubscript:@"kIPCLoadDirectionsMessageRoutePersistentData"];
    [(IPCLoadDirectionsMessage *)v5 setRoutePersistentData:v11];
  }
  return v5;
}

- (id)dictionaryValue
{
  v14.receiver = self;
  v14.super_class = (Class)IPCLoadDirectionsMessage;
  v3 = [(IPCMessageObject *)&v14 dictionaryValue];
  id v4 = [v3 mutableCopy];

  v5 = [(IPCLoadDirectionsMessage *)self url];
  v6 = [v5 absoluteString];
  [v4 setObject:v6 forKeyedSubscript:@"kIPCLoadDirectionsMessageURL"];

  v7 = +[NSNumber numberWithBool:[(IPCLoadDirectionsMessage *)self originIsWatch]];
  [v4 setObject:v7 forKeyedSubscript:@"kIPCLoadDirectionsMessageOriginIsWatch"];

  v8 = [(IPCLoadDirectionsMessage *)self routeContextData];
  id v9 = [v8 copy];
  [v4 setObject:v9 forKeyedSubscript:@"kIPCLoadDirectionsMessageRouteContextData"];

  v10 = [(IPCLoadDirectionsMessage *)self routePersistentData];
  id v11 = [v10 copy];
  [v4 setObject:v11 forKeyedSubscript:@"kIPCLoadDirectionsMessageRoutePersistentData"];

  id v12 = [v4 copy];

  return v12;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IPCLoadDirectionsMessage;
  v3 = [(IPCLoadDirectionsMessage *)&v7 description];
  id v4 = [(IPCLoadDirectionsMessage *)self dictionaryValue];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BOOL)originIsWatch
{
  return self->_originIsWatch;
}

- (void)setOriginIsWatch:(BOOL)a3
{
  self->_originIsWatch = a3;
}

- (NSData)routeContextData
{
  return self->_routeContextData;
}

- (void)setRouteContextData:(id)a3
{
}

- (NSData)routePersistentData
{
  return self->_routePersistentData;
}

- (void)setRoutePersistentData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePersistentData, 0);
  objc_storeStrong((id *)&self->_routeContextData, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end