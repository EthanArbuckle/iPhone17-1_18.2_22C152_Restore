@interface FLOWSchemaFLOWSmsContext
- (BOOL)emojiUsed;
- (BOOL)hasAppendingActionReadMessagesCount;
- (BOOL)hasAudioContext;
- (BOOL)hasEmojiUsed;
- (BOOL)hasIsLongMessage;
- (BOOL)hasIsReply;
- (BOOL)hasIsSenderShortCode;
- (BOOL)hasIsSummarized;
- (BOOL)hasKeyboardUsed;
- (BOOL)hasLanguageConfidenceMatrix;
- (BOOL)hasMessageDurationMs;
- (BOOL)hasMessageType;
- (BOOL)hasRichAttachmentIntelligenceFeatureUsage;
- (BOOL)hasSummarySourceType;
- (BOOL)hasTextContext;
- (BOOL)hasTextMessageLength;
- (BOOL)hasUserPersona;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupMessageAtIndex:(unint64_t)a3;
- (BOOL)isLongMessage;
- (BOOL)isLongMessageListAtIndex:(unint64_t)a3;
- (BOOL)isMultiLingualAtIndex:(unint64_t)a3;
- (BOOL)isReadableAtIndex:(unint64_t)a3;
- (BOOL)isReply;
- (BOOL)isSenderShortCode;
- (BOOL)isSenderShortCodeListAtIndex:(unint64_t)a3;
- (BOOL)isSummarized;
- (BOOL)keyboardUsed;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWLanguageConfidenceMatrix)languageConfidenceMatrix;
- (FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage)richAttachmentIntelligenceFeatureUsage;
- (FLOWSchemaFLOWSmsAudioContext)audioContext;
- (FLOWSchemaFLOWSmsContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWSmsContext)initWithJSON:(id)a3;
- (FLOWSchemaFLOWSmsTextContext)textContext;
- (FLOWSchemaFLOWTextMessageLength)textMessageLength;
- (NSArray)isGroupMessages;
- (NSArray)isLongMessageLists;
- (NSArray)isMultiLinguals;
- (NSArray)isReadables;
- (NSArray)isSenderShortCodeLists;
- (NSArray)messageDurationsInSeconds;
- (NSArray)personTypes;
- (NSArray)readMessageTypes;
- (NSArray)recipientTypes;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appendingActionReadMessagesCount;
- (int)messageType;
- (int)personTypeAtIndex:(unint64_t)a3;
- (int)readMessageTypeAtIndex:(unint64_t)a3;
- (int)recipientTypeAtIndex:(unint64_t)a3;
- (int)summarySourceType;
- (int)userPersona;
- (unint64_t)hash;
- (unint64_t)isGroupMessageCount;
- (unint64_t)isLongMessageListCount;
- (unint64_t)isMultiLingualCount;
- (unint64_t)isReadableCount;
- (unint64_t)isSenderShortCodeListCount;
- (unint64_t)messageDurationsInSecondsAtIndex:(unint64_t)a3;
- (unint64_t)messageDurationsInSecondsCount;
- (unint64_t)personTypeCount;
- (unint64_t)readMessageTypeCount;
- (unint64_t)recipientTypeCount;
- (unint64_t)whichMessagecontext;
- (unint64_t)whichMessagesize;
- (unsigned)messageDurationMs;
- (void)addIsGroupMessage:(BOOL)a3;
- (void)addIsLongMessageList:(BOOL)a3;
- (void)addIsMultiLingual:(BOOL)a3;
- (void)addIsReadable:(BOOL)a3;
- (void)addIsSenderShortCodeList:(BOOL)a3;
- (void)addMessageDurationsInSeconds:(unint64_t)a3;
- (void)addPersonType:(int)a3;
- (void)addReadMessageType:(int)a3;
- (void)addRecipientType:(int)a3;
- (void)clearIsGroupMessage;
- (void)clearIsLongMessageList;
- (void)clearIsMultiLingual;
- (void)clearIsReadable;
- (void)clearIsSenderShortCodeList;
- (void)clearMessageDurationsInSeconds;
- (void)clearPersonType;
- (void)clearReadMessageType;
- (void)clearRecipientType;
- (void)deleteAppendingActionReadMessagesCount;
- (void)deleteAudioContext;
- (void)deleteEmojiUsed;
- (void)deleteIsLongMessage;
- (void)deleteIsReply;
- (void)deleteIsSenderShortCode;
- (void)deleteIsSummarized;
- (void)deleteKeyboardUsed;
- (void)deleteLanguageConfidenceMatrix;
- (void)deleteMessageDurationMs;
- (void)deleteMessageType;
- (void)deleteRichAttachmentIntelligenceFeatureUsage;
- (void)deleteSummarySourceType;
- (void)deleteTextContext;
- (void)deleteTextMessageLength;
- (void)deleteUserPersona;
- (void)setAppendingActionReadMessagesCount:(int)a3;
- (void)setAudioContext:(id)a3;
- (void)setEmojiUsed:(BOOL)a3;
- (void)setHasAppendingActionReadMessagesCount:(BOOL)a3;
- (void)setHasAudioContext:(BOOL)a3;
- (void)setHasEmojiUsed:(BOOL)a3;
- (void)setHasIsLongMessage:(BOOL)a3;
- (void)setHasIsReply:(BOOL)a3;
- (void)setHasIsSenderShortCode:(BOOL)a3;
- (void)setHasIsSummarized:(BOOL)a3;
- (void)setHasKeyboardUsed:(BOOL)a3;
- (void)setHasLanguageConfidenceMatrix:(BOOL)a3;
- (void)setHasMessageDurationMs:(BOOL)a3;
- (void)setHasMessageType:(BOOL)a3;
- (void)setHasRichAttachmentIntelligenceFeatureUsage:(BOOL)a3;
- (void)setHasSummarySourceType:(BOOL)a3;
- (void)setHasTextContext:(BOOL)a3;
- (void)setHasTextMessageLength:(BOOL)a3;
- (void)setHasUserPersona:(BOOL)a3;
- (void)setIsGroupMessages:(id)a3;
- (void)setIsLongMessage:(BOOL)a3;
- (void)setIsLongMessageLists:(id)a3;
- (void)setIsMultiLinguals:(id)a3;
- (void)setIsReadables:(id)a3;
- (void)setIsReply:(BOOL)a3;
- (void)setIsSenderShortCode:(BOOL)a3;
- (void)setIsSenderShortCodeLists:(id)a3;
- (void)setIsSummarized:(BOOL)a3;
- (void)setKeyboardUsed:(BOOL)a3;
- (void)setLanguageConfidenceMatrix:(id)a3;
- (void)setMessageDurationMs:(unsigned int)a3;
- (void)setMessageDurationsInSeconds:(id)a3;
- (void)setMessageType:(int)a3;
- (void)setPersonTypes:(id)a3;
- (void)setReadMessageTypes:(id)a3;
- (void)setRecipientTypes:(id)a3;
- (void)setRichAttachmentIntelligenceFeatureUsage:(id)a3;
- (void)setSummarySourceType:(int)a3;
- (void)setTextContext:(id)a3;
- (void)setTextMessageLength:(id)a3;
- (void)setUserPersona:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWSmsContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FLOWSchemaFLOWSmsContext;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWSmsContext *)self textMessageLength];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWSmsContext *)self deleteTextMessageLength];
  }
  v9 = [(FLOWSchemaFLOWSmsContext *)self textContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLOWSchemaFLOWSmsContext *)self deleteTextContext];
  }
  v12 = [(FLOWSchemaFLOWSmsContext *)self audioContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(FLOWSchemaFLOWSmsContext *)self deleteAudioContext];
  }
  v15 = [(FLOWSchemaFLOWSmsContext *)self languageConfidenceMatrix];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(FLOWSchemaFLOWSmsContext *)self deleteLanguageConfidenceMatrix];
  }
  v18 = [(FLOWSchemaFLOWSmsContext *)self richAttachmentIntelligenceFeatureUsage];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(FLOWSchemaFLOWSmsContext *)self deleteRichAttachmentIntelligenceFeatureUsage];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDurationsInSeconds, 0);
  objc_storeStrong((id *)&self->_richAttachmentIntelligenceFeatureUsage, 0);
  objc_storeStrong((id *)&self->_isLongMessageLists, 0);
  objc_storeStrong((id *)&self->_isSenderShortCodeLists, 0);
  objc_storeStrong((id *)&self->_languageConfidenceMatrix, 0);
  objc_storeStrong((id *)&self->_isGroupMessages, 0);
  objc_storeStrong((id *)&self->_isReadables, 0);
  objc_storeStrong((id *)&self->_isMultiLinguals, 0);
  objc_storeStrong((id *)&self->_readMessageTypes, 0);
  objc_storeStrong((id *)&self->_personTypes, 0);
  objc_storeStrong((id *)&self->_audioContext, 0);
  objc_storeStrong((id *)&self->_textContext, 0);
  objc_storeStrong((id *)&self->_textMessageLength, 0);
  objc_storeStrong((id *)&self->_recipientTypes, 0);
}

- (void)setHasRichAttachmentIntelligenceFeatureUsage:(BOOL)a3
{
  self->_hasAudioContext = a3;
}

- (void)setHasLanguageConfidenceMatrix:(BOOL)a3
{
  self->_hasTextContext = a3;
}

- (void)setHasAudioContext:(BOOL)a3
{
  self->_hasTextMessageLength = a3;
}

- (BOOL)hasAudioContext
{
  return self->_hasTextMessageLength;
}

- (void)setHasTextContext:(BOOL)a3
{
  self->_hasMessageDurationMs = a3;
}

- (BOOL)hasTextContext
{
  return self->_hasMessageDurationMs;
}

- (void)setHasTextMessageLength:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (BOOL)hasTextMessageLength
{
  return *((unsigned char *)&self->_has + 3);
}

- (void)setHasMessageDurationMs:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasMessageDurationMs
{
  return *((unsigned char *)&self->_has + 2);
}

- (int)summarySourceType
{
  return self->_summarySourceType;
}

- (BOOL)isSummarized
{
  return self->_isSummarized;
}

- (int)userPersona
{
  return self->_userPersona;
}

- (void)setMessageDurationsInSeconds:(id)a3
{
}

- (NSArray)messageDurationsInSeconds
{
  return self->_messageDurationsInSeconds;
}

- (void)setRichAttachmentIntelligenceFeatureUsage:(id)a3
{
}

- (FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage)richAttachmentIntelligenceFeatureUsage
{
  return self->_richAttachmentIntelligenceFeatureUsage;
}

- (void)setIsLongMessageLists:(id)a3
{
}

- (NSArray)isLongMessageLists
{
  return self->_isLongMessageLists;
}

- (void)setIsSenderShortCodeLists:(id)a3
{
}

- (NSArray)isSenderShortCodeLists
{
  return self->_isSenderShortCodeLists;
}

- (int)appendingActionReadMessagesCount
{
  return self->_appendingActionReadMessagesCount;
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (BOOL)isLongMessage
{
  return self->_isLongMessage;
}

- (BOOL)isSenderShortCode
{
  return self->_isSenderShortCode;
}

- (void)setLanguageConfidenceMatrix:(id)a3
{
}

- (FLOWSchemaFLOWLanguageConfidenceMatrix)languageConfidenceMatrix
{
  return self->_languageConfidenceMatrix;
}

- (void)setIsGroupMessages:(id)a3
{
}

- (NSArray)isGroupMessages
{
  return self->_isGroupMessages;
}

- (void)setIsReadables:(id)a3
{
}

- (NSArray)isReadables
{
  return self->_isReadables;
}

- (void)setIsMultiLinguals:(id)a3
{
}

- (NSArray)isMultiLinguals
{
  return self->_isMultiLinguals;
}

- (void)setReadMessageTypes:(id)a3
{
}

- (NSArray)readMessageTypes
{
  return self->_readMessageTypes;
}

- (void)setPersonTypes:(id)a3
{
}

- (NSArray)personTypes
{
  return self->_personTypes;
}

- (void)setRecipientTypes:(id)a3
{
}

- (NSArray)recipientTypes
{
  return self->_recipientTypes;
}

- (BOOL)keyboardUsed
{
  return self->_keyboardUsed;
}

- (BOOL)emojiUsed
{
  return self->_emojiUsed;
}

- (int)messageType
{
  return self->_messageType;
}

- (unint64_t)whichMessagecontext
{
  return self->_whichMessagecontext;
}

- (unint64_t)whichMessagesize
{
  return self->_whichMessagesize;
}

- (FLOWSchemaFLOWSmsContext)initWithDictionary:(id)a3
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v153.receiver = self;
  v153.super_class = (Class)FLOWSchemaFLOWSmsContext;
  v5 = [(FLOWSchemaFLOWSmsContext *)&v153 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"messageType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsContext setMessageType:](v5, "setMessageType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"emojiUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsContext setEmojiUsed:](v5, "setEmojiUsed:", [v7 BOOLValue]);
    }
    v103 = v7;
    int v8 = [v4 objectForKeyedSubscript:@"keyboardUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsContext setKeyboardUsed:](v5, "setKeyboardUsed:", [v8 BOOLValue]);
    }
    v102 = v8;
    v9 = [v4 objectForKeyedSubscript:@"recipientType"];
    objc_opt_class();
    v116 = v9;
    if (objc_opt_isKindOfClass())
    {
      long long v151 = 0u;
      long long v152 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v149 objects:v162 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v150;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v150 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v149 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWSmsContext addRecipientType:](v5, "addRecipientType:", [v15 intValue]);
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v149 objects:v162 count:16];
        }
        while (v12);
      }
    }
    v16 = [v4 objectForKeyedSubscript:@"messageDurationMs"];
    objc_opt_class();
    v115 = v16;
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsContext setMessageDurationMs:](v5, "setMessageDurationMs:", [v16 unsignedIntValue]);
    }
    uint64_t v17 = [v4 objectForKeyedSubscript:@"textMessageLength"];
    objc_opt_class();
    v114 = (void *)v17;
    if (objc_opt_isKindOfClass())
    {
      v18 = [[FLOWSchemaFLOWTextMessageLength alloc] initWithDictionary:v17];
      [(FLOWSchemaFLOWSmsContext *)v5 setTextMessageLength:v18];
    }
    uint64_t v19 = [v4 objectForKeyedSubscript:@"textContext"];
    objc_opt_class();
    v113 = (void *)v19;
    if (objc_opt_isKindOfClass())
    {
      int v20 = [[FLOWSchemaFLOWSmsTextContext alloc] initWithDictionary:v19];
      [(FLOWSchemaFLOWSmsContext *)v5 setTextContext:v20];
    }
    uint64_t v21 = [v4 objectForKeyedSubscript:@"audioContext"];
    objc_opt_class();
    v112 = (void *)v21;
    if (objc_opt_isKindOfClass())
    {
      objc_super v22 = [[FLOWSchemaFLOWSmsAudioContext alloc] initWithDictionary:v21];
      [(FLOWSchemaFLOWSmsContext *)v5 setAudioContext:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"personType"];
    objc_opt_class();
    v111 = v23;
    if (objc_opt_isKindOfClass())
    {
      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v145 objects:v161 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v146;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v146 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v145 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWSmsContext addPersonType:](v5, "addPersonType:", [v29 intValue]);
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v145 objects:v161 count:16];
        }
        while (v26);
      }
    }
    v30 = [v4 objectForKeyedSubscript:@"readMessageType"];
    objc_opt_class();
    v110 = v30;
    if (objc_opt_isKindOfClass())
    {
      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      id v31 = v30;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v141 objects:v160 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v142;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v142 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v141 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWSmsContext addReadMessageType:](v5, "addReadMessageType:", [v36 intValue]);
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v141 objects:v160 count:16];
        }
        while (v33);
      }
    }
    v37 = [v4 objectForKeyedSubscript:@"isMultiLingual"];
    objc_opt_class();
    v109 = v37;
    if (objc_opt_isKindOfClass())
    {
      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      id v38 = v37;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v137 objects:v159 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v138;
        do
        {
          for (uint64_t m = 0; m != v40; ++m)
          {
            if (*(void *)v138 != v41) {
              objc_enumerationMutation(v38);
            }
            v43 = *(void **)(*((void *)&v137 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWSmsContext addIsMultiLingual:](v5, "addIsMultiLingual:", [v43 BOOLValue]);
            }
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v137 objects:v159 count:16];
        }
        while (v40);
      }
    }
    v44 = [v4 objectForKeyedSubscript:@"isReadable"];
    objc_opt_class();
    v108 = v44;
    if (objc_opt_isKindOfClass())
    {
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      id v45 = v44;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v133 objects:v158 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v134;
        do
        {
          for (uint64_t n = 0; n != v47; ++n)
          {
            if (*(void *)v134 != v48) {
              objc_enumerationMutation(v45);
            }
            v50 = *(void **)(*((void *)&v133 + 1) + 8 * n);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWSmsContext addIsReadable:](v5, "addIsReadable:", [v50 BOOLValue]);
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v133 objects:v158 count:16];
        }
        while (v47);
      }
    }
    v51 = [v4 objectForKeyedSubscript:@"isGroupMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v52 = v6;
      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      v53 = v51;
      id v54 = v51;
      uint64_t v55 = [v54 countByEnumeratingWithState:&v129 objects:v157 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v130;
        do
        {
          for (iuint64_t i = 0; ii != v56; ++ii)
          {
            if (*(void *)v130 != v57) {
              objc_enumerationMutation(v54);
            }
            v59 = *(void **)(*((void *)&v129 + 1) + 8 * ii);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWSmsContext addIsGroupMessage:](v5, "addIsGroupMessage:", [v59 BOOLValue]);
            }
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v129 objects:v157 count:16];
        }
        while (v56);
      }

      v51 = v53;
      v6 = v52;
    }
    v107 = v51;
    uint64_t v60 = [v4 objectForKeyedSubscript:@"languageConfidenceMatrix"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v61 = [[FLOWSchemaFLOWLanguageConfidenceMatrix alloc] initWithDictionary:v60];
      [(FLOWSchemaFLOWSmsContext *)v5 setLanguageConfidenceMatrix:v61];
    }
    v62 = [v4 objectForKeyedSubscript:@"isSenderShortCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsContext setIsSenderShortCode:](v5, "setIsSenderShortCode:", [v62 BOOLValue]);
    }
    v63 = v6;
    v64 = [v4 objectForKeyedSubscript:@"isLongMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsContext setIsLongMessage:](v5, "setIsLongMessage:", [v64 BOOLValue]);
    }
    v65 = [v4 objectForKeyedSubscript:@"isReply"];
    objc_opt_class();
    v106 = v65;
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsContext setIsReply:](v5, "setIsReply:", [v65 BOOLValue]);
    }
    v99 = v64;
    v100 = v62;
    v101 = (void *)v60;
    v66 = [v4 objectForKeyedSubscript:@"appendingActionReadMessagesCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsContext setAppendingActionReadMessagesCount:](v5, "setAppendingActionReadMessagesCount:", [v66 intValue]);
    }
    v98 = v66;
    v104 = v63;
    v67 = [v4 objectForKeyedSubscript:@"isSenderShortCodeList"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      id v68 = v67;
      uint64_t v69 = [v68 countByEnumeratingWithState:&v125 objects:v156 count:16];
      if (v69)
      {
        uint64_t v70 = v69;
        uint64_t v71 = *(void *)v126;
        do
        {
          for (juint64_t j = 0; jj != v70; ++jj)
          {
            if (*(void *)v126 != v71) {
              objc_enumerationMutation(v68);
            }
            v73 = *(void **)(*((void *)&v125 + 1) + 8 * jj);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWSmsContext addIsSenderShortCodeList:](v5, "addIsSenderShortCodeList:", [v73 BOOLValue]);
            }
          }
          uint64_t v70 = [v68 countByEnumeratingWithState:&v125 objects:v156 count:16];
        }
        while (v70);
      }
    }
    v74 = [v4 objectForKeyedSubscript:@"isLongMessageList"];
    objc_opt_class();
    v105 = v74;
    v75 = v4;
    if (objc_opt_isKindOfClass())
    {
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v76 = v74;
      uint64_t v77 = [v76 countByEnumeratingWithState:&v121 objects:v155 count:16];
      if (v77)
      {
        uint64_t v78 = v77;
        uint64_t v79 = *(void *)v122;
        do
        {
          for (kuint64_t k = 0; kk != v78; ++kk)
          {
            if (*(void *)v122 != v79) {
              objc_enumerationMutation(v76);
            }
            v81 = *(void **)(*((void *)&v121 + 1) + 8 * kk);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWSmsContext addIsLongMessageList:](v5, "addIsLongMessageList:", [v81 BOOLValue]);
            }
          }
          uint64_t v78 = [v76 countByEnumeratingWithState:&v121 objects:v155 count:16];
        }
        while (v78);
      }

      id v4 = v75;
    }
    v82 = [v4 objectForKeyedSubscript:@"richAttachmentIntelligenceFeatureUsage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v83 = [[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage alloc] initWithDictionary:v82];
      [(FLOWSchemaFLOWSmsContext *)v5 setRichAttachmentIntelligenceFeatureUsage:v83];
    }
    v84 = [v4 objectForKeyedSubscript:@"messageDurationsInSeconds"];
    objc_opt_class();
    v85 = v107;
    if (objc_opt_isKindOfClass())
    {
      v97 = v67;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v86 = v84;
      uint64_t v87 = [v86 countByEnumeratingWithState:&v117 objects:v154 count:16];
      if (v87)
      {
        uint64_t v88 = v87;
        uint64_t v89 = *(void *)v118;
        do
        {
          for (muint64_t m = 0; mm != v88; ++mm)
          {
            if (*(void *)v118 != v89) {
              objc_enumerationMutation(v86);
            }
            v91 = *(void **)(*((void *)&v117 + 1) + 8 * mm);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWSmsContext addMessageDurationsInSeconds:](v5, "addMessageDurationsInSeconds:", [v91 unsignedLongLongValue]);
            }
          }
          uint64_t v88 = [v86 countByEnumeratingWithState:&v117 objects:v154 count:16];
        }
        while (v88);
      }

      id v4 = v75;
      v85 = v107;
      v67 = v97;
    }
    v92 = objc_msgSend(v4, "objectForKeyedSubscript:", @"userPersona", v97);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsContext setUserPersona:](v5, "setUserPersona:", [v92 intValue]);
    }
    v93 = [v4 objectForKeyedSubscript:@"isSummarized"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsContext setIsSummarized:](v5, "setIsSummarized:", [v93 BOOLValue]);
    }
    v94 = [v75 objectForKeyedSubscript:@"summarySourceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsContext setSummarySourceType:](v5, "setSummarySourceType:", [v94 intValue]);
    }
    v95 = v5;

    id v4 = v75;
  }

  return v5;
}

- (FLOWSchemaFLOWSmsContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWSmsContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWSmsContext *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[FLOWSchemaFLOWSmsContext appendingActionReadMessagesCount](self, "appendingActionReadMessagesCount"));
    [v3 setObject:v4 forKeyedSubscript:@"appendingActionReadMessagesCount"];
  }
  if (self->_audioContext)
  {
    v5 = [(FLOWSchemaFLOWSmsContext *)self audioContext];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"audioContext"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"audioContext"];
    }
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWSmsContext emojiUsed](self, "emojiUsed"));
    [v3 setObject:v8 forKeyedSubscript:@"emojiUsed"];
  }
  if ([(NSArray *)self->_isGroupMessages count])
  {
    v9 = [(FLOWSchemaFLOWSmsContext *)self isGroupMessages];
    id v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"isGroupMessage"];
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWSmsContext isLongMessage](self, "isLongMessage"));
    [v3 setObject:v11 forKeyedSubscript:@"isLongMessage"];
  }
  if ([(NSArray *)self->_isLongMessageLists count])
  {
    uint64_t v12 = [(FLOWSchemaFLOWSmsContext *)self isLongMessageLists];
    uint64_t v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"isLongMessageList"];
  }
  if ([(NSArray *)self->_isMultiLinguals count])
  {
    int v14 = [(FLOWSchemaFLOWSmsContext *)self isMultiLinguals];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"isMultiLingual"];
  }
  if ([(NSArray *)self->_isReadables count])
  {
    v16 = [(FLOWSchemaFLOWSmsContext *)self isReadables];
    uint64_t v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"isReadable"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWSmsContext isReply](self, "isReply"));
    [v3 setObject:v19 forKeyedSubscript:@"isReply"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    int v20 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWSmsContext isSenderShortCode](self, "isSenderShortCode"));
    [v3 setObject:v20 forKeyedSubscript:@"isSenderShortCode"];
  }
  if ([(NSArray *)self->_isSenderShortCodeLists count])
  {
    uint64_t v21 = [(FLOWSchemaFLOWSmsContext *)self isSenderShortCodeLists];
    objc_super v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"isSenderShortCodeList"];
  }
  __int16 v23 = (__int16)self->_has;
  if ((v23 & 0x100) != 0)
  {
    id v24 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWSmsContext isSummarized](self, "isSummarized"));
    [v3 setObject:v24 forKeyedSubscript:@"isSummarized"];

    __int16 v23 = (__int16)self->_has;
  }
  if ((v23 & 4) != 0)
  {
    uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWSmsContext keyboardUsed](self, "keyboardUsed"));
    [v3 setObject:v25 forKeyedSubscript:@"keyboardUsed"];
  }
  if (self->_languageConfidenceMatrix)
  {
    uint64_t v26 = [(FLOWSchemaFLOWSmsContext *)self languageConfidenceMatrix];
    uint64_t v27 = [v26 dictionaryRepresentation];
    if (v27)
    {
      [v3 setObject:v27 forKeyedSubscript:@"languageConfidenceMatrix"];
    }
    else
    {
      v28 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v28 forKeyedSubscript:@"languageConfidenceMatrix"];
    }
  }
  if (self->_whichMessagesize == 6)
  {
    v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWSmsContext messageDurationMs](self, "messageDurationMs"));
    [v3 setObject:v29 forKeyedSubscript:@"messageDurationMs"];
  }
  if ([(NSArray *)self->_messageDurationsInSeconds count])
  {
    v30 = [(FLOWSchemaFLOWSmsContext *)self messageDurationsInSeconds];
    id v31 = (void *)[v30 copy];
    [v3 setObject:v31 forKeyedSubscript:@"messageDurationsInSeconds"];
  }
  if (*(_WORD *)&self->_has)
  {
    unsigned int v32 = [(FLOWSchemaFLOWSmsContext *)self messageType] - 1;
    if (v32 > 3) {
      uint64_t v33 = @"FLOWMESSAGETYPE_UNKNOWN";
    }
    else {
      uint64_t v33 = off_1E5EAFB98[v32];
    }
    [v3 setObject:v33 forKeyedSubscript:@"messageType"];
  }
  if ([(NSArray *)self->_personTypes count])
  {
    uint64_t v34 = [(FLOWSchemaFLOWSmsContext *)self personTypes];
    v35 = (void *)[v34 copy];
    [v3 setObject:v35 forKeyedSubscript:@"personType"];
  }
  if ([(NSArray *)self->_readMessageTypes count])
  {
    v36 = [(FLOWSchemaFLOWSmsContext *)self readMessageTypes];
    v37 = (void *)[v36 copy];
    [v3 setObject:v37 forKeyedSubscript:@"readMessageType"];
  }
  if ([(NSArray *)self->_recipientTypes count])
  {
    id v38 = [(FLOWSchemaFLOWSmsContext *)self recipientTypes];
    uint64_t v39 = (void *)[v38 copy];
    [v3 setObject:v39 forKeyedSubscript:@"recipientType"];
  }
  if (self->_richAttachmentIntelligenceFeatureUsage)
  {
    uint64_t v40 = [(FLOWSchemaFLOWSmsContext *)self richAttachmentIntelligenceFeatureUsage];
    uint64_t v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"richAttachmentIntelligenceFeatureUsage"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"richAttachmentIntelligenceFeatureUsage"];
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    int v43 = [(FLOWSchemaFLOWSmsContext *)self summarySourceType];
    v44 = @"FLOWSUMMARYSOURCETYPE_UNKNOWN";
    if (v43 == 1) {
      v44 = @"FLOWSUMMARYSOURCETYPE_SINGLE_MESSAGE";
    }
    if (v43 == 2) {
      id v45 = @"FLOWSUMMARYSOURCETYPE_MULTIPLE_MESSAGES";
    }
    else {
      id v45 = v44;
    }
    [v3 setObject:v45 forKeyedSubscript:@"summarySourceType"];
  }
  if (self->_textContext)
  {
    uint64_t v46 = [(FLOWSchemaFLOWSmsContext *)self textContext];
    uint64_t v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"textContext"];
    }
    else
    {
      uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"textContext"];
    }
  }
  if (self->_textMessageLength)
  {
    v49 = [(FLOWSchemaFLOWSmsContext *)self textMessageLength];
    v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"textMessageLength"];
    }
    else
    {
      v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"textMessageLength"];
    }
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    unsigned int v52 = [(FLOWSchemaFLOWSmsContext *)self userPersona] - 1;
    if (v52 > 5) {
      v53 = @"INFERENCEAPPSELECTIONUSERPERSONA_UNKNOWN";
    }
    else {
      v53 = off_1E5EAFBB8[v52];
    }
    [v3 setObject:v53 forKeyedSubscript:@"userPersona"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v54 = v3;

  return v54;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    uint64_t v31 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v30 = 0;
    if ((has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v31 = 2654435761 * self->_messageType;
  if ((has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v30 = 2654435761 * self->_emojiUsed;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v29 = 2654435761 * self->_keyboardUsed;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v29 = 0;
LABEL_8:
  uint64_t v28 = [(NSArray *)self->_recipientTypes hash];
  if (self->_whichMessagesize == 6) {
    uint64_t v27 = 2654435761 * self->_messageDurationMs;
  }
  else {
    uint64_t v27 = 0;
  }
  unint64_t v26 = [(FLOWSchemaFLOWTextMessageLength *)self->_textMessageLength hash];
  unint64_t v25 = [(FLOWSchemaFLOWSmsTextContext *)self->_textContext hash];
  unint64_t v24 = [(FLOWSchemaFLOWSmsAudioContext *)self->_audioContext hash];
  uint64_t v23 = [(NSArray *)self->_personTypes hash];
  uint64_t v22 = [(NSArray *)self->_readMessageTypes hash];
  uint64_t v21 = [(NSArray *)self->_isMultiLinguals hash];
  uint64_t v20 = [(NSArray *)self->_isReadables hash];
  uint64_t v19 = [(NSArray *)self->_isGroupMessages hash];
  unint64_t v17 = [(FLOWSchemaFLOWLanguageConfidenceMatrix *)self->_languageConfidenceMatrix hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_isSenderShortCode;
    if ((v4 & 0x10) != 0)
    {
LABEL_13:
      uint64_t v6 = 2654435761 * self->_isLongMessage;
      if ((v4 & 0x20) != 0) {
        goto LABEL_14;
      }
LABEL_18:
      uint64_t v7 = 0;
      if ((v4 & 0x40) != 0) {
        goto LABEL_15;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((v4 & 0x10) != 0) {
      goto LABEL_13;
    }
  }
  uint64_t v6 = 0;
  if ((v4 & 0x20) == 0) {
    goto LABEL_18;
  }
LABEL_14:
  uint64_t v7 = 2654435761 * self->_isReply;
  if ((v4 & 0x40) != 0)
  {
LABEL_15:
    uint64_t v8 = 2654435761 * self->_appendingActionReadMessagesCount;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v8 = 0;
LABEL_20:
  uint64_t v9 = [(NSArray *)self->_isSenderShortCodeLists hash];
  uint64_t v10 = [(NSArray *)self->_isLongMessageLists hash];
  unint64_t v11 = [(FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *)self->_richAttachmentIntelligenceFeatureUsage hash];
  uint64_t v12 = [(NSArray *)self->_messageDurationsInSeconds hash];
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
    uint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_22;
    }
LABEL_25:
    uint64_t v14 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_23;
    }
LABEL_26:
    uint64_t v15 = 0;
    return v30 ^ v31 ^ v29 ^ v27 ^ v28 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
  uint64_t v13 = 2654435761 * self->_userPersona;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_25;
  }
LABEL_22:
  uint64_t v14 = 2654435761 * self->_isSummarized;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_26;
  }
LABEL_23:
  uint64_t v15 = 2654435761 * self->_summarySourceType;
  return v30 ^ v31 ^ v29 ^ v27 ^ v28 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  __int16 v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_101;
  }
  unint64_t whichMessagesize = self->_whichMessagesize;
  if (whichMessagesize != [v4 whichMessagesize]) {
    goto LABEL_101;
  }
  unint64_t whichMessagecontext = self->_whichMessagecontext;
  if (whichMessagecontext != [v4 whichMessagecontext]) {
    goto LABEL_101;
  }
  $43EA71C45EF27CC8A4D45F36FE3240D2 has = self->_has;
  unsigned int v8 = v4[78];
  if ((*(unsigned char *)&has & 1) != (v8 & 1)) {
    goto LABEL_101;
  }
  if (*(unsigned char *)&has)
  {
    int messageType = self->_messageType;
    if (messageType != [v4 messageType]) {
      goto LABEL_101;
    }
    $43EA71C45EF27CC8A4D45F36FE3240D2 has = self->_has;
    unsigned int v8 = v4[78];
  }
  int v10 = (*(unsigned int *)&has >> 1) & 1;
  if (v10 != ((v8 >> 1) & 1)) {
    goto LABEL_101;
  }
  if (v10)
  {
    int emojiUsed = self->_emojiUsed;
    if (emojiUsed != [v4 emojiUsed]) {
      goto LABEL_101;
    }
    $43EA71C45EF27CC8A4D45F36FE3240D2 has = self->_has;
    unsigned int v8 = v4[78];
  }
  int v12 = (*(unsigned int *)&has >> 2) & 1;
  if (v12 != ((v8 >> 2) & 1)) {
    goto LABEL_101;
  }
  if (v12)
  {
    int keyboardUsed = self->_keyboardUsed;
    if (keyboardUsed != [v4 keyboardUsed]) {
      goto LABEL_101;
    }
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self recipientTypes];
  uint64_t v15 = [v4 recipientTypes];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_100;
  }
  uint64_t v16 = [(FLOWSchemaFLOWSmsContext *)self recipientTypes];
  if (v16)
  {
    unint64_t v17 = (void *)v16;
    uint64_t v18 = [(FLOWSchemaFLOWSmsContext *)self recipientTypes];
    uint64_t v19 = [v4 recipientTypes];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  unsigned int messageDurationMs = self->_messageDurationMs;
  if (messageDurationMs != [v4 messageDurationMs]) {
    goto LABEL_101;
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self textMessageLength];
  uint64_t v15 = [v4 textMessageLength];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_100;
  }
  uint64_t v22 = [(FLOWSchemaFLOWSmsContext *)self textMessageLength];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    unint64_t v24 = [(FLOWSchemaFLOWSmsContext *)self textMessageLength];
    unint64_t v25 = [v4 textMessageLength];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self textContext];
  uint64_t v15 = [v4 textContext];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_100;
  }
  uint64_t v27 = [(FLOWSchemaFLOWSmsContext *)self textContext];
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    uint64_t v29 = [(FLOWSchemaFLOWSmsContext *)self textContext];
    uint64_t v30 = [v4 textContext];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self audioContext];
  uint64_t v15 = [v4 audioContext];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_100;
  }
  uint64_t v32 = [(FLOWSchemaFLOWSmsContext *)self audioContext];
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    uint64_t v34 = [(FLOWSchemaFLOWSmsContext *)self audioContext];
    v35 = [v4 audioContext];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self personTypes];
  uint64_t v15 = [v4 personTypes];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_100;
  }
  uint64_t v37 = [(FLOWSchemaFLOWSmsContext *)self personTypes];
  if (v37)
  {
    id v38 = (void *)v37;
    uint64_t v39 = [(FLOWSchemaFLOWSmsContext *)self personTypes];
    uint64_t v40 = [v4 personTypes];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self readMessageTypes];
  uint64_t v15 = [v4 readMessageTypes];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_100;
  }
  uint64_t v42 = [(FLOWSchemaFLOWSmsContext *)self readMessageTypes];
  if (v42)
  {
    int v43 = (void *)v42;
    v44 = [(FLOWSchemaFLOWSmsContext *)self readMessageTypes];
    id v45 = [v4 readMessageTypes];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self isMultiLinguals];
  uint64_t v15 = [v4 isMultiLinguals];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_100;
  }
  uint64_t v47 = [(FLOWSchemaFLOWSmsContext *)self isMultiLinguals];
  if (v47)
  {
    uint64_t v48 = (void *)v47;
    v49 = [(FLOWSchemaFLOWSmsContext *)self isMultiLinguals];
    v50 = [v4 isMultiLinguals];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self isReadables];
  uint64_t v15 = [v4 isReadables];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_100;
  }
  uint64_t v52 = [(FLOWSchemaFLOWSmsContext *)self isReadables];
  if (v52)
  {
    v53 = (void *)v52;
    id v54 = [(FLOWSchemaFLOWSmsContext *)self isReadables];
    uint64_t v55 = [v4 isReadables];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self isGroupMessages];
  uint64_t v15 = [v4 isGroupMessages];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_100;
  }
  uint64_t v57 = [(FLOWSchemaFLOWSmsContext *)self isGroupMessages];
  if (v57)
  {
    v58 = (void *)v57;
    v59 = [(FLOWSchemaFLOWSmsContext *)self isGroupMessages];
    uint64_t v60 = [v4 isGroupMessages];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self languageConfidenceMatrix];
  uint64_t v15 = [v4 languageConfidenceMatrix];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_100;
  }
  uint64_t v62 = [(FLOWSchemaFLOWSmsContext *)self languageConfidenceMatrix];
  if (v62)
  {
    v63 = (void *)v62;
    v64 = [(FLOWSchemaFLOWSmsContext *)self languageConfidenceMatrix];
    v65 = [v4 languageConfidenceMatrix];
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  $43EA71C45EF27CC8A4D45F36FE3240D2 v67 = self->_has;
  int v68 = (*(unsigned int *)&v67 >> 3) & 1;
  unsigned int v69 = v4[78];
  if (v68 != ((v69 >> 3) & 1)) {
    goto LABEL_101;
  }
  if (v68)
  {
    int isSenderShortCode = self->_isSenderShortCode;
    if (isSenderShortCode != [v4 isSenderShortCode]) {
      goto LABEL_101;
    }
    $43EA71C45EF27CC8A4D45F36FE3240D2 v67 = self->_has;
    unsigned int v69 = v4[78];
  }
  int v71 = (*(unsigned int *)&v67 >> 4) & 1;
  if (v71 != ((v69 >> 4) & 1)) {
    goto LABEL_101;
  }
  if (v71)
  {
    int isLongMessage = self->_isLongMessage;
    if (isLongMessage != [v4 isLongMessage]) {
      goto LABEL_101;
    }
    $43EA71C45EF27CC8A4D45F36FE3240D2 v67 = self->_has;
    unsigned int v69 = v4[78];
  }
  int v73 = (*(unsigned int *)&v67 >> 5) & 1;
  if (v73 != ((v69 >> 5) & 1)) {
    goto LABEL_101;
  }
  if (v73)
  {
    int isReply = self->_isReply;
    if (isReply != [v4 isReply]) {
      goto LABEL_101;
    }
    $43EA71C45EF27CC8A4D45F36FE3240D2 v67 = self->_has;
    unsigned int v69 = v4[78];
  }
  int v75 = (*(unsigned int *)&v67 >> 6) & 1;
  if (v75 != ((v69 >> 6) & 1)) {
    goto LABEL_101;
  }
  if (v75)
  {
    int appendingActionReadMessagesCount = self->_appendingActionReadMessagesCount;
    if (appendingActionReadMessagesCount != [v4 appendingActionReadMessagesCount]) {
      goto LABEL_101;
    }
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self isSenderShortCodeLists];
  uint64_t v15 = [v4 isSenderShortCodeLists];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_100;
  }
  uint64_t v77 = [(FLOWSchemaFLOWSmsContext *)self isSenderShortCodeLists];
  if (v77)
  {
    uint64_t v78 = (void *)v77;
    uint64_t v79 = [(FLOWSchemaFLOWSmsContext *)self isSenderShortCodeLists];
    v80 = [v4 isSenderShortCodeLists];
    int v81 = [v79 isEqual:v80];

    if (!v81) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self isLongMessageLists];
  uint64_t v15 = [v4 isLongMessageLists];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_100;
  }
  uint64_t v82 = [(FLOWSchemaFLOWSmsContext *)self isLongMessageLists];
  if (v82)
  {
    v83 = (void *)v82;
    v84 = [(FLOWSchemaFLOWSmsContext *)self isLongMessageLists];
    v85 = [v4 isLongMessageLists];
    int v86 = [v84 isEqual:v85];

    if (!v86) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self richAttachmentIntelligenceFeatureUsage];
  uint64_t v15 = [v4 richAttachmentIntelligenceFeatureUsage];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_100;
  }
  uint64_t v87 = [(FLOWSchemaFLOWSmsContext *)self richAttachmentIntelligenceFeatureUsage];
  if (v87)
  {
    uint64_t v88 = (void *)v87;
    uint64_t v89 = [(FLOWSchemaFLOWSmsContext *)self richAttachmentIntelligenceFeatureUsage];
    v90 = [v4 richAttachmentIntelligenceFeatureUsage];
    int v91 = [v89 isEqual:v90];

    if (!v91) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self messageDurationsInSeconds];
  uint64_t v15 = [v4 messageDurationsInSeconds];
  if ((v14 == 0) == (v15 != 0))
  {
LABEL_100:

    goto LABEL_101;
  }
  uint64_t v92 = [(FLOWSchemaFLOWSmsContext *)self messageDurationsInSeconds];
  if (v92)
  {
    v93 = (void *)v92;
    v94 = [(FLOWSchemaFLOWSmsContext *)self messageDurationsInSeconds];
    v95 = [v4 messageDurationsInSeconds];
    int v96 = [v94 isEqual:v95];

    if (!v96) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  $43EA71C45EF27CC8A4D45F36FE3240D2 v99 = self->_has;
  int v100 = (*(unsigned int *)&v99 >> 7) & 1;
  unsigned int v101 = v4[78];
  if (v100 == ((v101 >> 7) & 1))
  {
    if (v100)
    {
      int userPersona = self->_userPersona;
      if (userPersona != [v4 userPersona]) {
        goto LABEL_101;
      }
      $43EA71C45EF27CC8A4D45F36FE3240D2 v99 = self->_has;
      unsigned int v101 = v4[78];
    }
    int v103 = (*(unsigned int *)&v99 >> 8) & 1;
    if (v103 == ((v101 >> 8) & 1))
    {
      if (v103)
      {
        int isSummarized = self->_isSummarized;
        if (isSummarized != [v4 isSummarized]) {
          goto LABEL_101;
        }
        $43EA71C45EF27CC8A4D45F36FE3240D2 v99 = self->_has;
        unsigned int v101 = v4[78];
      }
      int v105 = (*(unsigned int *)&v99 >> 9) & 1;
      if (v105 == ((v101 >> 9) & 1))
      {
        if (!v105
          || (int summarySourceType = self->_summarySourceType,
              summarySourceType == [v4 summarySourceType]))
        {
          BOOL v97 = 1;
          goto LABEL_102;
        }
      }
    }
  }
LABEL_101:
  BOOL v97 = 0;
LABEL_102:

  return v97;
}

- (void)writeTo:(id)a3
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v6 = self->_recipientTypes;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v95 objects:v107 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v96 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v95 + 1) + 8 * i) intValue];
        PBDataWriterWriteInt32Field();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v95 objects:v107 count:16];
    }
    while (v8);
  }

  if (self->_whichMessagesize == 6) {
    PBDataWriterWriteUint32Field();
  }
  unint64_t v11 = [(FLOWSchemaFLOWSmsContext *)self textMessageLength];

  if (v11)
  {
    int v12 = [(FLOWSchemaFLOWSmsContext *)self textMessageLength];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v13 = [(FLOWSchemaFLOWSmsContext *)self textContext];

  if (v13)
  {
    uint64_t v14 = [(FLOWSchemaFLOWSmsContext *)self textContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v15 = [(FLOWSchemaFLOWSmsContext *)self audioContext];

  if (v15)
  {
    uint64_t v16 = [(FLOWSchemaFLOWSmsContext *)self audioContext];
    PBDataWriterWriteSubmessage();
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  unint64_t v17 = self->_personTypes;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v91 objects:v106 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v92;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v92 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v91 + 1) + 8 * j) intValue];
        PBDataWriterWriteInt32Field();
      }
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v91 objects:v106 count:16];
    }
    while (v19);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v22 = self->_readMessageTypes;
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v87 objects:v105 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v88;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v88 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v87 + 1) + 8 * k) intValue];
        PBDataWriterWriteInt32Field();
      }
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v87 objects:v105 count:16];
    }
    while (v24);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v27 = self->_isMultiLinguals;
  uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v83 objects:v104 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v84;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v84 != v30) {
          objc_enumerationMutation(v27);
        }
        [*(id *)(*((void *)&v83 + 1) + 8 * m) BOOLValue];
        PBDataWriterWriteBOOLField();
      }
      uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v83 objects:v104 count:16];
    }
    while (v29);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v32 = self->_isReadables;
  uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v79 objects:v103 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v80;
    do
    {
      for (uint64_t n = 0; n != v34; ++n)
      {
        if (*(void *)v80 != v35) {
          objc_enumerationMutation(v32);
        }
        [*(id *)(*((void *)&v79 + 1) + 8 * n) BOOLValue];
        PBDataWriterWriteBOOLField();
      }
      uint64_t v34 = [(NSArray *)v32 countByEnumeratingWithState:&v79 objects:v103 count:16];
    }
    while (v34);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v37 = self->_isGroupMessages;
  uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v75 objects:v102 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v76;
    do
    {
      for (iuint64_t i = 0; ii != v39; ++ii)
      {
        if (*(void *)v76 != v40) {
          objc_enumerationMutation(v37);
        }
        [*(id *)(*((void *)&v75 + 1) + 8 * ii) BOOLValue];
        PBDataWriterWriteBOOLField();
      }
      uint64_t v39 = [(NSArray *)v37 countByEnumeratingWithState:&v75 objects:v102 count:16];
    }
    while (v39);
  }

  uint64_t v42 = [(FLOWSchemaFLOWSmsContext *)self languageConfidenceMatrix];

  if (v42)
  {
    int v43 = [(FLOWSchemaFLOWSmsContext *)self languageConfidenceMatrix];
    PBDataWriterWriteSubmessage();
  }
  __int16 v44 = (__int16)self->_has;
  if ((v44 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v44 = (__int16)self->_has;
    if ((v44 & 0x10) == 0)
    {
LABEL_59:
      if ((v44 & 0x20) == 0) {
        goto LABEL_60;
      }
      goto LABEL_95;
    }
  }
  else if ((v44 & 0x10) == 0)
  {
    goto LABEL_59;
  }
  PBDataWriterWriteBOOLField();
  __int16 v44 = (__int16)self->_has;
  if ((v44 & 0x20) == 0)
  {
LABEL_60:
    if ((v44 & 0x40) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_95:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_61:
  }
    PBDataWriterWriteInt32Field();
LABEL_62:
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v45 = self->_isSenderShortCodeLists;
  uint64_t v46 = [(NSArray *)v45 countByEnumeratingWithState:&v71 objects:v101 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v72;
    do
    {
      for (juint64_t j = 0; jj != v47; ++jj)
      {
        if (*(void *)v72 != v48) {
          objc_enumerationMutation(v45);
        }
        [*(id *)(*((void *)&v71 + 1) + 8 * jj) BOOLValue];
        PBDataWriterWriteBOOLField();
      }
      uint64_t v47 = [(NSArray *)v45 countByEnumeratingWithState:&v71 objects:v101 count:16];
    }
    while (v47);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v50 = self->_isLongMessageLists;
  uint64_t v51 = [(NSArray *)v50 countByEnumeratingWithState:&v67 objects:v100 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v68;
    do
    {
      for (kuint64_t k = 0; kk != v52; ++kk)
      {
        if (*(void *)v68 != v53) {
          objc_enumerationMutation(v50);
        }
        [*(id *)(*((void *)&v67 + 1) + 8 * kk) BOOLValue];
        PBDataWriterWriteBOOLField();
      }
      uint64_t v52 = [(NSArray *)v50 countByEnumeratingWithState:&v67 objects:v100 count:16];
    }
    while (v52);
  }

  uint64_t v55 = [(FLOWSchemaFLOWSmsContext *)self richAttachmentIntelligenceFeatureUsage];

  if (v55)
  {
    int v56 = [(FLOWSchemaFLOWSmsContext *)self richAttachmentIntelligenceFeatureUsage];
    PBDataWriterWriteSubmessage();
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v57 = self->_messageDurationsInSeconds;
  uint64_t v58 = [(NSArray *)v57 countByEnumeratingWithState:&v63 objects:v99 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v64;
    do
    {
      for (muint64_t m = 0; mm != v59; ++mm)
      {
        if (*(void *)v64 != v60) {
          objc_enumerationMutation(v57);
        }
        objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * mm), "unsignedLongLongValue", (void)v63);
        PBDataWriterWriteUint64Field();
      }
      uint64_t v59 = [(NSArray *)v57 countByEnumeratingWithState:&v63 objects:v99 count:16];
    }
    while (v59);
  }

  __int16 v62 = (__int16)self->_has;
  if ((v62 & 0x80) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      goto LABEL_87;
    }
LABEL_98:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      goto LABEL_89;
    }
    goto LABEL_88;
  }
  PBDataWriterWriteInt32Field();
  __int16 v62 = (__int16)self->_has;
  if ((v62 & 0x100) != 0) {
    goto LABEL_98;
  }
LABEL_87:
  if ((v62 & 0x200) != 0) {
LABEL_88:
  }
    PBDataWriterWriteInt32Field();
LABEL_89:
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWSmsContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteSummarySourceType
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasSummarySourceType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSummarySourceType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSummarySourceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int summarySourceType = a3;
}

- (void)deleteIsSummarized
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasIsSummarized:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsSummarized
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsSummarized:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int isSummarized = a3;
}

- (void)deleteUserPersona
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasUserPersona:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasUserPersona
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setUserPersona:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int userPersona = a3;
}

- (unint64_t)messageDurationsInSecondsAtIndex:(unint64_t)a3
{
  __int16 v3 = [(NSArray *)self->_messageDurationsInSeconds objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)messageDurationsInSecondsCount
{
  return [(NSArray *)self->_messageDurationsInSeconds count];
}

- (void)addMessageDurationsInSeconds:(unint64_t)a3
{
  messageDurationsInSeconds = self->_messageDurationsInSeconds;
  if (!messageDurationsInSeconds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_messageDurationsInSeconds;
    self->_messageDurationsInSeconds = v6;

    messageDurationsInSeconds = self->_messageDurationsInSeconds;
  }
  id v8 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSArray *)messageDurationsInSeconds addObject:v8];
}

- (void)clearMessageDurationsInSeconds
{
}

- (void)deleteRichAttachmentIntelligenceFeatureUsage
{
}

- (BOOL)hasRichAttachmentIntelligenceFeatureUsage
{
  return self->_richAttachmentIntelligenceFeatureUsage != 0;
}

- (BOOL)isLongMessageListAtIndex:(unint64_t)a3
{
  __int16 v3 = [(NSArray *)self->_isLongMessageLists objectAtIndexedSubscript:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)isLongMessageListCount
{
  return [(NSArray *)self->_isLongMessageLists count];
}

- (void)addIsLongMessageList:(BOOL)a3
{
  BOOL v3 = a3;
  isLongMessageLists = self->_isLongMessageLists;
  if (!isLongMessageLists)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_isLongMessageLists;
    self->_isLongMessageLists = v6;

    isLongMessageLists = self->_isLongMessageLists;
  }
  id v8 = [NSNumber numberWithBool:v3];
  [(NSArray *)isLongMessageLists addObject:v8];
}

- (void)clearIsLongMessageList
{
}

- (BOOL)isSenderShortCodeListAtIndex:(unint64_t)a3
{
  BOOL v3 = [(NSArray *)self->_isSenderShortCodeLists objectAtIndexedSubscript:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)isSenderShortCodeListCount
{
  return [(NSArray *)self->_isSenderShortCodeLists count];
}

- (void)addIsSenderShortCodeList:(BOOL)a3
{
  BOOL v3 = a3;
  isSenderShortCodeLists = self->_isSenderShortCodeLists;
  if (!isSenderShortCodeLists)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_isSenderShortCodeLists;
    self->_isSenderShortCodeLists = v6;

    isSenderShortCodeLists = self->_isSenderShortCodeLists;
  }
  id v8 = [NSNumber numberWithBool:v3];
  [(NSArray *)isSenderShortCodeLists addObject:v8];
}

- (void)clearIsSenderShortCodeList
{
}

- (void)deleteAppendingActionReadMessagesCount
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasAppendingActionReadMessagesCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasAppendingActionReadMessagesCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setAppendingActionReadMessagesCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int appendingActionReadMessagesCount = a3;
}

- (void)deleteIsReply
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasIsReply:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsReply
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsReply:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int isReply = a3;
}

- (void)deleteIsLongMessage
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasIsLongMessage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsLongMessage
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsLongMessage:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int isLongMessage = a3;
}

- (void)deleteIsSenderShortCode
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasIsSenderShortCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsSenderShortCode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setIsSenderShortCode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int isSenderShortCode = a3;
}

- (void)deleteLanguageConfidenceMatrix
{
}

- (BOOL)hasLanguageConfidenceMatrix
{
  return self->_languageConfidenceMatrix != 0;
}

- (BOOL)isGroupMessageAtIndex:(unint64_t)a3
{
  __int16 v3 = [(NSArray *)self->_isGroupMessages objectAtIndexedSubscript:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)isGroupMessageCount
{
  return [(NSArray *)self->_isGroupMessages count];
}

- (void)addIsGroupMessage:(BOOL)a3
{
  BOOL v3 = a3;
  isGroupMessages = self->_isGroupMessages;
  if (!isGroupMessages)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_isGroupMessages;
    self->_isGroupMessages = v6;

    isGroupMessages = self->_isGroupMessages;
  }
  id v8 = [NSNumber numberWithBool:v3];
  [(NSArray *)isGroupMessages addObject:v8];
}

- (void)clearIsGroupMessage
{
}

- (BOOL)isReadableAtIndex:(unint64_t)a3
{
  BOOL v3 = [(NSArray *)self->_isReadables objectAtIndexedSubscript:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)isReadableCount
{
  return [(NSArray *)self->_isReadables count];
}

- (void)addIsReadable:(BOOL)a3
{
  BOOL v3 = a3;
  isReadables = self->_isReadables;
  if (!isReadables)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_isReadables;
    self->_isReadables = v6;

    isReadables = self->_isReadables;
  }
  id v8 = [NSNumber numberWithBool:v3];
  [(NSArray *)isReadables addObject:v8];
}

- (void)clearIsReadable
{
}

- (BOOL)isMultiLingualAtIndex:(unint64_t)a3
{
  BOOL v3 = [(NSArray *)self->_isMultiLinguals objectAtIndexedSubscript:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)isMultiLingualCount
{
  return [(NSArray *)self->_isMultiLinguals count];
}

- (void)addIsMultiLingual:(BOOL)a3
{
  BOOL v3 = a3;
  isMultiLinguals = self->_isMultiLinguals;
  if (!isMultiLinguals)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_isMultiLinguals;
    self->_isMultiLinguals = v6;

    isMultiLinguals = self->_isMultiLinguals;
  }
  id v8 = [NSNumber numberWithBool:v3];
  [(NSArray *)isMultiLinguals addObject:v8];
}

- (void)clearIsMultiLingual
{
}

- (int)readMessageTypeAtIndex:(unint64_t)a3
{
  BOOL v3 = [(NSArray *)self->_readMessageTypes objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)readMessageTypeCount
{
  return [(NSArray *)self->_readMessageTypes count];
}

- (void)addReadMessageType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  readMessageTypes = self->_readMessageTypes;
  if (!readMessageTypes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_readMessageTypes;
    self->_readMessageTypes = v6;

    readMessageTypes = self->_readMessageTypes;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)readMessageTypes addObject:v8];
}

- (void)clearReadMessageType
{
}

- (int)personTypeAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_personTypes objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)personTypeCount
{
  return [(NSArray *)self->_personTypes count];
}

- (void)addPersonType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  personTypes = self->_personTypes;
  if (!personTypes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_personTypes;
    self->_personTypes = v6;

    personTypes = self->_personTypes;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)personTypes addObject:v8];
}

- (void)clearPersonType
{
}

- (void)deleteAudioContext
{
  if (self->_whichMessagecontext == 9)
  {
    self->_unint64_t whichMessagecontext = 0;
    self->_audioContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWSmsAudioContext)audioContext
{
  if (self->_whichMessagecontext == 9) {
    v2 = self->_audioContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAudioContext:(id)a3
{
  int v4 = (FLOWSchemaFLOWSmsAudioContext *)a3;
  textContext = self->_textContext;
  self->_textContext = 0;

  unint64_t v6 = 9;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichMessagecontext = v6;
  audioContext = self->_audioContext;
  self->_audioContext = v4;
}

- (void)deleteTextContext
{
  if (self->_whichMessagecontext == 8)
  {
    self->_unint64_t whichMessagecontext = 0;
    self->_textContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWSmsTextContext)textContext
{
  if (self->_whichMessagecontext == 8) {
    v2 = self->_textContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTextContext:(id)a3
{
  int v4 = (FLOWSchemaFLOWSmsTextContext *)a3;
  audioContext = self->_audioContext;
  self->_audioContext = 0;

  self->_unint64_t whichMessagecontext = 8 * (v4 != 0);
  textContext = self->_textContext;
  self->_textContext = v4;
}

- (void)deleteTextMessageLength
{
  if (self->_whichMessagesize == 7)
  {
    self->_unint64_t whichMessagesize = 0;
    self->_textMessageLength = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWTextMessageLength)textMessageLength
{
  if (self->_whichMessagesize == 7) {
    v2 = self->_textMessageLength;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTextMessageLength:(id)a3
{
  self->_unsigned int messageDurationMs = 0;
  unint64_t v3 = 7;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichMessagesize = v3;
  objc_storeStrong((id *)&self->_textMessageLength, a3);
}

- (void)deleteMessageDurationMs
{
  if (self->_whichMessagesize == 6)
  {
    self->_unint64_t whichMessagesize = 0;
    self->_unsigned int messageDurationMs = 0;
  }
}

- (unsigned)messageDurationMs
{
  if (self->_whichMessagesize == 6) {
    return self->_messageDurationMs;
  }
  else {
    return 0;
  }
}

- (void)setMessageDurationMs:(unsigned int)a3
{
  textMessageLength = self->_textMessageLength;
  self->_textMessageLength = 0;

  self->_unint64_t whichMessagesize = 6;
  self->_unsigned int messageDurationMs = a3;
}

- (int)recipientTypeAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(NSArray *)self->_recipientTypes objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)recipientTypeCount
{
  return [(NSArray *)self->_recipientTypes count];
}

- (void)addRecipientType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  recipientTypes = self->_recipientTypes;
  if (!recipientTypes)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_recipientTypes;
    self->_recipientTypes = v6;

    recipientTypes = self->_recipientTypes;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)recipientTypes addObject:v8];
}

- (void)clearRecipientType
{
}

- (void)deleteKeyboardUsed
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasKeyboardUsed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasKeyboardUsed
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setKeyboardUsed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int keyboardUsed = a3;
}

- (void)deleteEmojiUsed
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasEmojiUsed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasEmojiUsed
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setEmojiUsed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int emojiUsed = a3;
}

- (void)deleteMessageType
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasMessageType:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasMessageType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setMessageType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int messageType = a3;
}

@end