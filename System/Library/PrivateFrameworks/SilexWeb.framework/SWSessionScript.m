@interface SWSessionScript
- (BOOL)queueable;
- (NSString)identifier;
- (SWSession)session;
- (SWSessionScript)initWithSession:(id)a3;
- (WKUserScript)userScript;
@end

@implementation SWSessionScript

- (NSString)identifier
{
  return (NSString *)@"session";
}

- (SWSessionScript)initWithSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWSessionScript;
  v6 = [(SWSessionScript *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_session, a3);
  }

  return v7;
}

- (BOOL)queueable
{
  return 0;
}

- (WKUserScript)userScript
{
  v12[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F08900];
  v11 = @"identifier";
  v3 = [(SWSessionScript *)self session];
  v4 = [v3 identifier];
  v12[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v6 = [v2 dataWithJSONObject:v5 options:0 error:0];

  v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  v8 = [NSString stringWithFormat:@"applenews.session = %@", v7];
  objc_super v9 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v8 injectionTime:0 forMainFrameOnly:1];

  return (WKUserScript *)v9;
}

- (SWSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
}

@end