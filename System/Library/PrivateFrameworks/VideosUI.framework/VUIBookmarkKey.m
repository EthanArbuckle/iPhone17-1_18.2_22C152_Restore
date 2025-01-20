@interface VUIBookmarkKey
- (NSString)identifier;
- (VUIBookmarkKey)init;
- (VUIBookmarkKey)initWithIdentifier:(id)a3 keyType:(int64_t)a4;
- (id)description;
- (int64_t)keyType;
@end

@implementation VUIBookmarkKey

- (VUIBookmarkKey)initWithIdentifier:(id)a3 keyType:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)VUIBookmarkKey;
    v7 = [(VUIBookmarkKey *)&v12 init];
    if (v7)
    {
      uint64_t v8 = [v6 copy];
      identifier = v7->_identifier;
      v7->_identifier = (NSString *)v8;

      v7->_keyType = a4;
    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (VUIBookmarkKey)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)VUIBookmarkKey;
  v4 = [(VUIBookmarkKey *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@, identifier=%@, keyType=%ld", v4, self->_identifier, self->_keyType];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)keyType
{
  return self->_keyType;
}

- (void).cxx_destruct
{
}

@end