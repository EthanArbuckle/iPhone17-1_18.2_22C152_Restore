@interface StreamContext
- (OS_dispatch_source)readSource;
- (StreamContext)init;
- (unsigned)streamFlags;
- (void)setReadSource:(id)a3;
- (void)setStreamFlags:(unsigned int)a3;
@end

@implementation StreamContext

- (void).cxx_destruct
{
}

- (void)setStreamFlags:(unsigned int)a3
{
  self->_streamFlags = a3;
}

- (unsigned)streamFlags
{
  return self->_streamFlags;
}

- (void)setReadSource:(id)a3
{
}

- (OS_dispatch_source)readSource
{
  return self->_readSource;
}

- (StreamContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)StreamContext;
  return [(StreamContext *)&v3 init];
}

@end