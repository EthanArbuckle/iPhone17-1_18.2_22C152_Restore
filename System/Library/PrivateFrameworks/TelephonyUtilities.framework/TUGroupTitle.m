@interface TUGroupTitle
- (BOOL)mostRecentCallWasMissed;
- (CNContact)backingContact;
- (NSArray)handles;
- (NSArray)idsCanonicalDestinations;
- (NSString)backingContactIdentifier;
- (NSString)callerId;
- (NSString)destinationId;
- (NSString)isoCountryCode;
- (NSString)value;
- (TUGroupTitle)initWithString:(id)a3;
- (int64_t)mostRecentCallType;
- (void)setValue:(id)a3;
@end

@implementation TUGroupTitle

- (TUGroupTitle)initWithString:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUGroupTitle;
  v5 = [(TUGroupTitle *)&v8 init];
  v6 = v5;
  if (v5) {
    [(TUGroupTitle *)v5 setValue:v4];
  }

  return v6;
}

- (NSString)callerId
{
  return 0;
}

- (CNContact)backingContact
{
  return 0;
}

- (NSString)backingContactIdentifier
{
  return 0;
}

- (NSString)destinationId
{
  return 0;
}

- (NSString)isoCountryCode
{
  return (NSString *)&stru_1EECEA668;
}

- (NSArray)handles
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (int64_t)mostRecentCallType
{
  return 0;
}

- (BOOL)mostRecentCallWasMissed
{
  return 0;
}

- (NSArray)idsCanonicalDestinations
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end