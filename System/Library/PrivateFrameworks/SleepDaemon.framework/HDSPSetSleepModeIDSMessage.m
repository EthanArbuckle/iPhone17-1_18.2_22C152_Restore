@interface HDSPSetSleepModeIDSMessage
- (BOOL)sleepModeOn;
- (HDSPSetSleepModeIDSMessage)initWithCoder:(id)a3;
- (HDSPSetSleepModeIDSMessage)initWithSleepModeOn:(BOOL)a3;
- (NSString)identifier;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)destinations;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDSPSetSleepModeIDSMessage

- (HDSPSetSleepModeIDSMessage)initWithSleepModeOn:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HDSPSetSleepModeIDSMessage;
  v4 = [(HDSPSetSleepModeIDSMessage *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_sleepModeOn = a3;
    v6 = v4;
  }

  return v5;
}

- (NSString)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (unint64_t)destinations
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HDSPSetSleepModeIDSMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDSPSetSleepModeIDSMessage;
  v5 = [(HDSPSetSleepModeIDSMessage *)&v8 init];
  if (v5)
  {
    v5->_sleepModeOn = [v4 decodeBoolForKey:@"sleepModeOn"];
    v6 = v5;
  }

  return v5;
}

- (id)succinctDescription
{
  v2 = [(HDSPSetSleepModeIDSMessage *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[HDSPSetSleepModeIDSMessage sleepModeOn](self, "sleepModeOn"), @"sleepModeOn");

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HDSPSetSleepModeIDSMessage *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (BOOL)sleepModeOn
{
  return self->_sleepModeOn;
}

@end