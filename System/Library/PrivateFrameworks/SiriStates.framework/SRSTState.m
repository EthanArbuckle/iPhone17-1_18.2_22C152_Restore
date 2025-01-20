@interface SRSTState
+ (SRSTState)analyzing;
+ (SRSTState)available;
+ (SRSTState)disabled;
+ (SRSTState)postResponse;
+ (SRSTState)processing;
+ (SRSTState)responding;
+ (SRSTState)resting;
+ (SRSTState)understanding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (SRSTState)init;
- (SRSTState)initWithUnderlyingObject:(id)a3;
- (_SRSTState)underlyingObject;
- (id)makeProxy;
- (unint64_t)hash;
@end

@implementation SRSTState

+ (SRSTState)analyzing
{
  v2 = [SRSTState alloc];
  v3 = +[_SRSTState analyzing];
  v4 = [(SRSTState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

+ (SRSTState)resting
{
  v2 = [SRSTState alloc];
  v3 = +[_SRSTState resting];
  v4 = [(SRSTState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

+ (SRSTState)available
{
  v2 = [SRSTState alloc];
  v3 = +[_SRSTState available];
  v4 = [(SRSTState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

- (SRSTState)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRSTState;
  v2 = [(SRSTState *)&v6 init];
  uint64_t v3 = objc_opt_new();
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = (_SRSTState *)v3;

  return v2;
}

- (NSString)name
{
  return [(_SRSTState *)self->_underlyingObject name];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = [a3 hash];
  return v4 == [(SRSTState *)self hash];
}

- (unint64_t)hash
{
  v2 = [(_SRSTState *)self->_underlyingObject name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)makeProxy
{
  v2 = [[SRSTStateProxy alloc] initWithState:self];
  return v2;
}

+ (id)new
{
  return objc_alloc_init(SRSTState);
}

- (SRSTState)initWithUnderlyingObject:(id)a3
{
  uint64_t v4 = (_SRSTState *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SRSTState;
  v5 = [(SRSTState *)&v8 init];
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (_SRSTState)underlyingObject
{
  return (_SRSTState *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

+ (SRSTState)postResponse
{
  v2 = [SRSTState alloc];
  unint64_t v3 = +[_SRSTState postResponse];
  uint64_t v4 = [(SRSTState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

+ (SRSTState)understanding
{
  v2 = [SRSTState alloc];
  unint64_t v3 = +[_SRSTState understanding];
  uint64_t v4 = [(SRSTState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

+ (SRSTState)responding
{
  v2 = [SRSTState alloc];
  unint64_t v3 = +[_SRSTState responding];
  uint64_t v4 = [(SRSTState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

+ (SRSTState)disabled
{
  v2 = [SRSTState alloc];
  unint64_t v3 = +[_SRSTState disabled];
  uint64_t v4 = [(SRSTState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

+ (SRSTState)processing
{
  v2 = [SRSTState alloc];
  unint64_t v3 = +[_SRSTState processing];
  uint64_t v4 = [(SRSTState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

@end