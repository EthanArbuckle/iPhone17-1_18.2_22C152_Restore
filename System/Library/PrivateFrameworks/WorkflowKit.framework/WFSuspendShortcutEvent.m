@interface WFSuspendShortcutEvent
+ (Class)codableEventClass;
- (NSString)dismissalType;
- (NSString)key;
- (NSString)presentationStyle;
- (void)setDismissalType:(id)a3;
- (void)setKey:(id)a3;
- (void)setPresentationStyle:(id)a3;
@end

@implementation WFSuspendShortcutEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalType, 0);
  objc_storeStrong((id *)&self->_presentationStyle, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setDismissalType:(id)a3
{
}

- (NSString)dismissalType
{
  return self->_dismissalType;
}

- (void)setPresentationStyle:(id)a3
{
}

- (NSString)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end