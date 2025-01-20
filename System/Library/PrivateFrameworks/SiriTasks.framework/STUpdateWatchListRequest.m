@interface STUpdateWatchListRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)contentIdentifiersToAdd;
- (NSArray)contentIdentifiersToRemove;
- (STUpdateWatchListRequest)initWithCoder:(id)a3;
- (void)_setContentIdentifiersToAdd:(id)a3;
- (void)_setContentIdentifiersToRemove:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STUpdateWatchListRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentIdentifiersToRemove, 0);
  objc_storeStrong((id *)&self->_contentIdentifiersToAdd, 0);
}

- (void)_setContentIdentifiersToRemove:(id)a3
{
}

- (NSArray)contentIdentifiersToRemove
{
  return self->_contentIdentifiersToRemove;
}

- (void)_setContentIdentifiersToAdd:(id)a3
{
}

- (NSArray)contentIdentifiersToAdd
{
  return self->_contentIdentifiersToAdd;
}

- (STUpdateWatchListRequest)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STUpdateWatchListRequest;
  v5 = [(AFSiriRequest *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_contentIdentifiersToAdd"];
    contentIdentifiersToAdd = v5->_contentIdentifiersToAdd;
    v5->_contentIdentifiersToAdd = (NSArray *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_contentIdentifiersToRemove"];
    contentIdentifiersToRemove = v5->_contentIdentifiersToRemove;
    v5->_contentIdentifiersToRemove = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STUpdateWatchListRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentIdentifiersToAdd, @"_contentIdentifiersToAdd", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_contentIdentifiersToRemove forKey:@"_contentIdentifiersToRemove"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end