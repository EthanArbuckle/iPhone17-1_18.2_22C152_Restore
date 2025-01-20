@interface PKApplicationMessageViewConfiguration
- (PKApplicationMessageViewConfiguration)init;
- (PKApplicationMessageViewConfiguration)initWithWidth:(double)a3;
- (double)width;
@end

@implementation PKApplicationMessageViewConfiguration

- (PKApplicationMessageViewConfiguration)init
{
  return 0;
}

- (PKApplicationMessageViewConfiguration)initWithWidth:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplicationMessageViewConfiguration;
  result = [(PKApplicationMessageViewConfiguration *)&v5 init];
  if (result) {
    result->_width = a3;
  }
  return result;
}

- (double)width
{
  return self->_width;
}

@end