@interface SSPersonalAnswerResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
+ (id)bundleId;
- (BOOL)buildButtonItemsAreTrailing;
- (BOOL)isFlight;
- (BOOL)isHotel;
- (BOOL)isRestaurant;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)displayName;
- (NSString)titleString;
- (SSPersonalAnswerResultBuilder)initWithResult:(id)a3;
- (id)buildAction;
- (id)buildBadgingImageWithThumbnail:(id)a3;
- (id)buildButtonItems;
- (id)buildDescriptions;
- (id)buildInlineCardSections;
- (id)buildThumbnail;
- (id)buildTitle;
- (id)processRawTitleString:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setIsFlight:(BOOL)a3;
- (void)setIsHotel:(BOOL)a3;
- (void)setIsRestaurant:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setTitleString:(id)a3;
@end

@implementation SSPersonalAnswerResultBuilder

+ (id)bundleId
{
  return @"com.apple.spotlight.events";
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (BOOL)supportsResult:(id)a3
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SSPersonalAnswerResultBuilder;
  if (objc_msgSendSuper2(&v8, sel_supportsResult_, v4))
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v4 applicationBundleIdentifier];
    char v5 = [v6 isEqualToString:@"com.apple.spotlight.events"];
  }
  return v5;
}

- (SSPersonalAnswerResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SSPersonalAnswerResultBuilder;
  char v5 = [(SSResultBuilder *)&v12 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22CE8] withType:objc_opt_class()];
    [(SSPersonalAnswerResultBuilder *)v5 setDisplayName:v6];

    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F23658] withType:objc_opt_class()];
    objc_super v8 = [(SSPersonalAnswerResultBuilder *)v5 processRawTitleString:v7];
    [(SSPersonalAnswerResultBuilder *)v5 setTitleString:v8];

    v9 = [v4 valueForAttribute:*MEMORY[0x1E4F235A8] withType:objc_opt_class()];
    [(SSPersonalAnswerResultBuilder *)v5 setStartDate:v9];

    v10 = [v4 valueForAttribute:*MEMORY[0x1E4F22D58] withType:objc_opt_class()];
    [(SSPersonalAnswerResultBuilder *)v5 setEndDate:v10];
  }
  return v5;
}

- (id)processRawTitleString:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"Flight: "])
  {
    char v5 = [v4 stringByReplacingOccurrencesOfString:@": " withString:@" "];

    [(SSPersonalAnswerResultBuilder *)self setIsFlight:1];
  }
  else if ([v4 hasPrefix:@"Stay: "])
  {
    char v5 = [v4 stringByReplacingOccurrencesOfString:@"Stay: " withString:&stru_1F1824018];

    [(SSPersonalAnswerResultBuilder *)self setIsHotel:1];
  }
  else
  {
    char v5 = v4;
    if ([v4 hasPrefix:@"Reservation: "])
    {
      char v5 = [v4 stringByReplacingOccurrencesOfString:@"Reservation: " withString:&stru_1F1824018];

      [(SSPersonalAnswerResultBuilder *)self setIsRestaurant:1];
    }
  }
  id v6 = v5;

  return v6;
}

- (id)buildInlineCardSections
{
  v4.receiver = self;
  v4.super_class = (Class)SSPersonalAnswerResultBuilder;
  v2 = [(SSResultBuilder *)&v4 buildInlineCardSections];
  return v2;
}

- (id)buildTitle
{
  v3 = [(SSPersonalAnswerResultBuilder *)self displayName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [(SSPersonalAnswerResultBuilder *)self displayName];
    goto LABEL_5;
  }
  id v6 = [(SSPersonalAnswerResultBuilder *)self titleString];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v5 = [(SSPersonalAnswerResultBuilder *)self titleString];
LABEL_5:
    objc_super v8 = (void *)v5;
    if (v5) {
      goto LABEL_6;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  objc_super v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v8 = [v12 localizedStringForKey:@"NO_TITLE" value:&stru_1F1824018 table:@"SpotlightServices"];

  if (!v8) {
    goto LABEL_9;
  }
LABEL_6:
  v9 = [MEMORY[0x1E4F9A378] textWithString:v8];
  v10 = [(SSPersonalAnswerResultBuilder *)self displayName];
  uint64_t v11 = [v10 length];

  if (v11) {
    [v9 setMaxLines:2];
  }
LABEL_10:

  return v9;
}

- (id)buildDescriptions
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v3 = [(SSPersonalAnswerResultBuilder *)self displayName];

  if (v3) {
    v3 = self->_titleString;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setDateFormat:@"MMMM d, yyyy"];
  uint64_t v5 = [(SSPersonalAnswerResultBuilder *)self startDate];
  id v6 = [v4 stringFromDate:v5];

  [v4 setDateFormat:@"h:mm a"];
  uint64_t v7 = [(SSPersonalAnswerResultBuilder *)self startDate];
  objc_super v8 = [v4 stringFromDate:v7];

  if ([(SSPersonalAnswerResultBuilder *)self isFlight])
  {
    v9 = [(SSPersonalAnswerResultBuilder *)self endDate];
    v10 = [v4 stringFromDate:v9];

    uint64_t v11 = [NSString stringWithFormat:@"%@ to %@", v8, v10];
  }
  else
  {
    uint64_t v11 = [NSString stringWithFormat:@"Check in at %@", v8];
  }
  objc_super v12 = [MEMORY[0x1E4F9A378] textWithString:v3];
  v17[0] = v12;
  v13 = [MEMORY[0x1E4F9A378] textWithString:v6];
  v17[1] = v13;
  v14 = [MEMORY[0x1E4F9A378] textWithString:v11];
  v17[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];

  return v15;
}

- (id)buildThumbnail
{
  v3 = objc_opt_new();
  if ([(SSPersonalAnswerResultBuilder *)self isFlight])
  {
    id v4 = @"airplane.circle.fill";
  }
  else if ([(SSPersonalAnswerResultBuilder *)self isHotel])
  {
    id v4 = @"bed.double.circle.fill";
  }
  else
  {
    if (![(SSPersonalAnswerResultBuilder *)self isRestaurant]) {
      goto LABEL_8;
    }
    id v4 = @"fork.knife.circle.fill";
  }
  [v3 setSymbolName:v4];
LABEL_8:
  [v3 setPrimaryColor:4];
  return v3;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  v3 = objc_opt_new();
  [v3 setSymbolName:@"envelope.fill"];
  [v3 setPrimaryColor:7];
  return v3;
}

- (id)buildAction
{
  return 0;
}

- (id)buildButtonItems
{
  return 0;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 1;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (BOOL)isFlight
{
  return self->_isFlight;
}

- (void)setIsFlight:(BOOL)a3
{
  self->_isFlight = a3;
}

- (BOOL)isHotel
{
  return self->_isHotel;
}

- (void)setIsHotel:(BOOL)a3
{
  self->_isHotel = a3;
}

- (BOOL)isRestaurant
{
  return self->_isRestaurant;
}

- (void)setIsRestaurant:(BOOL)a3
{
  self->_isRestaurant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end