@interface SSPhoneResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (id)bundleId;
- (BOOL)buildButtonItemsAreTrailing;
- (BOOL)isMissedCall;
- (BOOL)isOutgoingCall;
- (BOOL)isVideoCall;
- (BOOL)isVoicemail;
- (NSArray)recipientContactIdentifiers;
- (NSArray)senderContactIdentifiers;
- (NSDate)callDate;
- (NSString)callOrigin;
- (NSString)callSourceApplicationBundleIdentifier;
- (NSString)voicemailTranscription;
- (NSURL)callbackURL;
- (SSPhoneResultBuilder)initWithResult:(id)a3;
- (id)buildAction;
- (id)buildButtonItems;
- (id)buildCommand;
- (id)buildDescriptions;
- (id)buildPreviewButtonItems;
- (id)buildThumbnail;
- (id)buildTitle;
- (id)bundleIdentifierForAppIconBadgeImage;
- (id)contactIdentifiers;
- (unint64_t)numberOfLinesForDescriptions;
- (void)setCallDate:(id)a3;
- (void)setCallOrigin:(id)a3;
- (void)setCallSourceApplicationBundleIdentifier:(id)a3;
- (void)setCallbackURL:(id)a3;
- (void)setIsMissedCall:(BOOL)a3;
- (void)setIsOutgoingCall:(BOOL)a3;
- (void)setIsVideoCall:(BOOL)a3;
- (void)setIsVoicemail:(BOOL)a3;
- (void)setRecipientContactIdentifiers:(id)a3;
- (void)setSenderContactIdentifiers:(id)a3;
- (void)setVoicemailTranscription:(id)a3;
@end

@implementation SSPhoneResultBuilder

+ (id)bundleId
{
  return @"com.apple.mobilephone";
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSPhoneResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SSPhoneResultBuilder;
  v5 = [(SSResultBuilder *)&v23 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F234A0] withType:objc_opt_class()];
    v7 = [v6 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v6;
    }
    else {
      v8 = 0;
    }
    [(SSPhoneResultBuilder *)v5 setRecipientContactIdentifiers:v8];

    v9 = [v4 valueForAttribute:*MEMORY[0x1E4F22B10] withType:objc_opt_class()];
    v10 = [v9 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v9;
    }
    else {
      v11 = 0;
    }
    [(SSPhoneResultBuilder *)v5 setSenderContactIdentifiers:v11];

    v12 = [v4 valueForAttribute:*MEMORY[0x1E4F23218] withType:objc_opt_class()];
    if (v12)
    {
      v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
      [(SSPhoneResultBuilder *)v5 setCallbackURL:v13];
    }
    else
    {
      [(SSPhoneResultBuilder *)v5 setCallbackURL:0];
    }
    v14 = [v4 valueForAttribute:*MEMORY[0x1E4F234D0] withType:objc_opt_class()];
    [(SSPhoneResultBuilder *)v5 setCallSourceApplicationBundleIdentifier:v14];

    v15 = [(SSResultBuilder *)v5 result];
    v16 = [v15 contentType];
    -[SSPhoneResultBuilder setIsVoicemail:](v5, "setIsVoicemail:", [v16 isEqualToString:@"kSpotlightItemTypeVoicemail"]);

    v17 = [v4 valueForAttribute:*MEMORY[0x1E4F23598] withType:objc_opt_class()];
    [(SSPhoneResultBuilder *)v5 setVoicemailTranscription:v17];

    v18 = [v4 valueForAttribute:*MEMORY[0x1E4F22C38] withType:objc_opt_class()];
    [(SSPhoneResultBuilder *)v5 setCallDate:v18];

    v19 = [v4 valueForAttribute:*MEMORY[0x1E4F23220] withType:objc_opt_class()];
    -[SSPhoneResultBuilder setIsMissedCall:](v5, "setIsMissedCall:", [v19 containsString:@"Missed"]);
    -[SSPhoneResultBuilder setIsOutgoingCall:](v5, "setIsOutgoingCall:", [v19 containsString:@"Outgoing"]);
    v20 = [v4 valueForAttribute:*MEMORY[0x1E4F23228] withType:objc_opt_class()];
    -[SSPhoneResultBuilder setIsVideoCall:](v5, "setIsVideoCall:", [v20 isEqualToString:@"Video"]);

    v21 = [v4 valueForAttribute:*MEMORY[0x1E4F22CD0] withType:objc_opt_class()];
    [(SSPhoneResultBuilder *)v5 setCallOrigin:v21];
  }
  return v5;
}

- (id)buildTitle
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SSPhoneResultBuilder *)self voicemailTranscription];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [(SSPhoneResultBuilder *)self voicemailTranscription];
    v6 = [(SSResultBuilder *)self buildHighlightedTextWithString:v5 includeQuotes:1];

    [v6 setMaxLines:2];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SSPhoneResultBuilder;
    v6 = [(SSResultBuilder *)&v12 buildTitle];
    if ([(SSPhoneResultBuilder *)self isMissedCall])
    {
      v7 = objc_opt_new();
      v8 = [v6 text];
      [v7 setText:v8];

      [v7 setTextColor:1];
      v9 = objc_opt_new();

      v13[0] = v7;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [v9 setFormattedTextPieces:v10];

      v6 = v9;
    }
  }
  return v6;
}

- (id)buildDescriptions
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  uint64_t v4 = [(SSPhoneResultBuilder *)self voicemailTranscription];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v18.receiver = self;
    v18.super_class = (Class)SSPhoneResultBuilder;
    v6 = [(SSResultBuilder *)&v18 buildTitle];
    v7 = [v6 text];

    if (![v7 length]) {
      goto LABEL_7;
    }
  }
  else
  {
    v8 = [(SSPhoneResultBuilder *)self callOrigin];
    uint64_t v9 = [v8 length];

    if (!v9) {
      goto LABEL_8;
    }
    v7 = [(SSPhoneResultBuilder *)self callOrigin];
  }
  [v3 addObject:v7];
LABEL_7:

LABEL_8:
  v10 = [(SSPhoneResultBuilder *)self callDate];

  if (v10)
  {
    v11 = [(SSPhoneResultBuilder *)self callDate];
    objc_super v12 = +[SSDateFormatManager dynamicCompactStringFromDate:v11];
    [v3 addObject:v12];
  }
  if ([v3 count])
  {
    v13 = (void *)MEMORY[0x1E4F9A378];
    v14 = [v3 componentsJoinedByString:@" · "];
    v15 = [v13 textWithString:v14];
    v19[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)numberOfLinesForDescriptions
{
  return 1;
}

- (id)buildThumbnail
{
  v3 = objc_opt_new();
  uint64_t v4 = [(SSPhoneResultBuilder *)self contactIdentifiers];
  [v3 setContactIdentifiers:v4];

  [v3 setThreeDTouchEnabled:1];
  return v3;
}

- (id)contactIdentifiers
{
  if ([(SSPhoneResultBuilder *)self isOutgoingCall]) {
    [(SSPhoneResultBuilder *)self recipientContactIdentifiers];
  }
  else {
  v3 = [(SSPhoneResultBuilder *)self senderContactIdentifiers];
  }
  return v3;
}

- (id)bundleIdentifierForAppIconBadgeImage
{
  v2 = [(SSPhoneResultBuilder *)self callSourceApplicationBundleIdentifier];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [(id)objc_opt_class() bundleId];
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)buildAction
{
  return 0;
}

- (id)buildButtonItems
{
  v3 = objc_opt_new();
  if ([(SSPhoneResultBuilder *)self isVoicemail])
  {
    id v4 = objc_opt_new();
    uint64_t v5 = [(SSResultBuilder *)self result];
    v6 = [v5 identifier];
    [v4 setMediaIdentifier:v6];

    [v4 setMediaType:100];
    v7 = objc_opt_new();
    [v7 setMediaMetadata:v4];
    [v3 addObject:v7];
  }
  v8 = [(SSPhoneResultBuilder *)self callbackURL];

  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    v10 = (void *)MEMORY[0x1E4F9A2F8];
    v11 = [(SSPhoneResultBuilder *)self callbackURL];
    objc_super v12 = [v10 punchoutWithURL:v11];
    [v9 setPunchout:v12];

    v13 = objc_opt_new();
    if ([(SSPhoneResultBuilder *)self isVideoCall]) {
      v14 = @"video";
    }
    else {
      v14 = @"phone";
    }
    [v13 setSymbolName:v14];
    [v13 setIsTemplate:1];
    v15 = objc_opt_new();
    [v15 setCommand:v9];
    [v15 setImage:v13];
    [v3 addObject:v15];
  }
  if ([v3 count]) {
    v16 = v3;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  return v17;
}

- (id)buildCommand
{
  v3 = objc_opt_new();
  id v4 = [(SSResultBuilder *)self coreSpotlightId];
  [v3 setCoreSpotlightIdentifier:v4];

  uint64_t v5 = [(SSResultBuilder *)self result];
  v6 = [v5 applicationBundleIdentifier];
  [v3 setApplicationBundleIdentifier:v6];

  return v3;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 1;
}

- (id)buildPreviewButtonItems
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SSPhoneResultBuilder *)self contactIdentifiers];
  if ([v3 count]
    && ([(SSPhoneResultBuilder *)self voicemailTranscription],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        !v5))
  {
    v7 = objc_opt_new();
    v8 = [v3 firstObject];
    [v7 setContactIdentifier:v8];

    uint64_t v9 = (void *)MEMORY[0x1E4F28ED0];
    if ([(SSPhoneResultBuilder *)self isVideoCall]) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 4;
    }
    v11 = [v9 numberWithInt:v10];
    v16[0] = v11;
    objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v7 setActionTypesToShow:v12];

    v15 = v7;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SSPhoneResultBuilder;
    v6 = [(SSResultBuilder *)&v14 buildPreviewButtonItems];
  }

  return v6;
}

- (NSArray)recipientContactIdentifiers
{
  return self->_recipientContactIdentifiers;
}

- (void)setRecipientContactIdentifiers:(id)a3
{
}

- (NSArray)senderContactIdentifiers
{
  return self->_senderContactIdentifiers;
}

- (void)setSenderContactIdentifiers:(id)a3
{
}

- (NSURL)callbackURL
{
  return self->_callbackURL;
}

- (void)setCallbackURL:(id)a3
{
}

- (NSString)callSourceApplicationBundleIdentifier
{
  return self->_callSourceApplicationBundleIdentifier;
}

- (void)setCallSourceApplicationBundleIdentifier:(id)a3
{
}

- (NSDate)callDate
{
  return self->_callDate;
}

- (void)setCallDate:(id)a3
{
}

- (NSString)voicemailTranscription
{
  return self->_voicemailTranscription;
}

- (void)setVoicemailTranscription:(id)a3
{
}

- (NSString)callOrigin
{
  return self->_callOrigin;
}

- (void)setCallOrigin:(id)a3
{
}

- (BOOL)isMissedCall
{
  return self->_isMissedCall;
}

- (void)setIsMissedCall:(BOOL)a3
{
  self->_isMissedCall = a3;
}

- (BOOL)isOutgoingCall
{
  return self->_isOutgoingCall;
}

- (void)setIsOutgoingCall:(BOOL)a3
{
  self->_isOutgoingCall = a3;
}

- (BOOL)isVideoCall
{
  return self->_isVideoCall;
}

- (void)setIsVideoCall:(BOOL)a3
{
  self->_isVideoCall = a3;
}

- (BOOL)isVoicemail
{
  return self->_isVoicemail;
}

- (void)setIsVoicemail:(BOOL)a3
{
  self->_isVoicemail = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOrigin, 0);
  objc_storeStrong((id *)&self->_voicemailTranscription, 0);
  objc_storeStrong((id *)&self->_callDate, 0);
  objc_storeStrong((id *)&self->_callSourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_callbackURL, 0);
  objc_storeStrong((id *)&self->_senderContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_recipientContactIdentifiers, 0);
}

@end