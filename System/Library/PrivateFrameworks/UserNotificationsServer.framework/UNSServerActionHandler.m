@interface UNSServerActionHandler
- (UNSServerActionHandler)init;
- (UNSServerActionHandlerDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation UNSServerActionHandler

- (UNSServerActionHandlerDelegate)delegate
{
  v2 = (void *)MEMORY[0x223CA0D10]((char *)self + OBJC_IVAR___UNSServerActionHandler_delegate, a2);
  return (UNSServerActionHandlerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (UNSServerActionHandler)init
{
  return (UNSServerActionHandler *)UNSServerActionHandler.init()();
}

- (void)dealloc
{
  v2 = self;
  sub_2228D4B2C();
}

- (void).cxx_destruct
{
  sub_2228D5710((uint64_t)self + OBJC_IVAR___UNSServerActionHandler_delegate);
  swift_release();
  swift_release();
}

@end