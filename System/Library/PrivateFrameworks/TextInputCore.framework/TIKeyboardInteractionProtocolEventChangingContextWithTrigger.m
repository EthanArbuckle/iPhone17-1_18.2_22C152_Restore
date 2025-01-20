@interface TIKeyboardInteractionProtocolEventChangingContextWithTrigger
+ (BOOL)supportsSecureCoding;
- (NSString)contextChangeTrigger;
- (NSString)description;
- (TIKeyboardInteractionProtocolEventChangingContextWithTrigger)initWithCoder:(id)a3;
- (TIKeyboardInteractionProtocolEventChangingContextWithTrigger)initWithContextChangeTrigger:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)sendTo:(id)a3;
@end

@implementation TIKeyboardInteractionProtocolEventChangingContextWithTrigger

- (void).cxx_destruct
{
}

- (NSString)contextChangeTrigger
{
  return self->_contextChangeTrigger;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<Changing Context With Trigger: %@>", self->_contextChangeTrigger];
}

- (void)sendTo:(id)a3
{
}

- (TIKeyboardInteractionProtocolEventChangingContextWithTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventChangingContextWithTrigger;
  v5 = [(TIKeyboardInteractionProtocolEventChangingContextWithTrigger *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextChangeTrigger"];
    contextChangeTrigger = v5->_contextChangeTrigger;
    v5->_contextChangeTrigger = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (TIKeyboardInteractionProtocolEventChangingContextWithTrigger)initWithContextChangeTrigger:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventChangingContextWithTrigger;
  uint64_t v6 = [(TIKeyboardInteractionProtocolEventChangingContextWithTrigger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contextChangeTrigger, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end