@interface PipeMapping
- (NSUUID)identifier;
- (PipeMapping)initWithIdentifier:(id)a3 handle:(unsigned __int16)a4;
- (id)description;
- (unsigned)pipeHandle;
- (void)setIdentifier:(id)a3;
- (void)setPipeHandle:(unsigned __int16)a3;
@end

@implementation PipeMapping

- (PipeMapping)initWithIdentifier:(id)a3 handle:(unsigned __int16)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PipeMapping;
  v8 = [(PipeMapping *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_pipeHandle = a4;
  }

  return v9;
}

- (id)description
{
  return +[NSString stringWithFormat:@"identifier:%@ handle:%#06x", self->_identifier, self->_pipeHandle];
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)pipeHandle
{
  return self->_pipeHandle;
}

- (void)setPipeHandle:(unsigned __int16)a3
{
  self->_pipeHandle = a3;
}

- (void).cxx_destruct
{
}

@end