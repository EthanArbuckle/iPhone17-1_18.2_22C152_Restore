@interface FLOWSchemaFLOWDomainExecutionStarted
- (BOOL)hasDomainExecutionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWDomainExecutionStarted)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWDomainExecutionStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)domainExecutionType;
- (unint64_t)hash;
- (void)deleteDomainExecutionType;
- (void)setDomainExecutionType:(int)a3;
- (void)setHasDomainExecutionType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWDomainExecutionStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)domainExecutionType
{
  return self->_domainExecutionType;
}

- (FLOWSchemaFLOWDomainExecutionStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FLOWSchemaFLOWDomainExecutionStarted;
  v5 = [(FLOWSchemaFLOWDomainExecutionStarted *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"domainExecutionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWDomainExecutionStarted setDomainExecutionType:](v5, "setDomainExecutionType:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWDomainExecutionStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWDomainExecutionStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWDomainExecutionStarted *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    int v4 = [(FLOWSchemaFLOWDomainExecutionStarted *)self domainExecutionType];
    v5 = @"FLOWDOMAINEXECUTIONTYPE_UNKNOWN";
    if (v4 <= 399)
    {
      if (v4 <= 299)
      {
        switch(v4)
        {
          case 200:
            v5 = @"FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_INTENT_SELECTION";
            break;
          case 201:
            v5 = @"FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_NL_INTENT_CONVERTER";
            break;
          case 202:
            v5 = @"FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_ININTENT_CONVERTER";
            break;
          case 203:
            v5 = @"FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_SEND_HOMEKIT_COMMAND_CONTROL";
            break;
          case 204:
            v5 = @"FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_SEND_HOMEKIT_COMMAND_ACE";
            break;
          case 205:
            v5 = @"FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_SEND_HOMEKIT_COMMAND_CONFIGURE";
            break;
          case 206:
            v5 = @"FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_NATIVE_HOME_STORE_INITIALIZATION";
            break;
          case 207:
            v5 = @"FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_MODIFYING_INTENT";
            break;
          case 208:
            v5 = @"FLOWDOMAINEXECUTIONTYPE_HOME_AUTOMATION_BLOCKING_INTENT";
            break;
          default:
            switch(v4)
            {
              case 'd':
                v5 = @"FLOWDOMAINEXECUTIONTYPE_MESSAGE_READ_ACTION_SPEECH_API";
                break;
              case 'e':
                v5 = @"FLOWDOMAINEXECUTIONTYPE_MESSAGE_SHARING_LINK_PRESENTATION";
                break;
              case 'f':
                v5 = @"FLOWDOMAINEXECUTIONTYPE_MESSAGE_ONE_SHOT_AUTO_PUNCTUATION_CESRFORMATTER";
                break;
              case 'g':
                v5 = @"FLOWDOMAINEXECUTIONTYPE_MESSAGE_WFON_SCREEN_CONTENT_EXTRACTION";
                break;
              case 'h':
                v5 = @"FLOWDOMAINEXECUTIONTYPE_MESSAGE_NOW_PLAYING_QUEUE_FETCH";
                break;
              default:
                goto LABEL_14;
            }
            break;
        }
      }
      else
      {
        v6 = @"FLOWDOMAINEXECUTIONTYPE_PHONE_RESOLVE_CRR";
        uint64_t v7 = @"FLOWDOMAINEXECUTIONTYPE_PHONE_FACETIME_MESSAGE";
        v8 = @"FLOWDOMAINEXECUTIONTYPE_PHONE_RESOLVE_SRR";
        if (v4 != 302) {
          v8 = @"FLOWDOMAINEXECUTIONTYPE_UNKNOWN";
        }
        if (v4 != 301) {
          uint64_t v7 = v8;
        }
        BOOL v9 = v4 == 300;
LABEL_11:
        if (v9) {
          v5 = v6;
        }
        else {
          v5 = v7;
        }
      }
    }
    else
    {
      switch(v4)
      {
        case 1000:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_AIRPLAY_DEVICE_SEARCH";
          break;
        case 1001:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_AIRPLAY_SET_AUDIO_SESSION_CATEGORY";
          break;
        case 1002:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_RECON_SESSION_CREATE_W_ENDPOINT_FEATURES";
          break;
        case 1003:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_RECON_SESSION_SET_TARGET_AUDIO_SESSION_ID";
          break;
        case 1004:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_AIRPLAY_SET_OUTPUT_DEVICES";
          break;
        case 1005:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_MEDIAREMOTE_SEND_QUEUE";
          break;
        case 1006:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_MEDIAREMOTE_PLAY";
          break;
        case 1007:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_AMS_PURCHASE";
          break;
        case 1008:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_SHAZAM_PERFORM_MATCH";
          break;
        case 1009:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_CLIENT_CONTEXT_SIGNAL";
          break;
        case 1010:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_COMPOUND_SIGNAL";
          break;
        case 1011:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_ENTITY_SEARCH_SIGNAL";
          break;
        case 1012:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_FOREGROUP_APP_SIGNAL";
          break;
        case 1013:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_INTENT_MEDIA_SIGNAL";
          break;
        case 1014:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_LAST_NOW_PLAYING_SIGNAL";
          break;
        case 1015:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_NOW_PLAYING_APP_SIGNAL";
          break;
        case 1016:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_NOW_PLAYING_STATE_SIGNAL";
          break;
        case 1017:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_NOW_PLAYING_USAGE_SIGNAL";
          break;
        case 1018:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_PRIVATE_INTENT_DATA_SIGNAL";
          break;
        case 1019:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_SELECTED_APP_SIGNAL";
          break;
        case 1020:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_SUPPORTED_MEDIA_SIGNAL";
          break;
        case 1021:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_USER_CONTEXT_SIGNAL";
          break;
        case 1022:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_MEGA_MODEL_LAST_NOW_PLAYING_SIGNAL";
          break;
        case 1023:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_MEGA_MODEL_NOW_PLAYING_COUNT_SIGNAL";
          break;
        case 1024:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_MEGA_MODEL_NOW_PLAYING_RECENCY_SIGNAL";
          break;
        case 1025:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_PIRENE_REQUEST_SIGNAL";
          break;
        case 1026:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_LIVE_ACTIVITY_WAIT";
          break;
        case 1027:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_TIMER_ALARM_MOBILE_TIMER_WAIT";
          break;
        case 1028:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_TIMER_ALARM_COORDINATION_WAIT";
          break;
        case 1029:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_BOLT_ENABLED_SIGNAL";
          break;
        case 1030:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_USER_RECOGNIZED_SIGNAL";
          break;
        case 1031:
          v5 = @"FLOWDOMAINEXECUTIONTYPE_MEDIAPLAYER_APP_SELECTION_FREE_MEDIA_CONTENT_SIGNAL";
          break;
        default:
          v6 = @"FLOWDOMAINEXECUTIONTYPE_VOICESHORTCUTS_SHORTCUT_EVENT_WAIT";
          uint64_t v7 = @"FLOWDOMAINEXECUTIONTYPE_VOICESHORTCUTS_LINK_EVENT_WAIT";
          if (v4 != 401) {
            uint64_t v7 = @"FLOWDOMAINEXECUTIONTYPE_UNKNOWN";
          }
          BOOL v9 = v4 == 400;
          goto LABEL_11;
      }
    }
LABEL_14:
    [v3 setObject:v5 forKeyedSubscript:@"domainExecutionType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_domainExecutionType;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int domainExecutionType = self->_domainExecutionType,
            domainExecutionType == [v4 domainExecutionType]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWDomainExecutionStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteDomainExecutionType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDomainExecutionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDomainExecutionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDomainExecutionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int domainExecutionType = a3;
}

@end