@interface MOEventSharedWithYou
+ (BOOL)supportsSecureCoding;
- (BOOL)itemIsPinned;
- (MOEventSharedWithYou)initWithCoder:(id)a3;
- (NSArray)itemRecipients;
- (NSArray)itemSenders;
- (NSNumber)itemAttributionsCount;
- (NSURL)itemURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)itemShareDirection;
- (unint64_t)itemSyndicationStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setItemAttributionsCount:(id)a3;
- (void)setItemIsPinned:(BOOL)a3;
- (void)setItemRecipients:(id)a3;
- (void)setItemSenders:(id)a3;
- (void)setItemShareDirection:(unint64_t)a3;
- (void)setItemSyndicationStatus:(unint64_t)a3;
- (void)setItemURL:(id)a3;
@end

@implementation MOEventSharedWithYou

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  itemURL = self->_itemURL;
  id v5 = a3;
  [v5 encodeObject:itemURL forKey:@"itemURL"];
  [v5 encodeObject:self->_itemSenders forKey:@"itemSenders"];
  [v5 encodeObject:self->_itemRecipients forKey:@"itemRecipients"];
  [v5 encodeBool:self->_itemIsPinned forKey:@"itemIsPinned"];
  [v5 encodeBool:self->_itemShareDirection != 0 forKey:@"itemShareDirection"];
  [v5 encodeInteger:self->_itemSyndicationStatus forKey:@"itemSyndicationStatus"];
  [v5 encodeObject:self->_itemAttributionsCount forKey:@"itemAttributionsCount"];
}

- (MOEventSharedWithYou)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MOEventSharedWithYou;
  id v5 = [(MOEventSharedWithYou *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemURL"];
    itemURL = v5->_itemURL;
    v5->_itemURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"itemSenders"];
    itemSenders = v5->_itemSenders;
    v5->_itemSenders = (NSArray *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"itemRecipients"];
    itemRecipients = v5->_itemRecipients;
    v5->_itemRecipients = (NSArray *)v10;

    v5->_itemIsPinned = [v4 decodeBoolForKey:@"itemIsPinned"];
    v5->_itemShareDirection = [v4 decodeBoolForKey:@"itemShareDirection"];
    v5->_itemSyndicationStatus = [v4 decodeIntegerForKey:@"itemSyndicationStatus"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemAttributionsCount"];
    itemAttributionsCount = v5->_itemAttributionsCount;
    v5->_itemAttributionsCount = (NSNumber *)v12;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOEventSharedWithYou);
  objc_storeStrong((id *)&v4->_itemURL, self->_itemURL);
  objc_storeStrong((id *)&v4->_itemSenders, self->_itemSenders);
  objc_storeStrong((id *)&v4->_itemRecipients, self->_itemRecipients);
  v4->_itemIsPinned = self->_itemIsPinned;
  v4->_itemShareDirection = self->_itemShareDirection;
  v4->_itemSyndicationStatus = self->_itemSyndicationStatus;
  objc_storeStrong((id *)&v4->_itemAttributionsCount, self->_itemAttributionsCount);
  return v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(NSURL *)self->_itemURL absoluteString];
  uint64_t v5 = [v4 mask];
  uint64_t v6 = (void *)v5;
  if (self->_itemIsPinned) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  uint64_t v8 = (void *)[v3 initWithFormat:@"itemURL, %@, itemIsPinned, %@, itemShareDirection, %lu, itemAttributionsCount, %@", v5, v7, self->_itemShareDirection, self->_itemAttributionsCount];

  return v8;
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
}

- (NSArray)itemSenders
{
  return self->_itemSenders;
}

- (void)setItemSenders:(id)a3
{
}

- (NSArray)itemRecipients
{
  return self->_itemRecipients;
}

- (void)setItemRecipients:(id)a3
{
}

- (unint64_t)itemShareDirection
{
  return self->_itemShareDirection;
}

- (void)setItemShareDirection:(unint64_t)a3
{
  self->_itemShareDirection = a3;
}

- (BOOL)itemIsPinned
{
  return self->_itemIsPinned;
}

- (void)setItemIsPinned:(BOOL)a3
{
  self->_itemIsPinned = a3;
}

- (unint64_t)itemSyndicationStatus
{
  return self->_itemSyndicationStatus;
}

- (void)setItemSyndicationStatus:(unint64_t)a3
{
  self->_itemSyndicationStatus = a3;
}

- (NSNumber)itemAttributionsCount
{
  return self->_itemAttributionsCount;
}

- (void)setItemAttributionsCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemAttributionsCount, 0);
  objc_storeStrong((id *)&self->_itemRecipients, 0);
  objc_storeStrong((id *)&self->_itemSenders, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
}

@end