@interface SFMoreResults
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)label;
- (SFMoreResults)initWithCoder:(id)a3;
- (SFMoreResults)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)loadSearchResultsWithCompletionAndErrorHandler:(id)a3;
- (void)loadSearchResultsWithCompletionHandler:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation SFMoreResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)hash
{
  v2 = [(SFMoreResults *)self label];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFMoreResults *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFMoreResults *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(SFMoreResults *)self label];
    v7 = [(SFMoreResults *)v5 label];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFMoreResults *)self label];
      if (v8)
      {
        v9 = [(SFMoreResults *)self label];
        v10 = [(SFMoreResults *)v5 label];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 1;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFMoreResults *)self label];
  v6 = (void *)[v5 copy];
  [v4 setLabel:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMoreResults alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBMoreResults *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMoreResults alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBMoreResults *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBMoreResults alloc] initWithFacade:self];
  v5 = [(_SFPBMoreResults *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFMoreResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBMoreResults alloc] initWithData:v5];
  v7 = [(SFMoreResults *)self initWithProtobuf:v6];

  return v7;
}

- (SFMoreResults)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFMoreResults;
  v5 = [(SFMoreResults *)&v10 init];
  if (v5)
  {
    v6 = [v4 label];

    if (v6)
    {
      v7 = [v4 label];
      [(SFMoreResults *)v5 setLabel:v7];
    }
    v8 = v5;
  }

  return v5;
}

- (void)loadSearchResultsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__SFMoreResults_Handwritten__loadSearchResultsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5A2E6C8;
  id v7 = v4;
  id v5 = v4;
  [(SFMoreResults *)self loadSearchResultsWithCompletionAndErrorHandler:v6];
}

uint64_t __69__SFMoreResults_Handwritten__loadSearchResultsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadSearchResultsWithCompletionAndErrorHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__SFMoreResults_Handwritten__loadSearchResultsWithCompletionAndErrorHandler___block_invoke;
  v6[3] = &unk_1E5A2E6C8;
  id v7 = v4;
  id v5 = v4;
  SFResourceLoaderLoadMoreResults(self, v6);
}

uint64_t __77__SFMoreResults_Handwritten__loadSearchResultsWithCompletionAndErrorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end