@interface CACMessageDisplayOperation
- (BOOL)ignore;
- (CACMessageDisplayOperation)initWithMessageString:(id)a3 type:(int64_t)a4;
- (NSString)message;
- (int64_t)type;
- (void)main;
- (void)setIgnore:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CACMessageDisplayOperation

- (CACMessageDisplayOperation)initWithMessageString:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CACMessageDisplayOperation;
  v7 = [(CACMessageDisplayOperation *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(CACMessageDisplayOperation *)v7 setMessage:v6];
    [(CACMessageDisplayOperation *)v8 setType:a4];
  }

  return v8;
}

- (void)main
{
  if (([(CACMessageDisplayOperation *)self isCancelled] & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__CACMessageDisplayOperation_main__block_invoke;
    block[3] = &unk_264D115D0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    v3 = [(CACMessageDisplayOperation *)self message];
    +[CACDisplayManager durationToDisplayMessageString:v3];
    double v5 = v4;

    if (v5 > 0.0)
    {
      while (([(CACMessageDisplayOperation *)self isCancelled] & 1) == 0)
      {
        if (v5 <= 0.1)
        {
          usleep((v5 * 1000000.0));
          return;
        }
        double v5 = v5 + -0.1;
        usleep(0x186A0u);
        if (v5 <= 0.0) {
          return;
        }
      }
    }
  }
}

void __34__CACMessageDisplayOperation_main__block_invoke(uint64_t a1)
{
  id v3 = +[CACDisplayManager sharedManager];
  v2 = [*(id *)(a1 + 32) message];
  objc_msgSend(v3, "_showBannerViewWithText:type:", v2, objc_msgSend(*(id *)(a1 + 32), "type"));
}

- (BOOL)ignore
{
  return self->_ignore;
}

- (void)setIgnore:(BOOL)a3
{
  self->_ignore = a3;
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setMessage:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end