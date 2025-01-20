@interface AXZoomListenerContainer
- (NSString)identifier;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation AXZoomListenerContainer

- (id)handler
{
  return self->handler;
}

- (void)setHandler:(id)a3
{
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong(&self->handler, 0);
}

@end