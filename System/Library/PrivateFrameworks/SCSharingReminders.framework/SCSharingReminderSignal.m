@interface SCSharingReminderSignal
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)sharingIdentifier;
- (NSString)sharingType;
- (NSString)signalType;
- (SCSharingReminderSignal)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSharingIdentifier:(id)a3;
- (void)setSharingType:(id)a3;
- (void)setSignalType:(id)a3;
@end

@implementation SCSharingReminderSignal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SCSharingReminderSignal *)self sharingIdentifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(SCSharingReminderSignal *)self sharingType];
  [v4 encodeObject:v6 forKey:@"sharingType"];

  id v7 = [(SCSharingReminderSignal *)self signalType];
  [v4 encodeObject:v7 forKey:@"signalType"];
}

- (SCSharingReminderSignal)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCSharingReminderSignal;
  v5 = [(SCSharingReminderSignal *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    sharingIdentifier = v5->_sharingIdentifier;
    v5->_sharingIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingType"];
    sharingType = v5->_sharingType;
    v5->_sharingType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signalType"];
    signalType = v5->_signalType;
    v5->_signalType = (NSString *)v10;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SCSharingReminderSignal *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(SCSharingReminderSignal *)v5 sharingIdentifier];
      id v7 = [(SCSharingReminderSignal *)self sharingIdentifier];
      if ([v6 isEqualToString:v7])
      {
        uint64_t v8 = [(SCSharingReminderSignal *)v5 sharingType];
        v9 = [(SCSharingReminderSignal *)self sharingType];
        if ([v8 isEqualToString:v9])
        {
          uint64_t v10 = [(SCSharingReminderSignal *)v5 signalType];
          v11 = [(SCSharingReminderSignal *)self signalType];
          char v12 = [v10 isEqual:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Identifier: %@ Sharing type: %@ Signal type: %@", self->_sharingIdentifier, self->_sharingType, self->_signalType];
}

- (NSString)signalType
{
  return self->_signalType;
}

- (void)setSignalType:(id)a3
{
}

- (NSString)sharingIdentifier
{
  return self->_sharingIdentifier;
}

- (void)setSharingIdentifier:(id)a3
{
}

- (NSString)sharingType
{
  return self->_sharingType;
}

- (void)setSharingType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingType, 0);
  objc_storeStrong((id *)&self->_sharingIdentifier, 0);
  objc_storeStrong((id *)&self->_signalType, 0);
}

@end