@interface SSPurchasableItem
+ (id)allPropertyKeys;
+ (id)databaseTable;
+ (id)sortByDatePurchasedKey;
- (BOOL)isHidden;
- (SSPurchasableItem)initWithPropertyValues:(id)a3;
- (id)datePurchased;
- (id)description;
- (id)propertyValues;
- (int64_t)accountUniqueIdentifier;
- (int64_t)pid;
- (int64_t)storeID;
- (void)dealloc;
@end

@implementation SSPurchasableItem

- (SSPurchasableItem)initWithPropertyValues:(id)a3
{
  v4 = [(SSPurchasableItem *)self init];
  if (v4) {
    v4->_propertyValues = (NSDictionary *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSPurchasableItem;
  [(SSPurchasableItem *)&v3 dealloc];
}

- (id)propertyValues
{
  v2 = self->_propertyValues;
  return v2;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@:%p> [PID: %lld] [Account: %lld] [StoreID: %lld]", NSStringFromClass(v4), self, -[SSPurchasableItem pid](self, "pid"), -[SSPurchasableItem accountUniqueIdentifier](self, "accountUniqueIdentifier"), -[SSPurchasableItem storeID](self, "storeID")];
}

- (int64_t)pid
{
  id v2 = [(NSDictionary *)self->_propertyValues objectForKey:SSPurchasableItemPID];
  return [v2 longLongValue];
}

- (int64_t)accountUniqueIdentifier
{
  id v2 = [(NSDictionary *)self->_propertyValues objectForKey:SSPurchasableItemAccountUniqueIdentifier];
  return [v2 longLongValue];
}

- (id)datePurchased
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  double v3 = (double)objc_msgSend(-[NSDictionary objectForKey:](self->_propertyValues, "objectForKey:", SSPurchasableItemDatePurchased), "longLongValue");
  return (id)[v2 dateWithTimeIntervalSinceReferenceDate:v3];
}

- (BOOL)isHidden
{
  id v2 = [(NSDictionary *)self->_propertyValues objectForKey:SSPurchasableItemIsHidden];
  return [v2 BOOLValue];
}

- (int64_t)storeID
{
  id v2 = [(NSDictionary *)self->_propertyValues objectForKey:SSPurchasableItemStoreID];
  return [v2 longLongValue];
}

+ (id)databaseTable
{
  return 0;
}

+ (id)sortByDatePurchasedKey
{
  return (id)SSPurchasableItemDatePurchased;
}

+ (id)allPropertyKeys
{
  if (allPropertyKeys_onceToken != -1) {
    dispatch_once(&allPropertyKeys_onceToken, &__block_literal_global_35);
  }
  return (id)allPropertyKeys___allPropertyKeys;
}

uint64_t __36__SSPurchasableItem_allPropertyKeys__block_invoke()
{
  v1[5] = *MEMORY[0x1E4F143B8];
  v1[0] = SSPurchasableItemPID;
  v1[1] = SSPurchasableItemAccountUniqueIdentifier;
  v1[2] = SSPurchasableItemDatePurchased;
  v1[3] = SSPurchasableItemIsHidden;
  v1[4] = SSPurchasableItemStoreID;
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v1 count:5];
  allPropertyKeys___allPropertyKeys = result;
  return result;
}

@end