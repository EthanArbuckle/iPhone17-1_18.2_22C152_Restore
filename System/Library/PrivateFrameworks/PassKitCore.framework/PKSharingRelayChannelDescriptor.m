@interface PKSharingRelayChannelDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)createChannelWithRegion:(id)a3;
+ (id)createChannelWithRegion:(id)a3 stateful:(BOOL)a4;
+ (id)existingChannelForMailboxIdentifier:(id)a3;
+ (id)existingChannelForURL:(id)a3;
- (BOOL)stateful;
- (NSString)existingChannelURL;
- (NSString)existingMailboxIdentifier;
- (NSString)region;
- (PKSharingRelayChannelDescriptor)initWithCoder:(id)a3;
- (id)_initWithSubType:(unint64_t)a3 region:(id)a4 stateful:(BOOL)a5 existingChannelURL:(id)a6 mailboxIdentifier:(id)a7;
- (unint64_t)subtype;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSharingRelayChannelDescriptor

- (id)_initWithSubType:(unint64_t)a3 region:(id)a4 stateful:(BOOL)a5 existingChannelURL:(id)a6 mailboxIdentifier:(id)a7
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PKSharingRelayChannelDescriptor;
  v16 = [(PKSharingChannelDescriptor *)&v19 _initWithType:3];
  v17 = v16;
  if (v16)
  {
    v16[3] = (id)a3;
    objc_storeStrong(v16 + 4, a4);
    *((unsigned char *)v17 + 16) = a5;
    objc_storeStrong(v17 + 5, a6);
    objc_storeStrong(v17 + 6, a7);
  }

  return v17;
}

+ (id)createChannelWithRegion:(id)a3
{
  id v3 = a3;
  id v4 = [[PKSharingRelayChannelDescriptor alloc] _initWithSubType:1 region:v3 stateful:1 existingChannelURL:0 mailboxIdentifier:0];

  return v4;
}

+ (id)createChannelWithRegion:(id)a3 stateful:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [[PKSharingRelayChannelDescriptor alloc] _initWithSubType:1 region:v5 stateful:v4 existingChannelURL:0 mailboxIdentifier:0];

  return v6;
}

+ (id)existingChannelForURL:(id)a3
{
  id v3 = a3;
  id v4 = [[PKSharingRelayChannelDescriptor alloc] _initWithSubType:2 region:0 stateful:0 existingChannelURL:v3 mailboxIdentifier:0];

  return v4;
}

+ (id)existingChannelForMailboxIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[PKSharingRelayChannelDescriptor alloc] _initWithSubType:2 region:0 stateful:0 existingChannelURL:0 mailboxIdentifier:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingRelayChannelDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKSharingRelayChannelDescriptor;
  id v5 = [(PKSharingChannelDescriptor *)&v15 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtype"];
    v5->_subtype = [v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
    region = v5->_region;
    v5->_region = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stateful"];
    v5->_stateful = [v9 BOOLValue];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"existingChannelURL"];
    existingChannelURL = v5->_existingChannelURL;
    v5->_existingChannelURL = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"existingMailboxIdentifier"];
    existingMailboxIdentifier = v5->_existingMailboxIdentifier;
    v5->_existingMailboxIdentifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKSharingRelayChannelDescriptor;
  id v4 = a3;
  [(PKSharingChannelDescriptor *)&v7 encodeWithCoder:v4];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_subtype, v7.receiver, v7.super_class);
  [v4 encodeObject:v5 forKey:@"subtype"];

  [v4 encodeObject:self->_region forKey:@"region"];
  id v6 = [NSNumber numberWithBool:self->_stateful];
  [v4 encodeObject:v6 forKey:@"stateful"];

  [v4 encodeObject:self->_existingChannelURL forKey:@"existingChannelURL"];
  [v4 encodeObject:self->_existingMailboxIdentifier forKey:@"existingMailboxIdentifier"];
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (NSString)region
{
  return self->_region;
}

- (BOOL)stateful
{
  return self->_stateful;
}

- (NSString)existingChannelURL
{
  return self->_existingChannelURL;
}

- (NSString)existingMailboxIdentifier
{
  return self->_existingMailboxIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingMailboxIdentifier, 0);
  objc_storeStrong((id *)&self->_existingChannelURL, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end