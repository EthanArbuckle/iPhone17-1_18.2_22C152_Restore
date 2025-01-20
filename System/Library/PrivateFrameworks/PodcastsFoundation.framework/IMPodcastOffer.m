@interface IMPodcastOffer
- (BOOL)isEqual:(id)a3;
- (NSString)kind;
- (NSString)priceType;
- (unint64_t)offerTypeAsFlagBit;
- (void)setKind:(id)a3;
- (void)setPriceType:(id)a3;
@end

@implementation IMPodcastOffer

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(IMPodcastOffer *)self priceType];
    v7 = [(IMPodcastOffer *)self priceType];
    if (v6 == v7 || [v6 isEqual:v7])
    {
      v8 = [(IMPodcastOffer *)self kind];
      v9 = [v5 kind];
      if (v8 == v9) {
        char v10 = 1;
      }
      else {
        char v10 = [v8 isEqual:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)offerTypeAsFlagBit
{
  v3 = [(IMPodcastOffer *)self priceType];
  char v4 = [v3 isEqualToString:@"STDQ"];

  if (v4) {
    return 1;
  }
  v6 = [(IMPodcastOffer *)self priceType];
  char v7 = [v6 isEqualToString:@"PSUB"];

  if (v7) {
    return 2;
  }
  v8 = [(IMPodcastOffer *)self priceType];
  char v9 = [v8 isEqualToString:@"PLUS"];

  if (v9) {
    return 4;
  }
  char v10 = [(IMPodcastOffer *)self priceType];
  int v11 = [v10 isEqualToString:@"PRMO"];

  if (v11) {
    return 8;
  }
  else {
    return 1;
  }
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (NSString)priceType
{
  return self->_priceType;
}

- (void)setPriceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceType, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

@end