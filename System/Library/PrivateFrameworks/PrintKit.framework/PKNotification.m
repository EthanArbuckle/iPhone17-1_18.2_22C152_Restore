@interface PKNotification
- (NSDate)endTime;
- (NSDate)startTime;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)headerString;
- (NSString)messageString;
- (OS_dispatch_queue)resultQueue;
- (PKNotification)initWithNotifier:(id)a3 notifyKind:(int)a4;
- (PKNotifier)notifier;
- (id)_makeDict;
- (id)resultHandler;
- (int)kind;
- (unint64_t)_makeFlags;
- (void)_interpretResult:(unint64_t)a3 responseDict:(id)a4;
- (void)cancel;
- (void)setAlternateButtonTitle:(id)a3;
- (void)setDefaultButtonTitle:(id)a3;
- (void)setHeaderString:(id)a3;
- (void)setMessageString:(id)a3;
- (void)setResultHandler:(id)a3;
- (void)setResultQueue:(id)a3;
- (void)start;
@end

@implementation PKNotification

- (PKNotification)initWithNotifier:(id)a3 notifyKind:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKNotification;
  v8 = [(PKNotification *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notifier, a3);
    v9->_kind = a4;
  }

  return v9;
}

- (void)cancel
{
}

- (void)start
{
  notifier = self->_notifier;
  unint64_t v4 = [(PKNotification *)self _makeFlags];
  id v5 = [(PKNotification *)self _makeDict];
  -[PKNotifier startNotification:options:dict:](notifier, "startNotification:options:dict:", self, v4);
}

- (unint64_t)_makeFlags
{
  return self->_kind;
}

- (id)_makeDict
{
  v3 = objc_opt_new();
  unint64_t v4 = [(PKNotification *)self headerString];

  if (v4)
  {
    id v5 = [(PKNotification *)self headerString];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263EFFFC8]];
  }
  v6 = [(PKNotification *)self messageString];

  if (v6)
  {
    id v7 = [(PKNotification *)self messageString];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x263EFFFD8]];
  }
  v8 = [(PKNotification *)self defaultButtonTitle];

  if (v8)
  {
    v9 = [(PKNotification *)self defaultButtonTitle];
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x263F00000]];
  }
  v10 = [(PKNotification *)self alternateButtonTitle];

  if (v10)
  {
    objc_super v11 = [(PKNotification *)self alternateButtonTitle];
    [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x263EFFFE8]];
  }
  [v3 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F79610]];
  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F79628]];
  [v3 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F795D0]];

  return v3;
}

- (void)_interpretResult:(unint64_t)a3 responseDict:(id)a4
{
  v6 = [(PKNotification *)self resultHandler];
  id v7 = [(PKNotification *)self resultQueue];
  uint64_t v8 = 2 * (a3 == 1);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__PKNotification__interpretResult_responseDict___block_invoke;
  v10[3] = &unk_2649EDCF0;
  if (!a3) {
    uint64_t v8 = 1;
  }
  id v11 = v6;
  uint64_t v12 = v8;
  id v9 = v6;
  dispatch_async(v7, v10);
}

uint64_t __48__PKNotification__interpretResult_responseDict___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (OS_dispatch_queue)resultQueue
{
  return self->_resultQueue;
}

- (void)setResultQueue:(id)a3
{
  self->_resultQueue = (OS_dispatch_queue *)a3;
}

- (id)resultHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setResultHandler:(id)a3
{
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)endTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (PKNotifier)notifier
{
  return (PKNotifier *)objc_getProperty(self, a2, 48, 1);
}

- (int)kind
{
  return self->_kind;
}

- (NSString)headerString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHeaderString:(id)a3
{
}

- (NSString)messageString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMessageString:(id)a3
{
}

- (NSString)defaultButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDefaultButtonTitle:(id)a3
{
}

- (NSString)alternateButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAlternateButtonTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_messageString, 0);
  objc_storeStrong((id *)&self->_headerString, 0);
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong(&self->_resultHandler, 0);
}

@end