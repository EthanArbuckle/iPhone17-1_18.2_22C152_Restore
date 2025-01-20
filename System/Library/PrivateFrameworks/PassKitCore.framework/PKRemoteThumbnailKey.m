@interface PKRemoteThumbnailKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteThumbnailKey:(id)a3;
- (NSDictionary)requestDictionary;
- (NSString)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setRequestDictionary:(id)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation PKRemoteThumbnailKey

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKRemoteThumbnailKey allocWithZone:](PKRemoteThumbnailKey, "allocWithZone:") init];
  uint64_t v6 = [(NSDictionary *)self->_requestDictionary copyWithZone:a3];
  requestDictionary = v5->_requestDictionary;
  v5->_requestDictionary = (NSDictionary *)v6;

  uint64_t v8 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  requestIdentifier = v5->_requestIdentifier;
  v5->_requestIdentifier = (NSString *)v8;

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_requestIdentifier];
  [v3 safelyAddObject:self->_requestDictionary];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKRemoteThumbnailKey *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKRemoteThumbnailKey *)self isEqualToRemoteThumbnailKey:v5];

  return v6;
}

- (BOOL)isEqualToRemoteThumbnailKey:(id)a3
{
  unint64_t v4 = a3;
  requestIdentifier = self->_requestIdentifier;
  BOOL v6 = (NSString *)v4[1];
  if (requestIdentifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[NSString isEqual:](requestIdentifier, "isEqual:")) {
      goto LABEL_9;
    }
LABEL_7:
    char v8 = 0;
    goto LABEL_13;
  }
  if (requestIdentifier != v6) {
    goto LABEL_7;
  }
LABEL_9:
  requestDictionary = self->_requestDictionary;
  v10 = (NSDictionary *)v4[2];
  if (requestDictionary && v10) {
    char v8 = -[NSDictionary isEqual:](requestDictionary, "isEqual:");
  }
  else {
    char v8 = requestDictionary == v10;
  }
LABEL_13:

  return v8;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSDictionary)requestDictionary
{
  return self->_requestDictionary;
}

- (void)setRequestDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDictionary, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end