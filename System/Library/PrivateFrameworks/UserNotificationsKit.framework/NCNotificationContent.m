@interface NCNotificationContent
- (BOOL)isAirDrop;
- (BOOL)isCallType;
- (BOOL)isCommunicationType;
- (BOOL)isDateAllDay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMessagingType;
- (NCNotificationContent)initWithNotificationContent:(id)a3;
- (NSArray)carPlayIcons;
- (NSArray)fullScreenIcons;
- (NSArray)icons;
- (NSAttributedString)attributedMessage;
- (NSAttributedString)summary;
- (NSAttributedString)threadSummary;
- (NSDate)date;
- (NSString)categorySummaryFormat;
- (NSString)contentType;
- (NSString)customHeader;
- (NSString)debugDescription;
- (NSString)defaultHeader;
- (NSString)footer;
- (NSString)header;
- (NSString)hiddenPreviewsBodyPlaceholder;
- (NSString)message;
- (NSString)spotlightIdentifier;
- (NSString)subtitle;
- (NSString)summaryArgument;
- (NSString)title;
- (NSString)topic;
- (NSTimeZone)timeZone;
- (UIImage)attachmentImage;
- (_UNNotificationCommunicationContext)communicationContext;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unint64_t)summaryArgumentCount;
@end

@implementation NCNotificationContent

- (NCNotificationContent)initWithNotificationContent:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)NCNotificationContent;
  v5 = [(NCNotificationContent *)&v58 init];
  if (v5)
  {
    v6 = [v4 contentType];
    uint64_t v7 = [v6 copy];
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v7;

    v9 = [v4 customHeader];
    uint64_t v10 = [v9 copy];
    customHeader = v5->_customHeader;
    v5->_customHeader = (NSString *)v10;

    v12 = [v4 defaultHeader];
    uint64_t v13 = [v12 copy];
    defaultHeader = v5->_defaultHeader;
    v5->_defaultHeader = (NSString *)v13;

    v15 = [v4 title];
    uint64_t v16 = [v15 copy];
    title = v5->_title;
    v5->_title = (NSString *)v16;

    v18 = [v4 subtitle];
    uint64_t v19 = [v18 copy];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v19;

    v21 = [v4 attributedMessage];
    uint64_t v22 = [v21 copy];
    attributedMessage = v5->_attributedMessage;
    v5->_attributedMessage = (NSAttributedString *)v22;

    v24 = [v4 summary];
    uint64_t v25 = [v24 copy];
    summary = v5->_summary;
    v5->_summary = (NSAttributedString *)v25;

    v27 = [v4 threadSummary];
    uint64_t v28 = [v27 copy];
    threadSummary = v5->_threadSummary;
    v5->_threadSummary = (NSAttributedString *)v28;

    v30 = [v4 spotlightIdentifier];
    uint64_t v31 = [v30 copy];
    spotlightIdentifier = v5->_spotlightIdentifier;
    v5->_spotlightIdentifier = (NSString *)v31;

    v33 = [v4 footer];
    uint64_t v34 = [v33 copy];
    footer = v5->_footer;
    v5->_footer = (NSString *)v34;

    v36 = [v4 hiddenPreviewsBodyPlaceholder];
    uint64_t v37 = [v36 copy];
    hiddenPreviewsBodyPlaceholder = v5->_hiddenPreviewsBodyPlaceholder;
    v5->_hiddenPreviewsBodyPlaceholder = (NSString *)v37;

    v39 = [v4 categorySummaryFormat];
    uint64_t v40 = [v39 copy];
    categorySummaryFormat = v5->_categorySummaryFormat;
    v5->_categorySummaryFormat = (NSString *)v40;

    v42 = [v4 communicationContext];
    uint64_t v43 = [v42 copy];
    communicationContext = v5->_communicationContext;
    v5->_communicationContext = (_UNNotificationCommunicationContext *)v43;

    uint64_t v45 = [v4 icons];
    icons = v5->_icons;
    v5->_icons = (NSArray *)v45;

    uint64_t v47 = [v4 carPlayIcons];
    carPlayIcons = v5->_carPlayIcons;
    v5->_carPlayIcons = (NSArray *)v47;

    uint64_t v49 = [v4 fullScreenIcons];
    fullScreenIcons = v5->_fullScreenIcons;
    v5->_fullScreenIcons = (NSArray *)v49;

    uint64_t v51 = [v4 attachmentImage];
    attachmentImage = v5->_attachmentImage;
    v5->_attachmentImage = (UIImage *)v51;

    uint64_t v53 = [v4 date];
    date = v5->_date;
    v5->_date = (NSDate *)v53;

    v5->_dateAllDay = [v4 isDateAllDay];
    uint64_t v55 = [v4 timeZone];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v55;
  }
  return v5;
}

- (NSString)message
{
  return [(NSAttributedString *)self->_attributedMessage string];
}

- (BOOL)isMessagingType
{
  v3 = [(NCNotificationContent *)self contentType];
  if ([v3 isEqualToString:*MEMORY[0x263F1E128]])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(NCNotificationContent *)self contentType];
    char v4 = [v5 isEqualToString:*MEMORY[0x263F1E130]];
  }
  return v4;
}

- (BOOL)isCallType
{
  v3 = [(NCNotificationContent *)self contentType];
  if ([v3 isEqualToString:*MEMORY[0x263F1E118]])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(NCNotificationContent *)self contentType];
    if ([v5 isEqualToString:*MEMORY[0x263F1E138]])
    {
      char v4 = 1;
    }
    else
    {
      v6 = [(NCNotificationContent *)self contentType];
      if ([v6 isEqualToString:*MEMORY[0x263F1E140]])
      {
        char v4 = 1;
      }
      else
      {
        uint64_t v7 = [(NCNotificationContent *)self contentType];
        char v4 = [v7 isEqualToString:*MEMORY[0x263F1E108]];
      }
    }
  }
  return v4;
}

- (BOOL)isAirDrop
{
  v2 = [(NCNotificationContent *)self contentType];
  char v3 = [v2 isEqualToString:*MEMORY[0x263F1E100]];

  return v3;
}

- (BOOL)isCommunicationType
{
  if ([(NCNotificationContent *)self isMessagingType]
    || [(NCNotificationContent *)self isCallType])
  {
    return 1;
  }

  return [(NCNotificationContent *)self isAirDrop];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = 0;
LABEL_22:
      char v54 = 0;
      goto LABEL_23;
    }
  }
  id v5 = v4;
  if (!v5) {
    goto LABEL_22;
  }
  v6 = [(NCNotificationContent *)self contentType];
  uint64_t v7 = [v5 contentType];
  int v8 = NCIsEqual(v6, v7);

  if (!v8) {
    goto LABEL_22;
  }
  v9 = [(NCNotificationContent *)self customHeader];
  uint64_t v10 = [v5 customHeader];
  int v11 = NCIsEqual(v9, v10);

  if (!v11) {
    goto LABEL_22;
  }
  v12 = [(NCNotificationContent *)self defaultHeader];
  uint64_t v13 = [v5 defaultHeader];
  int v14 = NCIsEqual(v12, v13);

  if (!v14) {
    goto LABEL_22;
  }
  v15 = [(NCNotificationContent *)self title];
  uint64_t v16 = [v5 title];
  int v17 = NCIsEqual(v15, v16);

  if (!v17) {
    goto LABEL_22;
  }
  v18 = [(NCNotificationContent *)self subtitle];
  uint64_t v19 = [v5 subtitle];
  int v20 = NCIsEqual(v18, v19);

  if (!v20) {
    goto LABEL_22;
  }
  v21 = [(NCNotificationContent *)self message];
  uint64_t v22 = [v5 message];
  int v23 = NCIsEqual(v21, v22);

  if (!v23) {
    goto LABEL_22;
  }
  v24 = [(NCNotificationContent *)self attributedMessage];
  uint64_t v25 = [v5 attributedMessage];
  int v26 = NCIsEqual(v24, v25);

  if (!v26) {
    goto LABEL_22;
  }
  v27 = [(NCNotificationContent *)self summary];
  uint64_t v28 = [v5 summary];
  int v29 = NCIsEqual(v27, v28);

  if (!v29) {
    goto LABEL_22;
  }
  v30 = [(NCNotificationContent *)self threadSummary];
  uint64_t v31 = [v5 threadSummary];
  int v32 = NCIsEqual(v30, v31);

  if (!v32) {
    goto LABEL_22;
  }
  v33 = [(NCNotificationContent *)self spotlightIdentifier];
  uint64_t v34 = [v5 spotlightIdentifier];
  int v35 = NCIsEqual(v33, v34);

  if (!v35) {
    goto LABEL_22;
  }
  v36 = [(NCNotificationContent *)self footer];
  uint64_t v37 = [v5 footer];
  int v38 = NCIsEqual(v36, v37);

  if (!v38) {
    goto LABEL_22;
  }
  v39 = [(NCNotificationContent *)self hiddenPreviewsBodyPlaceholder];
  uint64_t v40 = [v5 hiddenPreviewsBodyPlaceholder];
  int v41 = NCIsEqual(v39, v40);

  if (!v41) {
    goto LABEL_22;
  }
  v42 = [(NCNotificationContent *)self categorySummaryFormat];
  uint64_t v43 = [v5 categorySummaryFormat];
  int v44 = NCIsEqual(v42, v43);

  if (!v44) {
    goto LABEL_22;
  }
  uint64_t v45 = [(NCNotificationContent *)self communicationContext];
  v46 = [v5 communicationContext];
  int v47 = NCIsEqual(v45, v46);

  if (!v47) {
    goto LABEL_22;
  }
  v48 = [(NCNotificationContent *)self date];
  uint64_t v49 = [v5 date];
  int v50 = NCIsEqual(v48, v49);

  if (!v50) {
    goto LABEL_22;
  }
  int v51 = [(NCNotificationContent *)self isDateAllDay];
  if (v51 != [v5 isDateAllDay]) {
    goto LABEL_22;
  }
  v52 = [(NCNotificationContent *)self timeZone];
  uint64_t v53 = [v5 timeZone];
  char v54 = NCIsEqual(v52, v53);

LABEL_23:
  return v54;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_contentType hash];
  NSUInteger v4 = [(NSString *)self->_customHeader hash] + v3;
  NSUInteger v5 = [(NSString *)self->_defaultHeader hash];
  NSUInteger v6 = v4 + v5 + [(NSString *)self->_title hash];
  NSUInteger v7 = [(NSString *)self->_subtitle hash];
  NSUInteger v8 = v7 + [(NSAttributedString *)self->_attributedMessage hash];
  NSUInteger v9 = v6 + v8 + [(NSAttributedString *)self->_summary hash];
  uint64_t v10 = [(NSAttributedString *)self->_threadSummary hash];
  NSUInteger v11 = v10 + [(NSString *)self->_spotlightIdentifier hash];
  NSUInteger v12 = v11 + [(NSString *)self->_footer hash];
  NSUInteger v13 = v9 + v12 + [(NSString *)self->_hiddenPreviewsBodyPlaceholder hash];
  NSUInteger v14 = [(NSString *)self->_categorySummaryFormat hash];
  NSUInteger v15 = v14 + [(NSString *)self->_summaryArgument hash] + self->_summaryArgumentCount;
  NSUInteger v16 = v15 + [(_UNNotificationCommunicationContext *)self->_communicationContext hash];
  NSUInteger v17 = v13 + v16 + [(NSDate *)self->_date hash];
  BOOL dateAllDay = self->_dateAllDay;
  return v17 + dateAllDay + [(NSTimeZone *)self->_timeZone hash];
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationContent *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [NCMutableNotificationContent alloc];

  return [(NCNotificationContent *)v4 initWithNotificationContent:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  NSUInteger v3 = [(NCNotificationContent *)self descriptionBuilderWithMultilinePrefix:a3];
  NSUInteger v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  NSUInteger v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  NSUInteger v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__NCNotificationContent_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_264559E60;
  id v7 = v6;
  id v11 = v7;
  NSUInteger v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

void __63__NCNotificationContent_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  NSUInteger v3 = [*(id *)(a1 + 40) contentType];
  id v4 = (id)[v2 appendObject:v3 withName:@"contentType"];

  id v5 = *(void **)(a1 + 32);
  NSUInteger v6 = [*(id *)(a1 + 40) customHeader];
  id v7 = (id)[v5 appendObject:v6 withName:@"customHeader"];

  id v8 = *(void **)(a1 + 32);
  NSUInteger v9 = [*(id *)(a1 + 40) defaultHeader];
  id v10 = (id)[v8 appendObject:v9 withName:@"defaultHeader"];

  id v11 = *(void **)(a1 + 32);
  NSUInteger v12 = [*(id *)(a1 + 40) title];
  id v13 = (id)[v11 appendObject:v12 withName:@"title"];

  NSUInteger v14 = *(void **)(a1 + 32);
  NSUInteger v15 = [*(id *)(a1 + 40) subtitle];
  id v16 = (id)[v14 appendObject:v15 withName:@"subtitle" skipIfNil:1];

  NSUInteger v17 = *(void **)(a1 + 32);
  v18 = [*(id *)(a1 + 40) message];
  id v19 = (id)[v17 appendObject:v18 withName:@"message"];

  int v20 = *(void **)(a1 + 32);
  v21 = [*(id *)(a1 + 40) attributedMessage];
  id v22 = (id)[v20 appendObject:v21 withName:@"attributedMessage"];

  int v23 = *(void **)(a1 + 32);
  v24 = [*(id *)(a1 + 40) summary];
  id v25 = (id)[v23 appendObject:v24 withName:@"summary"];

  int v26 = *(void **)(a1 + 32);
  v27 = [*(id *)(a1 + 40) threadSummary];
  id v28 = (id)[v26 appendObject:v27 withName:@"threadSummary"];

  int v29 = *(void **)(a1 + 32);
  v30 = [*(id *)(a1 + 40) spotlightIdentifier];
  id v31 = (id)[v29 appendObject:v30 withName:@"spotlightIdentifier"];

  int v32 = *(void **)(a1 + 32);
  v33 = [*(id *)(a1 + 40) footer];
  id v34 = (id)[v32 appendObject:v33 withName:@"footer"];

  int v35 = *(void **)(a1 + 32);
  v36 = [*(id *)(a1 + 40) hiddenPreviewsBodyPlaceholder];
  id v37 = (id)[v35 appendObject:v36 withName:@"hiddenPreviewsBodyPlaceholder"];

  int v38 = *(void **)(a1 + 32);
  v39 = [*(id *)(a1 + 40) categorySummaryFormat];
  id v40 = (id)[v38 appendObject:v39 withName:@"categorySummaryFormat"];

  int v41 = *(void **)(a1 + 32);
  v42 = [*(id *)(a1 + 40) summaryArgument];
  id v43 = (id)[v41 appendObject:v42 withName:@"summaryArgument"];

  id v44 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "summaryArgumentCount"), @"summaryArgumentCount");
  uint64_t v45 = *(void **)(a1 + 32);
  v46 = [*(id *)(a1 + 40) communicationContext];
  id v47 = (id)[v45 appendObject:v46 withName:@"communicationContext" skipIfNil:1];

  v48 = *(void **)(a1 + 32);
  uint64_t v49 = [*(id *)(a1 + 40) icons];
  id v50 = (id)[v48 appendObject:v49 withName:@"icons"];

  int v51 = *(void **)(a1 + 32);
  v52 = [*(id *)(a1 + 40) carPlayIcons];
  id v53 = (id)[v51 appendObject:v52 withName:@"carPlayIcons"];

  char v54 = *(void **)(a1 + 32);
  uint64_t v55 = [*(id *)(a1 + 40) fullScreenIcons];
  id v56 = (id)[v54 appendObject:v55 withName:@"fullScreenIcons"];

  v57 = *(void **)(a1 + 32);
  objc_super v58 = [*(id *)(a1 + 40) attachmentImage];
  id v59 = (id)[v57 appendObject:v58 withName:@"attachmentImage"];

  v60 = *(void **)(a1 + 32);
  v61 = [*(id *)(a1 + 40) date];
  id v62 = (id)[v60 appendObject:v61 withName:@"date"];

  id v63 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isDateAllDay"), @"isDateAllDay");
  v64 = *(void **)(a1 + 32);
  id v66 = [*(id *)(a1 + 40) timeZone];
  id v65 = (id)[v64 appendObject:v66 withName:@"timeZone"];
}

- (id)succinctDescription
{
  v2 = [(NCNotificationContent *)self succinctDescriptionBuilder];
  NSUInteger v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  NSUInteger v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(NCNotificationContent *)self date];
  id v5 = (id)[v3 appendObject:v4 withName:@"date"];

  return v3;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSString)customHeader
{
  return self->_customHeader;
}

- (NSString)defaultHeader
{
  return self->_defaultHeader;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSAttributedString)attributedMessage
{
  return self->_attributedMessage;
}

- (NSAttributedString)summary
{
  return self->_summary;
}

- (NSAttributedString)threadSummary
{
  return self->_threadSummary;
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (NSString)footer
{
  return self->_footer;
}

- (NSString)hiddenPreviewsBodyPlaceholder
{
  return self->_hiddenPreviewsBodyPlaceholder;
}

- (NSString)categorySummaryFormat
{
  return self->_categorySummaryFormat;
}

- (_UNNotificationCommunicationContext)communicationContext
{
  return self->_communicationContext;
}

- (NSArray)icons
{
  return self->_icons;
}

- (NSArray)carPlayIcons
{
  return self->_carPlayIcons;
}

- (NSArray)fullScreenIcons
{
  return self->_fullScreenIcons;
}

- (UIImage)attachmentImage
{
  return self->_attachmentImage;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isDateAllDay
{
  return self->_dateAllDay;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)topic
{
  return self->_topic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_attachmentImage, 0);
  objc_storeStrong((id *)&self->_fullScreenIcons, 0);
  objc_storeStrong((id *)&self->_carPlayIcons, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_communicationContext, 0);
  objc_storeStrong((id *)&self->_summaryArgument, 0);
  objc_storeStrong((id *)&self->_categorySummaryFormat, 0);
  objc_storeStrong((id *)&self->_hiddenPreviewsBodyPlaceholder, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_threadSummary, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_defaultHeader, 0);
  objc_storeStrong((id *)&self->_customHeader, 0);

  objc_storeStrong((id *)&self->_contentType, 0);
}

- (NSString)header
{
  NSUInteger v3 = [(NSString *)self->_customHeader length];
  uint64_t v4 = 16;
  if (!v3) {
    uint64_t v4 = 24;
  }
  id v5 = *(Class *)((char *)&self->super.isa + v4);

  return (NSString *)v5;
}

- (NSString)summaryArgument
{
  return self->_summaryArgument;
}

- (unint64_t)summaryArgumentCount
{
  return self->_summaryArgumentCount;
}

@end