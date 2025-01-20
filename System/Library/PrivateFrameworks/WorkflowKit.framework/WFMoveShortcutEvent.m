@interface WFMoveShortcutEvent
+ (Class)codableEventClass;
- (NSString)key;
- (NSString)source;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation WFMoveShortcutEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end