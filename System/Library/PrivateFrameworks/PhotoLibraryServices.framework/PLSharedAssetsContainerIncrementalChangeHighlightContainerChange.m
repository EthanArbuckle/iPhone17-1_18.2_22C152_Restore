@interface PLSharedAssetsContainerIncrementalChangeHighlightContainerChange
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)relationshipKey;
- (NSURL)destinationHighlightURI;
- (NSURL)sourceHighlightURI;
- (PLSharedAssetsContainerIncrementalChangeHighlightContainerChange)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationHighlightURI:(id)a3;
- (void)setRelationshipKey:(id)a3;
- (void)setSourceHighlightURI:(id)a3;
@end

@implementation PLSharedAssetsContainerIncrementalChangeHighlightContainerChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationHighlightURI, 0);
  objc_storeStrong((id *)&self->_sourceHighlightURI, 0);
  objc_storeStrong((id *)&self->_relationshipKey, 0);
}

- (void)setDestinationHighlightURI:(id)a3
{
}

- (NSURL)destinationHighlightURI
{
  return self->_destinationHighlightURI;
}

- (void)setSourceHighlightURI:(id)a3
{
}

- (NSURL)sourceHighlightURI
{
  return self->_sourceHighlightURI;
}

- (void)setRelationshipKey:(id)a3
{
}

- (NSString)relationshipKey
{
  return self->_relationshipKey;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_relationshipKey hash];
  uint64_t v4 = [(NSURL *)self->_sourceHighlightURI hash] ^ v3;
  return v4 ^ [(NSURL *)self->_destinationHighlightURI hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PLSharedAssetsContainerIncrementalChangeHighlightContainerChange *)a3;
  if (v4 == self)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (PLObjectIsEqual() && PLObjectIsEqual()) {
        char IsEqual = PLObjectIsEqual();
      }
      else {
        char IsEqual = 0;
      }
    }
    else
    {
      char IsEqual = 0;
    }
  }

  return IsEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)[(NSString *)self->_relationshipKey copy];
  [v4 setRelationshipKey:v5];

  v6 = (void *)[(NSURL *)self->_sourceHighlightURI copy];
  [v4 setSourceHighlightURI:v6];

  v7 = (void *)[(NSURL *)self->_destinationHighlightURI copy];
  [v4 setDestinationHighlightURI:v7];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PLSharedAssetsContainerIncrementalChangeHighlightContainerChange *)self relationshipKey];
  [v4 encodeObject:v5 forKey:@"relationshipKey"];

  v6 = [(PLSharedAssetsContainerIncrementalChangeHighlightContainerChange *)self sourceHighlightURI];
  [v4 encodeObject:v6 forKey:@"sourceHighlightURI"];

  id v7 = [(PLSharedAssetsContainerIncrementalChangeHighlightContainerChange *)self destinationHighlightURI];
  [v4 encodeObject:v7 forKey:@"destinationHighlightURI"];
}

- (PLSharedAssetsContainerIncrementalChangeHighlightContainerChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLSharedAssetsContainerIncrementalChangeHighlightContainerChange;
  v5 = [(PLSharedAssetsContainerIncrementalChangeHighlightContainerChange *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relationshipKey"];
    relationshipKey = v5->_relationshipKey;
    v5->_relationshipKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceHighlightURI"];
    sourceHighlightURI = v5->_sourceHighlightURI;
    v5->_sourceHighlightURI = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationHighlightURI"];
    destinationHighlightURI = v5->_destinationHighlightURI;
    v5->_destinationHighlightURI = (NSURL *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end