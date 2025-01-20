@interface TILanguageModelAdaptationContext
- (BOOL)isOnline;
- (NSDictionary)recipientContext;
- (NSString)appContext;
- (NSString)identifier;
- (NSString)identifierForResponseKit;
- (NSString)recipientNameDigest;
- (TILanguageModelAdaptationContext)initWithClientIdentifier:(id)a3 andRecipientContactInfo:(id)a4;
- (TILanguageModelAdaptationContext)initWithClientIdentifier:(id)a3 andRecipientRecord:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setIsOnline:(BOOL)a3;
@end

@implementation TILanguageModelAdaptationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientContext, 0);
  objc_storeStrong((id *)&self->_recipientNameDigest, 0);

  objc_storeStrong((id *)&self->_appContext, 0);
}

- (void)setIsOnline:(BOOL)a3
{
  self->_isOnline = a3;
}

- (BOOL)isOnline
{
  return self->_isOnline;
}

- (NSDictionary)recipientContext
{
  return self->_recipientContext;
}

- (NSString)recipientNameDigest
{
  return self->_recipientNameDigest;
}

- (NSString)appContext
{
  return self->_appContext;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(TILanguageModelAdaptationContext);
  uint64_t v5 = [(NSString *)self->_appContext copy];
  appContext = v4->_appContext;
  v4->_appContext = (NSString *)v5;

  objc_storeStrong((id *)&v4->_recipientContext, self->_recipientContext);
  uint64_t v7 = [(NSString *)self->_recipientNameDigest copy];
  recipientNameDigest = v4->_recipientNameDigest;
  v4->_recipientNameDigest = (NSString *)v7;

  return v4;
}

- (NSString)identifierForResponseKit
{
  return self->_recipientNameDigest;
}

- (NSString)identifier
{
  recipientNameDigest = self->_recipientNameDigest;
  if (recipientNameDigest)
  {
    v3 = [NSString stringWithFormat:@"%@@%@", self->_appContext, recipientNameDigest];
  }
  else
  {
    v3 = self->_appContext;
  }

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"appContext=%@ recipientContext=%@", self->_appContext, self->_recipientContext];
}

- (TILanguageModelAdaptationContext)initWithClientIdentifier:(id)a3 andRecipientContactInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    v9 = TIAddressBookFindRecordsMatchingRecipients(v8);
    v10 = [v9 objectForKey:v7];
  }
  else
  {
    v10 = 0;
  }
  v11 = [(TILanguageModelAdaptationContext *)self initWithClientIdentifier:v6 andRecipientRecord:v10];

  return v11;
}

- (TILanguageModelAdaptationContext)initWithClientIdentifier:(id)a3 andRecipientRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)TILanguageModelAdaptationContext;
  v8 = [(TILanguageModelAdaptationContext *)&v21 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    appContext = v8->_appContext;
    v8->_appContext = (NSString *)v9;

    v8->_isOnline = 1;
    if (v7)
    {
      v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v12 = [v7 objectForKey:@"compositeName"];
      if (v12)
      {
        v13 = +[TICryptographer sharedCryptographer];
        v14 = [v13 stringDigestForName:v12];
      }
      else
      {
        v14 = 0;
      }
      v15 = [v7 objectForKey:@"firstName"];
      if (v15) {
        [(NSDictionary *)v11 setObject:v15 forKey:*MEMORY[0x1E4F72410]];
      }
      v16 = [v7 objectForKey:@"lastName"];
      if (v16) {
        [(NSDictionary *)v11 setObject:v16 forKey:*MEMORY[0x1E4F72408]];
      }
      if (v14) {
        [(NSDictionary *)v11 setObject:v14 forKey:*MEMORY[0x1E4F72418]];
      }
      uint64_t v17 = [v14 copy];
      recipientNameDigest = v8->_recipientNameDigest;
      v8->_recipientNameDigest = (NSString *)v17;

      recipientContext = v8->_recipientContext;
      v8->_recipientContext = v11;
    }
  }

  return v8;
}

@end