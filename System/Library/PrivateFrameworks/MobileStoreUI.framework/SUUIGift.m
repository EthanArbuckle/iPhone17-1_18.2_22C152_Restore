@interface SUUIGift
- (NSArray)recipientAddresses;
- (NSDate)deliveryDate;
- (NSString)giftAmountString;
- (NSString)message;
- (NSString)senderEmailAddress;
- (NSString)senderName;
- (NSString)totalGiftAmountString;
- (SUUIGift)initWithGiftCategory:(int64_t)a3;
- (SUUIGift)initWithItem:(id)a3;
- (SUUIGiftTheme)theme;
- (SUUIItem)item;
- (id)HTTPBodyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)giftAmount;
- (int64_t)giftCategory;
- (void)reset;
- (void)setDeliveryDate:(id)a3;
- (void)setGiftAmount:(int64_t)a3;
- (void)setGiftAmountString:(id)a3;
- (void)setMessage:(id)a3;
- (void)setRecipientAddresses:(id)a3;
- (void)setSenderEmailAddress:(id)a3;
- (void)setSenderName:(id)a3;
- (void)setTheme:(id)a3;
- (void)setTotalGiftAmountString:(id)a3;
@end

@implementation SUUIGift

- (SUUIGift)initWithGiftCategory:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIGift;
  result = [(SUUIGift *)&v5 init];
  if (result) {
    result->_category = a3;
  }
  return result;
}

- (SUUIGift)initWithItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIGift;
  v6 = [(SUUIGift *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

- (id)HTTPBodyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(SUUIGift *)self deliveryDate];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F08790]);
    [v5 setDateFormat:@"yyyy-MM-dd"];
    v6 = [v5 stringFromDate:v4];
    [v3 setObject:v6 forKey:@"customSendGiftDate"];

    [v3 setObject:@"custom" forKey:@"dateSendType"];
  }
  else
  {
    [v3 setObject:@"today" forKey:@"dateSendType"];
  }
  v7 = [(SUUIGift *)self item];
  v8 = v7;
  if (v7)
  {
    objc_super v9 = [v7 primaryItemOffer];
    v10 = [v9 actionParameters];

    if (v10) {
      [v3 setObject:v10 forKey:@"actionParams"];
    }
    [v3 setObject:@"product" forKey:@"giftType"];
  }
  else
  {
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[SUUIGift giftAmount](self, "giftAmount"));
    [v3 setObject:v11 forKey:@"amount"];

    [v3 setObject:@"credit" forKey:@"giftType"];
  }
  v12 = [(SUUIGift *)self message];
  if ([v12 length]) {
    [v3 setObject:v12 forKey:@"message"];
  }
  v13 = [(SUUIGift *)self recipientAddresses];
  if ([v13 count])
  {
    v14 = [v13 componentsJoinedByString:@","];
    [v3 setObject:v14 forKey:@"toEmail"];
  }
  v15 = [(SUUIGift *)self senderEmailAddress];
  if (v15) {
    [v3 setObject:v15 forKey:@"senderEmail"];
  }
  v16 = [(SUUIGift *)self senderName];
  if (v16) {
    [v3 setObject:v16 forKey:@"fromName"];
  }
  theme = self->_theme;
  if (theme)
  {
    v18 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SUUIGiftTheme themeIdentifier](theme, "themeIdentifier"));
    [v3 setObject:v18 forKey:@"fcAdamId"];
  }
  v19 = [MEMORY[0x263F89480] sharedInstance];
  v20 = [v19 guid];

  if (v20) {
    [v3 setObject:v20 forKey:@"guid"];
  }

  return v3;
}

- (void)reset
{
  deliveryDate = self->_deliveryDate;
  self->_deliveryDate = 0;

  giftAmountString = self->_giftAmountString;
  self->_giftAmount = 0;
  self->_giftAmountString = 0;

  message = self->_message;
  self->_message = 0;

  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = 0;

  theme = self->_theme;
  self->_theme = 0;

  totalGiftAmountString = self->_totalGiftAmountString;
  self->_totalGiftAmountString = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = self->_category;
  uint64_t v6 = [(NSDate *)self->_deliveryDate copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(void *)(v5 + 24) = self->_giftAmount;
  uint64_t v8 = [(NSString *)self->_giftAmountString copyWithZone:a3];
  objc_super v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  objc_storeStrong((id *)(v5 + 40), self->_item);
  uint64_t v10 = [(NSString *)self->_message copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSArray *)self->_recipientAddresses copyWithZone:a3];
  v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  uint64_t v14 = [(NSString *)self->_senderEmailAddress copyWithZone:a3];
  v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  uint64_t v16 = [(NSString *)self->_senderName copyWithZone:a3];
  v17 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v16;

  id v18 = [(SUUIGiftTheme *)self->_theme copyWithZone:a3];
  v19 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v18;

  uint64_t v20 = [(NSString *)self->_totalGiftAmountString copyWithZone:a3];
  v21 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v20;

  return (id)v5;
}

- (NSDate)deliveryDate
{
  return self->_deliveryDate;
}

- (void)setDeliveryDate:(id)a3
{
}

- (int64_t)giftAmount
{
  return self->_giftAmount;
}

- (void)setGiftAmount:(int64_t)a3
{
  self->_giftAmount = a3;
}

- (NSString)giftAmountString
{
  return self->_giftAmountString;
}

- (void)setGiftAmountString:(id)a3
{
}

- (int64_t)giftCategory
{
  return self->_category;
}

- (SUUIItem)item
{
  return self->_item;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSArray)recipientAddresses
{
  return self->_recipientAddresses;
}

- (void)setRecipientAddresses:(id)a3
{
}

- (NSString)senderEmailAddress
{
  return self->_senderEmailAddress;
}

- (void)setSenderEmailAddress:(id)a3
{
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
}

- (SUUIGiftTheme)theme
{
  return self->_theme;
}

- (void)setTheme:(id)a3
{
}

- (NSString)totalGiftAmountString
{
  return self->_totalGiftAmountString;
}

- (void)setTotalGiftAmountString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalGiftAmountString, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_senderEmailAddress, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_giftAmountString, 0);
  objc_storeStrong((id *)&self->_deliveryDate, 0);
}

@end