@interface PGDiscoveryFeedItem
- (PGDiscoveryFeedItem)initWithObject:(id)a3;
- (id)dictionaryRepresentation;
@end

@implementation PGDiscoveryFeedItem

- (void).cxx_destruct
{
}

- (id)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F8AE78];
  v8[0] = self->_localIdentifier;
  uint64_t v3 = *MEMORY[0x1E4F8AE70];
  v7[0] = v2;
  v7[1] = v3;
  v4 = [NSNumber numberWithBool:self->_isCollection];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (PGDiscoveryFeedItem)initWithObject:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGDiscoveryFeedItem;
  v5 = [(PGDiscoveryFeedItem *)&v10 init];
  if (v5)
  {
    v6 = [v4 localIdentifier];
    uint64_t v7 = [v6 copy];
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v7;

    objc_opt_class();
    v5->_isCollection = objc_opt_isKindOfClass() & 1;
  }

  return v5;
}

@end