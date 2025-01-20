@interface PLLoggingServiceListener
+ (PLLoggingServiceListener)sharedInstance;
- (NSXPCListener)listener;
- (NSXPCListenerDelegate)delegate;
- (PLLoggingServiceListener)init;
- (void)setDelegate:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation PLLoggingServiceListener

- (PLLoggingServiceListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLLoggingServiceListener;
  return [(PLLoggingServiceListener *)&v3 init];
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSXPCListenerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

+ (PLLoggingServiceListener)sharedInstance
{
  if (qword_267C93410 != -1) {
    swift_once();
  }
  v2 = (void *)qword_267C935E0;
  return (PLLoggingServiceListener *)v2;
}

@end