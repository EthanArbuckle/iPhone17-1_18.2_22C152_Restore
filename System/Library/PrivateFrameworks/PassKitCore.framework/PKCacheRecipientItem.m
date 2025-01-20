@interface PKCacheRecipientItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasExpired;
- (BOOL)isNewerThan:(id)a3;
- (PKCacheRecipientItem)initWithCoder:(id)a3;
- (PKCacheRecipientItem)initWithItem:(id)a3;
- (PKPeerPaymentRecipient)item;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKCacheRecipientItem

- (PKCacheRecipientItem)initWithItem:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCacheRecipientItem;
  v6 = [(PKCacheRecipientItem *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    insertDate = v7->_insertDate;
    v7->_insertDate = (NSDate *)v8;
  }
  return v7;
}

- (BOOL)hasExpired
{
  v3 = [(PKPeerPaymentRecipient *)self->_item cacheUntil];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NSDate *)self->_insertDate dateByAddingTimeInterval:3600.0];
  }
  v6 = v5;

  v7 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v8 = [v6 compare:v7] == -1;

  return v8;
}

- (BOOL)isNewerThan:(id)a3
{
  return [(NSDate *)self->_insertDate compare:*((void *)a3 + 1)] != NSOrderedAscending;
}

- (PKCacheRecipientItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCacheRecipientItem;
  id v5 = [(PKCacheRecipientItem *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    item = v5->_item;
    v5->_item = (PKPeerPaymentRecipient *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    insertDate = v5->_insertDate;
    v5->_insertDate = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  item = self->_item;
  id v5 = a3;
  [v5 encodeObject:item forKey:@"i"];
  [v5 encodeObject:self->_insertDate forKey:@"d"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRecipient)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_insertDate, 0);
}

@end