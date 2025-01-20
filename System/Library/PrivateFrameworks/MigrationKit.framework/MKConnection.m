@interface MKConnection
- (MKConnection)initWithConnection:(id)a3 queue:(id)a4 hostname:(id)a5;
- (NSString)hostname;
- (NSValue)identifier;
- (OS_dispatch_queue)queue;
- (OS_nw_connection)connection;
- (char)buffer;
- (unint64_t)bufferSize;
- (void)dealloc;
- (void)setBuffer:(char *)a3;
- (void)setBufferSize:(unint64_t)a3;
- (void)setConnection:(id)a3;
- (void)setHostname:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation MKConnection

- (MKConnection)initWithConnection:(id)a3 queue:(id)a4 hostname:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MKConnection;
  v11 = [(MKConnection *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(MKConnection *)v11 setConnection:v8];
    [(MKConnection *)v12 setQueue:v9];
    [(MKConnection *)v12 setHostname:v10];
    v13 = [MEMORY[0x263F08D40] valueWithPointer:v8];
    [(MKConnection *)v12 setIdentifier:v13];

    [(MKConnection *)v12 setBufferSize:0x10000];
    [(MKConnection *)v12 setBuffer:malloc_type_malloc(v12->_bufferSize, 0xDDBA2C6DuLL)];
  }

  return v12;
}

- (void)dealloc
{
  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MKConnection;
  [(MKConnection *)&v4 dealloc];
}

- (char)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(char *)a3
{
  self->_buffer = a3;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (NSValue)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  self->_connection = (OS_nw_connection *)a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end