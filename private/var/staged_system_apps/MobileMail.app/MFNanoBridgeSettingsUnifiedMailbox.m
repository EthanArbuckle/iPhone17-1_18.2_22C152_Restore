@interface MFNanoBridgeSettingsUnifiedMailbox
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MFNanoBridgeSettingsUnifiedMailbox)initWithCoder:(id)a3;
- (MFNanoBridgeSettingsUnifiedMailbox)initWithType:(int64_t)a3;
- (id)displayName;
- (id)icon;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)mailboxFilterType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MFNanoBridgeSettingsUnifiedMailbox

- (MFNanoBridgeSettingsUnifiedMailbox)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFNanoBridgeSettingsUnifiedMailbox;
  result = [(MFNanoBridgeSettingsUnifiedMailbox *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (unint64_t)mailboxFilterType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = +[NSNumber numberWithInteger:self->_type];
  [v5 encodeObject:v4 forKey:@"kNSCodingKeyType"];
}

- (MFNanoBridgeSettingsUnifiedMailbox)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyType"];
  id v6 = [v5 unsignedIntegerValue];

  v7 = [(MFNanoBridgeSettingsUnifiedMailbox *)self initWithType:v6];
  return v7;
}

- (id)displayName
{
  if (self->_type == 7)
  {
    v2 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = [v2 localizedStringForKey:@"ALL_INBOXES" value:&stru_100619928 table:@"Main"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)icon
{
  if (self->_type == 7)
  {
    v2 = +[UIImage mf_systemImageNamed:MFImageGlyphFavoriteInboxUnifiedMailbox forView:7];
    v3 = off_100690EA0();
    id v4 = [v2 imageWithTintColor:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFNanoBridgeSettingsUnifiedMailbox;
  if ([(MFNanoBridgeSettingsMailbox *)&v7 isEqual:v4]) {
    BOOL v5 = [v4 type] == self->_type;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

@end