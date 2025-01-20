@interface PKIdentityIntentToStore
+ (PKIdentityIntentToStore)mayStoreIntent;
+ (PKIdentityIntentToStore)mayStoreIntentForDays:(NSInteger)days;
+ (PKIdentityIntentToStore)willNotStoreIntent;
- (DIIdentityIntentToStore)wrapped;
- (PKIdentityIntentToStore)initWithDIIdentityIntentToStore:(id)a3;
- (id)asDIIdentityIntentToStore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setWrapped:(id)a3;
@end

@implementation PKIdentityIntentToStore

- (PKIdentityIntentToStore)initWithDIIdentityIntentToStore:(id)a3
{
  v4 = (DIIdentityIntentToStore *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PKIdentityIntentToStore;
  v5 = [(PKIdentityIntentToStore *)&v8 init];
  wrapped = v5->_wrapped;
  v5->_wrapped = v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [PKIdentityIntentToStore alloc];
  v6 = (void *)[(DIIdentityIntentToStore *)self->_wrapped copyWithZone:a3];
  v7 = [(PKIdentityIntentToStore *)v5 initWithDIIdentityIntentToStore:v6];

  return v7;
}

- (id)description
{
  return (id)[(DIIdentityIntentToStore *)self->_wrapped description];
}

+ (PKIdentityIntentToStore)willNotStoreIntent
{
  v2 = [PKIdentityIntentToStore alloc];
  v3 = [MEMORY[0x1E4F5C1C0] willNotStoreIntent];
  v4 = [(PKIdentityIntentToStore *)v2 initWithDIIdentityIntentToStore:v3];

  return v4;
}

+ (PKIdentityIntentToStore)mayStoreIntent
{
  v2 = [PKIdentityIntentToStore alloc];
  v3 = [MEMORY[0x1E4F5C1C0] mayStoreIntent];
  v4 = [(PKIdentityIntentToStore *)v2 initWithDIIdentityIntentToStore:v3];

  return v4;
}

+ (PKIdentityIntentToStore)mayStoreIntentForDays:(NSInteger)days
{
  v4 = [PKIdentityIntentToStore alloc];
  v5 = [MEMORY[0x1E4F5C1C0] mayStoreIntentForDays:days];
  v6 = [(PKIdentityIntentToStore *)v4 initWithDIIdentityIntentToStore:v5];

  return v6;
}

- (id)asDIIdentityIntentToStore
{
  return self->_wrapped;
}

- (DIIdentityIntentToStore)wrapped
{
  return (DIIdentityIntentToStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWrapped:(id)a3
{
}

- (void).cxx_destruct
{
}

@end