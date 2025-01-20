@interface SRSTSharedState
+ (SRSTSharedState)passive;
+ (SRSTSharedState)preparingToServe;
+ (SRSTSharedState)serving;
+ (SRSTSharedState)unshared;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (SRSTSharedState)init;
- (SRSTSharedState)initWithUnderlyingObject:(id)a3;
- (_SRSTSharedState)underlyingObject;
- (id)makeProxy;
- (unint64_t)hash;
@end

@implementation SRSTSharedState

+ (SRSTSharedState)preparingToServe
{
  v2 = [SRSTSharedState alloc];
  v3 = +[_SRSTSharedState preparingToServe];
  v4 = [(SRSTSharedState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

+ (SRSTSharedState)serving
{
  v2 = [SRSTSharedState alloc];
  v3 = +[_SRSTSharedState serving];
  v4 = [(SRSTSharedState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

- (SRSTSharedState)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRSTSharedState;
  v2 = [(SRSTSharedState *)&v6 init];
  uint64_t v3 = objc_opt_new();
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = (_SRSTSharedState *)v3;

  return v2;
}

- (NSString)name
{
  return [(_SRSTSharedState *)self->_underlyingObject name];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = [a3 hash];
  return v4 == [(SRSTSharedState *)self hash];
}

- (unint64_t)hash
{
  v2 = [(_SRSTSharedState *)self->_underlyingObject name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)makeProxy
{
  v2 = [[SRSTSharedStateProxy alloc] initWithState:self];
  return v2;
}

+ (id)new
{
  return objc_alloc_init(SRSTSharedState);
}

- (SRSTSharedState)initWithUnderlyingObject:(id)a3
{
  uint64_t v4 = (_SRSTSharedState *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SRSTSharedState;
  v5 = [(SRSTSharedState *)&v8 init];
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (_SRSTSharedState)underlyingObject
{
  return (_SRSTSharedState *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

+ (SRSTSharedState)unshared
{
  v2 = [SRSTSharedState alloc];
  unint64_t v3 = +[_SRSTSharedState unshared];
  uint64_t v4 = [(SRSTSharedState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

+ (SRSTSharedState)passive
{
  v2 = [SRSTSharedState alloc];
  unint64_t v3 = +[_SRSTSharedState passive];
  uint64_t v4 = [(SRSTSharedState *)v2 initWithUnderlyingObject:v3];

  return v4;
}

@end