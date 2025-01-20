@interface WFSymbolIcon
+ (BOOL)supportsSecureCoding;
+ (id)symbolIconForActionIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (BOOL)hasClearBackground;
- (BOOL)hasTransparentBackground;
- (BOOL)isEqual:(id)a3;
- (NSString)symbolName;
- (WFColor)symbolColor;
- (WFIconBackground)background;
- (WFSymbolIcon)iconWithSymbolColor:(id)a3 background:(id)a4;
- (WFSymbolIcon)initWithCoder:(id)a3;
- (WFSymbolIcon)initWithSymbolName:(id)a3 background:(id)a4;
- (WFSymbolIcon)initWithSymbolName:(id)a3 symbolColor:(id)a4;
- (WFSymbolIcon)initWithSymbolName:(id)a3 symbolColor:(id)a4 background:(id)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSymbolIcon

- (NSString)symbolName
{
  return self->_symbolName;
}

- (WFSymbolIcon)iconWithSymbolColor:(id)a3 background:(id)a4
{
  v6 = (WFIconBackground *)a4;
  v7 = (WFColor *)a3;
  id v8 = objc_alloc((Class)objc_opt_class());
  symbolColor = v7;
  if (!v7) {
    symbolColor = self->_symbolColor;
  }
  background = v6;
  if (!v6) {
    background = self->_background;
  }
  v11 = (void *)[v8 initWithSymbolName:self->_symbolName symbolColor:symbolColor background:background];

  return (WFSymbolIcon *)v11;
}

- (BOOL)hasClearBackground
{
  v2 = [(WFSymbolIcon *)self background];
  v3 = +[WFIconColorBackground clearBackground];
  char v4 = [v2 isEqual:v3];

  return v4;
}

- (WFIconBackground)background
{
  return self->_background;
}

- (WFSymbolIcon)initWithSymbolName:(id)a3 background:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[WFColor whiteColor];
  v9 = [(WFSymbolIcon *)self initWithSymbolName:v7 symbolColor:v8 background:v6];

  return v9;
}

- (WFSymbolIcon)initWithSymbolName:(id)a3 symbolColor:(id)a4 background:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFIcon.m", 114, @"Invalid parameter not satisfying: %@", @"symbolColor" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"WFIcon.m", 113, @"Invalid parameter not satisfying: %@", @"symbolName" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"WFIcon.m", 115, @"Invalid parameter not satisfying: %@", @"background" object file lineNumber description];

LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)WFSymbolIcon;
  v12 = [(WFIcon *)&v20 _init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    symbolName = v12->_symbolName;
    v12->_symbolName = (NSString *)v13;

    objc_storeStrong((id *)&v12->_symbolColor, a4);
    objc_storeStrong((id *)&v12->_background, a5);
    v15 = v12;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_symbolColor, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

- (WFColor)symbolColor
{
  return self->_symbolColor;
}

- (BOOL)hasTransparentBackground
{
  v2 = [(WFSymbolIcon *)self background];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = [v2 color];
    [v3 alpha];
    BOOL v5 = v4 < 1.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  symbolName = self->_symbolName;
  id v5 = a3;
  [v5 encodeObject:symbolName forKey:@"symbolName"];
  [v5 encodeObject:self->_symbolColor forKey:@"symbolColor"];
  [v5 encodeObject:self->_background forKey:@"background"];
}

- (WFSymbolIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"background"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolColor"];

  id v8 = [(WFSymbolIcon *)self initWithSymbolName:v5 symbolColor:v7 background:v6];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WFSymbolIcon *)self symbolName];
      id v6 = [v4 symbolName];
      id v7 = v5;
      id v8 = v6;
      id v9 = v8;
      if (v7 == v8)
      {
      }
      else
      {
        LOBYTE(v10) = 0;
        id v11 = v8;
        id v12 = v7;
        if (!v7 || !v8) {
          goto LABEL_23;
        }
        int v13 = [v7 isEqualToString:v8];

        if (!v13)
        {
          LOBYTE(v10) = 0;
LABEL_24:

          goto LABEL_25;
        }
      }
      v14 = [(WFSymbolIcon *)self symbolColor];
      v15 = [v4 symbolColor];
      id v12 = v14;
      id v16 = v15;
      id v11 = v16;
      if (v12 == v16)
      {
      }
      else
      {
        LOBYTE(v10) = 0;
        v17 = v16;
        id v18 = v12;
        if (!v12 || !v16)
        {
LABEL_22:

LABEL_23:
          goto LABEL_24;
        }
        int v10 = [v12 isEqual:v16];

        if (!v10) {
          goto LABEL_23;
        }
      }
      v19 = [(WFSymbolIcon *)self background];
      objc_super v20 = [v4 background];
      id v18 = v19;
      id v21 = v20;
      v17 = v21;
      if (v18 == v21)
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        LOBYTE(v10) = 0;
        if (v18 && v21) {
          LOBYTE(v10) = [v18 isEqual:v21];
        }
      }

      goto LABEL_22;
    }
  }
  LOBYTE(v10) = 0;
LABEL_25:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_symbolName hash];
  unint64_t v4 = [(WFColor *)self->_symbolColor hash] ^ v3;
  return v4 ^ [(WFIconBackground *)self->_background hash];
}

- (WFSymbolIcon)initWithSymbolName:(id)a3 symbolColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[WFIconColorBackground clearBackground];
  id v9 = [(WFSymbolIcon *)self initWithSymbolName:v7 symbolColor:v6 background:v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)symbolIconForActionIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (symbolIconForActionIdentifier_bundleIdentifier__onceToken != -1) {
    dispatch_once(&symbolIconForActionIdentifier_bundleIdentifier__onceToken, &__block_literal_global_19167);
  }
  id v7 = [(id)symbolIconForActionIdentifier_bundleIdentifier__actionIdentifierMapping objectForKeyedSubscript:v5];
  if (v7
    || ([(id)symbolIconForActionIdentifier_bundleIdentifier__bundleIdentifierMapping objectForKeyedSubscript:v6], (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = +[WFColor tintColorForBundleIdentifier:v6];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = +[WFColor colorWithSystemColor:21];
    }
    id v11 = v10;

    id v12 = [[WFSymbolIcon alloc] initWithSymbolName:v7 symbolColor:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __86__WFSymbolIcon_IconicSymbolUtilities__symbolIconForActionIdentifier_bundleIdentifier___block_invoke()
{
  v7[9] = *MEMORY[0x1E4F143B8];
  v6[0] = @"com.apple.VoiceMemos.ToggleRecording";
  v6[1] = @"com.apple.mobiletimer.INCreateTimerIntent";
  v7[0] = @"waveform";
  v7[1] = @"timer";
  v6[2] = @"com.apple.mobiletimer.CreateAlarmIntent";
  v6[3] = @"com.apple.mobiletimer-framework.MobileTimerIntents.MTCreateAlarmIntent";
  v7[2] = @"alarm.fill";
  v7[3] = @"alarm.fill";
  v6[4] = @"com.apple.TVRemoteUIService.LaunchRemoteIntent";
  v6[5] = @"com.apple.iBooks.OpenBookIntent";
  v7[4] = @"appletvremote.gen4.fill";
  v7[5] = @"book.fill";
  v6[6] = @"com.apple.iBooks.PlayAudiobookIntent";
  v6[7] = @"com.apple.DocumentsApp.ScanDocument";
  v7[6] = @"headphones";
  v7[7] = @"doc.viewfinder.fill";
  v6[8] = @"is.workflow.actions.timer.start";
  v7[8] = @"timer";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:9];
  v1 = (void *)symbolIconForActionIdentifier_bundleIdentifier__actionIdentifierMapping;
  symbolIconForActionIdentifier_bundleIdentifier__actionIdentifierMapping = v0;

  v4[0] = @"com.apple.Pages";
  v4[1] = @"com.apple.Numbers";
  v5[0] = @"apple.pages";
  v5[1] = @"apple.numbers";
  v4[2] = @"com.apple.Keynote";
  v4[3] = @"com.apple.BarcodeScanner";
  v5[2] = @"apple.keynote";
  v5[3] = @"qrcode.viewfinder";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  NSUInteger v3 = (void *)symbolIconForActionIdentifier_bundleIdentifier__bundleIdentifierMapping;
  symbolIconForActionIdentifier_bundleIdentifier__bundleIdentifierMapping = v2;
}

@end