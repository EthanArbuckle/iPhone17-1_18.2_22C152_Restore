@interface ICRadioStoreContentReference
+ (BOOL)supportsSecureCoding;
- (ICRadioStoreContentReference)initWithCoder:(id)a3;
- (ICRadioStoreContentReference)initWithStoreIdentifier:(id)a3;
- (NSNumber)storeIdentifier;
- (NSString)containerID;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)matchDictionaryWithSubscriptionStatus:(id)a3;
- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContainerID:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation ICRadioStoreContentReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_containerID, 0);
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setContainerID:(id)a3
{
}

- (NSString)containerID
{
  return self->_containerID;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICRadioStoreContentReference;
  id v4 = a3;
  [(ICRadioContentReference *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeIdentifier, @"id", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_containerID forKey:@"containerID"];
}

- (ICRadioStoreContentReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICRadioStoreContentReference;
  objc_super v5 = [(ICRadioContentReference *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerID"];
    containerID = v5->_containerID;
    v5->_containerID = (NSString *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ICRadioStoreContentReference;
  objc_super v5 = -[ICRadioContentReference copyWithZone:](&v11, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSNumber *)self->_storeIdentifier copyWithZone:a3];
    v7 = (void *)v5[2];
    v5[2] = v6;

    uint64_t v8 = [(NSString *)self->_containerID copyWithZone:a3];
    v9 = (void *)v5[1];
    v5[1] = v8;
  }
  return v5;
}

- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  [v4 setObject:self->_storeIdentifier forKeyedSubscript:@"id"];
  if ([(NSString *)self->_containerID length]) {
    [v4 setObject:self->_containerID forKeyedSubscript:@"container-id"];
  }
  objc_super v5 = (void *)[v4 copy];

  return v5;
}

- (id)matchDictionaryWithSubscriptionStatus:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithCapacity:1];
  v7 = [(ICRadioStoreContentReference *)self rawContentDictionaryWithSubscriptionStatus:v5];

  [v6 setObject:v7 forKey:@"store"];

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(ICRadioStoreContentReference *)self storeIdentifier];
  id v5 = [v3 stringWithFormat:@"<ICRadioStoreContentReference: %p adamID=%@>", self, v4];

  return (NSString *)v5;
}

- (ICRadioStoreContentReference)initWithStoreIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICRadioStoreContentReference;
  id v5 = [(ICRadioStoreContentReference *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSNumber *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end