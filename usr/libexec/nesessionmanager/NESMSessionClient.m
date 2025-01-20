@interface NESMSessionClient
- (id)description;
@end

@implementation NESMSessionClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_description, 0);
}

- (id)description
{
  return self->_description;
}

@end