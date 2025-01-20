@interface SFMessageSessionRequestEntry
- (BOOL)allowUnencrypted;
- (NSDictionary)options;
- (id)handler;
- (void)setAllowUnencrypted:(BOOL)a3;
- (void)setHandler:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation SFMessageSessionRequestEntry

- (BOOL)allowUnencrypted
{
  return self->_allowUnencrypted;
}

- (void)setAllowUnencrypted:(BOOL)a3
{
  self->_allowUnencrypted = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end