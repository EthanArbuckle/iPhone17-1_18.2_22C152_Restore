@interface WFPBRunShortcutEvent
- (BOOL)completed;
- (BOOL)didPresentShareSheet;
- (BOOL)didRunRemotely;
- (BOOL)hasActionCount;
- (BOOL)hasAutomationSuggestionsTrialIdentifier;
- (BOOL)hasAutomationType;
- (BOOL)hasCompleted;
- (BOOL)hasDidPresentShareSheet;
- (BOOL)hasDidRunRemotely;
- (BOOL)hasGalleryIdentifier;
- (BOOL)hasIsFromAutomationSuggestion;
- (BOOL)hasKey;
- (BOOL)hasNumberOfDialogsPresented;
- (BOOL)hasRunSource;
- (BOOL)hasScriptingRunBundleIdentifier;
- (BOOL)hasShortcutSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromAutomationSuggestion;
- (BOOL)readFrom:(id)a3;
- (NSString)automationSuggestionsTrialIdentifier;
- (NSString)automationType;
- (NSString)galleryIdentifier;
- (NSString)key;
- (NSString)runSource;
- (NSString)scriptingRunBundleIdentifier;
- (NSString)shortcutSource;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)actionCount;
- (unsigned)numberOfDialogsPresented;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionCount:(unsigned int)a3;
- (void)setAutomationSuggestionsTrialIdentifier:(id)a3;
- (void)setAutomationType:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setDidPresentShareSheet:(BOOL)a3;
- (void)setDidRunRemotely:(BOOL)a3;
- (void)setGalleryIdentifier:(id)a3;
- (void)setHasActionCount:(BOOL)a3;
- (void)setHasCompleted:(BOOL)a3;
- (void)setHasDidPresentShareSheet:(BOOL)a3;
- (void)setHasDidRunRemotely:(BOOL)a3;
- (void)setHasIsFromAutomationSuggestion:(BOOL)a3;
- (void)setHasNumberOfDialogsPresented:(BOOL)a3;
- (void)setIsFromAutomationSuggestion:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setNumberOfDialogsPresented:(unsigned int)a3;
- (void)setRunSource:(id)a3;
- (void)setScriptingRunBundleIdentifier:(id)a3;
- (void)setShortcutSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBRunShortcutEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_scriptingRunBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, 0);
}

- (void)setScriptingRunBundleIdentifier:(id)a3
{
}

- (NSString)scriptingRunBundleIdentifier
{
  return self->_scriptingRunBundleIdentifier;
}

- (void)setAutomationSuggestionsTrialIdentifier:(id)a3
{
}

- (NSString)automationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier;
}

- (BOOL)isFromAutomationSuggestion
{
  return self->_isFromAutomationSuggestion;
}

- (BOOL)didPresentShareSheet
{
  return self->_didPresentShareSheet;
}

- (unsigned)numberOfDialogsPresented
{
  return self->_numberOfDialogsPresented;
}

- (void)setGalleryIdentifier:(id)a3
{
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setShortcutSource:(id)a3
{
}

- (NSString)shortcutSource
{
  return self->_shortcutSource;
}

- (BOOL)didRunRemotely
{
  return self->_didRunRemotely;
}

- (BOOL)completed
{
  return self->_completed;
}

- (unsigned)actionCount
{
  return self->_actionCount;
}

- (void)setAutomationType:(id)a3
{
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setRunSource:(id)a3
{
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 5))
  {
    -[WFPBRunShortcutEvent setKey:](self, "setKey:");
    id v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[WFPBRunShortcutEvent setRunSource:](self, "setRunSource:");
    id v4 = v7;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBRunShortcutEvent setAutomationType:](self, "setAutomationType:");
    id v4 = v7;
  }
  char v5 = *((unsigned char *)v4 + 84);
  if (v5)
  {
    self->_actionCount = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 84);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_completed = *((unsigned char *)v4 + 80);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 84) & 0x10) != 0)
  {
LABEL_10:
    self->_didRunRemotely = *((unsigned char *)v4 + 82);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_11:
  if (*((void *)v4 + 9))
  {
    -[WFPBRunShortcutEvent setShortcutSource:](self, "setShortcutSource:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[WFPBRunShortcutEvent setGalleryIdentifier:](self, "setGalleryIdentifier:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 84);
  if ((v6 & 2) != 0)
  {
    self->_numberOfDialogsPresented = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 84);
    if ((v6 & 8) == 0)
    {
LABEL_17:
      if ((v6 & 0x20) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 8) == 0)
  {
    goto LABEL_17;
  }
  self->_didPresentShareSheet = *((unsigned char *)v4 + 81);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 84) & 0x20) != 0)
  {
LABEL_18:
    self->_isFromAutomationSuggestion = *((unsigned char *)v4 + 83);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_19:
  if (*((void *)v4 + 2))
  {
    -[WFPBRunShortcutEvent setAutomationSuggestionsTrialIdentifier:](self, "setAutomationSuggestionsTrialIdentifier:");
    id v4 = v7;
  }
  if (*((void *)v4 + 8))
  {
    -[WFPBRunShortcutEvent setScriptingRunBundleIdentifier:](self, "setScriptingRunBundleIdentifier:");
    id v4 = v7;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_runSource hash];
  NSUInteger v5 = [(NSString *)self->_automationType hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v6 = 2654435761 * self->_actionCount;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_completed;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v8 = 2654435761 * self->_didRunRemotely;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v8 = 0;
LABEL_8:
  NSUInteger v9 = [(NSString *)self->_shortcutSource hash];
  NSUInteger v10 = [(NSString *)self->_galleryIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v12 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v13 = 0;
    goto LABEL_15;
  }
  uint64_t v11 = 2654435761 * self->_numberOfDialogsPresented;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v12 = 2654435761 * self->_didPresentShareSheet;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v13 = 2654435761 * self->_isFromAutomationSuggestion;
LABEL_15:
  NSUInteger v14 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  NSUInteger v15 = v11 ^ v12 ^ v13 ^ [(NSString *)self->_automationSuggestionsTrialIdentifier hash];
  return v14 ^ v15 ^ [(NSString *)self->_scriptingRunBundleIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_58;
    }
  }
  runSource = self->_runSource;
  if ((unint64_t)runSource | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](runSource, "isEqual:")) {
      goto LABEL_58;
    }
  }
  automationType = self->_automationType;
  if ((unint64_t)automationType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](automationType, "isEqual:")) {
      goto LABEL_58;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_actionCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_58;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 4) == 0) {
      goto LABEL_58;
    }
    if (self->_completed)
    {
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_58;
      }
    }
    else if (*((unsigned char *)v4 + 80))
    {
      goto LABEL_58;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 4) != 0)
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 0x10) == 0) {
      goto LABEL_58;
    }
    if (self->_didRunRemotely)
    {
      if (!*((unsigned char *)v4 + 82)) {
        goto LABEL_58;
      }
    }
    else if (*((unsigned char *)v4 + 82))
    {
      goto LABEL_58;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 0x10) != 0)
  {
    goto LABEL_58;
  }
  shortcutSource = self->_shortcutSource;
  if ((unint64_t)shortcutSource | *((void *)v4 + 9)
    && !-[NSString isEqual:](shortcutSource, "isEqual:"))
  {
    goto LABEL_58;
  }
  galleryIdentifier = self->_galleryIdentifier;
  if ((unint64_t)galleryIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](galleryIdentifier, "isEqual:")) {
      goto LABEL_58;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0 || self->_numberOfDialogsPresented != *((_DWORD *)v4 + 12)) {
      goto LABEL_58;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 8) == 0) {
      goto LABEL_58;
    }
    if (self->_didPresentShareSheet)
    {
      if (!*((unsigned char *)v4 + 81)) {
        goto LABEL_58;
      }
    }
    else if (*((unsigned char *)v4 + 81))
    {
      goto LABEL_58;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 0x20) != 0)
    {
      if (self->_isFromAutomationSuggestion)
      {
        if (!*((unsigned char *)v4 + 83)) {
          goto LABEL_58;
        }
        goto LABEL_54;
      }
      if (!*((unsigned char *)v4 + 83)) {
        goto LABEL_54;
      }
    }
LABEL_58:
    char v12 = 0;
    goto LABEL_59;
  }
  if ((*((unsigned char *)v4 + 84) & 0x20) != 0) {
    goto LABEL_58;
  }
LABEL_54:
  automationSuggestionsTrialIdentifier = self->_automationSuggestionsTrialIdentifier;
  if ((unint64_t)automationSuggestionsTrialIdentifier | *((void *)v4 + 2)
    && !-[NSString isEqual:](automationSuggestionsTrialIdentifier, "isEqual:"))
  {
    goto LABEL_58;
  }
  scriptingRunBundleIdentifier = self->_scriptingRunBundleIdentifier;
  if ((unint64_t)scriptingRunBundleIdentifier | *((void *)v4 + 8)) {
    char v12 = -[NSString isEqual:](scriptingRunBundleIdentifier, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_59:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_runSource copyWithZone:a3];
  NSUInteger v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_automationType copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_actionCount;
    *(unsigned char *)(v5 + 84) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 80) = self->_completed;
  *(unsigned char *)(v5 + 84) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 82) = self->_didRunRemotely;
    *(unsigned char *)(v5 + 84) |= 0x10u;
  }
LABEL_5:
  uint64_t v13 = [(NSString *)self->_shortcutSource copyWithZone:a3];
  NSUInteger v14 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v13;

  uint64_t v15 = [(NSString *)self->_galleryIdentifier copyWithZone:a3];
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  char v17 = (char)self->_has;
  if ((v17 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    *(unsigned char *)(v5 + 81) = self->_didPresentShareSheet;
    *(unsigned char *)(v5 + 84) |= 8u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 48) = self->_numberOfDialogsPresented;
  *(unsigned char *)(v5 + 84) |= 2u;
  char v17 = (char)self->_has;
  if ((v17 & 8) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((v17 & 0x20) != 0)
  {
LABEL_8:
    *(unsigned char *)(v5 + 83) = self->_isFromAutomationSuggestion;
    *(unsigned char *)(v5 + 84) |= 0x20u;
  }
LABEL_9:
  uint64_t v18 = [(NSString *)self->_automationSuggestionsTrialIdentifier copyWithZone:a3];
  v19 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v18;

  uint64_t v20 = [(NSString *)self->_scriptingRunBundleIdentifier copyWithZone:a3];
  v21 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v20;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v7;
  }
  if (self->_runSource)
  {
    objc_msgSend(v7, "setRunSource:");
    id v4 = v7;
  }
  if (self->_automationType)
  {
    objc_msgSend(v7, "setAutomationType:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_actionCount;
    *((unsigned char *)v4 + 84) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v4 + 80) = self->_completed;
  *((unsigned char *)v4 + 84) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    *((unsigned char *)v4 + 82) = self->_didRunRemotely;
    *((unsigned char *)v4 + 84) |= 0x10u;
  }
LABEL_11:
  if (self->_shortcutSource)
  {
    objc_msgSend(v7, "setShortcutSource:");
    id v4 = v7;
  }
  if (self->_galleryIdentifier)
  {
    objc_msgSend(v7, "setGalleryIdentifier:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_numberOfDialogsPresented;
    *((unsigned char *)v4 + 84) |= 2u;
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_17:
      if ((v6 & 0x20) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_17;
  }
  *((unsigned char *)v4 + 81) = self->_didPresentShareSheet;
  *((unsigned char *)v4 + 84) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_18:
    *((unsigned char *)v4 + 83) = self->_isFromAutomationSuggestion;
    *((unsigned char *)v4 + 84) |= 0x20u;
  }
LABEL_19:
  if (self->_automationSuggestionsTrialIdentifier)
  {
    objc_msgSend(v7, "setAutomationSuggestionsTrialIdentifier:");
    id v4 = v7;
  }
  if (self->_scriptingRunBundleIdentifier)
  {
    objc_msgSend(v7, "setScriptingRunBundleIdentifier:");
    id v4 = v7;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_runSource)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_automationType)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
LABEL_11:
  if (self->_shortcutSource)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_galleryIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_17:
      if ((v6 & 0x20) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_18:
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
LABEL_19:
  if (self->_automationSuggestionsTrialIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_scriptingRunBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBRunShortcutEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  runSource = self->_runSource;
  if (runSource) {
    [v4 setObject:runSource forKey:@"runSource"];
  }
  automationType = self->_automationType;
  if (automationType) {
    [v4 setObject:automationType forKey:@"automationType"];
  }
  char has = (char)self->_has;
  if (has)
  {
    char v17 = [NSNumber numberWithUnsignedInt:self->_actionCount];
    [v4 setObject:v17 forKey:@"actionCount"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  uint64_t v18 = [NSNumber numberWithBool:self->_completed];
  [v4 setObject:v18 forKey:@"completed"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    NSUInteger v9 = [NSNumber numberWithBool:self->_didRunRemotely];
    [v4 setObject:v9 forKey:@"didRunRemotely"];
  }
LABEL_11:
  shortcutSource = self->_shortcutSource;
  if (shortcutSource) {
    [v4 setObject:shortcutSource forKey:@"shortcutSource"];
  }
  galleryIdentifier = self->_galleryIdentifier;
  if (galleryIdentifier) {
    [v4 setObject:galleryIdentifier forKey:@"galleryIdentifier"];
  }
  char v12 = (char)self->_has;
  if ((v12 & 2) != 0)
  {
    v19 = [NSNumber numberWithUnsignedInt:self->_numberOfDialogsPresented];
    [v4 setObject:v19 forKey:@"numberOfDialogsPresented"];

    char v12 = (char)self->_has;
    if ((v12 & 8) == 0)
    {
LABEL_17:
      if ((v12 & 0x20) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_17;
  }
  uint64_t v20 = [NSNumber numberWithBool:self->_didPresentShareSheet];
  [v4 setObject:v20 forKey:@"didPresentShareSheet"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_18:
    uint64_t v13 = [NSNumber numberWithBool:self->_isFromAutomationSuggestion];
    [v4 setObject:v13 forKey:@"isFromAutomationSuggestion"];
  }
LABEL_19:
  automationSuggestionsTrialIdentifier = self->_automationSuggestionsTrialIdentifier;
  if (automationSuggestionsTrialIdentifier) {
    [v4 setObject:automationSuggestionsTrialIdentifier forKey:@"automationSuggestionsTrialIdentifier"];
  }
  scriptingRunBundleIdentifier = self->_scriptingRunBundleIdentifier;
  if (scriptingRunBundleIdentifier) {
    [v4 setObject:scriptingRunBundleIdentifier forKey:@"scriptingRunBundleIdentifier"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBRunShortcutEvent;
  id v4 = [(WFPBRunShortcutEvent *)&v8 description];
  uint64_t v5 = [(WFPBRunShortcutEvent *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasScriptingRunBundleIdentifier
{
  return self->_scriptingRunBundleIdentifier != 0;
}

- (BOOL)hasAutomationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier != 0;
}

- (BOOL)hasIsFromAutomationSuggestion
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasIsFromAutomationSuggestion:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setIsFromAutomationSuggestion:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isFromAutomationSuggestion = a3;
}

- (BOOL)hasDidPresentShareSheet
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasDidPresentShareSheet:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setDidPresentShareSheet:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_didPresentShareSheet = a3;
}

- (BOOL)hasNumberOfDialogsPresented
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNumberOfDialogsPresented:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setNumberOfDialogsPresented:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numberOfDialogsPresented = a3;
}

- (BOOL)hasGalleryIdentifier
{
  return self->_galleryIdentifier != 0;
}

- (BOOL)hasShortcutSource
{
  return self->_shortcutSource != 0;
}

- (BOOL)hasDidRunRemotely
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasDidRunRemotely:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setDidRunRemotely:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_didRunRemotely = a3;
}

- (BOOL)hasCompleted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_completed = a3;
}

- (BOOL)hasActionCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasActionCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setActionCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_actionCount = a3;
}

- (BOOL)hasAutomationType
{
  return self->_automationType != 0;
}

- (BOOL)hasRunSource
{
  return self->_runSource != 0;
}

- (NSString)runSource
{
  if (self->_runSource) {
    return self->_runSource;
  }
  else {
    return (NSString *)@"unknown";
  }
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"RunShortcut";
  }
}

@end