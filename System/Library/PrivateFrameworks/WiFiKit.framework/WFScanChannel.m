@interface WFScanChannel
- (NSString)description;
- (WFScanChannel)init;
- (WFScanChannel)initWithChannel:(int64_t)a3 flags:(int64_t)a4;
- (unint64_t)channel;
- (unint64_t)flags;
- (void)setChannel:(unint64_t)a3;
- (void)setFlags:(unint64_t)a3;
@end

@implementation WFScanChannel

- (WFScanChannel)initWithChannel:(int64_t)a3 flags:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WFScanChannel;
  result = [(WFScanChannel *)&v7 init];
  if (result)
  {
    result->_channel = a3;
    result->_flags = a4;
  }
  return result;
}

- (WFScanChannel)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"-[WFScanChannel init] unavailable" userInfo:0];
  objc_exception_throw(v2);
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: Channel: %d Flags: %d>", v5, -[WFScanChannel channel](self, "channel"), -[WFScanChannel flags](self, "flags")];

  return (NSString *)v6;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_channel = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

@end