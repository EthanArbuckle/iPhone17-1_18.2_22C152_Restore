@interface SUUICountdown
- (BOOL)isFlapped;
- (BOOL)isLoaded;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)numberFormat;
- (NSURL)URL;
- (SUUIArtworkProviding)artworkProvider;
- (SUUIArtworkProviding)endArtworkProvider;
- (SUUICountdown)initWithCountdownDictionary:(id)a3;
- (UIColor)flapBottomColor;
- (UIColor)flapTopColor;
- (UIColor)fontColor;
- (int64_t)finalValue;
- (int64_t)initialValue;
- (int64_t)rate;
- (int64_t)type;
- (unint64_t)dateFormat;
- (void)setArtworkProvider:(id)a3;
- (void)setDateFormat:(unint64_t)a3;
- (void)setEndArtworkProvider:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setFinalValue:(int64_t)a3;
- (void)setFlapBottomColor:(id)a3;
- (void)setFlapTopColor:(id)a3;
- (void)setFlapped:(BOOL)a3;
- (void)setFontColor:(id)a3;
- (void)setInitialValue:(int64_t)a3;
- (void)setNumberFormat:(id)a3;
- (void)setRate:(int64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setURL:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation SUUICountdown

- (SUUICountdown)initWithCountdownDictionary:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SUUICountdown;
  v5 = [(SUUICountdown *)&v43 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_44;
  }
  [(SUUICountdown *)v5 setType:1];
  v7 = [MEMORY[0x263EFF910] date];
  [(SUUICountdown *)v6 setEndDate:v7];

  v8 = [MEMORY[0x263EFF910] date];
  [(SUUICountdown *)v6 setStartDate:v8];

  [(SUUICountdown *)v6 setFlapped:1];
  [(SUUICountdown *)v6 setRate:1];
  v9 = [v4 objectForKey:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v9 isEqualToString:@"number"])
    {
      uint64_t v10 = 0;
    }
    else
    {
      if (![v9 isEqualToString:@"timer"]) {
        goto LABEL_8;
      }
      uint64_t v10 = 1;
    }
    [(SUUICountdown *)v6 setType:v10];
  }
LABEL_8:
  v11 = [v4 objectForKey:@"subType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v11 isEqualToString:@"number"])
    {
      uint64_t v12 = 0;
LABEL_13:
      [(SUUICountdown *)v6 setType:v12];
      goto LABEL_14;
    }
    if ([v11 isEqualToString:@"timer"])
    {
      uint64_t v12 = 1;
      goto LABEL_13;
    }
  }
LABEL_14:
  v13 = [v4 objectForKey:@"endDate"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = objc_alloc_init(MEMORY[0x263F08790]);
    [v14 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    v15 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
    [v14 setTimeZone:v15];

    v16 = [v14 dateFromString:v13];
    if (v16) {
      [(SUUICountdown *)v6 setEndDate:v16];
    }
  }
  v17 = [v4 objectForKey:@"dateFormat"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v18 = [v17 isEqualToString:@"dhms"];
    int v19 = [v17 isEqualToString:@"dhm"];
    int v20 = [v17 isEqualToString:@"hms"];
    if ([v17 isEqualToString:@"hm"] | v20 | v19 | v18) {
      uint64_t v21 = 3;
    }
    else {
      uint64_t v21 = 0;
    }
    [(SUUICountdown *)v6 setDateFormat:v21];
  }
  v22 = [v4 objectForKey:@"numberFormat"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUUICountdown *)v6 setNumberFormat:v22];
  }
  v23 = [v4 objectForKey:@"endValue"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = [(SUUICountdown *)v6 numberFormat];

    if (v24)
    {
      id v25 = objc_alloc_init(MEMORY[0x263F08A30]);
      v26 = [(SUUICountdown *)v6 numberFormat];
      [v25 setPositiveFormat:v26];

      v27 = [v25 numberFromString:v23];
      v28 = v27;
      if (v27) {
        -[SUUICountdown setFinalValue:](v6, "setFinalValue:", [v27 longLongValue]);
      }
    }
  }
  if (![(SUUICountdown *)v6 finalValue] && (objc_opt_respondsToSelector() & 1) != 0) {
    -[SUUICountdown setFinalValue:](v6, "setFinalValue:", [v23 longLongValue]);
  }
  v29 = [v4 objectForKey:@"url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [NSURL URLWithString:v29];
    [(SUUICountdown *)v6 setURL:v30];
  }
  [(SUUICountdown *)v6 updateWithDictionary:v4];
  v31 = [v4 objectForKey:@"fontColor"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = SUUIColorWithHTMLCode(v31);
    [(SUUICountdown *)v6 setFontColor:v32];
  }
  v33 = [v4 objectForKey:@"flapTopColor"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v34 = SUUIColorWithHTMLCode(v33);
    [(SUUICountdown *)v6 setFlapTopColor:v34];
  }
  v35 = [v4 objectForKey:@"flapBottomColor"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36 = SUUIColorWithHTMLCode(v35);
    [(SUUICountdown *)v6 setFlapBottomColor:v36];
  }
  v37 = [v4 objectForKey:@"flapped"];

  if (objc_opt_respondsToSelector()) {
    -[SUUICountdown setFlapped:](v6, "setFlapped:", [v37 BOOLValue]);
  }
  v38 = [v4 objectForKey:@"artwork"];

  v39 = +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:v38];
  [(SUUICountdown *)v6 setArtworkProvider:v39];

  v40 = [v4 objectForKey:@"endArtwork"];

  v41 = +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:v40];
  [(SUUICountdown *)v6 setEndArtworkProvider:v41];

LABEL_44:
  return v6;
}

- (void)updateWithDictionary:(id)a3
{
  id v11 = a3;
  id v4 = [v11 objectForKey:@"value"];
  char v5 = objc_opt_respondsToSelector();
  if (v5) {
    -[SUUICountdown setInitialValue:](self, "setInitialValue:", [v4 longLongValue]);
  }
  v6 = [v11 objectForKey:@"rate"];

  if (objc_opt_respondsToSelector()) {
    -[SUUICountdown setRate:](self, "setRate:", [v6 integerValue]);
  }
  else {
    char v5 = 0;
  }
  v7 = [v11 objectForKey:@"timestamp"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_alloc_init(MEMORY[0x263F08790]);
    [v8 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    v9 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
    [v8 setTimeZone:v9];

    uint64_t v10 = [v8 dateFromString:v7];
    if (v10) {
      [(SUUICountdown *)self setStartDate:v10];
    }
    else {
      char v5 = 0;
    }
  }
  if ((v5 & 1) != 0 && !self->_isLoaded) {
    self->_isLoaded = 1;
  }
}

- (BOOL)isLoaded
{
  return [(SUUICountdown *)self type] || self->_isLoaded;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (unint64_t)dateFormat
{
  return self->_dateFormat;
}

- (void)setDateFormat:(unint64_t)a3
{
  self->_dateFormat = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (int64_t)initialValue
{
  return self->_initialValue;
}

- (void)setInitialValue:(int64_t)a3
{
  self->_initialValue = a3;
}

- (int64_t)finalValue
{
  return self->_finalValue;
}

- (void)setFinalValue:(int64_t)a3
{
  self->_finalValue = a3;
}

- (int64_t)rate
{
  return self->_rate;
}

- (void)setRate:(int64_t)a3
{
  self->_rate = a3;
}

- (NSString)numberFormat
{
  return self->_numberFormat;
}

- (void)setNumberFormat:(id)a3
{
}

- (UIColor)fontColor
{
  return self->_fontColor;
}

- (void)setFontColor:(id)a3
{
}

- (UIColor)flapTopColor
{
  return self->_flapTopColor;
}

- (void)setFlapTopColor:(id)a3
{
}

- (UIColor)flapBottomColor
{
  return self->_flapBottomColor;
}

- (void)setFlapBottomColor:(id)a3
{
}

- (BOOL)isFlapped
{
  return self->_flapped;
}

- (void)setFlapped:(BOOL)a3
{
  self->_flapped = a3;
}

- (SUUIArtworkProviding)artworkProvider
{
  return self->_artworkProvider;
}

- (void)setArtworkProvider:(id)a3
{
}

- (SUUIArtworkProviding)endArtworkProvider
{
  return self->_endArtworkProvider;
}

- (void)setEndArtworkProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endArtworkProvider, 0);
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_flapBottomColor, 0);
  objc_storeStrong((id *)&self->_flapTopColor, 0);
  objc_storeStrong((id *)&self->_fontColor, 0);
  objc_storeStrong((id *)&self->_numberFormat, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end