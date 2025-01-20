@interface SKEventRegistration
- (NSDictionary)options;
- (NSString)eventID;
- (id)handler;
- (void)setEventID:(id)a3;
- (void)setHandler:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation SKEventRegistration

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_eventID, 0);
}

- (void)setHandler:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setEventID:(id)a3
{
}

- (NSString)eventID
{
  return self->_eventID;
}

@end