@interface ICQDaemonDefaultOffer
+ (id)_mutablePlaceholderPersistanceDictionary;
+ (id)persistenceKey;
- (BOOL)isDefaultOffer;
@end

@implementation ICQDaemonDefaultOffer

+ (id)persistenceKey
{
  return @"_ICQCachedDefaultOfferInternal";
}

+ (id)_mutablePlaceholderPersistanceDictionary
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ICQDaemonDefaultOffer;
  v2 = objc_msgSendSuper2(&v4, sel__mutablePlaceholderPersistanceDictionary);
  [v2 setObject:&unk_1F2DDFF48 forKey:@"isDefaultOffer"];
  return v2;
}

- (BOOL)isDefaultOffer
{
  return 1;
}

@end