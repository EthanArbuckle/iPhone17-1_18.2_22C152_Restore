@interface VUIRentalExpirationLabel
+ (id)_calculateExpirationStringForDate:(id)a3 displayWarningColor:(BOOL *)a4 updateInterval:(int64_t *)a5 locStringPrefix:(id)a6;
+ (id)calculateExpirationStringForDate:(id)a3 updateInterval:(int64_t *)a4 locStringPrefix:(id)a5;
+ (id)labelForRentalExpirationDate:(id)a3 downloadExpirationDate:(id)a4 contentAvailabilityDate:(id)a5 downloadStatus:(unint64_t)a6;
+ (id)labelWithExpirationDate:(id)a3 textLayout:(id)a4 existingLabel:(id)a5 locStringPrefix:(id)a6;
+ (id)labelWithExpirationDate:(id)a3 textLayout:(id)a4 existingLabel:(id)a5 locStringPrefix:(id)a6 forDownload:(BOOL)a7 contentIsAvailable:(BOOL)a8;
+ (id)labelWithExpirationDate:(id)a3 textLayout:(id)a4 existingLabel:(id)a5 locStringPrefix:(id)a6 useWarningColor:(BOOL)a7;
+ (id)labelWithTextLayout:(id)a3 existingLabel:(id)a4 locStringPrefix:(id)a5;
- (BOOL)contentIsAvailable;
- (BOOL)forDownload;
- (BOOL)useWarningColor;
- (NSDate)expirationDate;
- (NSString)locStringPrefix;
- (NSTimer)expiryUpdateTimer;
- (VUIRentalExpirationLabelDelegate)delegate;
- (void)_computeExpirationLabel:(id)a3;
- (void)dealloc;
- (void)invalidateTimer;
- (void)setContentIsAvailable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExpiryUpdateTimer:(id)a3;
- (void)setForDownload:(BOOL)a3;
- (void)setLocStringPrefix:(id)a3;
- (void)setUseWarningColor:(BOOL)a3;
- (void)vui_willMoveToWindow:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation VUIRentalExpirationLabel

+ (id)labelForRentalExpirationDate:(id)a3 downloadExpirationDate:(id)a4 contentAvailabilityDate:(id)a5 downloadStatus:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    if (a6 - 1 >= 2 && ([MEMORY[0x1E4F1C9C8] shouldShowLabelForDownloadExpirationDate:v10] & 1) != 0)
    {
      if (!v9)
      {
        id v17 = v10;
        id v10 = v17;
        if (v11)
        {
          uint64_t v13 = objc_msgSend(v11, "vui_isInThePast") ^ 1;
          uint64_t v12 = 1;
          id v14 = v10;
          goto LABEL_12;
        }
        uint64_t v12 = 1;
        id v14 = v17;
        goto LABEL_11;
      }
      if ([v9 compare:v10] != -1)
      {
        id v10 = v10;
        uint64_t v12 = 0;
        uint64_t v13 = 1;
        id v14 = v10;
LABEL_12:
        v15 = +[VUIRentalExpirationLabel labelWithExpirationDate:v14 textLayout:0 existingLabel:0 locStringPrefix:@"EXPIRATION_LEFT" forDownload:v12 contentIsAvailable:v13];

        goto LABEL_14;
      }
      id v14 = v9;
LABEL_10:
      uint64_t v12 = 0;
LABEL_11:
      uint64_t v13 = 1;
      goto LABEL_12;
    }
  }
  if (v9)
  {
    id v14 = v9;
    id v10 = 0;
    goto LABEL_10;
  }
  id v10 = 0;
  v15 = 0;
LABEL_14:

  return v15;
}

+ (id)labelWithTextLayout:(id)a3 existingLabel:(id)a4 locStringPrefix:(id)a5
{
  v7 = (VUITextLayout *)a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    v7 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v7 setTextStyle:21];
    [(VUITextLayout *)v7 setFontWeight:0];
    id v10 = [MEMORY[0x1E4FB1618] grayColor];
    [(VUITextLayout *)v7 setColor:v10];

    [(VUITextLayout *)v7 setNumberOfLines:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v8;
  }
  else {
    id v11 = 0;
  }
  uint64_t v12 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v7 existingLabel:v11];
  [v12 setLocStringPrefix:v9];
  [v12 setContentIsAvailable:1];

  return v12;
}

+ (id)labelWithExpirationDate:(id)a3 textLayout:(id)a4 existingLabel:(id)a5 locStringPrefix:(id)a6
{
  id v9 = a3;
  id v10 = +[VUIRentalExpirationLabel labelWithTextLayout:a4 existingLabel:a5 locStringPrefix:a6];
  [v10 setUseWarningColor:1];
  [v10 setExpirationDate:v9];

  return v10;
}

+ (id)labelWithExpirationDate:(id)a3 textLayout:(id)a4 existingLabel:(id)a5 locStringPrefix:(id)a6 useWarningColor:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  uint64_t v12 = +[VUIRentalExpirationLabel labelWithTextLayout:a4 existingLabel:a5 locStringPrefix:a6];
  [v12 setUseWarningColor:v7];
  [v12 setExpirationDate:v11];

  return v12;
}

+ (id)labelWithExpirationDate:(id)a3 textLayout:(id)a4 existingLabel:(id)a5 locStringPrefix:(id)a6 forDownload:(BOOL)a7 contentIsAvailable:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = (VUITextLayout *)a4;
  id v15 = a5;
  id v16 = a6;
  if (!v14)
  {
    id v14 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v14 setTextStyle:21];
    [(VUITextLayout *)v14 setFontWeight:0];
    id v17 = [MEMORY[0x1E4FB1618] grayColor];
    [(VUITextLayout *)v14 setColor:v17];

    [(VUITextLayout *)v14 setNumberOfLines:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v18 = v15;
  }
  else {
    id v18 = 0;
  }
  v19 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v14 existingLabel:v18];
  [v19 setLocStringPrefix:v16];
  [v19 setForDownload:v9];
  [v19 setUseWarningColor:1];
  [v19 setContentIsAvailable:v8];
  [v19 setExpirationDate:v13];

  return v19;
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUIRentalExpirationLabel;
  id v4 = a3;
  [(VUIRentalExpirationLabel *)&v5 willMoveToWindow:v4];
  -[VUIRentalExpirationLabel vui_willMoveToWindow:](self, "vui_willMoveToWindow:", v4, v5.receiver, v5.super_class);
}

- (void)vui_willMoveToWindow:(id)a3
{
  if (a3) {
    -[VUIRentalExpirationLabel _computeExpirationLabel:](self, "_computeExpirationLabel:");
  }
  else {
    [(VUIRentalExpirationLabel *)self invalidateTimer];
  }
}

- (void)dealloc
{
  [(VUIRentalExpirationLabel *)self invalidateTimer];
  v3.receiver = self;
  v3.super_class = (Class)VUIRentalExpirationLabel;
  [(VUILabel *)&v3 dealloc];
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
  id v4 = [(VUIRentalExpirationLabel *)self window];
  [(VUIRentalExpirationLabel *)self _computeExpirationLabel:v4];
}

- (void)invalidateTimer
{
  [(NSTimer *)self->_expiryUpdateTimer invalidate];
  expiryUpdateTimer = self->_expiryUpdateTimer;
  self->_expiryUpdateTimer = 0;
}

- (void)_computeExpirationLabel:(id)a3
{
  id v4 = a3;
  if (!self->_expirationDate)
  {
    [(NSTimer *)self->_expiryUpdateTimer invalidate];
    expiryUpdateTimer = self->_expiryUpdateTimer;
    self->_expiryUpdateTimer = 0;

    goto LABEL_20;
  }
  char v33 = 0;
  uint64_t v32 = 0;
  if (self->_contentIsAvailable)
  {
    objc_super v5 = [(id)objc_opt_class() _calculateExpirationStringForDate:self->_expirationDate displayWarningColor:&v33 updateInterval:&v32 locStringPrefix:self->_locStringPrefix];
    if (self->_forDownload)
    {
      v6 = +[VUILocalizationManager sharedInstance];
      BOOL v7 = [v6 localizedStringForKey:@"EXPIRED"];
      int v8 = [v5 isEqualToString:v7];

      if (v8)
      {
        BOOL v9 = +[VUILocalizationManager sharedInstance];
        uint64_t v10 = [v9 localizedStringForKey:@"RENEW"];

        objc_super v5 = (void *)v10;
      }
    }
  }
  else
  {
    uint64_t v12 = +[VUILocalizationManager sharedInstance];
    objc_super v5 = [v12 localizedStringForKey:@"NOT_AVAILABLE"];

    char v33 = 1;
  }
  id v13 = [(VUILabel *)self textLayout];
  id v14 = v13;
  if (v33 && self->_useWarningColor)
  {
    id v15 = [MEMORY[0x1E4FB1618] redColor];
    [v14 setColor:v15];

    uint64_t v16 = [MEMORY[0x1E4FB1618] redColor];
  }
  else
  {
    id v17 = [v13 color];

    if (!v17)
    {
      id v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.7];
      [v14 setColor:v18];
    }
    v19 = [v14 darkColor];

    if (v19) {
      goto LABEL_16;
    }
    uint64_t v16 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.7];
  }
  v20 = (void *)v16;
  [v14 setDarkColor:v16];

LABEL_16:
  v21 = [v14 attributedStringWithString:v5 view:self];
  [(VUILabel *)self setVuiAttributedText:v21];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained rentalExpirationLabelNeedsRelayout:self];

  if (v4 && v32 >= 1)
  {
    objc_initWeak(&location, self);
    [(NSTimer *)self->_expiryUpdateTimer invalidate];
    v23 = [MEMORY[0x1E4F28ED0] numberWithInteger:v32];
    v24 = (void *)MEMORY[0x1E4F1CB00];
    [v23 doubleValue];
    double v26 = v25;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __52__VUIRentalExpirationLabel__computeExpirationLabel___block_invoke;
    v29[3] = &unk_1E6DF66E0;
    objc_copyWeak(&v30, &location);
    v27 = [v24 scheduledTimerWithTimeInterval:0 repeats:v29 block:v26];
    v28 = self->_expiryUpdateTimer;
    self->_expiryUpdateTimer = v27;

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

LABEL_20:
}

void __52__VUIRentalExpirationLabel__computeExpirationLabel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained window];
  [WeakRetained _computeExpirationLabel:v1];
}

+ (id)calculateExpirationStringForDate:(id)a3 updateInterval:(int64_t *)a4 locStringPrefix:(id)a5
{
  char v11 = 0;
  id v7 = a5;
  id v8 = a3;
  BOOL v9 = [(id)objc_opt_class() _calculateExpirationStringForDate:v8 displayWarningColor:&v11 updateInterval:a4 locStringPrefix:v7];

  return v9;
}

+ (id)_calculateExpirationStringForDate:(id)a3 displayWarningColor:(BOOL *)a4 updateInterval:(int64_t *)a5 locStringPrefix:(id)a6
{
  BOOL v9 = (__CFString *)a6;
  uint64_t v10 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v11 = a3;
  id v12 = [v10 alloc];
  id v13 = (void *)[v12 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v14 = [MEMORY[0x1E4F1C9C8] date];
  id v15 = [v13 components:240 fromDate:v14 toDate:v11 options:0];

  uint64_t v16 = [v15 day];
  uint64_t v17 = [v15 hour];
  uint64_t v18 = [v15 minute];
  uint64_t v19 = [v15 second];
  v20 = @"COUNT";
  if (v9) {
    v20 = v9;
  }
  v38 = v20;
  [v11 timeIntervalSinceNow];
  double v22 = v21;

  if (v22 > 0.0)
  {
    if (v16 >= 2)
    {
      v37 = a5;
      uint64_t v23 = v19 + 5;
      if ((unint64_t)v16 >= 6) {
        uint64_t v23 = 0;
      }
      int64_t v24 = 3600 * v17 + 60 * v18 + v23;
      if (v17 <= 0 && v18 <= 0 && v19 <= 0) {
        uint64_t v18 = v16;
      }
      else {
        uint64_t v18 = v16 + 1;
      }
      v27 = @"_DAYS";
      goto LABEL_27;
    }
    if (v16 != 1 && v17 <= 0)
    {
      if (v18 >= 1)
      {
        v37 = a5;
        int64_t v24 = v19 + 5;
        v27 = @"_MINUTES";
        goto LABEL_27;
      }
      if (v19 >= 1)
      {
        v36 = +[VUILocalizationManager sharedInstance];
        v29 = [v36 localizedStringForKey:@"EXPIRES_LESS_THAN_ONE_MIN"];

        int64_t v24 = v19 + 5;
        goto LABEL_28;
      }
      int64_t v24 = 0;
    }
    else
    {
      int64_t v24 = v19 + 60 * v18 + 5;
      if (v17 + 24 * v16)
      {
        v37 = a5;
        v27 = @"_HOURS";
        uint64_t v18 = v17 + 24 * v16;
LABEL_27:
        v31 = [(__CFString *)v38 stringByAppendingString:v27];
        uint64_t v32 = NSString;
        char v33 = +[VUILocalizationManager sharedInstance];
        v34 = [v33 localizedStringForKey:v31];
        v29 = objc_msgSend(v32, "stringWithValidatedFormat:validFormatSpecifiers:error:", v34, @"%d", 0, v18);

        a5 = v37;
LABEL_28:
        if (a4 && !*a4 && v16 <= 4) {
          goto LABEL_31;
        }
        goto LABEL_32;
      }
    }
    v29 = 0;
    goto LABEL_28;
  }
  v28 = +[VUILocalizationManager sharedInstance];
  v29 = [v28 localizedStringForKey:@"EXPIRED"];

  int64_t v24 = 0;
  if (a4) {
LABEL_31:
  }
    *a4 = 1;
LABEL_32:
  if (a5) {
    *a5 = v24;
  }

  return v29;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (VUIRentalExpirationLabelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIRentalExpirationLabelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)locStringPrefix
{
  return self->_locStringPrefix;
}

- (void)setLocStringPrefix:(id)a3
{
}

- (NSTimer)expiryUpdateTimer
{
  return self->_expiryUpdateTimer;
}

- (void)setExpiryUpdateTimer:(id)a3
{
}

- (BOOL)contentIsAvailable
{
  return self->_contentIsAvailable;
}

- (void)setContentIsAvailable:(BOOL)a3
{
  self->_contentIsAvailable = a3;
}

- (BOOL)forDownload
{
  return self->_forDownload;
}

- (void)setForDownload:(BOOL)a3
{
  self->_forDownload = a3;
}

- (BOOL)useWarningColor
{
  return self->_useWarningColor;
}

- (void)setUseWarningColor:(BOOL)a3
{
  self->_useWarningColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryUpdateTimer, 0);
  objc_storeStrong((id *)&self->_locStringPrefix, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end