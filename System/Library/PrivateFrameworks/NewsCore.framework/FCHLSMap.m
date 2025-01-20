@interface FCHLSMap
- (id)description;
@end

@implementation FCHLSMap

- (id)description
{
  url = self;
  if (self) {
    url = self->_url;
  }
  return (id)[NSString stringWithFormat:@"%@", url];
}

- (void).cxx_destruct
{
}

@end