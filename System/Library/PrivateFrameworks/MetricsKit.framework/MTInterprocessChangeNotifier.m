@interface MTInterprocessChangeNotifier
+ (id)fullIdentifier:(id)a3;
+ (void)notify:(id)a3;
- (MTInterprocessChangeNotifier)initWithIdentifier:(id)a3 onChange:(id)a4;
- (void)dealloc;
- (void)notify;
- (void)stop;
@end

@implementation MTInterprocessChangeNotifier

- (MTInterprocessChangeNotifier)initWithIdentifier:(id)a3 onChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MTInterprocessChangeNotifier;
  v8 = [(MTInterprocessChangeNotifier *)&v17 init];
  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = +[MTInterprocessChangeNotifier fullIdentifier:v6];
  identifier = v8->_identifier;
  v8->_identifier = (NSString *)v9;

  v8->_token = -1;
  v11 = [(NSString *)v8->_identifier UTF8String];
  v12 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __60__MTInterprocessChangeNotifier_initWithIdentifier_onChange___block_invoke;
  handler[3] = &unk_264310B60;
  id v16 = v7;
  LODWORD(v11) = notify_register_dispatch(v11, &v8->_token, v12, handler);

  if (!v11 && v8->_token != -1)
  {

LABEL_6:
    v13 = v8;
    goto LABEL_7;
  }

  v13 = 0;
LABEL_7:

  return v13;
}

+ (id)fullIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"MTMetricsKit:%@", a3];
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  [(MTInterprocessChangeNotifier *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)MTInterprocessChangeNotifier;
  [(MTInterprocessChangeNotifier *)&v3 dealloc];
}

- (void)stop
{
  int token = self->_token;
  if ((token & 0x80000000) == 0 && notify_is_valid_token(token))
  {
    notify_cancel(self->_token);
    self->_int token = -1;
  }
}

uint64_t __60__MTInterprocessChangeNotifier_initWithIdentifier_onChange___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)notify
{
  if ((self->_token & 0x80000000) == 0)
  {
    v2 = [(NSString *)self->_identifier UTF8String];
    notify_post(v2);
  }
}

+ (void)notify:(id)a3
{
  id v3 = [a1 fullIdentifier:a3];
  notify_post((const char *)[v3 UTF8String]);
}

@end