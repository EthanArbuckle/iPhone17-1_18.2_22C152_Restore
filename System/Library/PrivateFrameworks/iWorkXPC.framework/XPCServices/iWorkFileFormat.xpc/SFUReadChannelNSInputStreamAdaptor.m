@interface SFUReadChannelNSInputStreamAdaptor
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (SFUReadChannelNSInputStreamAdaptor)initWithSFUInputStream:(id)a3;
- (id)delegate;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)streamStatus;
- (void)close;
- (void)open;
- (void)setDelegate:(id)a3;
@end

@implementation SFUReadChannelNSInputStreamAdaptor

- (SFUReadChannelNSInputStreamAdaptor)initWithSFUInputStream:(id)a3
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSData) initWithBytes:&v10 length:0];
  v9.receiver = self;
  v9.super_class = (Class)SFUReadChannelNSInputStreamAdaptor;
  v7 = [(SFUReadChannelNSInputStreamAdaptor *)&v9 initWithData:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_inputStream, a3);
    objc_storeWeak((id *)&v7->_delegate, v7);
    atomic_store(0, &v7->_status);
  }

  return v7;
}

- (void)open
{
  if (!atomic_load(&self->_status)) {
    atomic_store(2uLL, &self->_status);
  }
}

- (void)close
{
  atomic_store(6uLL, &self->_status);
  [(SFUInputStream *)self->_inputStream close];
  inputStream = self->_inputStream;
  self->_inputStream = 0;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = self;
  }
  objc_storeWeak((id *)&self->_delegate, v3);
}

- (id)propertyForKey:(id)a3
{
  if ([a3 isEqualToString:NSStreamFileCurrentOffsetKey])
  {
    v4 = +[NSNumber numberWithLongLong:[(SFUInputStream *)self->_inputStream offset]];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:NSStreamFileCurrentOffsetKey]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(SFUInputStream *)self->_inputStream canSeek])
  {
    id v8 = [v6 unsignedIntegerValue];
    [(SFUInputStream *)self->_inputStream seekToOffset:v8];
    BOOL v9 = [(SFUInputStream *)self->_inputStream offset] == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)streamStatus
{
  return atomic_load(&self->_status);
}

- (id)streamError
{
  return self->_streamError;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  unint64_t v4 = atomic_load(&self->_status);
  if (v4 != 2) {
    return -1;
  }
  atomic_store(3uLL, &self->_status);
  int64_t result = (int64_t)[(SFUInputStream *)self->_inputStream readToBuffer:a3 size:a4];
  if (result) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = 5;
  }
  atomic_store(v7, &self->_status);
  return result;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamError, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inputStream, 0);
}

@end