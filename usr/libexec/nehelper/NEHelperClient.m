@interface NEHelperClient
- (unint64_t)hash;
@end

@implementation NEHelperClient

- (unint64_t)hash
{
  return self->_hash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end