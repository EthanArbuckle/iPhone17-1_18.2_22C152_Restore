@interface CryptexRemoteObjectArray
- (CryptexRemoteObjectArray)initWithArray:(id)a3;
- (NSArray)array;
@end

@implementation CryptexRemoteObjectArray

- (CryptexRemoteObjectArray)initWithArray:(id)a3
{
  v4 = (NSArray *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CryptexRemoteObjectArray;
  v5 = [(CryptexRemoteObjectArray *)&v8 init];
  array = v5->_array;
  v5->_array = v4;

  return v5;
}

- (NSArray)array
{
  return self->_array;
}

- (void).cxx_destruct
{
}

@end