@interface TUStringShareItem
- (NSString)message;
- (TUStringShareItem)initWithMessage:(id)a3;
- (void)setMessage:(id)a3;
@end

@implementation TUStringShareItem

- (TUStringShareItem)initWithMessage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUStringShareItem;
  v5 = [(TUStringShareItem *)&v8 init];
  v6 = v5;
  if (v5) {
    [(TUStringShareItem *)v5 setMessage:v4];
  }

  return v6;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end