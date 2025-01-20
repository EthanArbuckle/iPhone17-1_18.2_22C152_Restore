@interface PKDashboardPassMessages
+ (id)identifier;
- (NSOrderedSet)messages;
- (void)setMessages:(id)a3;
@end

@implementation PKDashboardPassMessages

+ (id)identifier
{
  return @"passMessages";
}

- (NSOrderedSet)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
}

- (void).cxx_destruct
{
}

@end