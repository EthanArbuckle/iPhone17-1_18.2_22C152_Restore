@interface StoreDownloadQueueRequest
+ (void)initialize;
- (BOOL)cancelsDuplicateDownloads;
- (BOOL)isEqual:(id)a3;
- (NSNumber)accountIdentifier;
- (NSString)queueContentsURLBagKey;
- (NSString)queueCountURLBagKey;
- (NSString)queueIdentifier;
- (NSString)reason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)purchaseIdentifier;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAccountIdentifier:(id)a3;
- (void)setCancelsDuplicateDownloads:(BOOL)a3;
- (void)setPurchaseIdentifier:(int64_t)a3;
- (void)setQueueIdentifier:(id)a3;
- (void)setReason:(id)a3;
@end

@implementation StoreDownloadQueueRequest

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)StoreDownloadQueueRequest;
  [(StoreDownloadQueueRequest *)&v3 dealloc];
}

- (NSString)queueContentsURLBagKey
{
  id v2 = [(id)qword_100401D38 objectForKey:self->_queueIdentifier];

  return (NSString *)v2;
}

- (NSString)queueCountURLBagKey
{
  id v2 = [(id)qword_100401D40 objectForKey:self->_queueIdentifier];

  return (NSString *)v2;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)StoreDownloadQueueRequest;
  return +[NSString stringWithFormat:@"%@: %@ / %@", [(StoreDownloadQueueRequest *)&v3 description], self->_queueIdentifier, self->_accountIdentifier];
}

- (unint64_t)hash
{
  return [(NSString *)self->_queueIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && (id v6 = [(StoreDownloadQueueRequest *)self purchaseIdentifier],
        v6 == [a3 purchaseIdentifier]))
  {
    v7 = [(StoreDownloadQueueRequest *)self accountIdentifier];
    if (v7 == [a3 accountIdentifier]
      || (unsigned int v8 = -[NSNumber isEqual:](-[StoreDownloadQueueRequest accountIdentifier](self, "accountIdentifier"), "isEqual:", [a3 accountIdentifier])) != 0)
    {
      v9 = [(StoreDownloadQueueRequest *)self queueIdentifier];
      if (v9 == [a3 queueIdentifier])
      {
        LOBYTE(v8) = 1;
      }
      else
      {
        v10 = [(StoreDownloadQueueRequest *)self queueIdentifier];
        id v11 = [a3 queueIdentifier];
        LOBYTE(v8) = [(NSString *)v10 isEqual:v11];
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(NSNumber *)self->_accountIdentifier copyWithZone:a3];
  *((unsigned char *)v5 + 16) = self->_cancelsDuplicateDownloads;
  v5[3] = self->_purchaseIdentifier;
  v5[4] = [(NSString *)self->_queueIdentifier copyWithZone:a3];
  v5[5] = [(NSString *)self->_reason copyWithZone:a3];
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_100401D38 = (uint64_t)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"pendingApps", @"apps", @"pendingBooks", @"books", @"pendingSongs", @"media", 0);
    qword_100401D40 = (uint64_t)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"checkAppQueue", @"apps", @"checkBookQueue", @"books", @"check-download-queue", @"media", 0);
  }
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (BOOL)cancelsDuplicateDownloads
{
  return self->_cancelsDuplicateDownloads;
}

- (void)setCancelsDuplicateDownloads:(BOOL)a3
{
  self->_cancelsDuplicateDownloads = a3;
}

- (int64_t)purchaseIdentifier
{
  return self->_purchaseIdentifier;
}

- (void)setPurchaseIdentifier:(int64_t)a3
{
  self->_purchaseIdentifier = a3;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (void)setQueueIdentifier:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

@end