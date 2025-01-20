@interface SUScriptDeviceOffer
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (AMSDeviceOffer)nativeOffer;
- (AMSDeviceOffer)offer;
- (NSNumber)adamId;
- (NSString)description;
- (SUScriptDeviceOffer)initWithDeviceOffer:(id)a3;
- (id)_className;
- (id)isDowngrading;
- (id)isSubscribed;
- (id)scriptAttributeKeys;
- (unint64_t)offerType;
- (void)setAdamId:(id)a3;
- (void)setDescription:(id)a3;
- (void)setDowngrading:(id)a3;
- (void)setOffer:(id)a3;
- (void)setOfferType:(unint64_t)a3;
- (void)setSubscribed:(id)a3;
@end

@implementation SUScriptDeviceOffer

- (SUScriptDeviceOffer)initWithDeviceOffer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUScriptDeviceOffer;
  v6 = [(SUScriptObject *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_offer, a3);
  }

  return v7;
}

- (AMSDeviceOffer)nativeOffer
{
  return self->_offer;
}

- (NSNumber)adamId
{
  v2 = [(SUScriptDeviceOffer *)self offer];
  v3 = [v2 adamId];

  return (NSNumber *)v3;
}

- (id)_className
{
  return @"iTunesDeviceOffer";
}

- (NSString)description
{
  v2 = [(SUScriptDeviceOffer *)self offer];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (id)isDowngrading
{
  v2 = [(SUScriptDeviceOffer *)self offer];
  int v3 = [v2 isDowngrading];
  v4 = (id *)MEMORY[0x263EFFB40];
  if (!v3) {
    v4 = (id *)MEMORY[0x263EFFB38];
  }
  id v5 = *v4;

  return v5;
}

- (id)isSubscribed
{
  v2 = [(SUScriptDeviceOffer *)self offer];
  int v3 = [v2 isSubscribed];
  v4 = (id *)MEMORY[0x263EFFB40];
  if (!v3) {
    v4 = (id *)MEMORY[0x263EFFB38];
  }
  id v5 = *v4;

  return v5;
}

- (unint64_t)offerType
{
  v2 = [(SUScriptDeviceOffer *)self offer];
  unint64_t v3 = [v2 offerType];

  return v3;
}

- (void)setAdamId:(id)a3
{
  unint64_t v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"adamId"];
  [v3 throwException:v4];
}

- (void)setDescription:(id)a3
{
  unint64_t v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"description"];
  [v3 throwException:v4];
}

- (void)setDowngrading:(id)a3
{
  unint64_t v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"downgrading"];
  [v3 throwException:v4];
}

- (void)setOfferType:(unint64_t)a3
{
  unint64_t v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"offerType"];
  [v3 throwException:v4];
}

- (void)setSubscribed:(id)a3
{
  unint64_t v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"subscribed"];
  [v3 throwException:v4];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  id v5 = [(id)__KeyMapping_52 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptDeviceOffer;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptDeviceOffer;
  v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  unint64_t v3 = [(id)__KeyMapping_52 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__KeyMapping_52;
    __KeyMapping_52 = (uint64_t)&unk_26DBD7C38;
  }
}

- (AMSDeviceOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end