@interface MontrealNNModelQuantization
- (MontrealNNModelQuantization)initWithDictionary:(id)a3;
- (NSNumber)weightStorageRange;
- (NSString)weightStorage;
@end

@implementation MontrealNNModelQuantization

- (MontrealNNModelQuantization)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MontrealNNModelQuantization;
  v7 = [(MontrealNNModelQuantization *)&v15 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_exMRL_stringForKey_(v4, v5, (uint64_t)off_1E9457FA8, v6);
    weightStorage = v7->_weightStorage;
    v7->_weightStorage = (NSString *)v8;

    uint64_t v12 = objc_msgSend_exMRL_numberForKey_(v4, v10, (uint64_t)off_1E9457FB0, v11);
    weightStorageRange = v7->_weightStorageRange;
    v7->_weightStorageRange = (NSNumber *)v12;
  }
  return v7;
}

- (NSString)weightStorage
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)weightStorageRange
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightStorageRange, 0);

  objc_storeStrong((id *)&self->_weightStorage, 0);
}

@end