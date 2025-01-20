@interface PHCallBlockingServiceProvider
- (BOOL)supportsSpamBlocking;
- (NSString)localizedName;
- (PHCallBlockingServiceProvider)initWithLocalizedName:(id)a3 supportsSpamBlocking:(BOOL)a4;
@end

@implementation PHCallBlockingServiceProvider

- (PHCallBlockingServiceProvider)initWithLocalizedName:(id)a3 supportsSpamBlocking:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHCallBlockingServiceProvider;
  v7 = [(PHCallBlockingServiceProvider *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    localizedName = v7->_localizedName;
    v7->_localizedName = (NSString *)v8;

    v7->_supportsSpamBlocking = a4;
  }

  return v7;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)supportsSpamBlocking
{
  return self->_supportsSpamBlocking;
}

- (void).cxx_destruct
{
}

@end