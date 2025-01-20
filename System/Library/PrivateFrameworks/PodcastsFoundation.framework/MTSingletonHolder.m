@interface MTSingletonHolder
- (id)instance;
- (void)setInstance:(id)a3;
@end

@implementation MTSingletonHolder

- (id)instance
{
  return self->_instance;
}

- (void)setInstance:(id)a3
{
}

- (void).cxx_destruct
{
}

@end