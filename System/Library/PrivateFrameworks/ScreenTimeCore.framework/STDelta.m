@interface STDelta
- (NSDictionary)dictionary;
- (NSString)uniqueIdentifier;
- (STDelta)initWithUniqueIdentifier:(id)a3;
- (int64_t)changeType;
- (void)changedWithDictionary:(id)a3;
- (void)deleted;
- (void)setDictionary:(id)a3;
@end

@implementation STDelta

- (STDelta)initWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STDelta;
  v5 = [(STDelta *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)changedWithDictionary:(id)a3
{
  self->_changeType = 1;
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void)deleted
{
  self->_changeType = 2;
  self->_dictionary = 0;
  MEMORY[0x1F41817F8]();
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end