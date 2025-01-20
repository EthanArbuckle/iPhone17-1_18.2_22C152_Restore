@interface VCInteractionDonation
+ (id)timestampDateFormatter;
- (BOOL)isEqual:(id)a3;
- (INInteraction)interaction;
- (INShortcut)shortcut;
- (NSDate)date;
- (NSString)fullDescription;
- (NSString)identifier;
- (NSString)sourceAppIdentifier;
- (NSString)sourceAppIdentifierForDisplay;
- (NSString)sourceAppIdentifierForLaunching;
- (NSString)subtitle;
- (NSString)suggestedPhrase;
- (NSString)title;
- (VCInteractionDonation)initWithEvent:(id)a3;
- (VCInteractionDonation)initWithIdentifier:(id)a3 sourceAppIdentifier:(id)a4 interaction:(id)a5;
- (id)uniqueProperty;
- (unint64_t)hash;
@end

@implementation VCInteractionDonation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sourceAppIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)sourceAppIdentifier
{
  return self->_sourceAppIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)uniqueProperty
{
  v3 = [(VCInteractionDonation *)self sourceAppIdentifierForDisplay];
  if (v3) {
    [(VCInteractionDonation *)self sourceAppIdentifierForDisplay];
  }
  else {
  v4 = [(VCInteractionDonation *)self sourceAppIdentifier];
  }

  v5 = NSString;
  v6 = [(VCInteractionDonation *)self title];
  v7 = [(VCInteractionDonation *)self subtitle];
  v8 = [v5 stringWithFormat:@"%@-%@-%@", v4, v6, v7];

  return v8;
}

- (NSString)suggestedPhrase
{
  v2 = [(VCInteractionDonation *)self interaction];
  v3 = [v2 intent];
  v4 = [v3 suggestedInvocationPhrase];

  return (NSString *)v4;
}

- (INShortcut)shortcut
{
  id v3 = objc_alloc(MEMORY[0x1E4F30738]);
  v4 = [(VCInteractionDonation *)self interaction];
  v5 = [v4 intent];
  v6 = (void *)[v3 initWithIntent:v5];

  return (INShortcut *)v6;
}

- (NSString)fullDescription
{
  id v3 = [(id)objc_opt_class() timestampDateFormatter];
  v4 = [(VCInteractionDonation *)self date];
  v38 = [v3 stringFromDate:v4];

  v5 = [(VCInteractionDonation *)self interaction];
  v6 = [v5 intent];
  v7 = [v6 backingStore];
  uint64_t v8 = [v7 formattedText];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_1F0C7EBE0;
  }
  v37 = v10;

  v11 = [(VCInteractionDonation *)self interaction];
  v12 = [v11 intentResponse];
  v13 = [v12 backingStore];
  uint64_t v14 = [v13 formattedText];
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = &stru_1F0C7EBE0;
  }
  v33 = v16;

  id v30 = (id)NSString;
  v29 = [(VCInteractionDonation *)self title];
  v36 = [(VCInteractionDonation *)self subtitle];
  v35 = [(VCInteractionDonation *)self interaction];
  v34 = [v35 intent];
  v17 = [v34 _className];
  v26 = [(VCInteractionDonation *)self sourceAppIdentifierForDisplay];
  v18 = [(VCInteractionDonation *)self sourceAppIdentifierForLaunching];
  v32 = [(VCInteractionDonation *)self interaction];
  v28 = [v32 intent];
  v19 = [v28 launchId];
  v27 = [(VCInteractionDonation *)self interaction];
  v20 = [v27 intent];
  v21 = [v20 _nanoLaunchId];
  v22 = [(VCInteractionDonation *)self interaction];
  v23 = [v22 intent];
  v24 = [v23 extensionBundleId];
  id v31 = [v30 stringWithFormat:@"Title: %@\nSubtitle: %@\nType: %@\nBundle Identifier for Display: %@\nBundle Identifier for Launch: %@\nDate: %@\nlaunchId: %@\nnanoLaunchId: %@\nExtension Bundle ID: %@\nIntent:\n%@\nResponse:\n%@", v29, v36, v17, v26, v18, v38, v19, v21, v24, v37, v33];

  return (NSString *)v31;
}

- (NSString)subtitle
{
  id v3 = [(VCInteractionDonation *)self sourceAppIdentifierForDisplay];
  char v4 = [v3 isEqualToString:@"com.apple.mobilenotes"];

  if (v4) {
    v5 = 0;
  }
  else {
    v5 = self->_subtitle;
  }
  return v5;
}

- (NSDate)date
{
  v2 = [(VCInteractionDonation *)self interaction];
  id v3 = [v2 dateInterval];
  char v4 = [v3 startDate];

  return (NSDate *)v4;
}

- (NSString)sourceAppIdentifierForLaunching
{
  v2 = [(VCInteractionDonation *)self interaction];
  id v3 = [v2 intent];
  char v4 = objc_msgSend(v3, "_intents_bundleIdForLaunching");

  return (NSString *)v4;
}

- (NSString)sourceAppIdentifierForDisplay
{
  v2 = [(VCInteractionDonation *)self interaction];
  id v3 = [v2 intent];
  char v4 = objc_msgSend(v3, "_intents_bundleIdForDisplay");

  return (NSString *)v4;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash] ^ 0xBADCA7;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (VCInteractionDonation *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSString *)self->_identifier isEqualToString:v4->_identifier];
  }

  return v5;
}

- (VCInteractionDonation)initWithEvent:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 metadata];
  v6 = [MEMORY[0x1E4F5B550] serializedInteraction];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v17 = 0;
    uint64_t v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v17];
    v9 = v17;
    if (v8)
    {
      v10 = [v4 UUID];
      v11 = [v10 UUIDString];
      v12 = [v4 source];
      v13 = [v12 bundleID];
      self = [(VCInteractionDonation *)self initWithIdentifier:v11 sourceAppIdentifier:v13 interaction:v8];

      uint64_t v14 = self;
    }
    else
    {
      v10 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "-[VCInteractionDonation initWithEvent:]";
        __int16 v20 = 2112;
        id v21 = v4;
        __int16 v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to unarchive interaction data for event: %@, error: %@", buf, 0x20u);
      }
      uint64_t v14 = 0;
    }
  }
  else
  {
    v9 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v4 metadata];
      *(_DWORD *)buf = 136315394;
      v19 = "-[VCInteractionDonation initWithEvent:]";
      __int16 v20 = 2112;
      id v21 = v15;
      _os_log_impl(&dword_1B3C5C000, v9, OS_LOG_TYPE_DEFAULT, "%s Missing interaction data from event.metadata=%@", buf, 0x16u);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (VCInteractionDonation)initWithIdentifier:(id)a3 sourceAppIdentifier:(id)a4 interaction:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_9:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"VCInteractionDonation.m", 44, @"Invalid parameter not satisfying: %@", @"sourceAppIdentifier" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_10:
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"VCInteractionDonation.m", 45, @"Invalid parameter not satisfying: %@", @"interaction" object file lineNumber description];

    goto LABEL_11;
  }
  uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"VCInteractionDonation.m", 43, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v10) {
    goto LABEL_9;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_10;
  }
LABEL_4:
  v12 = 0;
  if (v9 && v10)
  {
    v28.receiver = self;
    v28.super_class = (Class)VCInteractionDonation;
    self = [(VCInteractionDonation *)&v28 init];
    if (self)
    {
      v13 = (NSString *)[v9 copy];
      identifier = self->_identifier;
      self->_identifier = v13;

      v15 = (NSString *)[v10 copy];
      sourceAppIdentifier = self->_sourceAppIdentifier;
      self->_sourceAppIdentifier = v15;

      id v17 = (INInteraction *)[v11 copy];
      interaction = self->_interaction;
      self->_interaction = v17;

      v19 = [(INInteraction *)self->_interaction intent];
      __int16 v20 = [v19 _title];
      title = self->_title;
      self->_title = v20;

      __int16 v22 = [v19 _subtitle];
      subtitle = self->_subtitle;
      self->_subtitle = v22;

      self = self;
      v12 = self;
      goto LABEL_12;
    }
LABEL_11:
    v12 = 0;
  }
LABEL_12:

  return v12;
}

+ (id)timestampDateFormatter
{
  if (timestampDateFormatter_onceToken_15173 != -1) {
    dispatch_once(&timestampDateFormatter_onceToken_15173, &__block_literal_global_15174);
  }
  v2 = (void *)timestampDateFormatter_dateFormatter_15175;
  return v2;
}

uint64_t __47__VCInteractionDonation_timestampDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)timestampDateFormatter_dateFormatter_15175;
  timestampDateFormatter_dateFormatter_15175 = (uint64_t)v0;

  [(id)timestampDateFormatter_dateFormatter_15175 setDateStyle:1];
  v2 = (void *)timestampDateFormatter_dateFormatter_15175;
  return [v2 setTimeStyle:1];
}

@end