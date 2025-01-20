@interface RTWalletManagerNotificationPassUsed
- (NSArray)storeIDs;
- (NSString)passTypeIdentifier;
- (RTWalletManagerNotificationPassUsed)initWithPassTypeIdentifier:(id)a3 source:(int64_t)a4 info:(id)a5;
- (int64_t)source;
@end

@implementation RTWalletManagerNotificationPassUsed

- (RTWalletManagerNotificationPassUsed)initWithPassTypeIdentifier:(id)a3 source:(int64_t)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RTWalletManagerNotificationPassUsed;
  v10 = [(RTNotification *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    passTypeIdentifier = v10->_passTypeIdentifier;
    v10->_passTypeIdentifier = (NSString *)v11;

    v10->_source = a4;
    v13 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F87FE0]];
    uint64_t v14 = [v13 copy];
    storeIDs = v10->_storeIDs;
    v10->_storeIDs = (NSArray *)v14;
  }
  return v10;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (int64_t)source
{
  return self->_source;
}

- (NSArray)storeIDs
{
  return self->_storeIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIDs, 0);

  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end