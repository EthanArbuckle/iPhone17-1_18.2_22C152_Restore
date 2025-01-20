@interface WBSSavedAccountSidecarContextSpecificData
- (BOOL)isEqual:(id)a3;
- (NSDate)lastUsedDate;
- (NSDictionary)dictionaryRepresentation;
- (WBSSavedAccountSidecarContextSpecificData)initWithDictionaryRepresentation:(id)a3;
- (WBSSavedAccountSidecarContextSpecificData)initWithLastUsedDate:(id)a3;
- (unint64_t)hash;
- (void)setLastUsedDate:(id)a3;
@end

@implementation WBSSavedAccountSidecarContextSpecificData

- (WBSSavedAccountSidecarContextSpecificData)initWithLastUsedDate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSavedAccountSidecarContextSpecificData;
  v6 = [(WBSSavedAccountSidecarContextSpecificData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lastUsedDate, a3);
    v8 = v7;
  }

  return v7;
}

- (WBSSavedAccountSidecarContextSpecificData)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = (NSDictionary *)[v4 copy];
  originalKeychainDictionary = self->_originalKeychainDictionary;
  self->_originalKeychainDictionary = v5;

  v7 = objc_msgSend(v4, "safari_numberForKey:", @"lUsed");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v7 doubleValue];
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastUsedDate = self->_lastUsedDate;
    self->_lastUsedDate = v9;
  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSSavedAccountSidecarContextSpecificData *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = WBSIsEqual(self->_lastUsedDate, v4->_lastUsedDate);
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSDate *)self->_lastUsedDate hash];
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (void *)[(NSDictionary *)self->_originalKeychainDictionary mutableCopy];
  id v4 = NSNumber;
  [(NSDate *)self->_lastUsedDate timeIntervalSinceReferenceDate];
  char v5 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v5 forKeyedSubscript:@"lUsed"];

  return (NSDictionary *)v3;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_originalKeychainDictionary, 0);
}

@end