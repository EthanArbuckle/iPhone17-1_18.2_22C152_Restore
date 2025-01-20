@interface boringssl_concrete_boringssl_session_state
- (void)dealloc;
@end

@implementation boringssl_concrete_boringssl_session_state

- (void)dealloc
{
  OPENSSL_free((void *)self->serialized_session);
  v3.receiver = self;
  v3.super_class = (Class)boringssl_concrete_boringssl_session_state;
  [(boringssl_concrete_boringssl_session_state *)&v3 dealloc];
}

@end