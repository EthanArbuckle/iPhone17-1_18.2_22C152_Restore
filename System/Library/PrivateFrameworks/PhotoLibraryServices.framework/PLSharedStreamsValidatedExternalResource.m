@interface PLSharedStreamsValidatedExternalResource
- (NSString)fingerprint;
- (id)description;
- (unsigned)sharedStreamsType;
- (void)setFingerprint:(id)a3;
- (void)setSharedStreamsType:(unsigned int)a3;
@end

@implementation PLSharedStreamsValidatedExternalResource

- (void).cxx_destruct
{
}

- (void)setFingerprint:(id)a3
{
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (unsigned)sharedStreamsType
{
  return self->_sharedStreamsType;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p> - sharedStreamsType: %ld, recipeID: %ld", v5, self, -[PLSharedStreamsValidatedExternalResource sharedStreamsType](self, "sharedStreamsType"), -[PLValidatedExternalResource recipeID](self, "recipeID")];

  return v6;
}

- (void)setSharedStreamsType:(unsigned int)a3
{
  self->_sharedStreamsType = a3;
  if (a3 > 9) {
    uint64_t v3 = 65741;
  }
  else {
    uint64_t v3 = dword_19BA9A8D8[a3];
  }
  [(PLValidatedExternalResource *)self setRecipeID:v3];
}

@end