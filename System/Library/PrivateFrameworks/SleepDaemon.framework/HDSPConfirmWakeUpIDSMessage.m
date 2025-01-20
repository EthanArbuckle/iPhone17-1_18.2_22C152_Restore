@interface HDSPConfirmWakeUpIDSMessage
- (BOOL)wasExplicitConfirmation;
- (HDSPConfirmWakeUpIDSMessage)initWithCoder:(id)a3;
- (HDSPConfirmWakeUpIDSMessage)initWithWasExplicitConfirmation:(BOOL)a3 wakeUpConfirmedDate:(id)a4 wakeUpConfirmedUntilDate:(id)a5;
- (NSDate)wakeUpConfirmedUntilDate;
- (id)succinctDescriptionBuilder;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDSPConfirmWakeUpIDSMessage

- (HDSPConfirmWakeUpIDSMessage)initWithWasExplicitConfirmation:(BOOL)a3 wakeUpConfirmedDate:(id)a4 wakeUpConfirmedUntilDate:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDSPConfirmWakeUpIDSMessage;
  v10 = [(HDSPEventRecordMessage *)&v14 initWithDate:a4];
  v11 = v10;
  if (v10)
  {
    v10->_wasExplicitConfirmation = a3;
    objc_storeStrong((id *)&v10->_wakeUpConfirmedUntilDate, a5);
    v12 = v11;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDSPConfirmWakeUpIDSMessage;
  id v4 = a3;
  [(HDSPEventRecordMessage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_wakeUpConfirmedUntilDate, @"confirmedUntilDate", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_wasExplicitConfirmation forKey:@"wasExplicitConfirmation"];
}

- (HDSPConfirmWakeUpIDSMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPConfirmWakeUpIDSMessage;
  objc_super v5 = [(HDSPEventRecordMessage *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confirmedUntilDate"];
    wakeUpConfirmedUntilDate = v5->_wakeUpConfirmedUntilDate;
    v5->_wakeUpConfirmedUntilDate = (NSDate *)v6;

    v5->_wasExplicitConfirmation = [v4 decodeBoolForKey:@"wasExplicitConfirmation"];
    v8 = v5;
  }

  return v5;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[HDSPConfirmWakeUpIDSMessage wasExplicitConfirmation](self, "wasExplicitConfirmation"), @"wasExplicitConfirmation");
  objc_super v5 = [(HDSPConfirmWakeUpIDSMessage *)self wakeUpConfirmedDate];
  id v6 = (id)[v3 appendObject:v5 withName:@"wakeUpConfirmedDate"];

  v7 = [(HDSPConfirmWakeUpIDSMessage *)self wakeUpConfirmedUntilDate];
  id v8 = (id)[v3 appendObject:v7 withName:@"wakeUpConfirmedUntilDate"];

  return v3;
}

- (BOOL)wasExplicitConfirmation
{
  return self->_wasExplicitConfirmation;
}

- (NSDate)wakeUpConfirmedUntilDate
{
  return self->_wakeUpConfirmedUntilDate;
}

- (void).cxx_destruct
{
}

@end