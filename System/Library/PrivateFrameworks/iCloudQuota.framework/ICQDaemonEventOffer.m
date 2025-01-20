@interface ICQDaemonEventOffer
+ (id)_mutablePlaceholderPersistanceDictionary;
+ (id)persistenceKey;
- (id)_initWithAccount:(id)a3 error:(id)a4;
@end

@implementation ICQDaemonEventOffer

+ (id)persistenceKey
{
  return @"_ICQCachedEventOfferInternal";
}

+ (id)_mutablePlaceholderPersistanceDictionary
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ICQDaemonEventOffer;
  v2 = objc_msgSendSuper2(&v4, sel__mutablePlaceholderPersistanceDictionary);
  [v2 setObject:&unk_1F2DE0380 forKey:@"isEventOffer"];
  return v2;
}

- (id)_initWithAccount:(id)a3 error:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)ICQDaemonEventOffer;
  id v4 = [(ICQDaemonOffer *)&v11 _initWithAccount:a3 error:a4];
  if (v4)
  {
    v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Creating backup restored offer placeholder", v10, 2u);
    }

    v6 = [v4 serverDictionary];
    v7 = (void *)[v6 mutableCopy];

    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:@"isEventOffer"];
    [v7 setObject:@"Event" forKey:@"offerType"];
    [v7 setObject:@"Event" forKey:@"type"];
    v8 = (void *)[v7 copy];
    [v4 setServerDictionary:v8];
  }
  return v4;
}

@end