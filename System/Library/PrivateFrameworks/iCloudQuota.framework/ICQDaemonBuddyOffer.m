@interface ICQDaemonBuddyOffer
+ (id)_mutablePlaceholderPersistanceDictionary;
+ (id)persistenceKey;
@end

@implementation ICQDaemonBuddyOffer

+ (id)_mutablePlaceholderPersistanceDictionary
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ICQDaemonBuddyOffer;
  v2 = objc_msgSendSuper2(&v4, sel__mutablePlaceholderPersistanceDictionary);
  [v2 setObject:&unk_1F2DE05F0 forKey:@"isBuddyOffer"];
  return v2;
}

+ (id)persistenceKey
{
  return @"_ICQCachedBuddyOfferInternal";
}

@end