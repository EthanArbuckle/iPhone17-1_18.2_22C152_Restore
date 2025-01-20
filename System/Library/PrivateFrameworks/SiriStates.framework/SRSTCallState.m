@interface SRSTCallState
+ (SRSTCallState)micMutedCall;
+ (SRSTCallState)noCall;
+ (SRSTCallState)onHoldCall;
+ (SRSTCallState)ongoingCall;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (SRSTCallState)init;
- (SRSTCallState)initWithUnderlyingObject:(id)a3;
- (_SRSTCallState)underlyingObject;
- (id)makeProxy;
- (unint64_t)hash;
@end

@implementation SRSTCallState

+ (SRSTCallState)noCall
{
  v2 = [SRSTCallState alloc];
  v3 = +[_SRSTCallState noCall];
  v4 = [(SRSTCallState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

+ (SRSTCallState)micMutedCall
{
  v2 = [SRSTCallState alloc];
  v3 = +[_SRSTCallState micMutedCall];
  v4 = [(SRSTCallState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

- (SRSTCallState)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRSTCallState;
  v2 = [(SRSTCallState *)&v6 init];
  uint64_t v3 = objc_opt_new();
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = (_SRSTCallState *)v3;

  return v2;
}

- (NSString)name
{
  return [(_SRSTCallState *)self->_underlyingObject name];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = [a3 hash];
  return v4 == [(SRSTCallState *)self hash];
}

- (unint64_t)hash
{
  v2 = [(_SRSTCallState *)self->_underlyingObject name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)makeProxy
{
  v2 = [[SRSTCallStateProxy alloc] initWithState:self];
  return v2;
}

+ (id)new
{
  return objc_alloc_init(SRSTCallState);
}

- (SRSTCallState)initWithUnderlyingObject:(id)a3
{
  uint64_t v4 = (_SRSTCallState *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SRSTCallState;
  v5 = [(SRSTCallState *)&v8 init];
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (_SRSTCallState)underlyingObject
{
  return (_SRSTCallState *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

+ (SRSTCallState)onHoldCall
{
  v2 = [SRSTCallState alloc];
  unint64_t v3 = +[_SRSTCallState onHoldCall];
  uint64_t v4 = [(SRSTCallState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

+ (SRSTCallState)ongoingCall
{
  v2 = [SRSTCallState alloc];
  unint64_t v3 = +[_SRSTCallState ongoingCall];
  uint64_t v4 = [(SRSTCallState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

@end