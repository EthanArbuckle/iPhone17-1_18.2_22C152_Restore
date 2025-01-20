@interface ICSLogger
+ (id)sharedInstance;
+ (void)logAtLevel:(int64_t)a3 forTokenizer:(id)a4 message:(id)a5;
+ (void)setDelegate:(id)a3;
- (void)logAtLevel:(int64_t)a3 forTokenizer:(id)a4 format:(id)a5 args:(char *)a6;
- (void)setDelegate:(id)a3;
@end

@implementation ICSLogger

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __27__ICSLogger_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(ICSLogger);
  return MEMORY[0x1F41817F8]();
}

- (void)logAtLevel:(int64_t)a3 forTokenizer:(id)a4 format:(id)a5 args:(char *)a6
{
  id v23 = a4;
  id v10 = a5;
  if (!self->_loggingDelegate || self->_logCount > 199) {
    goto LABEL_13;
  }
  if (!v23) {
    goto LABEL_10;
  }
  char v11 = [v23 printedICS];
  if (a3 == 3 && (v11 & 1) == 0)
  {
    id v12 = [NSString alloc];
    v13 = [v23 debugDescription];
    v14 = (void *)[v12 initWithFormat:@"ICS Error for file: %@", v13];

    v15 = [v14 stringByReplacingOccurrencesOfString:@"%" withString:@"%%"];
    [(ICSLoggingDelegate *)self->_loggingDelegate logICSMessage:v15 atLevel:3];
    [v23 setPrintedICS:1];
    ++self->_logCount;
  }
  if ((int)[v23 logCount] <= 4)
  {
    objc_msgSend(v23, "setLogCount:", objc_msgSend(v23, "logCount") + 1);
    if ((int)[v23 logCount] >= 5)
    {
      loggingDelegate = self->_loggingDelegate;
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Hit Max ICS log messages for file! (%i)", 200);
      [(ICSLoggingDelegate *)loggingDelegate logICSMessage:v17 atLevel:3];
    }
LABEL_10:
    v18 = (void *)[[NSString alloc] initWithFormat:v10 arguments:a6];
    v19 = [v18 stringByReplacingOccurrencesOfString:@"%" withString:@"%%"];
    [(ICSLoggingDelegate *)self->_loggingDelegate logICSMessage:v19 atLevel:a3];
    int logCount = self->_logCount;
    self->_int logCount = logCount + 1;
    if (logCount >= 199)
    {
      v21 = self->_loggingDelegate;
      v22 = [NSString stringWithFormat:@"Hit Max ICS log messages (%i), disabling logging!", 200];
      [(ICSLoggingDelegate *)v21 logICSMessage:v22 atLevel:3];
    }
  }
LABEL_13:
}

+ (void)logAtLevel:(int64_t)a3 forTokenizer:(id)a4 message:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = +[ICSLogger sharedInstance];
  [v9 logAtLevel:a3 forTokenizer:v8 format:v7 args:&v10];
}

- (void)setDelegate:(id)a3
{
}

+ (void)setDelegate:(id)a3
{
  id v3 = a3;
  id v4 = +[ICSLogger sharedInstance];
  [v4 setDelegate:v3];
}

- (void).cxx_destruct
{
}

@end