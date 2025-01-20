@interface WFShowDialogEvent
+ (Class)codableEventClass;
- (NSString)automationType;
- (NSString)dialogType;
- (NSString)dismissalType;
- (NSString)key;
- (NSString)presentationStyle;
- (void)setAutomationType:(id)a3;
- (void)setDialogType:(id)a3;
- (void)setDismissalType:(id)a3;
- (void)setKey:(id)a3;
- (void)setPresentationStyle:(id)a3;
@end

@implementation WFShowDialogEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_dismissalType, 0);
  objc_storeStrong((id *)&self->_presentationStyle, 0);
  objc_storeStrong((id *)&self->_dialogType, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setAutomationType:(id)a3
{
}

- (NSString)automationType
{
  return self->_automationType;
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

- (void)setDialogType:(id)a3
{
}

- (NSString)dialogType
{
  return self->_dialogType;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end