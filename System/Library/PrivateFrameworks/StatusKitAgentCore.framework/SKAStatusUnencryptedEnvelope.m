@interface SKAStatusUnencryptedEnvelope
- (NSDate)dateCreated;
- (NSDate)datePublished;
- (NSDictionary)envelopeDictionary;
- (NSString)statusUniqueIdentifier;
- (SKAStatusUnencryptedEnvelope)initWithEnvelopeDictionary:(id)a3;
- (void)setEnvelopeDictionary:(id)a3;
@end

@implementation SKAStatusUnencryptedEnvelope

- (SKAStatusUnencryptedEnvelope)initWithEnvelopeDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKAStatusUnencryptedEnvelope;
  v6 = [(SKAStatusUnencryptedEnvelope *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_envelopeDictionary, a3);
  }

  return v7;
}

- (NSString)statusUniqueIdentifier
{
  return (NSString *)[(NSDictionary *)self->_envelopeDictionary ska_stringForKey:@"i"];
}

- (NSDate)datePublished
{
  return (NSDate *)[(NSDictionary *)self->_envelopeDictionary ska_dateFromUnixTimestampForKey:@"p"];
}

- (NSDate)dateCreated
{
  return (NSDate *)[(NSDictionary *)self->_envelopeDictionary ska_dateFromUnixTimestampForKey:@"c"];
}

- (NSDictionary)envelopeDictionary
{
  return self->_envelopeDictionary;
}

- (void)setEnvelopeDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end