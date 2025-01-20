@interface ICIAMApplicationMessage
+ (Class)contentPagesType;
+ (Class)presentationTriggersType;
+ (Class)targetType;
- (BOOL)carousel;
- (BOOL)hasApplicationBadge;
- (BOOL)hasAssetPrefetchStrategy;
- (BOOL)hasCarousel;
- (BOOL)hasCloseButton;
- (BOOL)hasEndDate;
- (BOOL)hasGlobalPresentationPolicyGroup;
- (BOOL)hasHasCloseButton;
- (BOOL)hasHoldoutEvent;
- (BOOL)hasIdentifier;
- (BOOL)hasImpressionEvent;
- (BOOL)hasLocalNotification;
- (BOOL)hasMaximumDisplays;
- (BOOL)hasMessageType;
- (BOOL)hasModalPresentationStyle;
- (BOOL)hasPriority;
- (BOOL)hasReportingEnabled;
- (BOOL)hasRule;
- (BOOL)hasStartDate;
- (BOOL)hasTemplateURL;
- (BOOL)hasWebArchiveURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)reportingEnabled;
- (ICIAMApplicationBadge)applicationBadge;
- (ICIAMLocalNotification)localNotification;
- (ICIAMMessageRule)rule;
- (ICIAMMetricEvent)holdoutEvent;
- (ICIAMMetricEvent)impressionEvent;
- (NSMutableArray)contentPages;
- (NSMutableArray)presentationTriggers;
- (NSMutableArray)targets;
- (NSString)identifier;
- (NSString)templateURL;
- (NSString)webArchiveURL;
- (double)endDate;
- (double)startDate;
- (id)assetPrefetchStrategyAsString:(int)a3;
- (id)contentPagesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)globalPresentationPolicyGroupAsString:(int)a3;
- (id)messageTypeAsString:(int)a3;
- (id)modalPresentationStyleAsString:(int)a3;
- (id)presentationTriggersAtIndex:(unint64_t)a3;
- (id)targetAtIndex:(unint64_t)a3;
- (int)StringAsAssetPrefetchStrategy:(id)a3;
- (int)StringAsGlobalPresentationPolicyGroup:(id)a3;
- (int)StringAsMessageType:(id)a3;
- (int)StringAsModalPresentationStyle:(id)a3;
- (int)assetPrefetchStrategy;
- (int)globalPresentationPolicyGroup;
- (int)maximumDisplays;
- (int)messageType;
- (int)modalPresentationStyle;
- (int)priority;
- (unint64_t)contentPagesCount;
- (unint64_t)hash;
- (unint64_t)presentationTriggersCount;
- (unint64_t)targetsCount;
- (void)addContentPages:(id)a3;
- (void)addPresentationTriggers:(id)a3;
- (void)addTarget:(id)a3;
- (void)clearContentPages;
- (void)clearPresentationTriggers;
- (void)clearTargets;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationBadge:(id)a3;
- (void)setAssetPrefetchStrategy:(int)a3;
- (void)setCarousel:(BOOL)a3;
- (void)setContentPages:(id)a3;
- (void)setEndDate:(double)a3;
- (void)setGlobalPresentationPolicyGroup:(int)a3;
- (void)setHasAssetPrefetchStrategy:(BOOL)a3;
- (void)setHasCarousel:(BOOL)a3;
- (void)setHasCloseButton:(BOOL)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasGlobalPresentationPolicyGroup:(BOOL)a3;
- (void)setHasHasCloseButton:(BOOL)a3;
- (void)setHasMaximumDisplays:(BOOL)a3;
- (void)setHasMessageType:(BOOL)a3;
- (void)setHasModalPresentationStyle:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasReportingEnabled:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setHoldoutEvent:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImpressionEvent:(id)a3;
- (void)setLocalNotification:(id)a3;
- (void)setMaximumDisplays:(int)a3;
- (void)setMessageType:(int)a3;
- (void)setModalPresentationStyle:(int)a3;
- (void)setPresentationTriggers:(id)a3;
- (void)setPriority:(int)a3;
- (void)setReportingEnabled:(BOOL)a3;
- (void)setRule:(id)a3;
- (void)setStartDate:(double)a3;
- (void)setTargets:(id)a3;
- (void)setTemplateURL:(id)a3;
- (void)setWebArchiveURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMApplicationMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webArchiveURL, 0);
  objc_storeStrong((id *)&self->_templateURL, 0);
  objc_storeStrong((id *)&self->_targets, 0);
  objc_storeStrong((id *)&self->_rule, 0);
  objc_storeStrong((id *)&self->_presentationTriggers, 0);
  objc_storeStrong((id *)&self->_localNotification, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_holdoutEvent, 0);
  objc_storeStrong((id *)&self->_contentPages, 0);

  objc_storeStrong((id *)&self->_applicationBadge, 0);
}

- (void)setApplicationBadge:(id)a3
{
}

- (ICIAMApplicationBadge)applicationBadge
{
  return self->_applicationBadge;
}

- (void)setPresentationTriggers:(id)a3
{
}

- (NSMutableArray)presentationTriggers
{
  return self->_presentationTriggers;
}

- (void)setImpressionEvent:(id)a3
{
}

- (ICIAMMetricEvent)impressionEvent
{
  return self->_impressionEvent;
}

- (void)setLocalNotification:(id)a3
{
}

- (ICIAMLocalNotification)localNotification
{
  return self->_localNotification;
}

- (void)setHoldoutEvent:(id)a3
{
}

- (ICIAMMetricEvent)holdoutEvent
{
  return self->_holdoutEvent;
}

- (void)setWebArchiveURL:(id)a3
{
}

- (NSString)webArchiveURL
{
  return self->_webArchiveURL;
}

- (void)setRule:(id)a3
{
}

- (ICIAMMessageRule)rule
{
  return self->_rule;
}

- (void)setContentPages:(id)a3
{
}

- (NSMutableArray)contentPages
{
  return self->_contentPages;
}

- (double)endDate
{
  return self->_endDate;
}

- (double)startDate
{
  return self->_startDate;
}

- (int)maximumDisplays
{
  return self->_maximumDisplays;
}

- (void)setTemplateURL:(id)a3
{
}

- (NSString)templateURL
{
  return self->_templateURL;
}

- (int)priority
{
  return self->_priority;
}

- (void)setTargets:(id)a3
{
}

- (NSMutableArray)targets
{
  return self->_targets;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[ICIAMApplicationMessage setIdentifier:](self, "setIdentifier:");
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = *((id *)v4 + 16);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ICIAMApplicationMessage *)self addTarget:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v7);
  }

  __int16 v10 = *((_WORD *)v4 + 78);
  if ((v10 & 0x20) != 0)
  {
    self->_messageType = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v10 = *((_WORD *)v4 + 78);
    if ((v10 & 0x100) == 0)
    {
LABEL_12:
      if ((v10 & 0x80) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*((_WORD *)v4 + 78) & 0x100) == 0)
  {
    goto LABEL_12;
  }
  self->_carousel = *((unsigned char *)v4 + 152);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 78) & 0x80) != 0)
  {
LABEL_13:
    self->_priority = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_14:
  if (*((void *)v4 + 17)) {
    -[ICIAMApplicationMessage setTemplateURL:](self, "setTemplateURL:");
  }
  __int16 v11 = *((_WORD *)v4 + 78);
  if ((v11 & 0x10) != 0)
  {
    self->_maximumDisplays = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v11 = *((_WORD *)v4 + 78);
    if ((v11 & 2) == 0)
    {
LABEL_18:
      if ((v11 & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_36;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_18;
  }
  self->_startDate = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v11 = *((_WORD *)v4 + 78);
  if ((v11 & 1) == 0)
  {
LABEL_19:
    if ((v11 & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_36:
  self->_endDate = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 78) & 0x200) != 0)
  {
LABEL_20:
    self->_hasCloseButton = *((unsigned char *)v4 + 153);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_21:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v12 = *((id *)v4 + 5);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v12);
        }
        [(ICIAMApplicationMessage *)self addContentPages:*(void *)(*((void *)&v37 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v14);
  }

  rule = self->_rule;
  uint64_t v18 = *((void *)v4 + 15);
  if (rule)
  {
    if (v18) {
      -[ICIAMMessageRule mergeFrom:](rule, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[ICIAMApplicationMessage setRule:](self, "setRule:");
  }
  if (*((void *)v4 + 18)) {
    -[ICIAMApplicationMessage setWebArchiveURL:](self, "setWebArchiveURL:");
  }
  __int16 v19 = *((_WORD *)v4 + 78);
  if ((v19 & 0x40) != 0)
  {
    self->_modalPresentationStyle = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v19 = *((_WORD *)v4 + 78);
    if ((v19 & 8) == 0)
    {
LABEL_44:
      if ((v19 & 4) == 0) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }
  }
  else if ((v19 & 8) == 0)
  {
    goto LABEL_44;
  }
  self->_globalPresentationPolicyGroup = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 78) & 4) != 0)
  {
LABEL_45:
    self->_assetPrefetchStrategy = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_46:
  holdoutEvent = self->_holdoutEvent;
  uint64_t v21 = *((void *)v4 + 7);
  if (holdoutEvent)
  {
    if (v21) {
      -[ICIAMMetricEvent mergeFrom:](holdoutEvent, "mergeFrom:");
    }
  }
  else if (v21)
  {
    [(ICIAMApplicationMessage *)self setHoldoutEvent:"setHoldoutEvent:"];
  }
  localNotification = self->_localNotification;
  uint64_t v23 = *((void *)v4 + 10);
  if (localNotification)
  {
    if (v23) {
      -[ICIAMLocalNotification mergeFrom:](localNotification, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[ICIAMApplicationMessage setLocalNotification:](self, "setLocalNotification:");
  }
  impressionEvent = self->_impressionEvent;
  uint64_t v25 = *((void *)v4 + 9);
  if (impressionEvent)
  {
    if (v25) {
      -[ICIAMMetricEvent mergeFrom:](impressionEvent, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[ICIAMApplicationMessage setImpressionEvent:](self, "setImpressionEvent:");
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v26 = *((id *)v4 + 13);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        -[ICIAMApplicationMessage addPresentationTriggers:](self, "addPresentationTriggers:", *(void *)(*((void *)&v33 + 1) + 8 * k), (void)v33);
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v28);
  }

  applicationBadge = self->_applicationBadge;
  uint64_t v32 = *((void *)v4 + 3);
  if (applicationBadge)
  {
    if (v32) {
      -[ICIAMApplicationBadge mergeFrom:](applicationBadge, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[ICIAMApplicationMessage setApplicationBadge:](self, "setApplicationBadge:");
  }
  if ((*((_WORD *)v4 + 78) & 0x400) != 0)
  {
    self->_reportingEnabled = *((unsigned char *)v4 + 154);
    *(_WORD *)&self->_has |= 0x400u;
  }
}

- (unint64_t)hash
{
  NSUInteger v38 = [(NSString *)self->_identifier hash];
  uint64_t v37 = [(NSMutableArray *)self->_targets hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
    uint64_t v36 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v35 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v36 = 2654435761 * self->_messageType;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v35 = 2654435761 * self->_carousel;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v34 = 2654435761 * self->_priority;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v34 = 0;
LABEL_8:
  NSUInteger v33 = [(NSString *)self->_templateURL hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x10) != 0)
  {
    uint64_t v32 = 2654435761 * self->_maximumDisplays;
    if ((v4 & 2) != 0) {
      goto LABEL_10;
    }
LABEL_15:
    unint64_t v9 = 0;
    goto LABEL_18;
  }
  uint64_t v32 = 0;
  if ((v4 & 2) == 0) {
    goto LABEL_15;
  }
LABEL_10:
  double startDate = self->_startDate;
  double v6 = -startDate;
  if (startDate >= 0.0) {
    double v6 = self->_startDate;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_18:
  if (v4)
  {
    double endDate = self->_endDate;
    double v12 = -endDate;
    if (endDate >= 0.0) {
      double v12 = self->_endDate;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  unint64_t v30 = v10;
  if ((v4 & 0x200) != 0) {
    uint64_t v29 = 2654435761 * self->_hasCloseButton;
  }
  else {
    uint64_t v29 = 0;
  }
  unint64_t v31 = v9;
  uint64_t v28 = [(NSMutableArray *)self->_contentPages hash];
  unint64_t v27 = [(ICIAMMessageRule *)self->_rule hash];
  NSUInteger v26 = [(NSString *)self->_webArchiveURL hash];
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x40) == 0)
  {
    uint64_t v16 = 0;
    if ((v15 & 8) != 0) {
      goto LABEL_31;
    }
LABEL_34:
    uint64_t v17 = 0;
    if ((v15 & 4) != 0) {
      goto LABEL_32;
    }
    goto LABEL_35;
  }
  uint64_t v16 = 2654435761 * self->_modalPresentationStyle;
  if ((v15 & 8) == 0) {
    goto LABEL_34;
  }
LABEL_31:
  uint64_t v17 = 2654435761 * self->_globalPresentationPolicyGroup;
  if ((v15 & 4) != 0)
  {
LABEL_32:
    uint64_t v18 = 2654435761 * self->_assetPrefetchStrategy;
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v18 = 0;
LABEL_36:
  unint64_t v19 = [(ICIAMMetricEvent *)self->_holdoutEvent hash];
  unint64_t v20 = [(ICIAMLocalNotification *)self->_localNotification hash];
  unint64_t v21 = [(ICIAMMetricEvent *)self->_impressionEvent hash];
  uint64_t v22 = [(NSMutableArray *)self->_presentationTriggers hash];
  unint64_t v23 = [(ICIAMApplicationBadge *)self->_applicationBadge hash];
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    uint64_t v24 = 2654435761 * self->_reportingEnabled;
  }
  else {
    uint64_t v24 = 0;
  }
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_84;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_84;
    }
  }
  targets = self->_targets;
  if ((unint64_t)targets | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](targets, "isEqual:")) {
      goto LABEL_84;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 78);
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_messageType != *((_DWORD *)v4 + 23)) {
      goto LABEL_84;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 78) & 0x100) == 0) {
      goto LABEL_84;
    }
    if (self->_carousel)
    {
      if (!*((unsigned char *)v4 + 152)) {
        goto LABEL_84;
      }
    }
    else if (*((unsigned char *)v4 + 152))
    {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 78) & 0x100) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_priority != *((_DWORD *)v4 + 28)) {
      goto LABEL_84;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_84;
  }
  templateURL = self->_templateURL;
  if ((unint64_t)templateURL | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](templateURL, "isEqual:")) {
      goto LABEL_84;
    }
    __int16 has = (__int16)self->_has;
    __int16 v8 = *((_WORD *)v4 + 78);
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_maximumDisplays != *((_DWORD *)v4 + 22)) {
      goto LABEL_84;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_startDate != *((double *)v4 + 2)) {
      goto LABEL_84;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_84;
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_endDate != *((double *)v4 + 1)) {
      goto LABEL_84;
    }
  }
  else if (v8)
  {
    goto LABEL_84;
  }
  if ((has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0) {
      goto LABEL_84;
    }
    if (self->_hasCloseButton)
    {
      if (!*((unsigned char *)v4 + 153)) {
        goto LABEL_84;
      }
    }
    else if (*((unsigned char *)v4 + 153))
    {
      goto LABEL_84;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_84;
  }
  contentPages = self->_contentPages;
  if ((unint64_t)contentPages | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](contentPages, "isEqual:"))
  {
    goto LABEL_84;
  }
  rule = self->_rule;
  if ((unint64_t)rule | *((void *)v4 + 15))
  {
    if (!-[ICIAMMessageRule isEqual:](rule, "isEqual:")) {
      goto LABEL_84;
    }
  }
  webArchiveURL = self->_webArchiveURL;
  if ((unint64_t)webArchiveURL | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](webArchiveURL, "isEqual:")) {
      goto LABEL_84;
    }
  }
  __int16 v13 = (__int16)self->_has;
  __int16 v14 = *((_WORD *)v4 + 78);
  if ((v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_modalPresentationStyle != *((_DWORD *)v4 + 24)) {
      goto LABEL_84;
    }
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_84;
  }
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_globalPresentationPolicyGroup != *((_DWORD *)v4 + 12)) {
      goto LABEL_84;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_84;
  }
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_assetPrefetchStrategy != *((_DWORD *)v4 + 8)) {
      goto LABEL_84;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_84;
  }
  holdoutEvent = self->_holdoutEvent;
  if ((unint64_t)holdoutEvent | *((void *)v4 + 7) && !-[ICIAMMetricEvent isEqual:](holdoutEvent, "isEqual:")) {
    goto LABEL_84;
  }
  localNotification = self->_localNotification;
  if ((unint64_t)localNotification | *((void *)v4 + 10))
  {
    if (!-[ICIAMLocalNotification isEqual:](localNotification, "isEqual:")) {
      goto LABEL_84;
    }
  }
  impressionEvent = self->_impressionEvent;
  if ((unint64_t)impressionEvent | *((void *)v4 + 9))
  {
    if (!-[ICIAMMetricEvent isEqual:](impressionEvent, "isEqual:")) {
      goto LABEL_84;
    }
  }
  presentationTriggers = self->_presentationTriggers;
  if ((unint64_t)presentationTriggers | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](presentationTriggers, "isEqual:")) {
      goto LABEL_84;
    }
  }
  applicationBadge = self->_applicationBadge;
  if ((unint64_t)applicationBadge | *((void *)v4 + 3))
  {
    if (!-[ICIAMApplicationBadge isEqual:](applicationBadge, "isEqual:")) {
      goto LABEL_84;
    }
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 78) & 0x400) != 0)
    {
      if (self->_reportingEnabled)
      {
        if (!*((unsigned char *)v4 + 154)) {
          goto LABEL_84;
        }
      }
      else if (*((unsigned char *)v4 + 154))
      {
        goto LABEL_84;
      }
      BOOL v20 = 1;
      goto LABEL_85;
    }
LABEL_84:
    BOOL v20 = 0;
    goto LABEL_85;
  }
  BOOL v20 = (*((_WORD *)v4 + 78) & 0x400) == 0;
LABEL_85:

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  long double v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  __int16 v8 = self->_targets;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = (void *)[*(id *)(*((void *)&v52 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addTarget:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v10);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_messageType;
    *(_WORD *)(v5 + 156) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_10:
      if ((has & 0x80) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_10;
  }
  *(unsigned char *)(v5 + 152) = self->_carousel;
  *(_WORD *)(v5 + 156) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 112) = self->_priority;
    *(_WORD *)(v5 + 156) |= 0x80u;
  }
LABEL_12:
  uint64_t v15 = [(NSString *)self->_templateURL copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v15;

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_maximumDisplays;
    *(_WORD *)(v5 + 156) |= 0x10u;
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 2) == 0)
    {
LABEL_14:
      if ((v17 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_43;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_14;
  }
  *(double *)(v5 + 16) = self->_startDate;
  *(_WORD *)(v5 + 156) |= 2u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 1) == 0)
  {
LABEL_15:
    if ((v17 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_43:
  *(double *)(v5 + 8) = self->_endDate;
  *(_WORD *)(v5 + 156) |= 1u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_16:
    *(unsigned char *)(v5 + 153) = self->_hasCloseButton;
    *(_WORD *)(v5 + 156) |= 0x200u;
  }
LABEL_17:
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v18 = self->_contentPages;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v49 != v21) {
          objc_enumerationMutation(v18);
        }
        unint64_t v23 = (void *)[*(id *)(*((void *)&v48 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addContentPages:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v20);
  }

  id v24 = [(ICIAMMessageRule *)self->_rule copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v24;

  uint64_t v26 = [(NSString *)self->_webArchiveURL copyWithZone:a3];
  unint64_t v27 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v26;

  __int16 v28 = (__int16)self->_has;
  if ((v28 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_modalPresentationStyle;
    *(_WORD *)(v5 + 156) |= 0x40u;
    __int16 v28 = (__int16)self->_has;
    if ((v28 & 8) == 0)
    {
LABEL_26:
      if ((v28 & 4) == 0) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
  }
  else if ((v28 & 8) == 0)
  {
    goto LABEL_26;
  }
  *(_DWORD *)(v5 + 48) = self->_globalPresentationPolicyGroup;
  *(_WORD *)(v5 + 156) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_27:
    *(_DWORD *)(v5 + 32) = self->_assetPrefetchStrategy;
    *(_WORD *)(v5 + 156) |= 4u;
  }
LABEL_28:
  id v29 = [(ICIAMMetricEvent *)self->_holdoutEvent copyWithZone:a3];
  unint64_t v30 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v29;

  id v31 = [(ICIAMLocalNotification *)self->_localNotification copyWithZone:a3];
  uint64_t v32 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v31;

  id v33 = [(ICIAMMetricEvent *)self->_impressionEvent copyWithZone:a3];
  uint64_t v34 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v33;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v35 = self->_presentationTriggers;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v45;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v45 != v38) {
          objc_enumerationMutation(v35);
        }
        long long v40 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * k), "copyWithZone:", a3, (void)v44);
        [(id)v5 addPresentationTriggers:v40];
      }
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v37);
  }

  id v41 = [(ICIAMApplicationBadge *)self->_applicationBadge copyWithZone:a3];
  long long v42 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v41;

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 154) = self->_reportingEnabled;
    *(_WORD *)(v5 + 156) |= 0x400u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v21 = a3;
  if (self->_identifier) {
    objc_msgSend(v21, "setIdentifier:");
  }
  if ([(ICIAMApplicationMessage *)self targetsCount])
  {
    [v21 clearTargets];
    unint64_t v4 = [(ICIAMApplicationMessage *)self targetsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        long double v7 = [(ICIAMApplicationMessage *)self targetAtIndex:i];
        [v21 addTarget:v7];
      }
    }
  }
  __int16 has = (__int16)self->_has;
  uint64_t v9 = v21;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v21 + 23) = self->_messageType;
    *((_WORD *)v21 + 78) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v21 + 152) = self->_carousel;
  *((_WORD *)v21 + 78) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_10:
    *((_DWORD *)v21 + 28) = self->_priority;
    *((_WORD *)v21 + 78) |= 0x80u;
  }
LABEL_11:
  if (self->_templateURL)
  {
    objc_msgSend(v21, "setTemplateURL:");
    uint64_t v9 = v21;
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x10) != 0)
  {
    v9[22] = self->_maximumDisplays;
    *((_WORD *)v9 + 78) |= 0x10u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_15:
      if ((v10 & 1) == 0) {
        goto LABEL_16;
      }
LABEL_52:
      *((void *)v9 + 1) = *(void *)&self->_endDate;
      *((_WORD *)v9 + 78) |= 1u;
      if ((*(_WORD *)&self->_has & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_15;
  }
  *((void *)v9 + 2) = *(void *)&self->_startDate;
  *((_WORD *)v9 + 78) |= 2u;
  __int16 v10 = (__int16)self->_has;
  if (v10) {
    goto LABEL_52;
  }
LABEL_16:
  if ((v10 & 0x200) != 0)
  {
LABEL_17:
    *((unsigned char *)v9 + 153) = self->_hasCloseButton;
    *((_WORD *)v9 + 78) |= 0x200u;
  }
LABEL_18:
  if ([(ICIAMApplicationMessage *)self contentPagesCount])
  {
    [v21 clearContentPages];
    unint64_t v11 = [(ICIAMApplicationMessage *)self contentPagesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        __int16 v14 = [(ICIAMApplicationMessage *)self contentPagesAtIndex:j];
        [v21 addContentPages:v14];
      }
    }
  }
  if (self->_rule) {
    objc_msgSend(v21, "setRule:");
  }
  uint64_t v15 = v21;
  if (self->_webArchiveURL)
  {
    objc_msgSend(v21, "setWebArchiveURL:");
    uint64_t v15 = v21;
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x40) != 0)
  {
    v15[24] = self->_modalPresentationStyle;
    *((_WORD *)v15 + 78) |= 0x40u;
    __int16 v16 = (__int16)self->_has;
    if ((v16 & 8) == 0)
    {
LABEL_28:
      if ((v16 & 4) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((v16 & 8) == 0)
  {
    goto LABEL_28;
  }
  v15[12] = self->_globalPresentationPolicyGroup;
  *((_WORD *)v15 + 78) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_29:
    v15[8] = self->_assetPrefetchStrategy;
    *((_WORD *)v15 + 78) |= 4u;
  }
LABEL_30:
  if (self->_holdoutEvent) {
    objc_msgSend(v21, "setHoldoutEvent:");
  }
  if (self->_localNotification) {
    objc_msgSend(v21, "setLocalNotification:");
  }
  if (self->_impressionEvent) {
    objc_msgSend(v21, "setImpressionEvent:");
  }
  if ([(ICIAMApplicationMessage *)self presentationTriggersCount])
  {
    [v21 clearPresentationTriggers];
    unint64_t v17 = [(ICIAMApplicationMessage *)self presentationTriggersCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t k = 0; k != v18; ++k)
      {
        uint64_t v20 = [(ICIAMApplicationMessage *)self presentationTriggersAtIndex:k];
        [v21 addPresentationTriggers:v20];
      }
    }
  }
  if (self->_applicationBadge) {
    objc_msgSend(v21, "setApplicationBadge:");
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((unsigned char *)v21 + 154) = self->_reportingEnabled;
    *((_WORD *)v21 + 78) |= 0x400u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unint64_t v5 = self->_targets;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_12:
      if ((has & 0x80) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_13:
  }
    PBDataWriterWriteInt32Field();
LABEL_14:
  if (self->_templateURL) {
    PBDataWriterWriteStringField();
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_18:
      if ((v11 & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_59;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteDoubleField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 1) == 0)
  {
LABEL_19:
    if ((v11 & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_59:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_20:
  }
    PBDataWriterWriteBOOLField();
LABEL_21:
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unint64_t v12 = self->_contentPages;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v14);
  }

  if (self->_rule) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_webArchiveURL) {
    PBDataWriterWriteStringField();
  }
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 8) == 0)
    {
LABEL_34:
      if ((v17 & 4) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
  }
  else if ((v17 & 8) == 0)
  {
    goto LABEL_34;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_35:
  }
    PBDataWriterWriteInt32Field();
LABEL_36:
  if (self->_holdoutEvent) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_localNotification) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_impressionEvent) {
    PBDataWriterWriteSubmessage();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v18 = self->_presentationTriggers;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v20);
  }

  if (self->_applicationBadge) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMApplicationMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  targets = self->_targets;
  if (targets) {
    [v4 setObject:targets forKey:@"target"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t messageType = self->_messageType;
    if messageType < 5 && ((0x17u >> messageType))
    {
      uint64_t v9 = off_1E5AC6E10[messageType];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_messageType);
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v4 setObject:v9 forKey:@"messageType"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    __int16 v10 = [NSNumber numberWithBool:self->_carousel];
    [v4 setObject:v10 forKey:@"carousel"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    __int16 v11 = [NSNumber numberWithInt:self->_priority];
    [v4 setObject:v11 forKey:@"priority"];
  }
  templateURL = self->_templateURL;
  if (templateURL) {
    [v4 setObject:templateURL forKey:@"templateURL"];
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0)
  {
    long long v26 = [NSNumber numberWithInt:self->_maximumDisplays];
    [v4 setObject:v26 forKey:@"maximumDisplays"];

    __int16 v13 = (__int16)self->_has;
    if ((v13 & 2) == 0)
    {
LABEL_19:
      if ((v13 & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_41;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_19;
  }
  long long v27 = [NSNumber numberWithDouble:self->_startDate];
  [v4 setObject:v27 forKey:@"startDate"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 1) == 0)
  {
LABEL_20:
    if ((v13 & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_41:
  long long v28 = [NSNumber numberWithDouble:self->_endDate];
  [v4 setObject:v28 forKey:@"endDate"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_21:
    uint64_t v14 = [NSNumber numberWithBool:self->_hasCloseButton];
    [v4 setObject:v14 forKey:@"hasCloseButton"];
  }
LABEL_22:
  if ([(NSMutableArray *)self->_contentPages count])
  {
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_contentPages, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    __int16 v16 = self->_contentPages;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [*(id *)(*((void *)&v56 + 1) + 8 * i) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v18);
    }

    [v4 setObject:v15 forKey:@"contentPages"];
  }
  rule = self->_rule;
  if (rule)
  {
    long long v23 = [(ICIAMMessageRule *)rule dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"rule"];
  }
  webArchiveURL = self->_webArchiveURL;
  if (webArchiveURL) {
    [v4 setObject:webArchiveURL forKey:@"webArchiveURL"];
  }
  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x40) != 0)
  {
    int modalPresentationStyle = self->_modalPresentationStyle;
    if (modalPresentationStyle)
    {
      if (modalPresentationStyle == 1)
      {
        long long v30 = @"Fullscreen";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modalPresentationStyle);
        long long v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      long long v30 = @"Card";
    }
    [v4 setObject:v30 forKey:@"modalPresentationStyle"];

    __int16 v25 = (__int16)self->_has;
    if ((v25 & 8) == 0)
    {
LABEL_37:
      if ((v25 & 4) == 0) {
        goto LABEL_59;
      }
      goto LABEL_55;
    }
  }
  else if ((v25 & 8) == 0)
  {
    goto LABEL_37;
  }
  int globalPresentationPolicyGroup = self->_globalPresentationPolicyGroup;
  if (globalPresentationPolicyGroup)
  {
    if (globalPresentationPolicyGroup == 1)
    {
      long long v32 = @"Restricted";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_globalPresentationPolicyGroup);
      long long v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    long long v32 = @"Normal";
  }
  [v4 setObject:v32 forKey:@"globalPresentationPolicyGroup"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_55:
    uint64_t assetPrefetchStrategy = self->_assetPrefetchStrategy;
    if (assetPrefetchStrategy >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_assetPrefetchStrategy);
      long long v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v34 = off_1E5AC6E38[assetPrefetchStrategy];
    }
    [v4 setObject:v34 forKey:@"assetPrefetchStrategy"];
  }
LABEL_59:
  holdoutEvent = self->_holdoutEvent;
  if (holdoutEvent)
  {
    uint64_t v36 = [(ICIAMMetricEvent *)holdoutEvent dictionaryRepresentation];
    [v4 setObject:v36 forKey:@"holdoutEvent"];
  }
  localNotification = self->_localNotification;
  if (localNotification)
  {
    uint64_t v38 = [(ICIAMLocalNotification *)localNotification dictionaryRepresentation];
    [v4 setObject:v38 forKey:@"localNotification"];
  }
  impressionEvent = self->_impressionEvent;
  if (impressionEvent)
  {
    long long v40 = [(ICIAMMetricEvent *)impressionEvent dictionaryRepresentation];
    [v4 setObject:v40 forKey:@"impressionEvent"];
  }
  if ([(NSMutableArray *)self->_presentationTriggers count])
  {
    id v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_presentationTriggers, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v42 = self->_presentationTriggers;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v53 != v45) {
            objc_enumerationMutation(v42);
          }
          long long v47 = [*(id *)(*((void *)&v52 + 1) + 8 * j) dictionaryRepresentation];
          [v41 addObject:v47];
        }
        uint64_t v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v44);
    }

    [v4 setObject:v41 forKey:@"presentationTriggers"];
  }
  applicationBadge = self->_applicationBadge;
  if (applicationBadge)
  {
    long long v49 = [(ICIAMApplicationBadge *)applicationBadge dictionaryRepresentation];
    [v4 setObject:v49 forKey:@"applicationBadge"];
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    long long v50 = [NSNumber numberWithBool:self->_reportingEnabled];
    [v4 setObject:v50 forKey:@"reportingEnabled"];
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMApplicationMessage;
  id v4 = [(ICIAMApplicationMessage *)&v8 description];
  unint64_t v5 = [(ICIAMApplicationMessage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasReportingEnabled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasReportingEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setReportingEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_reportingEnabled = a3;
}

- (BOOL)reportingEnabled
{
  return (*(_WORD *)&self->_has & 0x400) == 0 || self->_reportingEnabled;
}

- (BOOL)hasApplicationBadge
{
  return self->_applicationBadge != 0;
}

- (id)presentationTriggersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_presentationTriggers objectAtIndex:a3];
}

- (unint64_t)presentationTriggersCount
{
  return [(NSMutableArray *)self->_presentationTriggers count];
}

- (void)addPresentationTriggers:(id)a3
{
  id v4 = a3;
  presentationTriggers = self->_presentationTriggers;
  id v8 = v4;
  if (!presentationTriggers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_presentationTriggers;
    self->_presentationTriggers = v6;

    id v4 = v8;
    presentationTriggers = self->_presentationTriggers;
  }
  [(NSMutableArray *)presentationTriggers addObject:v4];
}

- (void)clearPresentationTriggers
{
}

- (BOOL)hasImpressionEvent
{
  return self->_impressionEvent != 0;
}

- (BOOL)hasLocalNotification
{
  return self->_localNotification != 0;
}

- (BOOL)hasHoldoutEvent
{
  return self->_holdoutEvent != 0;
}

- (int)StringAsAssetPrefetchStrategy:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Immediate"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Never"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)assetPrefetchStrategyAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5AC6E38[a3];
  }

  return v3;
}

- (BOOL)hasAssetPrefetchStrategy
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasAssetPrefetchStrategy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setAssetPrefetchStrategy:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_uint64_t assetPrefetchStrategy = a3;
}

- (int)assetPrefetchStrategy
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_assetPrefetchStrategy;
  }
  else {
    return 0;
  }
}

- (int)StringAsGlobalPresentationPolicyGroup:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Normal"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Restricted"];
  }

  return v4;
}

- (id)globalPresentationPolicyGroupAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Restricted";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Normal";
  }
  return v4;
}

- (BOOL)hasGlobalPresentationPolicyGroup
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasGlobalPresentationPolicyGroup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setGlobalPresentationPolicyGroup:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int globalPresentationPolicyGroup = a3;
}

- (int)globalPresentationPolicyGroup
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_globalPresentationPolicyGroup;
  }
  else {
    return 0;
  }
}

- (int)StringAsModalPresentationStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Card"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Fullscreen"];
  }

  return v4;
}

- (id)modalPresentationStyleAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Fullscreen";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Card";
  }
  return v4;
}

- (BOOL)hasModalPresentationStyle
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasModalPresentationStyle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setModalPresentationStyle:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int modalPresentationStyle = a3;
}

- (int)modalPresentationStyle
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_modalPresentationStyle;
  }
  else {
    return 0;
  }
}

- (BOOL)hasWebArchiveURL
{
  return self->_webArchiveURL != 0;
}

- (BOOL)hasRule
{
  return self->_rule != 0;
}

- (id)contentPagesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contentPages objectAtIndex:a3];
}

- (unint64_t)contentPagesCount
{
  return [(NSMutableArray *)self->_contentPages count];
}

- (void)addContentPages:(id)a3
{
  id v4 = a3;
  contentPages = self->_contentPages;
  id v8 = v4;
  if (!contentPages)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_contentPages;
    self->_contentPages = v6;

    id v4 = v8;
    contentPages = self->_contentPages;
  }
  [(NSMutableArray *)contentPages addObject:v4];
}

- (void)clearContentPages
{
}

- (BOOL)hasHasCloseButton
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasHasCloseButton:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setHasCloseButton:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_hasCloseButton = a3;
}

- (BOOL)hasCloseButton
{
  return (*(_WORD *)&self->_has & 0x200) == 0 || self->_hasCloseButton;
}

- (BOOL)hasEndDate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasEndDate:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setEndDate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_double endDate = a3;
}

- (BOOL)hasStartDate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setStartDate:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_double startDate = a3;
}

- (BOOL)hasMaximumDisplays
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasMaximumDisplays:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setMaximumDisplays:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_maximumDisplays = a3;
}

- (BOOL)hasTemplateURL
{
  return self->_templateURL != 0;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setPriority:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_priority = a3;
}

- (BOOL)hasCarousel
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasCarousel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setCarousel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_carousel = a3;
}

- (BOOL)carousel
{
  return (*(_WORD *)&self->_has & 0x100) != 0 && self->_carousel;
}

- (int)StringAsMessageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Banner"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Modal"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Native"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Notification"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)messageTypeAsString:(int)a3
{
  if a3 < 5 && ((0x17u >> a3))
  {
    id v3 = off_1E5AC6E10[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (BOOL)hasMessageType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasMessageType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setMessageType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_uint64_t messageType = a3;
}

- (int)messageType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_messageType;
  }
  else {
    return 0;
  }
}

- (id)targetAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_targets objectAtIndex:a3];
}

- (unint64_t)targetsCount
{
  return [(NSMutableArray *)self->_targets count];
}

- (void)addTarget:(id)a3
{
  id v4 = a3;
  targets = self->_targets;
  id v8 = v4;
  if (!targets)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_targets;
    self->_targets = v6;

    id v4 = v8;
    targets = self->_targets;
  }
  [(NSMutableArray *)targets addObject:v4];
}

- (void)clearTargets
{
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

+ (Class)presentationTriggersType
{
  return (Class)objc_opt_class();
}

+ (Class)contentPagesType
{
  return (Class)objc_opt_class();
}

+ (Class)targetType
{
  return (Class)objc_opt_class();
}

@end