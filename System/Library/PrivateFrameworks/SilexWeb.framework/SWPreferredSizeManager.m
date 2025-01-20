@interface SWPreferredSizeManager
- (SWLogger)logger;
- (SWPreferredSizeManager)initWithMessageHandlerManager:(id)a3 logger:(id)a4;
- (id)preferredSizeBlock;
- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4;
- (void)onPreferredSize:(id)a3;
@end

@implementation SWPreferredSizeManager

- (SWPreferredSizeManager)initWithMessageHandlerManager:(id)a3 logger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)SWPreferredSizeManager;
    v8 = [(SWPreferredSizeManager *)&v13 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_logger, a4);
      v10 = +[SWWeakMessageHandler handlerWithMessageHandler:v9];
      [v6 addMessageHandler:v10 name:@"preferredSize"];
    }
    self = v9;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  id v5 = a3;
  id v6 = [v5 body];
  id v19 = [v6 objectForKey:@"height"];

  id v7 = [v5 body];
  v8 = [v7 objectForKey:@"width"];

  v9 = [(SWPreferredSizeManager *)self logger];
  v10 = NSString;
  v11 = [v5 name];
  v12 = ;
  [v9 log:v12];

  objc_opt_class();
  double v13 = 0.0;
  double v14 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v8 floatValue];
    double v14 = roundf(v15);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v19 floatValue];
    double v13 = roundf(v16);
  }
  v17 = [(SWPreferredSizeManager *)self preferredSizeBlock];

  if (v17)
  {
    v18 = [(SWPreferredSizeManager *)self preferredSizeBlock];
    v18[2](v14, v13);
  }
}

- (id)preferredSizeBlock
{
  return self->preferredSizeBlock;
}

- (void)onPreferredSize:(id)a3
{
}

- (SWLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong(&self->preferredSizeBlock, 0);
}

@end