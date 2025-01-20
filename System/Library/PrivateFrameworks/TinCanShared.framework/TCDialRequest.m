@interface TCDialRequest
- (BOOL)isRemoteUplinkMuted;
- (TCDialRequest)initWithURL:(id)a3;
- (id)URL;
- (unint64_t)state;
- (void)setRemoteUplinkMuted:(BOOL)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation TCDialRequest

- (TCDialRequest)initWithURL:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TCDialRequest;
  v5 = [(TCDialRequest *)&v18 initWithURL:v4];
  if (v5)
  {
    v6 = [MEMORY[0x263F08BA0] componentsWithURL:v4 resolvingAgainstBaseURL:1];
    v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"name=%@", @"sessionState"];
    v8 = [v6 queryItems];
    v9 = [v8 filteredArrayUsingPredicate:v7];
    v10 = [v9 firstObject];

    if (v10)
    {
      v11 = [v10 value];
      [(TCDialRequest *)v5 setState:TCSessionStateFromString(v11)];
    }
    else
    {
      [(TCDialRequest *)v5 setState:0];
    }
    v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"name=%@", @"remoteUplinkMuted"];
    v13 = [v6 queryItems];
    v14 = [v13 filteredArrayUsingPredicate:v12];
    v15 = [v14 firstObject];

    v16 = [v15 value];
    -[TCDialRequest setRemoteUplinkMuted:](v5, "setRemoteUplinkMuted:", [v16 isEqualToString:@"YES"]);
  }
  return v5;
}

- (id)URL
{
  v16.receiver = self;
  v16.super_class = (Class)TCDialRequest;
  v3 = [(TCDialRequest *)&v16 URL];
  if ([(TCDialRequest *)self state])
  {
    id v4 = [MEMORY[0x263F08BA0] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    v5 = [v4 queryItems];
    if (v5)
    {
      v6 = [v4 queryItems];
      v7 = (void *)[v6 mutableCopy];
    }
    else
    {
      v7 = [MEMORY[0x263EFF980] array];
    }

    v8 = (void *)MEMORY[0x263F08BD0];
    v9 = NSStringFromTCSessionState([(TCDialRequest *)self state]);
    v10 = [v8 queryItemWithName:@"sessionState" value:v9];

    [v7 addObject:v10];
    v11 = (void *)MEMORY[0x263F08BD0];
    if ([(TCDialRequest *)self isRemoteUplinkMuted]) {
      v12 = @"YES";
    }
    else {
      v12 = @"NO";
    }
    v13 = [v11 queryItemWithName:@"remoteUplinkMuted" value:v12];
    [v7 addObject:v13];
    [v4 setQueryItems:v7];
    uint64_t v14 = [v4 URL];

    v3 = (void *)v14;
  }
  return v3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)isRemoteUplinkMuted
{
  return self->_remoteUplinkMuted;
}

- (void)setRemoteUplinkMuted:(BOOL)a3
{
  self->_remoteUplinkMuted = a3;
}

@end