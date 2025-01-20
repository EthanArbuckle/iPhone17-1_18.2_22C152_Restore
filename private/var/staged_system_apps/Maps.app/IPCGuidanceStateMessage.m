@interface IPCGuidanceStateMessage
- (BOOL)includeRoute;
- (IPCGuidanceStateMessage)initWithDictionary:(id)a3;
- (id)description;
- (id)dictionaryValue;
- (void)setIncludeRoute:(BOOL)a3;
@end

@implementation IPCGuidanceStateMessage

- (IPCGuidanceStateMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IPCGuidanceStateMessage;
  v5 = [(IPCMessageObject *)&v8 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateMessageIncludeRouteKey"];
    -[IPCGuidanceStateMessage setIncludeRoute:](v5, "setIncludeRoute:", [v6 BOOLValue]);
  }
  return v5;
}

- (id)dictionaryValue
{
  v8.receiver = self;
  v8.super_class = (Class)IPCGuidanceStateMessage;
  v3 = [(IPCMessageObject *)&v8 dictionaryValue];
  id v4 = [v3 mutableCopy];

  v5 = +[NSNumber numberWithBool:[(IPCGuidanceStateMessage *)self includeRoute]];
  [v4 setObject:v5 forKeyedSubscript:@"kIPCGuidanceStateMessageIncludeRouteKey"];

  id v6 = [v4 copy];

  return v6;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IPCGuidanceStateMessage;
  v3 = [(IPCGuidanceStateMessage *)&v7 description];
  id v4 = [(IPCGuidanceStateMessage *)self dictionaryValue];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)includeRoute
{
  return self->_includeRoute;
}

- (void)setIncludeRoute:(BOOL)a3
{
  self->_includeRoute = a3;
}

@end