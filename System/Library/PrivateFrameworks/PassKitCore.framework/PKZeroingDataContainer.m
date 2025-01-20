@interface PKZeroingDataContainer
- (NSData)data;
- (PKZeroingDataContainer)initWithData:(id)a3;
- (void)dealloc;
@end

@implementation PKZeroingDataContainer

- (PKZeroingDataContainer)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKZeroingDataContainer;
  v6 = [(PKZeroingDataContainer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (void)dealloc
{
  rsize_t v3 = [(NSData *)self->_data length];
  if (v3) {
    memset_s((void *)[(NSData *)self->_data bytes], v3, 0, v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKZeroingDataContainer;
  [(PKZeroingDataContainer *)&v4 dealloc];
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end