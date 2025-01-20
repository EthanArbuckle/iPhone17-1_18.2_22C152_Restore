@interface WFGallerySessionStartEvent
+ (Class)codableEventClass;
- (NSString)key;
- (NSString)sessionIdentifier;
- (void)setKey:(id)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation WFGallerySessionStartEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
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