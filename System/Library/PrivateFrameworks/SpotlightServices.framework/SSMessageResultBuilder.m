@interface SSMessageResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (id)bundleId;
- (NSArray)attachmentNames;
- (NSArray)attachmentPaths;
- (NSArray)attachmentTypes;
- (NSArray)recipientContactIds;
- (NSArray)recipients;
- (NSArray)senderContactIds;
- (NSArray)senders;
- (NSDate)sendDate;
- (NSString)groupDisplayName;
- (NSString)groupPhotoPath;
- (NSString)message;
- (NSString)messageId;
- (SSMessageResultBuilder)initWithResult:(id)a3;
- (id)buildAttachmentSummary;
- (id)buildAttachmentThumbnail;
- (id)buildCompactCardSection;
- (id)buildDescriptions;
- (id)buildInlineCardSection;
- (id)buildThumbnail;
- (id)buildTitle;
- (void)setAttachmentNames:(id)a3;
- (void)setAttachmentPaths:(id)a3;
- (void)setAttachmentTypes:(id)a3;
- (void)setGroupDisplayName:(id)a3;
- (void)setGroupPhotoPath:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageId:(id)a3;
- (void)setRecipientContactIds:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSendDate:(id)a3;
- (void)setSenderContactIds:(id)a3;
- (void)setSenders:(id)a3;
@end

@implementation SSMessageResultBuilder

+ (id)bundleId
{
  return @"com.apple.MobileSMS";
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSMessageResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SSMessageResultBuilder;
  v5 = [(SSResultBuilder *)&v38 initWithResult:v4];
  v6 = v5;
  if (v5)
  {
    v36 = v5;
    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F22AE0] withType:objc_opt_class()];
    v37 = [v4 valueForAttribute:*MEMORY[0x1E4F22AE8] withType:objc_opt_class()];
    v8 = [v4 valueForAttribute:*MEMORY[0x1E4F22AF0] withType:objc_opt_class()];
    v33 = [v4 valueForAttribute:*MEMORY[0x1E4F22B30] withType:objc_opt_class()];
    v34 = [v4 valueForAttribute:*MEMORY[0x1E4F22B18] withType:objc_opt_class()];
    v32 = [v4 valueForAttribute:*MEMORY[0x1E4F234B0] withType:objc_opt_class()];
    v35 = [v4 valueForAttribute:*MEMORY[0x1E4F22B10] withType:objc_opt_class()];
    v6 = v36;
    v9 = [v4 valueForAttribute:*MEMORY[0x1E4F234A0] withType:objc_opt_class()];
    v10 = [v7 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v7;
    }
    else {
      v11 = 0;
    }
    [(SSMessageResultBuilder *)v36 setAttachmentNames:v11];

    v12 = [v37 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v37;
    }
    else {
      v13 = 0;
    }
    [(SSMessageResultBuilder *)v36 setAttachmentPaths:v13];

    v14 = [v8 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v8;
    }
    else {
      v15 = 0;
    }
    [(SSMessageResultBuilder *)v36 setAttachmentTypes:v15];

    v16 = [v4 valueForAttribute:*MEMORY[0x1E4F22CE8] withType:objc_opt_class()];
    [(SSMessageResultBuilder *)v36 setGroupDisplayName:v16];

    v17 = [v4 valueForAttribute:*MEMORY[0x1E4F22FD8] withType:objc_opt_class()];
    [(SSMessageResultBuilder *)v36 setGroupPhotoPath:v17];

    v18 = [v4 valueForAttribute:*MEMORY[0x1E4F23598] withType:objc_opt_class()];
    [(SSMessageResultBuilder *)v36 setMessage:v18];

    int v19 = isMacOS();
    v20 = (void *)MEMORY[0x1E4F22F38];
    if (!v19) {
      v20 = (void *)MEMORY[0x1E4F23670];
    }
    v21 = [v4 valueForAttribute:*v20 withType:objc_opt_class()];
    [(SSMessageResultBuilder *)v36 setMessageId:v21];

    v22 = [v33 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v23 = v33;
    }
    else {
      v23 = v34;
    }
    [(SSMessageResultBuilder *)v36 setSenders:v23];

    v24 = [v32 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v25 = v32;
    }
    else {
      v25 = 0;
    }
    [(SSMessageResultBuilder *)v36 setRecipients:v25];

    v26 = [v4 valueForAttribute:*MEMORY[0x1E4F22C38] withType:objc_opt_class()];
    [(SSMessageResultBuilder *)v36 setSendDate:v26];

    v27 = [v35 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v28 = v35;
    }
    else {
      v28 = 0;
    }
    [(SSMessageResultBuilder *)v36 setSenderContactIds:v28];

    v29 = [v9 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v30 = v9;
    }
    else {
      v30 = 0;
    }
    [(SSMessageResultBuilder *)v36 setRecipientContactIds:v30];
  }
  return v6;
}

- (id)buildInlineCardSection
{
  v10.receiver = self;
  v10.super_class = (Class)SSMessageResultBuilder;
  v3 = [(SSResultBuilder *)&v10 buildInlineCardSection];
  id v4 = (void *)MEMORY[0x1E4F9A0E0];
  v5 = [(SSMessageResultBuilder *)self sendDate];
  v6 = +[SSDateFormatManager dynamicCompactStringFromDate:v5];
  v7 = [v4 textWithString:v6];
  [v3 setSecondaryTitle:v7];

  [v3 setIsSecondaryTitleDetached:1];
  v8 = [(SSMessageResultBuilder *)self buildAttachmentThumbnail];
  [v3 setTrailingThumbnail:v8];

  return v3;
}

- (id)buildDescriptions
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SSResultBuilder *)self coreSpotlightId];
  int v5 = isMessagesAttachmentCoreSpotlightId(v3, v4);

  if (v5)
  {
    v6 = [(SSMessageResultBuilder *)self attachmentPaths];
    v7 = [v6 firstObject];
    v8 = [v7 lastPathComponent];

    id v9 = v8;
    objc_super v10 = v9;
    if (v9) {
      goto LABEL_12;
    }
  }
  uint64_t v11 = [(SSMessageResultBuilder *)self message];
  if (!v11) {
    goto LABEL_9;
  }
  v12 = (void *)v11;
  v13 = [(SSMessageResultBuilder *)self message];
  v14 = [(SSResultBuilder *)self matchedStrings];
  v15 = [v14 firstObject];
  int v16 = [v13 isEqual:v15];

  if (!v16)
  {
LABEL_9:
    uint64_t v21 = [(SSMessageResultBuilder *)self message];
    if (v21)
    {
      id v9 = (id)v21;
      objc_super v10 = 0;
    }
    else
    {
      id v9 = [(SSMessageResultBuilder *)self buildAttachmentSummary];
      objc_super v10 = 0;
      int v19 = 0;
      v20 = 0;
      if (!v9) {
        goto LABEL_13;
      }
    }
LABEL_12:
    v22 = [MEMORY[0x1E4F9A378] textWithString:v9];
    v25 = v22;
    int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];

    v20 = v9;
    goto LABEL_13;
  }
  v17 = [(SSResultBuilder *)self buildHighlightedMatchedTextWithTitle:0 headTruncation:1];
  v18 = [v17 formattedTextPieces];

  if (!v18)
  {

    goto LABEL_9;
  }
  v26[0] = v17;
  int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];

  if (!v19) {
    goto LABEL_9;
  }
  objc_super v10 = 0;
  v20 = 0;
LABEL_13:
  id v23 = v19;

  return v23;
}

- (id)buildAttachmentSummary
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v61 = objc_opt_new();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v54 = self;
  id v3 = [(SSMessageResultBuilder *)self attachmentTypes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v67;
    uint64_t v7 = *MEMORY[0x1E4F44400];
    uint64_t v60 = *MEMORY[0x1E4F44448];
    uint64_t v58 = *MEMORY[0x1E4F44578];
    uint64_t v59 = *MEMORY[0x1E4F44570];
    uint64_t v56 = *MEMORY[0x1E4F44560];
    uint64_t v57 = *MEMORY[0x1E4F44580];
    uint64_t v53 = *MEMORY[0x1E4F44330];
    uint64_t v47 = *MEMORY[0x1E4F44368];
    uint64_t v44 = *MEMORY[0x1E4F6EB08];
    uint64_t v45 = *MEMORY[0x1E4F44358];
    uint64_t v43 = *MEMORY[0x1E4F6EAF8];
    uint64_t v46 = *MEMORY[0x1E4F6EB00];
    uint64_t v51 = *MEMORY[0x1E4F6EBA8];
    uint64_t v52 = *MEMORY[0x1E4F6EAF0];
    uint64_t v8 = *MEMORY[0x1E4F6EB68];
    uint64_t v9 = *MEMORY[0x1E4F6EB60];
    uint64_t v10 = *MEMORY[0x1E4F6EB50];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v67 != v6) {
          objc_enumerationMutation(v3);
        }
        v12 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(*((void *)&v66 + 1) + 8 * v11)];
        char v13 = [v12 conformsToType:v7];
        uint64_t v14 = v10;
        if ((v13 & 1) == 0)
        {
          char v15 = [v12 conformsToType:v60];
          uint64_t v14 = v9;
          if ((v15 & 1) == 0)
          {
            char v16 = [v12 conformsToType:v59];
            uint64_t v14 = v8;
            if ((v16 & 1) == 0)
            {
              char v17 = [v12 conformsToType:v58];
              uint64_t v14 = v8;
              if ((v17 & 1) == 0)
              {
                char v18 = [v12 conformsToType:v57];
                uint64_t v14 = v8;
                if ((v18 & 1) == 0)
                {
                  if ([v12 conformsToType:v56])
                  {
                    v55 = [(SSMessageResultBuilder *)v54 attachmentTypes];
                    if ([v55 count] == 1)
                    {
                      v50 = [(SSMessageResultBuilder *)v54 senders];
                      v48 = [v50 firstObject];
                      uint64_t v49 = [v48 length];

                      uint64_t v14 = v51;
                      if (v49)
                      {
                        v36 = NSString;
                        v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                        objc_super v38 = [v37 localizedStringForKey:@"SHARED_WATCHFACE_NOTIFICATION" value:&stru_1F1824018 table:@"SpotlightServices"];
                        v39 = [(SSMessageResultBuilder *)v54 senders];
                        v40 = [v39 firstObject];
                        v41 = objc_msgSend(v36, "localizedStringWithFormat:", v38, v40);

                        goto LABEL_36;
                      }
                    }
                    else
                    {

                      uint64_t v14 = v51;
                    }
                  }
                  else
                  {
                    char v19 = [v12 conformsToType:v53];
                    uint64_t v14 = v52;
                    if ((v19 & 1) == 0)
                    {
                      char v20 = [v12 conformsToType:v47];
                      uint64_t v14 = v46;
                      if ((v20 & 1) == 0)
                      {
                        if ([v12 conformsToType:v45]) {
                          uint64_t v14 = v43;
                        }
                        else {
                          uint64_t v14 = v44;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        [v61 addObject:v14];

        ++v11;
      }
      while (v5 != v11);
      uint64_t v21 = [v3 countByEnumeratingWithState:&v66 objects:v71 count:16];
      uint64_t v5 = v21;
    }
    while (v21);
  }

  v22 = v61;
  if ([v61 count])
  {
    v41 = objc_opt_new();
    id v23 = NSString;
    v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"%lu Attachments: " value:&stru_1F1824018 table:@"SpotlightServices"];
    v26 = objc_msgSend(v23, "localizedStringWithFormat:", v25, objc_msgSend(v61, "count"));
    [v41 appendString:v26];

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v3 = v61;
    uint64_t v27 = [v3 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v63;
      char v30 = 1;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v63 != v29) {
            objc_enumerationMutation(v3);
          }
          uint64_t v32 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          uint64_t v33 = [v3 countForObject:v32];
          if ((v30 & 1) == 0) {
            [v41 appendString:@", "];
          }
          v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v35 = [v34 localizedStringForKey:v32 value:&stru_1F1824018 table:@"SpotlightServices"];
          objc_msgSend(v41, "appendFormat:", v35, v33);

          char v30 = 0;
        }
        uint64_t v28 = [v3 countByEnumeratingWithState:&v62 objects:v70 count:16];
        char v30 = 0;
      }
      while (v28);
LABEL_36:
      v22 = v61;
    }
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (id)buildThumbnail
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(SSMessageResultBuilder *)self senderContactIds];
  uint64_t v5 = (void *)[v3 initWithArray:v4];

  uint64_t v6 = [(SSMessageResultBuilder *)self recipientContactIds];
  unint64_t v7 = [v6 count];

  if (v7 >= 2)
  {
    uint64_t v8 = [(SSMessageResultBuilder *)self recipientContactIds];
    [v5 addObjectsFromArray:v8];
  }
  uint64_t v9 = [(SSMessageResultBuilder *)self groupPhotoPath];

  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    [v10 setCornerRoundingStyle:4];
    uint64_t v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = [(SSMessageResultBuilder *)self groupPhotoPath];
    char v13 = [v11 fileURLWithPath:v12 isDirectory:0];
    [v10 setUrlValue:v13];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
    [v10 setContactIdentifiers:v5];
    [v10 setThreeDTouchEnabled:1];
  }

  return v10;
}

- (id)buildAttachmentThumbnail
{
  id v3 = [(SSMessageResultBuilder *)self attachmentTypes];
  if ([v3 count])
  {
    unint64_t v4 = 0;
    uint64_t v5 = *MEMORY[0x1E4F44338];
    uint64_t v6 = *MEMORY[0x1E4F44400];
    while (1)
    {
      unint64_t v7 = [(SSMessageResultBuilder *)self attachmentNames];
      unint64_t v8 = [v7 count];

      if (v4 >= v8) {
        break;
      }
      uint64_t v9 = [(SSMessageResultBuilder *)self attachmentTypes];
      id v3 = [v9 objectAtIndexedSubscript:v4];

      uint64_t v10 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
      if (([v10 conformsToType:v5] & 1) != 0 || objc_msgSend(v10, "conformsToType:", v6))
      {
        v12 = [(SSMessageResultBuilder *)self attachmentNames];
        uint64_t v11 = [v12 objectAtIndexedSubscript:v4];

        goto LABEL_9;
      }

      ++v4;
      id v3 = [(SSMessageResultBuilder *)self attachmentTypes];
      if (v4 >= [v3 count]) {
        goto LABEL_7;
      }
    }
    uint64_t v11 = 0;
  }
  else
  {
LABEL_7:
    uint64_t v11 = 0;
LABEL_9:
  }
  if ([v11 length])
  {
    char v13 = objc_opt_new();
    [v13 setPhotoIdentifier:v11];
    [v13 setIsSyndicated:1];
    objc_msgSend(v13, "setSize:", 32.0, 32.0);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)buildCompactCardSection
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F9A378];
  unint64_t v4 = [(SSMessageResultBuilder *)self sendDate];
  uint64_t v5 = +[SSDateFormatManager dynamicCompactStringFromDate:v4];
  uint64_t v6 = [v3 textWithString:v5];
  v13[0] = v6;
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  v12.receiver = self;
  v12.super_class = (Class)SSMessageResultBuilder;
  unint64_t v8 = [(SSResultBuilder *)&v12 buildCompactCardSection];
  uint64_t v9 = [v8 descriptions];
  uint64_t v10 = [v7 arrayByAddingObjectsFromArray:v9];
  [v8 setDescriptions:v10];

  return v8;
}

- (id)buildTitle
{
  id v3 = [(SSMessageResultBuilder *)self groupDisplayName];
  if (!v3)
  {
    uint64_t v4 = [(SSMessageResultBuilder *)self senders];
    if (!v4
      || (uint64_t v5 = (void *)v4,
          [(SSMessageResultBuilder *)self senders],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          [v6 firstObject],
          id v3 = objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          !v3))
    {
      unint64_t v7 = [(SSMessageResultBuilder *)self recipients];
      if (v7)
      {
        unint64_t v8 = [(SSMessageResultBuilder *)self recipients];
        id v3 = [v8 firstObject];
      }
      else
      {
        id v3 = 0;
      }
    }
  }
  if (MEMORY[0x1C1884730](v3))
  {
    uint64_t v9 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v3];
    uint64_t v10 = [v9 formattedStringValue];

    id v3 = (void *)v10;
  }
  uint64_t v11 = [MEMORY[0x1E4F9A378] textWithString:v3];

  return v11;
}

- (NSString)groupDisplayName
{
  return self->_groupDisplayName;
}

- (void)setGroupDisplayName:(id)a3
{
}

- (NSString)groupPhotoPath
{
  return self->_groupPhotoPath;
}

- (void)setGroupPhotoPath:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
}

- (NSArray)attachmentNames
{
  return self->_attachmentNames;
}

- (void)setAttachmentNames:(id)a3
{
}

- (NSArray)attachmentPaths
{
  return self->_attachmentPaths;
}

- (void)setAttachmentPaths:(id)a3
{
}

- (NSArray)attachmentTypes
{
  return self->_attachmentTypes;
}

- (void)setAttachmentTypes:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (NSArray)recipientContactIds
{
  return self->_recipientContactIds;
}

- (void)setRecipientContactIds:(id)a3
{
}

- (NSDate)sendDate
{
  return self->_sendDate;
}

- (void)setSendDate:(id)a3
{
}

- (NSArray)senders
{
  return self->_senders;
}

- (void)setSenders:(id)a3
{
}

- (NSArray)senderContactIds
{
  return self->_senderContactIds;
}

- (void)setSenderContactIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderContactIds, 0);
  objc_storeStrong((id *)&self->_senders, 0);
  objc_storeStrong((id *)&self->_sendDate, 0);
  objc_storeStrong((id *)&self->_recipientContactIds, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_attachmentTypes, 0);
  objc_storeStrong((id *)&self->_attachmentPaths, 0);
  objc_storeStrong((id *)&self->_attachmentNames, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_groupPhotoPath, 0);
  objc_storeStrong((id *)&self->_groupDisplayName, 0);
}

@end