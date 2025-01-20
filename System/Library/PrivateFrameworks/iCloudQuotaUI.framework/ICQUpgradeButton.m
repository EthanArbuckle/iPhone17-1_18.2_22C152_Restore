@interface ICQUpgradeButton
+ (BOOL)shouldShowForOffer:(id)a3;
+ (id)attributedStringWithFormat:(id)a3 attributes:(id)a4 buttonLinkAttributes:(id)a5 links:(id)a6;
+ (id)buttonWithType:(int64_t)a3;
+ (id)spaceArrowAttributedStringWithBaseAttributes:(id)a3;
+ (id)upgradeButton;
- (ICQLink)link;
- (ICQOffer)offer;
- (ICQUpgradeButton)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedDetailedLink;
- (NSAttributedString)attributedDetailedText;
- (id)buttonAttributes;
- (id)buttonLinkAttributes;
- (void)setOffer:(id)a3;
@end

@implementation ICQUpgradeButton

+ (BOOL)shouldShowForOffer:(id)a3
{
  id v3 = a3;
  v4 = [v3 buttonSpecification];
  if (v4) {
    BOOL v5 = [v3 level] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)buttonWithType:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICQUpgradeButton;
  id v3 = objc_msgSendSuper2(&v5, sel_buttonWithType_, 1);
  return v3;
}

+ (id)upgradeButton
{
  return (id)[a1 buttonWithType:1];
}

+ (id)spaceArrowAttributedStringWithBaseAttributes:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F089B8];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 8197);
  v7 = (void *)[v5 initWithString:v6];

  uint64_t v8 = [v7 length];
  v9 = (void *)[objc_alloc(MEMORY[0x263F81678]) initWithData:0 ofType:0];
  v10 = [MEMORY[0x263F827E8] icqBundleImageNamed:@"PresentationRightArrowRed"];
  [v9 setImage:v10];

  v11 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v9];
  [v7 appendAttributedString:v11];

  objc_msgSend(v7, "addAttributes:range:", v4, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x263F814B8], &unk_26E01EE88, v8, objc_msgSend(v7, "length") - v8);
  v12 = (void *)[v7 copy];

  return v12;
}

+ (id)attributedStringWithFormat:(id)a3 attributes:(id)a4 buttonLinkAttributes:(id)a5 links:(id)a6
{
  id v9 = a3;
  id v44 = a4;
  id v43 = a5;
  id v10 = a6;
  uint64_t v11 = [v9 length];
  v45 = objc_opt_new();
  uint64_t v42 = v11;
  uint64_t v12 = [v9 rangeOfString:@"%@", 2, 0, v11 options range];
  uint64_t v14 = v13;
  uint64_t v15 = [v10 count];
  if (v15) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = 0;
  }
  if (v15) {
    uint64_t v17 = v12;
  }
  else {
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v18 = 0;
  if (v16)
  {
    unint64_t v19 = 0;
    v40 = v9;
    v41 = v10;
    do
    {
      v20 = [v10 objectAtIndexedSubscript:v19];
      id v21 = v43;
      id v22 = objc_alloc(MEMORY[0x263F086A0]);
      v23 = objc_msgSend(v9, "substringWithRange:", v18, v17 - v18);
      v24 = (void *)[v22 initWithString:v23 attributes:v44];
      [v45 appendAttributedString:v24];

      v25 = NSString;
      v26 = [v20 text];
      v27 = [v25 stringWithFormat:@"%@", v26];

      v28 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v27 attributes:v21];
      [v45 appendAttributedString:v28];

      if ([v20 options])
      {
        v29 = [a1 spaceArrowAttributedStringWithBaseAttributes:v21];
        [v45 appendAttributedString:v29];
      }
      uint64_t v18 = v17 + v16;
      ++v19;

      id v9 = v40;
      uint64_t v30 = [v40 rangeOfString:@"%@", 2, v17 + v16, v42 - (v17 + v16) options range];
      uint64_t v32 = v31;
      id v10 = v41;
      unint64_t v33 = [v41 count];
      if (v19 >= v33) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = v32;
      }
      if (v19 >= v33) {
        uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v17 = v30;
      }
    }
    while (v16);
  }
  id v34 = objc_alloc(MEMORY[0x263F086A0]);
  v35 = [v9 substringFromIndex:v18];
  v36 = (void *)[v34 initWithString:v35 attributes:v44];
  [v45 appendAttributedString:v36];

  v37 = (void *)[v45 copy];
  return v37;
}

- (ICQUpgradeButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICQUpgradeButton;
  id v3 = -[ICQUpgradeButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x263F88928] sharedOfferManager];
    id v5 = [v4 currentOffer];
    [(ICQUpgradeButton *)v3 setOffer:v5];
  }
  return v3;
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_offer, a3);
  v6 = [v5 buttonSpecification];
  objc_super v7 = [v6 buttonLink];
  uint64_t v8 = v7;
  if ([(ICQLink *)v7 action] == 105)
  {
    id v9 = (void *)MEMORY[0x263F88908];
    id v10 = [(ICQLink *)v7 text];
    uint64_t v11 = [(ICQLink *)v7 options];
    uint64_t v12 = [(ICQLink *)v7 parameters];
    uint64_t v8 = [v9 linkWithText:v10 options:v11 action:3 parameters:v12];
  }
  link = self->_link;
  self->_link = v8;

  uint64_t v14 = [v5 buttonSpecification];
  uint64_t v15 = [v14 buttonFormat];
  if (![(__CFString *)v15 length])
  {

    uint64_t v15 = @"%@";
  }
  if (self->_link)
  {
    uint64_t v16 = [v14 textFormat];

    if (v16)
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = [v14 textFormat];
      unint64_t v19 = [(ICQUpgradeButton *)self buttonAttributes];
      v20 = [(ICQUpgradeButton *)self buttonLinkAttributes];
      v39[0] = self->_link;
      id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
      id v22 = [v17 attributedStringWithFormat:v18 attributes:v19 buttonLinkAttributes:v20 links:v21];
      attributedDetailedText = self->_attributedDetailedText;
      self->_attributedDetailedText = v22;
    }
    if (self->_link)
    {
      v24 = [v14 linkFormat];

      if (v24)
      {
        v36 = objc_opt_class();
        v25 = [v14 linkFormat];
        v26 = [(ICQUpgradeButton *)self buttonAttributes];
        v27 = [(ICQUpgradeButton *)self buttonLinkAttributes];
        v38 = self->_link;
        v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
        v29 = [v36 attributedStringWithFormat:v25 attributes:v26 buttonLinkAttributes:v27 links:v28];
        attributedDetailedLink = self->_attributedDetailedLink;
        self->_attributedDetailedLink = v29;
      }
      if (self->_link)
      {
        uint64_t v31 = objc_opt_class();
        uint64_t v32 = [(ICQUpgradeButton *)self buttonAttributes];
        unint64_t v33 = [(ICQUpgradeButton *)self buttonLinkAttributes];
        v37 = self->_link;
        id v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
        v35 = [v31 attributedStringWithFormat:v15 attributes:v32 buttonLinkAttributes:v33 links:v34];

        [(ICQUpgradeButton *)self setAttributedTitle:v35 forState:0];
      }
    }
  }
}

- (id)buttonAttributes
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = *MEMORY[0x263F814F0];
  v2 = [MEMORY[0x263F81708] systemFontOfSize:11.0 weight:*MEMORY[0x263F81838]];
  v7[0] = v2;
  v6[1] = *MEMORY[0x263F81500];
  id v3 = [MEMORY[0x263F825C8] systemRedColor];
  v7[1] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)buttonLinkAttributes
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = *MEMORY[0x263F814F0];
  v2 = [MEMORY[0x263F81708] systemFontOfSize:11.0 weight:*MEMORY[0x263F81838]];
  v7[0] = v2;
  v6[1] = *MEMORY[0x263F81500];
  id v3 = [MEMORY[0x263F825C8] systemBlueColor];
  v7[1] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (ICQLink)link
{
  return self->_link;
}

- (NSAttributedString)attributedDetailedText
{
  return self->_attributedDetailedText;
}

- (NSAttributedString)attributedDetailedLink
{
  return self->_attributedDetailedLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedDetailedLink, 0);
  objc_storeStrong((id *)&self->_attributedDetailedText, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

@end