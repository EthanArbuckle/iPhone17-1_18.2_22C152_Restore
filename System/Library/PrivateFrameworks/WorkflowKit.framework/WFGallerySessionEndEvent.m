@interface WFGallerySessionEndEvent
+ (Class)codableEventClass;
- (NSString)key;
- (NSString)sessionIdentifier;
- (unsigned)duration;
- (void)setDuration:(unsigned int)a3;
- (void)setKey:(id)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation WFGallerySessionEndEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setDuration:(unsigned int)a3
{
  self->_duration = a3;
}

- (unsigned)duration
{
  return self->_duration;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end