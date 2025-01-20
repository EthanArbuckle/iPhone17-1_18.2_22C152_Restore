@interface TUAudioRouteCollectionKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAudioRouteCollectionKey:(id)a3;
- (NSString)category;
- (NSString)mode;
- (TUAudioRouteCollectionKey)initWithCategory:(id)a3 mode:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TUAudioRouteCollectionKey

- (TUAudioRouteCollectionKey)initWithCategory:(id)a3 mode:(id)a4
{
  v6 = (__CFString *)a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TUAudioRouteCollectionKey;
  v8 = [(TUAudioRouteCollectionKey *)&v16 init];
  if (v8)
  {
    if (!initWithCategory_mode___AVAudioSessionCategoryPhoneCall)
    {
      v9 = (void **)CUTWeakLinkSymbol();
      if (v9) {
        v10 = *v9;
      }
      else {
        v10 = 0;
      }
      objc_storeStrong((id *)&initWithCategory_mode___AVAudioSessionCategoryPhoneCall, v10);
    }
    if (-[__CFString isEqualToString:](v6, "isEqualToString:"))
    {

      v6 = @"PhoneCall";
    }
    uint64_t v11 = [(__CFString *)v6 copy];
    category = v8->_category;
    v8->_category = (NSString *)v11;

    uint64_t v13 = [v7 copy];
    mode = v8->_mode;
    v8->_mode = (NSString *)v13;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TUAudioRouteCollectionKey *)self category];
  v6 = [(TUAudioRouteCollectionKey *)self mode];
  id v7 = [v3 stringWithFormat:@"<%@ %p category=%@ mode=%@>", v4, self, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUAudioRouteCollectionKey *)self isEqualToAudioRouteCollectionKey:v4];

  return v5;
}

- (BOOL)isEqualToAudioRouteCollectionKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUAudioRouteCollectionKey *)self category];
  v6 = [v4 category];
  if (TUStringsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    id v7 = [(TUAudioRouteCollectionKey *)self mode];
    v8 = [v4 mode];
    char v9 = TUStringsAreEqualOrNil((unint64_t)v7, (uint64_t)v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(TUAudioRouteCollectionKey *)self category];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TUAudioRouteCollectionKey *)self mode];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(TUAudioRouteCollectionKey *)self category];
  unint64_t v6 = [(TUAudioRouteCollectionKey *)self mode];
  id v7 = (void *)[v4 initWithCategory:v5 mode:v6];

  return v7;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);

  objc_storeStrong((id *)&self->_category, 0);
}

@end