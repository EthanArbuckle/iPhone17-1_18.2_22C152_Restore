@interface TCCDSyncAccessAction
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (NSString)sequencer;
- (NSString)serviceIdentifier;
- (TCCDSyncAccessAction)initWithCoder:(id)a3;
- (TCCDSyncAccessAction)initWithServiceIdentifier:(id)a3;
- (id)_description;
- (id)syncId;
- (int64_t)changeType;
- (int64_t)syncChangeType;
- (int64_t)versionNumber;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSyncChangeType:(int64_t)a3;
- (void)setVersionNumber:(int64_t)a3;
@end

@implementation TCCDSyncAccessAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TCCDSyncAccessAction)initWithServiceIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCCDSyncAccessAction;
  v5 = [(TCCDSyncAccessAction *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = v6;

    v5->_versionNumber = 2;
  }

  return v5;
}

- (TCCDSyncAccessAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCCDSyncAccessAction;
  v5 = [(TCCDSyncAccessAction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TCCDSyncAccessActionServiceIdentifierKey"];
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v6;

    v5->_versionNumber = (int64_t)[v4 decodeInt64ForKey:@"TCCDSyncAccessActionVersionNumberKey"];
    if ([v4 containsValueForKey:@"TCCDSyncAccessActionChangeTypeKey"]) {
      v5->_syncChangeType = (int64_t)[v4 decodeInt64ForKey:@"TCCDSyncAccessActionChangeTypeKey"];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(TCCDSyncAccessAction *)self serviceIdentifier];
  [v5 encodeObject:v4 forKey:@"TCCDSyncAccessActionServiceIdentifierKey"];

  objc_msgSend(v5, "encodeInt64:forKey:", -[TCCDSyncAccessAction versionNumber](self, "versionNumber"), @"TCCDSyncAccessActionVersionNumberKey");
  objc_msgSend(v5, "encodeInt64:forKey:", -[TCCDSyncAccessAction syncChangeType](self, "syncChangeType"), @"TCCDSyncAccessActionChangeTypeKey");
}

- (unint64_t)hash
{
  v2 = [(TCCDSyncAccessAction *)self syncId];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)_description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(TCCDSyncAccessAction *)self serviceIdentifier];
  uint64_t v6 = +[NSString stringWithFormat:@"%@(%p): service: %@", v4, self, v5];

  return v6;
}

- (NSString)description
{
  v2 = [(TCCDSyncAccessAction *)self _description];
  id v3 = +[NSString stringWithFormat:@"{%@}", v2];

  return (NSString *)v3;
}

- (id)syncId
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(TCCDSyncAccessAction *)self serviceIdentifier];
  uint64_t v6 = +[NSString stringWithFormat:@"%@-%@", v4, v5];

  return v6;
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return self->_syncChangeType;
}

- (NSString)serviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)syncChangeType
{
  return self->_syncChangeType;
}

- (void)setSyncChangeType:(int64_t)a3
{
  self->_syncChangeType = a3;
}

- (int64_t)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(int64_t)a3
{
  self->_versionNumber = a3;
}

- (void).cxx_destruct
{
}

@end