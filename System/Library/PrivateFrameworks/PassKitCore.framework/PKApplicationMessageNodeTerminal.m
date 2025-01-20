@interface PKApplicationMessageNodeTerminal
- (PKApplicationMessage)message;
@end

@implementation PKApplicationMessageNodeTerminal

- (PKApplicationMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
}

@end