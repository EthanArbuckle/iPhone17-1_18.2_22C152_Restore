@interface THFlowBodyChunkInfo
- (BOOL)autosizes;
- (Class)layoutClass;
- (Class)repClass;
- (THFlowBodyChunkInfo)initWithBodyInfo:(id)a3;
- (THModelBodyTextInfo)bodyInfo;
- (id)bodyStorage;
- (id)columnStyle;
- (id)lineHints;
- (void)dealloc;
@end

@implementation THFlowBodyChunkInfo

- (THFlowBodyChunkInfo)initWithBodyInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THFlowBodyChunkInfo;
  v4 = -[THFlowBodyChunkInfo initWithContext:[a3 context] geometry:[a3 geometry]];
  if (v4) {
    v4->_bodyInfo = (THModelBodyTextInfo *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THFlowBodyChunkInfo;
  [(THModelBodyTextInfo *)&v3 dealloc];
}

- (BOOL)autosizes
{
  return [(THModelBodyTextInfo *)self->_bodyInfo autosizes];
}

- (id)bodyStorage
{
  return [(THModelBodyTextInfo *)self->_bodyInfo bodyStorage];
}

- (id)columnStyle
{
  return [(THModelBodyTextInfo *)self->_bodyInfo columnStyle];
}

- (id)lineHints
{
  return [(THModelBodyTextInfo *)self->_bodyInfo lineHints];
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (THModelBodyTextInfo)bodyInfo
{
  return self->_bodyInfo;
}

@end