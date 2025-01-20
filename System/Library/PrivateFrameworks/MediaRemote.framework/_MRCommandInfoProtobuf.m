@interface _MRCommandInfoProtobuf
+ (Class)currentPlaybackSessionTypesType;
+ (Class)supportedCustomQueueIdentifierType;
+ (Class)supportedPlaybackSessionIdentifiersType;
+ (Class)supportedPlaybackSessionTypesType;
- (BOOL)active;
- (BOOL)enabled;
- (BOOL)hasActive;
- (BOOL)hasCanScrub;
- (BOOL)hasCommand;
- (BOOL)hasCurrentQueueEndAction;
- (BOOL)hasDialogOptions;
- (BOOL)hasDisabledReason;
- (BOOL)hasEnabled;
- (BOOL)hasLastSectionContentItemID;
- (BOOL)hasLocalizedShortTitle;
- (BOOL)hasLocalizedTitle;
- (BOOL)hasMaximumRating;
- (BOOL)hasMinimumRating;
- (BOOL)hasNumAvailableSkips;
- (BOOL)hasPlaybackSessionIdentifier;
- (BOOL)hasPreferredPlaybackRate;
- (BOOL)hasPresentationStyle;
- (BOOL)hasProactiveCommandOptions;
- (BOOL)hasRepeatMode;
- (BOOL)hasShuffleMode;
- (BOOL)hasSkipFrequency;
- (BOOL)hasSkipInterval;
- (BOOL)hasSleepTimerFireDate;
- (BOOL)hasSleepTimerStopMode;
- (BOOL)hasSleepTimerTime;
- (BOOL)hasSupportsReferencePosition;
- (BOOL)hasUpNextItemCount;
- (BOOL)hasVocalsControlActive;
- (BOOL)hasVocalsControlContinuous;
- (BOOL)hasVocalsControlLevel;
- (BOOL)hasVocalsControlMaxLevel;
- (BOOL)hasVocalsControlMinLevel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsReferencePosition;
- (BOOL)vocalsControlActive;
- (BOOL)vocalsControlContinuous;
- (NSMutableArray)currentPlaybackSessionTypes;
- (NSMutableArray)supportedCustomQueueIdentifiers;
- (NSMutableArray)supportedPlaybackSessionIdentifiers;
- (NSMutableArray)supportedPlaybackSessionTypes;
- (NSString)lastSectionContentItemID;
- (NSString)localizedShortTitle;
- (NSString)localizedTitle;
- (NSString)playbackSessionIdentifier;
- (_MRCommandOptionsProtobuf)proactiveCommandOptions;
- (_MRDictionaryProtobuf)dialogOptions;
- (double)preferredIntervalAtIndex:(unint64_t)a3;
- (double)preferredIntervals;
- (double)sleepTimerFireDate;
- (double)sleepTimerTime;
- (float)maximumRating;
- (float)minimumRating;
- (float)preferredPlaybackRate;
- (float)supportedRateAtIndex:(unint64_t)a3;
- (float)supportedRates;
- (float)vocalsControlLevel;
- (float)vocalsControlMaxLevel;
- (float)vocalsControlMinLevel;
- (id)commandAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentPlaybackSessionTypesAtIndex:(unint64_t)a3;
- (id)currentQueueEndActionAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)disabledReasonAsString:(int)a3;
- (id)repeatModeAsString:(int)a3;
- (id)shuffleModeAsString:(int)a3;
- (id)sleepTimerStopModeAsString:(int)a3;
- (id)supportedCustomQueueIdentifierAtIndex:(unint64_t)a3;
- (id)supportedPlaybackSessionIdentifiersAtIndex:(unint64_t)a3;
- (id)supportedPlaybackSessionTypesAtIndex:(unint64_t)a3;
- (id)supportedQueueEndActionsAsString:(int)a3;
- (int)StringAsCommand:(id)a3;
- (int)StringAsCurrentQueueEndAction:(id)a3;
- (int)StringAsDisabledReason:(id)a3;
- (int)StringAsRepeatMode:(id)a3;
- (int)StringAsShuffleMode:(id)a3;
- (int)StringAsSleepTimerStopMode:(id)a3;
- (int)StringAsSupportedQueueEndActions:(id)a3;
- (int)canScrub;
- (int)command;
- (int)currentQueueEndAction;
- (int)disabledReason;
- (int)numAvailableSkips;
- (int)presentationStyle;
- (int)repeatMode;
- (int)shuffleMode;
- (int)skipFrequency;
- (int)skipInterval;
- (int)sleepTimerStopMode;
- (int)supportedInsertionPositions;
- (int)supportedInsertionPositionsAtIndex:(unint64_t)a3;
- (int)supportedPlaybackQueueTypes;
- (int)supportedPlaybackQueueTypesAtIndex:(unint64_t)a3;
- (int)supportedQueueEndActions;
- (int)supportedQueueEndActionsAtIndex:(unint64_t)a3;
- (int)upNextItemCount;
- (unint64_t)currentPlaybackSessionTypesCount;
- (unint64_t)hash;
- (unint64_t)preferredIntervalsCount;
- (unint64_t)supportedCustomQueueIdentifiersCount;
- (unint64_t)supportedInsertionPositionsCount;
- (unint64_t)supportedPlaybackQueueTypesCount;
- (unint64_t)supportedPlaybackSessionIdentifiersCount;
- (unint64_t)supportedPlaybackSessionTypesCount;
- (unint64_t)supportedQueueEndActionsCount;
- (unint64_t)supportedRatesCount;
- (void)addCurrentPlaybackSessionTypes:(id)a3;
- (void)addPreferredInterval:(double)a3;
- (void)addSupportedCustomQueueIdentifier:(id)a3;
- (void)addSupportedInsertionPositions:(int)a3;
- (void)addSupportedPlaybackQueueTypes:(int)a3;
- (void)addSupportedPlaybackSessionIdentifiers:(id)a3;
- (void)addSupportedPlaybackSessionTypes:(id)a3;
- (void)addSupportedQueueEndActions:(int)a3;
- (void)addSupportedRate:(float)a3;
- (void)clearCurrentPlaybackSessionTypes;
- (void)clearPreferredIntervals;
- (void)clearSupportedCustomQueueIdentifiers;
- (void)clearSupportedInsertionPositions;
- (void)clearSupportedPlaybackQueueTypes;
- (void)clearSupportedPlaybackSessionIdentifiers;
- (void)clearSupportedPlaybackSessionTypes;
- (void)clearSupportedQueueEndActions;
- (void)clearSupportedRates;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setCanScrub:(int)a3;
- (void)setCommand:(int)a3;
- (void)setCurrentPlaybackSessionTypes:(id)a3;
- (void)setCurrentQueueEndAction:(int)a3;
- (void)setDialogOptions:(id)a3;
- (void)setDisabledReason:(int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHasActive:(BOOL)a3;
- (void)setHasCanScrub:(BOOL)a3;
- (void)setHasCommand:(BOOL)a3;
- (void)setHasCurrentQueueEndAction:(BOOL)a3;
- (void)setHasDisabledReason:(BOOL)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)setHasMaximumRating:(BOOL)a3;
- (void)setHasMinimumRating:(BOOL)a3;
- (void)setHasNumAvailableSkips:(BOOL)a3;
- (void)setHasPreferredPlaybackRate:(BOOL)a3;
- (void)setHasPresentationStyle:(BOOL)a3;
- (void)setHasRepeatMode:(BOOL)a3;
- (void)setHasShuffleMode:(BOOL)a3;
- (void)setHasSkipFrequency:(BOOL)a3;
- (void)setHasSkipInterval:(BOOL)a3;
- (void)setHasSleepTimerFireDate:(BOOL)a3;
- (void)setHasSleepTimerStopMode:(BOOL)a3;
- (void)setHasSleepTimerTime:(BOOL)a3;
- (void)setHasSupportsReferencePosition:(BOOL)a3;
- (void)setHasUpNextItemCount:(BOOL)a3;
- (void)setHasVocalsControlActive:(BOOL)a3;
- (void)setHasVocalsControlContinuous:(BOOL)a3;
- (void)setHasVocalsControlLevel:(BOOL)a3;
- (void)setHasVocalsControlMaxLevel:(BOOL)a3;
- (void)setHasVocalsControlMinLevel:(BOOL)a3;
- (void)setLastSectionContentItemID:(id)a3;
- (void)setLocalizedShortTitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setMaximumRating:(float)a3;
- (void)setMinimumRating:(float)a3;
- (void)setNumAvailableSkips:(int)a3;
- (void)setPlaybackSessionIdentifier:(id)a3;
- (void)setPreferredIntervals:(double *)a3 count:(unint64_t)a4;
- (void)setPreferredPlaybackRate:(float)a3;
- (void)setPresentationStyle:(int)a3;
- (void)setProactiveCommandOptions:(id)a3;
- (void)setRepeatMode:(int)a3;
- (void)setShuffleMode:(int)a3;
- (void)setSkipFrequency:(int)a3;
- (void)setSkipInterval:(int)a3;
- (void)setSleepTimerFireDate:(double)a3;
- (void)setSleepTimerStopMode:(int)a3;
- (void)setSleepTimerTime:(double)a3;
- (void)setSupportedCustomQueueIdentifiers:(id)a3;
- (void)setSupportedInsertionPositions:(int *)a3 count:(unint64_t)a4;
- (void)setSupportedPlaybackQueueTypes:(int *)a3 count:(unint64_t)a4;
- (void)setSupportedPlaybackSessionIdentifiers:(id)a3;
- (void)setSupportedPlaybackSessionTypes:(id)a3;
- (void)setSupportedQueueEndActions:(int *)a3 count:(unint64_t)a4;
- (void)setSupportedRates:(float *)a3 count:(unint64_t)a4;
- (void)setSupportsReferencePosition:(BOOL)a3;
- (void)setUpNextItemCount:(int)a3;
- (void)setVocalsControlActive:(BOOL)a3;
- (void)setVocalsControlContinuous:(BOOL)a3;
- (void)setVocalsControlLevel:(float)a3;
- (void)setVocalsControlMaxLevel:(float)a3;
- (void)setVocalsControlMinLevel:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRCommandInfoProtobuf

- (int)supportedPlaybackQueueTypesAtIndex:(unint64_t)a3
{
  p_supportedPlaybackQueueTypes = &self->_supportedPlaybackQueueTypes;
  unint64_t count = self->_supportedPlaybackQueueTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_supportedPlaybackQueueTypes->list[a3];
}

- (int)StringAsSupportedQueueEndActions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Clear"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Reset"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AutoPlay"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)supportedQueueEndActionsAtIndex:(unint64_t)a3
{
  p_supportedQueueEndActions = &self->_supportedQueueEndActions;
  unint64_t count = self->_supportedQueueEndActions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_supportedQueueEndActions->list[a3];
}

- (void)addCurrentPlaybackSessionTypes:(id)a3
{
  id v4 = a3;
  currentPlaybackSessionTypes = self->_currentPlaybackSessionTypes;
  id v8 = v4;
  if (!currentPlaybackSessionTypes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_currentPlaybackSessionTypes;
    self->_currentPlaybackSessionTypes = v6;

    id v4 = v8;
    currentPlaybackSessionTypes = self->_currentPlaybackSessionTypes;
  }
  [(NSMutableArray *)currentPlaybackSessionTypes addObject:v4];
}

- (unint64_t)supportedPlaybackQueueTypesCount
{
  return self->_supportedPlaybackQueueTypes.count;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $AF98D11BA0603040132F42F0933BF992 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_3;
    }
LABEL_88:
    v4[313] = self->_enabled;
    *((_DWORD *)v4 + 80) |= 0x200000u;
    if ((*(_DWORD *)&self->_has & 0x100000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 37) = self->_command;
  *((_DWORD *)v4 + 80) |= 8u;
  $AF98D11BA0603040132F42F0933BF992 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0) {
    goto LABEL_88;
  }
LABEL_3:
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_4:
    v4[312] = self->_active;
    *((_DWORD *)v4 + 80) |= 0x100000u;
  }
LABEL_5:
  id v42 = v4;
  if ([(_MRCommandInfoProtobuf *)self preferredIntervalsCount])
  {
    [v42 clearPreferredIntervals];
    unint64_t v6 = [(_MRCommandInfoProtobuf *)self preferredIntervalsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        [(_MRCommandInfoProtobuf *)self preferredIntervalAtIndex:i];
        objc_msgSend(v42, "addPreferredInterval:");
      }
    }
  }
  if (self->_localizedTitle) {
    objc_msgSend(v42, "setLocalizedTitle:");
  }
  $AF98D11BA0603040132F42F0933BF992 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x80) != 0)
  {
    *((_DWORD *)v42 + 53) = LODWORD(self->_minimumRating);
    *((_DWORD *)v42 + 80) |= 0x80u;
    $AF98D11BA0603040132F42F0933BF992 v9 = self->_has;
  }
  if ((*(unsigned char *)&v9 & 0x40) != 0)
  {
    *((_DWORD *)v42 + 52) = LODWORD(self->_maximumRating);
    *((_DWORD *)v42 + 80) |= 0x40u;
  }
  if ([(_MRCommandInfoProtobuf *)self supportedRatesCount])
  {
    [v42 clearSupportedRates];
    unint64_t v10 = [(_MRCommandInfoProtobuf *)self supportedRatesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        [(_MRCommandInfoProtobuf *)self supportedRateAtIndex:j];
        objc_msgSend(v42, "addSupportedRate:");
      }
    }
  }
  if (self->_localizedShortTitle) {
    objc_msgSend(v42, "setLocalizedShortTitle:");
  }
  $AF98D11BA0603040132F42F0933BF992 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    *((_DWORD *)v42 + 62) = self->_repeatMode;
    *((_DWORD *)v42 + 80) |= 0x800u;
    $AF98D11BA0603040132F42F0933BF992 v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x1000) == 0)
    {
LABEL_23:
      if ((*(_WORD *)&v13 & 0x400) == 0) {
        goto LABEL_24;
      }
      goto LABEL_92;
    }
  }
  else if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)v42 + 63) = self->_shuffleMode;
  *((_DWORD *)v42 + 80) |= 0x1000u;
  $AF98D11BA0603040132F42F0933BF992 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v13 & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v42 + 59) = self->_presentationStyle;
  *((_DWORD *)v42 + 80) |= 0x400u;
  $AF98D11BA0603040132F42F0933BF992 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v13 & 0x100) == 0) {
      goto LABEL_26;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)v42 + 65) = self->_skipInterval;
  *((_DWORD *)v42 + 80) |= 0x4000u;
  $AF98D11BA0603040132F42F0933BF992 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v13 & 0x2000) == 0) {
      goto LABEL_27;
    }
LABEL_95:
    *((_DWORD *)v42 + 64) = self->_skipFrequency;
    *((_DWORD *)v42 + 80) |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 4) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_94:
  *((_DWORD *)v42 + 54) = self->_numAvailableSkips;
  *((_DWORD *)v42 + 80) |= 0x100u;
  $AF98D11BA0603040132F42F0933BF992 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x2000) != 0) {
    goto LABEL_95;
  }
LABEL_27:
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
LABEL_28:
    *((_DWORD *)v42 + 36) = self->_canScrub;
    *((_DWORD *)v42 + 80) |= 4u;
  }
LABEL_29:
  if ([(_MRCommandInfoProtobuf *)self supportedPlaybackQueueTypesCount])
  {
    [v42 clearSupportedPlaybackQueueTypes];
    unint64_t v14 = [(_MRCommandInfoProtobuf *)self supportedPlaybackQueueTypesCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
        objc_msgSend(v42, "addSupportedPlaybackQueueTypes:", -[_MRCommandInfoProtobuf supportedPlaybackQueueTypesAtIndex:](self, "supportedPlaybackQueueTypesAtIndex:", k));
    }
  }
  if ([(_MRCommandInfoProtobuf *)self supportedCustomQueueIdentifiersCount])
  {
    [v42 clearSupportedCustomQueueIdentifiers];
    unint64_t v17 = [(_MRCommandInfoProtobuf *)self supportedCustomQueueIdentifiersCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(_MRCommandInfoProtobuf *)self supportedCustomQueueIdentifierAtIndex:m];
        [v42 addSupportedCustomQueueIdentifier:v20];
      }
    }
  }
  if ([(_MRCommandInfoProtobuf *)self supportedInsertionPositionsCount])
  {
    [v42 clearSupportedInsertionPositions];
    unint64_t v21 = [(_MRCommandInfoProtobuf *)self supportedInsertionPositionsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
        objc_msgSend(v42, "addSupportedInsertionPositions:", -[_MRCommandInfoProtobuf supportedInsertionPositionsAtIndex:](self, "supportedInsertionPositionsAtIndex:", n));
    }
  }
  $AF98D11BA0603040132F42F0933BF992 v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x10000) != 0)
  {
    *((_DWORD *)v42 + 74) = self->_upNextItemCount;
    *((_DWORD *)v42 + 80) |= 0x10000u;
    $AF98D11BA0603040132F42F0933BF992 v24 = self->_has;
  }
  if ((*(_WORD *)&v24 & 0x200) != 0)
  {
    *((_DWORD *)v42 + 58) = LODWORD(self->_preferredPlaybackRate);
    *((_DWORD *)v42 + 80) |= 0x200u;
  }
  if ([(_MRCommandInfoProtobuf *)self supportedPlaybackSessionTypesCount])
  {
    [v42 clearSupportedPlaybackSessionTypes];
    unint64_t v25 = [(_MRCommandInfoProtobuf *)self supportedPlaybackSessionTypesCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        v28 = [(_MRCommandInfoProtobuf *)self supportedPlaybackSessionTypesAtIndex:ii];
        [v42 addSupportedPlaybackSessionTypes:v28];
      }
    }
  }
  if ([(_MRCommandInfoProtobuf *)self currentPlaybackSessionTypesCount])
  {
    [v42 clearCurrentPlaybackSessionTypes];
    unint64_t v29 = [(_MRCommandInfoProtobuf *)self currentPlaybackSessionTypesCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
      {
        v32 = [(_MRCommandInfoProtobuf *)self currentPlaybackSessionTypesAtIndex:jj];
        [v42 addCurrentPlaybackSessionTypes:v32];
      }
    }
  }
  if (self->_playbackSessionIdentifier) {
    objc_msgSend(v42, "setPlaybackSessionIdentifier:");
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v42 + 40) = self->_currentQueueEndAction;
    *((_DWORD *)v42 + 80) |= 0x10u;
  }
  if ([(_MRCommandInfoProtobuf *)self supportedQueueEndActionsCount])
  {
    [v42 clearSupportedQueueEndActions];
    unint64_t v33 = [(_MRCommandInfoProtobuf *)self supportedQueueEndActionsCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (kuint64_t k = 0; kk != v34; ++kk)
        objc_msgSend(v42, "addSupportedQueueEndActions:", -[_MRCommandInfoProtobuf supportedQueueEndActionsAtIndex:](self, "supportedQueueEndActionsAtIndex:", kk));
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v42 + 44) = self->_disabledReason;
    *((_DWORD *)v42 + 80) |= 0x20u;
  }
  if ([(_MRCommandInfoProtobuf *)self supportedPlaybackSessionIdentifiersCount])
  {
    [v42 clearSupportedPlaybackSessionIdentifiers];
    unint64_t v36 = [(_MRCommandInfoProtobuf *)self supportedPlaybackSessionIdentifiersCount];
    if (v36)
    {
      unint64_t v37 = v36;
      for (muint64_t m = 0; mm != v37; ++mm)
      {
        v39 = [(_MRCommandInfoProtobuf *)self supportedPlaybackSessionIdentifiersAtIndex:mm];
        [v42 addSupportedPlaybackSessionIdentifiers:v39];
      }
    }
  }
  if (self->_proactiveCommandOptions) {
    objc_msgSend(v42, "setProactiveCommandOptions:");
  }
  $AF98D11BA0603040132F42F0933BF992 v40 = self->_has;
  v41 = v42;
  if ((*(_DWORD *)&v40 & 0x800000) != 0)
  {
    *((unsigned char *)v42 + 315) = self->_vocalsControlActive;
    *((_DWORD *)v42 + 80) |= 0x800000u;
    $AF98D11BA0603040132F42F0933BF992 v40 = self->_has;
    if ((*(_DWORD *)&v40 & 0x20000) == 0)
    {
LABEL_71:
      if ((*(_DWORD *)&v40 & 0x40000) == 0) {
        goto LABEL_72;
      }
      goto LABEL_99;
    }
  }
  else if ((*(_DWORD *)&v40 & 0x20000) == 0)
  {
    goto LABEL_71;
  }
  *((_DWORD *)v42 + 75) = LODWORD(self->_vocalsControlLevel);
  *((_DWORD *)v42 + 80) |= 0x20000u;
  $AF98D11BA0603040132F42F0933BF992 v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x40000) == 0)
  {
LABEL_72:
    if ((*(_DWORD *)&v40 & 0x80000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)v42 + 76) = LODWORD(self->_vocalsControlMaxLevel);
  *((_DWORD *)v42 + 80) |= 0x40000u;
  $AF98D11BA0603040132F42F0933BF992 v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x80000) == 0)
  {
LABEL_73:
    if ((*(_DWORD *)&v40 & 0x1000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)v42 + 77) = LODWORD(self->_vocalsControlMinLevel);
  *((_DWORD *)v42 + 80) |= 0x80000u;
  $AF98D11BA0603040132F42F0933BF992 v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x1000000) == 0)
  {
LABEL_74:
    if ((*(unsigned char *)&v40 & 2) == 0) {
      goto LABEL_75;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((unsigned char *)v42 + 316) = self->_vocalsControlContinuous;
  *((_DWORD *)v42 + 80) |= 0x1000000u;
  $AF98D11BA0603040132F42F0933BF992 v40 = self->_has;
  if ((*(unsigned char *)&v40 & 2) == 0)
  {
LABEL_75:
    if ((*(_WORD *)&v40 & 0x8000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((void *)v42 + 17) = *(void *)&self->_sleepTimerTime;
  *((_DWORD *)v42 + 80) |= 2u;
  $AF98D11BA0603040132F42F0933BF992 v40 = self->_has;
  if ((*(_WORD *)&v40 & 0x8000) == 0)
  {
LABEL_76:
    if ((*(unsigned char *)&v40 & 1) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_103:
  *((_DWORD *)v42 + 66) = self->_sleepTimerStopMode;
  *((_DWORD *)v42 + 80) |= 0x8000u;
  if (*(_DWORD *)&self->_has)
  {
LABEL_77:
    *((void *)v42 + 16) = *(void *)&self->_sleepTimerFireDate;
    *((_DWORD *)v42 + 80) |= 1u;
  }
LABEL_78:
  if (self->_dialogOptions)
  {
    objc_msgSend(v42, "setDialogOptions:");
    v41 = v42;
  }
  if (self->_lastSectionContentItemID)
  {
    objc_msgSend(v42, "setLastSectionContentItemID:");
    v41 = v42;
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    v41[314] = self->_supportsReferencePosition;
    *((_DWORD *)v41 + 80) |= 0x400000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  $AF98D11BA0603040132F42F0933BF992 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_command;
    *(_DWORD *)(v5 + 320) |= 8u;
    $AF98D11BA0603040132F42F0933BF992 has = self->_has;
    if ((*(_DWORD *)&has & 0x200000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x200000) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 313) = self->_enabled;
  *(_DWORD *)(v5 + 320) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 312) = self->_active;
    *(_DWORD *)(v5 + 320) |= 0x100000u;
  }
LABEL_5:
  PBRepeatedDoubleCopy();
  uint64_t v8 = [(NSString *)self->_localizedTitle copyWithZone:a3];
  $AF98D11BA0603040132F42F0933BF992 v9 = *(void **)(v6 + 200);
  *(void *)(v6 + 200) = v8;

  $AF98D11BA0603040132F42F0933BF992 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x80) != 0)
  {
    *(float *)(v6 + 212) = self->_minimumRating;
    *(_DWORD *)(v6 + 320) |= 0x80u;
    $AF98D11BA0603040132F42F0933BF992 v10 = self->_has;
  }
  if ((*(unsigned char *)&v10 & 0x40) != 0)
  {
    *(float *)(v6 + 208) = self->_maximumRating;
    *(_DWORD *)(v6 + 320) |= 0x40u;
  }
  PBRepeatedFloatCopy();
  uint64_t v11 = [(NSString *)self->_localizedShortTitle copyWithZone:a3];
  v12 = *(void **)(v6 + 192);
  *(void *)(v6 + 192) = v11;

  $AF98D11BA0603040132F42F0933BF992 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    *(_DWORD *)(v6 + 248) = self->_repeatMode;
    *(_DWORD *)(v6 + 320) |= 0x800u;
    $AF98D11BA0603040132F42F0933BF992 v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x1000) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v13 & 0x400) == 0) {
        goto LABEL_12;
      }
      goto LABEL_70;
    }
  }
  else if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 252) = self->_shuffleMode;
  *(_DWORD *)(v6 + 320) |= 0x1000u;
  $AF98D11BA0603040132F42F0933BF992 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v13 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v6 + 236) = self->_presentationStyle;
  *(_DWORD *)(v6 + 320) |= 0x400u;
  $AF98D11BA0603040132F42F0933BF992 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v13 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(_DWORD *)(v6 + 260) = self->_skipInterval;
  *(_DWORD *)(v6 + 320) |= 0x4000u;
  $AF98D11BA0603040132F42F0933BF992 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v13 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v6 + 216) = self->_numAvailableSkips;
  *(_DWORD *)(v6 + 320) |= 0x100u;
  $AF98D11BA0603040132F42F0933BF992 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v13 & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_73:
  *(_DWORD *)(v6 + 256) = self->_skipFrequency;
  *(_DWORD *)(v6 + 320) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    *(_DWORD *)(v6 + 144) = self->_canScrub;
    *(_DWORD *)(v6 + 320) |= 4u;
  }
LABEL_17:
  PBRepeatedInt32Copy();
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  unint64_t v14 = self->_supportedCustomQueueIdentifiers;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v62;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v62 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = (void *)[*(id *)(*((void *)&v61 + 1) + 8 * v18) copyWithZone:a3];
        [(id)v6 addSupportedCustomQueueIdentifier:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v61 objects:v68 count:16];
    }
    while (v16);
  }

  PBRepeatedInt32Copy();
  $AF98D11BA0603040132F42F0933BF992 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000) != 0)
  {
    *(_DWORD *)(v6 + 296) = self->_upNextItemCount;
    *(_DWORD *)(v6 + 320) |= 0x10000u;
    $AF98D11BA0603040132F42F0933BF992 v20 = self->_has;
  }
  if ((*(_WORD *)&v20 & 0x200) != 0)
  {
    *(float *)(v6 + 232) = self->_preferredPlaybackRate;
    *(_DWORD *)(v6 + 320) |= 0x200u;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  unint64_t v21 = self->_supportedPlaybackSessionTypes;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v58;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v58 != v24) {
          objc_enumerationMutation(v21);
        }
        unint64_t v26 = (void *)[*(id *)(*((void *)&v57 + 1) + 8 * v25) copyWithZone:a3];
        [(id)v6 addSupportedPlaybackSessionTypes:v26];

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v57 objects:v67 count:16];
    }
    while (v23);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v27 = self->_currentPlaybackSessionTypes;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v54;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v54 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * v31) copyWithZone:a3];
        [(id)v6 addCurrentPlaybackSessionTypes:v32];

        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v53 objects:v66 count:16];
    }
    while (v29);
  }

  uint64_t v33 = [(NSString *)self->_playbackSessionIdentifier copyWithZone:a3];
  unint64_t v34 = *(void **)(v6 + 224);
  *(void *)(v6 + 224) = v33;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_currentQueueEndAction;
    *(_DWORD *)(v6 + 320) |= 0x10u;
  }
  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 176) = self->_disabledReason;
    *(_DWORD *)(v6 + 320) |= 0x20u;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v35 = self->_supportedPlaybackSessionIdentifiers;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v49 objects:v65 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v50;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v50 != v38) {
          objc_enumerationMutation(v35);
        }
        $AF98D11BA0603040132F42F0933BF992 v40 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * v39), "copyWithZone:", a3, (void)v49);
        [(id)v6 addSupportedPlaybackSessionIdentifiers:v40];

        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v49 objects:v65 count:16];
    }
    while (v37);
  }

  id v41 = [(_MRCommandOptionsProtobuf *)self->_proactiveCommandOptions copyWithZone:a3];
  id v42 = *(void **)(v6 + 240);
  *(void *)(v6 + 240) = v41;

  $AF98D11BA0603040132F42F0933BF992 v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x800000) != 0)
  {
    *(unsigned char *)(v6 + 315) = self->_vocalsControlActive;
    *(_DWORD *)(v6 + 320) |= 0x800000u;
    $AF98D11BA0603040132F42F0933BF992 v43 = self->_has;
    if ((*(_DWORD *)&v43 & 0x20000) == 0)
    {
LABEL_55:
      if ((*(_DWORD *)&v43 & 0x40000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_77;
    }
  }
  else if ((*(_DWORD *)&v43 & 0x20000) == 0)
  {
    goto LABEL_55;
  }
  *(float *)(v6 + 300) = self->_vocalsControlLevel;
  *(_DWORD *)(v6 + 320) |= 0x20000u;
  $AF98D11BA0603040132F42F0933BF992 v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x40000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v43 & 0x80000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(float *)(v6 + 304) = self->_vocalsControlMaxLevel;
  *(_DWORD *)(v6 + 320) |= 0x40000u;
  $AF98D11BA0603040132F42F0933BF992 v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x80000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v43 & 0x1000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(float *)(v6 + 308) = self->_vocalsControlMinLevel;
  *(_DWORD *)(v6 + 320) |= 0x80000u;
  $AF98D11BA0603040132F42F0933BF992 v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x1000000) == 0)
  {
LABEL_58:
    if ((*(unsigned char *)&v43 & 2) == 0) {
      goto LABEL_59;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(unsigned char *)(v6 + 316) = self->_vocalsControlContinuous;
  *(_DWORD *)(v6 + 320) |= 0x1000000u;
  $AF98D11BA0603040132F42F0933BF992 v43 = self->_has;
  if ((*(unsigned char *)&v43 & 2) == 0)
  {
LABEL_59:
    if ((*(_WORD *)&v43 & 0x8000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(double *)(v6 + 136) = self->_sleepTimerTime;
  *(_DWORD *)(v6 + 320) |= 2u;
  $AF98D11BA0603040132F42F0933BF992 v43 = self->_has;
  if ((*(_WORD *)&v43 & 0x8000) == 0)
  {
LABEL_60:
    if ((*(unsigned char *)&v43 & 1) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_81:
  *(_DWORD *)(v6 + 264) = self->_sleepTimerStopMode;
  *(_DWORD *)(v6 + 320) |= 0x8000u;
  if (*(_DWORD *)&self->_has)
  {
LABEL_61:
    *(double *)(v6 + 128) = self->_sleepTimerFireDate;
    *(_DWORD *)(v6 + 320) |= 1u;
  }
LABEL_62:
  id v44 = -[_MRDictionaryProtobuf copyWithZone:](self->_dialogOptions, "copyWithZone:", a3, (void)v49);
  v45 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v44;

  uint64_t v46 = [(NSString *)self->_lastSectionContentItemID copyWithZone:a3];
  v47 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v46;

  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    *(unsigned char *)(v6 + 314) = self->_supportsReferencePosition;
    *(_DWORD *)(v6 + 320) |= 0x400000u;
  }
  return (id)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $AF98D11BA0603040132F42F0933BF992 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    uint64_t v5 = @"Unknown";
    switch(self->_command)
    {
      case 0:
        break;
      case 1:
        uint64_t v5 = @"Play";
        break;
      case 2:
        uint64_t v5 = @"Pause";
        break;
      case 3:
        uint64_t v5 = @"TogglePlayPause";
        break;
      case 4:
        uint64_t v5 = @"Stop";
        break;
      case 5:
        uint64_t v5 = @"NextTrack";
        break;
      case 6:
        uint64_t v5 = @"PreviousTrack";
        break;
      case 7:
        uint64_t v5 = @"AdvanceShuffleMode";
        break;
      case 8:
        uint64_t v5 = @"AdvanceRepeatMode";
        break;
      case 9:
        uint64_t v5 = @"BeginFastForward";
        break;
      case 0xA:
        uint64_t v5 = @"EndFastForward";
        break;
      case 0xB:
        uint64_t v5 = @"BeginRewind";
        break;
      case 0xC:
        uint64_t v5 = @"EndRewind";
        break;
      case 0xD:
        uint64_t v5 = @"Rewind15Seconds";
        break;
      case 0xE:
        uint64_t v5 = @"FastForward15Seconds";
        break;
      case 0xF:
        uint64_t v5 = @"Rewind30Seconds";
        break;
      case 0x10:
        uint64_t v5 = @"FastForward30Seconds";
        break;
      case 0x12:
        uint64_t v5 = @"SkipForward";
        break;
      case 0x13:
        uint64_t v5 = @"SkipBackward";
        break;
      case 0x14:
        uint64_t v5 = @"ChangePlaybackRate";
        break;
      case 0x15:
        uint64_t v5 = @"RateTrack";
        break;
      case 0x16:
        uint64_t v5 = @"LikeTrack";
        break;
      case 0x17:
        uint64_t v5 = @"DislikeTrack";
        break;
      case 0x18:
        uint64_t v5 = @"BookmarkTrack";
        break;
      case 0x19:
        uint64_t v5 = @"NextChapter";
        break;
      case 0x1A:
        uint64_t v5 = @"PreviousChapter";
        break;
      case 0x1B:
        uint64_t v5 = @"NextAlbum";
        break;
      case 0x1C:
        uint64_t v5 = @"PreviousAlbum";
        break;
      case 0x1D:
        uint64_t v5 = @"NextPlaylist";
        break;
      case 0x1E:
        uint64_t v5 = @"PreviousPlaylist";
        break;
      case 0x1F:
        uint64_t v5 = @"BanTrack";
        break;
      case 0x20:
        uint64_t v5 = @"AddTrackToWishList";
        break;
      case 0x21:
        uint64_t v5 = @"RemoveTrackFromWishList";
        break;
      case 0x22:
        uint64_t v5 = @"NextInContext";
        break;
      case 0x23:
        uint64_t v5 = @"PreviousInContext";
        break;
      case 0x29:
        uint64_t v5 = @"ResetPlaybackTimeout";
        break;
      case 0x2D:
        uint64_t v5 = @"SeekToPlaybackPosition";
        break;
      case 0x2E:
        uint64_t v5 = @"ChangeRepeatMode";
        break;
      case 0x2F:
        uint64_t v5 = @"ChangeShuffleMode";
        break;
      case 0x30:
        uint64_t v5 = @"SetPlaybackQueue";
        break;
      case 0x31:
        uint64_t v5 = @"AddNowPlayingItemToLibrary";
        break;
      case 0x32:
        uint64_t v5 = @"CreateRadioStation";
        break;
      case 0x33:
        uint64_t v5 = @"AddItemToLibrary";
        break;
      case 0x34:
        uint64_t v5 = @"InsertIntoPlaybackQueue";
        break;
      case 0x35:
        uint64_t v5 = @"EnableLanguageOption";
        break;
      case 0x36:
        uint64_t v5 = @"DisableLanguageOption";
        break;
      case 0x37:
        uint64_t v5 = @"ReorderPlaybackQueue";
        break;
      case 0x38:
        uint64_t v5 = @"RemoveFromPlaybackQueue";
        break;
      case 0x39:
        uint64_t v5 = @"PlayItemInPlaybackQueue";
        break;
      case 0x3A:
        uint64_t v5 = @"PrepareForSetQueue";
        break;
      case 0x3B:
        uint64_t v5 = @"SetPlaybackSession";
        break;
      case 0x3C:
        uint64_t v5 = @"PreloadPlaybackSession";
        break;
      case 0x3D:
        uint64_t v5 = @"SetPriorityForPlaybackSession";
        break;
      case 0x3E:
        uint64_t v5 = @"DiscardPlaybackSession";
        break;
      case 0x3F:
        uint64_t v5 = @"Reshuffle";
        break;
      case 0x40:
        uint64_t v5 = @"LeaveSharedPlaybackSession";
        break;
      case 0x41:
        uint64_t v5 = @"PostEventNotice";
        break;
      case 0x7C:
        uint64_t v5 = @"SetSleepTimer";
        break;
      case 0x87:
        uint64_t v5 = @"ChangeQueueEndAction";
        break;
      case 0x8E:
        uint64_t v5 = @"VocalsControl";
        break;
      case 0x8F:
        uint64_t v5 = @"PrepareVocalsControl";
        break;
      case 0x90:
        uint64_t v5 = @"ClearUpNextQueue";
        break;
      case 0x91:
        uint64_t v5 = @"PerformDialogAction";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_command);
        uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    [v3 setObject:v5 forKey:@"command"];

    $AF98D11BA0603040132F42F0933BF992 has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    uint64_t v6 = [NSNumber numberWithBool:self->_enabled];
    [v3 setObject:v6 forKey:@"enabled"];

    $AF98D11BA0603040132F42F0933BF992 has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    unint64_t v7 = [NSNumber numberWithBool:self->_active];
    [v3 setObject:v7 forKey:@"active"];
  }
  uint64_t v8 = PBRepeatedDoubleNSArray();
  [v3 setObject:v8 forKey:@"preferredInterval"];

  localizedTitle = self->_localizedTitle;
  if (localizedTitle) {
    [v3 setObject:localizedTitle forKey:@"localizedTitle"];
  }
  localizedShortTitle = self->_localizedShortTitle;
  if (localizedShortTitle) {
    [v3 setObject:localizedShortTitle forKey:@"localizedShortTitle"];
  }
  $AF98D11BA0603040132F42F0933BF992 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x80) != 0)
  {
    *(float *)&double v9 = self->_minimumRating;
    $AF98D11BA0603040132F42F0933BF992 v13 = [NSNumber numberWithFloat:v9];
    [v3 setObject:v13 forKey:@"minimumRating"];

    $AF98D11BA0603040132F42F0933BF992 v12 = self->_has;
  }
  if ((*(unsigned char *)&v12 & 0x40) != 0)
  {
    *(float *)&double v9 = self->_maximumRating;
    unint64_t v14 = [NSNumber numberWithFloat:v9];
    [v3 setObject:v14 forKey:@"maximumRating"];
  }
  uint64_t v15 = PBRepeatedFloatNSArray();
  [v3 setObject:v15 forKey:@"supportedRate"];

  $AF98D11BA0603040132F42F0933BF992 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x800) != 0)
  {
    uint64_t repeatMode = self->_repeatMode;
    if (repeatMode >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_repeatMode);
      uint64_t v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v31 = off_1E57D6628[repeatMode];
    }
    [v3 setObject:v31 forKey:@"repeatMode"];

    $AF98D11BA0603040132F42F0933BF992 v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x1000) == 0)
    {
LABEL_81:
      if ((*(_WORD *)&v16 & 0x400) == 0) {
        goto LABEL_82;
      }
      goto LABEL_160;
    }
  }
  else if ((*(_WORD *)&v16 & 0x1000) == 0)
  {
    goto LABEL_81;
  }
  uint64_t shuffleMode = self->_shuffleMode;
  if (shuffleMode >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_shuffleMode);
    $AF98D11BA0603040132F42F0933BF992 v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    $AF98D11BA0603040132F42F0933BF992 v40 = off_1E57D6648[shuffleMode];
  }
  [v3 setObject:v40 forKey:@"shuffleMode"];

  $AF98D11BA0603040132F42F0933BF992 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x400) == 0)
  {
LABEL_82:
    if ((*(_WORD *)&v16 & 0x4000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_161;
  }
LABEL_160:
  v67 = [NSNumber numberWithInt:self->_presentationStyle];
  [v3 setObject:v67 forKey:@"presentationStyle"];

  $AF98D11BA0603040132F42F0933BF992 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x4000) == 0)
  {
LABEL_83:
    if ((*(_WORD *)&v16 & 0x100) == 0) {
      goto LABEL_84;
    }
    goto LABEL_162;
  }
LABEL_161:
  v68 = [NSNumber numberWithInt:self->_skipInterval];
  [v3 setObject:v68 forKey:@"skipInterval"];

  $AF98D11BA0603040132F42F0933BF992 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x100) == 0)
  {
LABEL_84:
    if ((*(_WORD *)&v16 & 0x2000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_163;
  }
LABEL_162:
  uint64_t v69 = [NSNumber numberWithInt:self->_numAvailableSkips];
  [v3 setObject:v69 forKey:@"numAvailableSkips"];

  $AF98D11BA0603040132F42F0933BF992 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x2000) == 0)
  {
LABEL_85:
    if ((*(unsigned char *)&v16 & 4) == 0) {
      goto LABEL_87;
    }
    goto LABEL_86;
  }
LABEL_163:
  v70 = [NSNumber numberWithInt:self->_skipFrequency];
  [v3 setObject:v70 forKey:@"skipFrequency"];

  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_86:
    uint64_t v17 = [NSNumber numberWithInt:self->_canScrub];
    [v3 setObject:v17 forKey:@"canScrub"];
  }
LABEL_87:
  uint64_t v18 = PBRepeatedInt32NSArray();
  [v3 setObject:v18 forKey:@"supportedPlaybackQueueTypes"];

  supportedCustomQueueIdentifiers = self->_supportedCustomQueueIdentifiers;
  if (supportedCustomQueueIdentifiers) {
    [v3 setObject:supportedCustomQueueIdentifiers forKey:@"supportedCustomQueueIdentifier"];
  }
  $AF98D11BA0603040132F42F0933BF992 v20 = PBRepeatedInt32NSArray();
  [v3 setObject:v20 forKey:@"supportedInsertionPositions"];

  $AF98D11BA0603040132F42F0933BF992 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x10000) != 0)
  {
    uint64_t v23 = [NSNumber numberWithInt:self->_upNextItemCount];
    [v3 setObject:v23 forKey:@"upNextItemCount"];

    $AF98D11BA0603040132F42F0933BF992 v22 = self->_has;
  }
  if ((*(_WORD *)&v22 & 0x200) != 0)
  {
    *(float *)&double v21 = self->_preferredPlaybackRate;
    uint64_t v24 = [NSNumber numberWithFloat:v21];
    [v3 setObject:v24 forKey:@"preferredPlaybackRate"];
  }
  supportedPlaybackSessionTypes = self->_supportedPlaybackSessionTypes;
  if (supportedPlaybackSessionTypes) {
    [v3 setObject:supportedPlaybackSessionTypes forKey:@"supportedPlaybackSessionTypes"];
  }
  currentPlaybackSessionTypes = self->_currentPlaybackSessionTypes;
  if (currentPlaybackSessionTypes) {
    [v3 setObject:currentPlaybackSessionTypes forKey:@"currentPlaybackSessionTypes"];
  }
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  if (playbackSessionIdentifier) {
    [v3 setObject:playbackSessionIdentifier forKey:@"playbackSessionIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    currentQueueEndActiouint64_t n = self->_currentQueueEndAction;
    if (currentQueueEndAction >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_currentQueueEndAction);
      uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v29 = off_1E57D6668[currentQueueEndAction];
    }
    [v3 setObject:v29 forKey:@"currentQueueEndAction"];
  }
  p_supportedQueueEndActions = &self->_supportedQueueEndActions;
  if (self->_supportedQueueEndActions.count)
  {
    uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (self->_supportedQueueEndActions.count)
    {
      unint64_t v34 = 0;
      do
      {
        uint64_t v35 = p_supportedQueueEndActions->list[v34];
        if (v35 >= 4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_supportedQueueEndActions->list[v34]);
          uint64_t v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v36 = off_1E57D6668[v35];
        }
        [v33 addObject:v36];

        ++v34;
      }
      while (v34 < self->_supportedQueueEndActions.count);
    }
    [v3 setObject:v33 forKey:@"supportedQueueEndActions"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    disabledReasouint64_t n = self->_disabledReason;
    if (disabledReason >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_disabledReason);
      uint64_t v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v38 = off_1E57D6688[disabledReason];
    }
    [v3 setObject:v38 forKey:@"disabledReason"];
  }
  if ([(NSMutableArray *)self->_supportedPlaybackSessionIdentifiers count])
  {
    id v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_supportedPlaybackSessionIdentifiers, "count"));
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    $AF98D11BA0603040132F42F0933BF992 v43 = self->_supportedPlaybackSessionIdentifiers;
    uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v71 objects:v75 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v72 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = [*(id *)(*((void *)&v71 + 1) + 8 * i) dictionaryRepresentation];
          [v42 addObject:v48];
        }
        uint64_t v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v71 objects:v75 count:16];
      }
      while (v45);
    }

    [v3 setObject:v42 forKey:@"supportedPlaybackSessionIdentifiers"];
  }
  proactiveCommandOptions = self->_proactiveCommandOptions;
  if (proactiveCommandOptions)
  {
    long long v50 = [(_MRCommandOptionsProtobuf *)proactiveCommandOptions dictionaryRepresentation];
    [v3 setObject:v50 forKey:@"proactiveCommandOptions"];
  }
  $AF98D11BA0603040132F42F0933BF992 v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x800000) != 0)
  {
    long long v59 = [NSNumber numberWithBool:self->_vocalsControlActive];
    [v3 setObject:v59 forKey:@"vocalsControlActive"];

    $AF98D11BA0603040132F42F0933BF992 v51 = self->_has;
    if ((*(_DWORD *)&v51 & 0x20000) == 0)
    {
LABEL_136:
      if ((*(_DWORD *)&v51 & 0x40000) == 0) {
        goto LABEL_137;
      }
      goto LABEL_152;
    }
  }
  else if ((*(_DWORD *)&v51 & 0x20000) == 0)
  {
    goto LABEL_136;
  }
  *(float *)&double v41 = self->_vocalsControlLevel;
  long long v60 = [NSNumber numberWithFloat:v41];
  [v3 setObject:v60 forKey:@"vocalsControlLevel"];

  $AF98D11BA0603040132F42F0933BF992 v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x40000) == 0)
  {
LABEL_137:
    if ((*(_DWORD *)&v51 & 0x80000) == 0) {
      goto LABEL_138;
    }
    goto LABEL_153;
  }
LABEL_152:
  *(float *)&double v41 = self->_vocalsControlMaxLevel;
  long long v61 = [NSNumber numberWithFloat:v41];
  [v3 setObject:v61 forKey:@"vocalsControlMaxLevel"];

  $AF98D11BA0603040132F42F0933BF992 v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x80000) == 0)
  {
LABEL_138:
    if ((*(_DWORD *)&v51 & 0x1000000) == 0) {
      goto LABEL_139;
    }
    goto LABEL_154;
  }
LABEL_153:
  *(float *)&double v41 = self->_vocalsControlMinLevel;
  long long v62 = [NSNumber numberWithFloat:v41];
  [v3 setObject:v62 forKey:@"vocalsControlMinLevel"];

  $AF98D11BA0603040132F42F0933BF992 v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x1000000) == 0)
  {
LABEL_139:
    if ((*(unsigned char *)&v51 & 2) == 0) {
      goto LABEL_140;
    }
    goto LABEL_155;
  }
LABEL_154:
  long long v63 = [NSNumber numberWithBool:self->_vocalsControlContinuous];
  [v3 setObject:v63 forKey:@"vocalsControlContinuous"];

  $AF98D11BA0603040132F42F0933BF992 v51 = self->_has;
  if ((*(unsigned char *)&v51 & 2) == 0)
  {
LABEL_140:
    if ((*(_WORD *)&v51 & 0x8000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_156;
  }
LABEL_155:
  long long v64 = [NSNumber numberWithDouble:self->_sleepTimerTime];
  [v3 setObject:v64 forKey:@"sleepTimerTime"];

  $AF98D11BA0603040132F42F0933BF992 v51 = self->_has;
  if ((*(_WORD *)&v51 & 0x8000) == 0)
  {
LABEL_141:
    if ((*(unsigned char *)&v51 & 1) == 0) {
      goto LABEL_143;
    }
    goto LABEL_142;
  }
LABEL_156:
  uint64_t sleepTimerStopMode = self->_sleepTimerStopMode;
  if (sleepTimerStopMode >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sleepTimerStopMode);
    v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = off_1E57D66A8[sleepTimerStopMode];
  }
  [v3 setObject:v66 forKey:@"sleepTimerStopMode"];

  if (*(_DWORD *)&self->_has)
  {
LABEL_142:
    long long v52 = [NSNumber numberWithDouble:self->_sleepTimerFireDate];
    [v3 setObject:v52 forKey:@"sleepTimerFireDate"];
  }
LABEL_143:
  dialogOptions = self->_dialogOptions;
  if (dialogOptions)
  {
    long long v54 = [(_MRDictionaryProtobuf *)dialogOptions dictionaryRepresentation];
    [v3 setObject:v54 forKey:@"dialogOptions"];
  }
  lastSectionContentItemID = self->_lastSectionContentItemID;
  if (lastSectionContentItemID) {
    [v3 setObject:lastSectionContentItemID forKey:@"lastSectionContentItemID"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    long long v56 = [NSNumber numberWithBool:self->_supportsReferencePosition];
    [v3 setObject:v56 forKey:@"supportsReferencePosition"];
  }
  id v57 = v3;

  return v57;
}

- (void)addSupportedPlaybackSessionTypes:(id)a3
{
  id v4 = a3;
  supportedPlaybackSessionTypes = self->_supportedPlaybackSessionTypes;
  id v8 = v4;
  if (!supportedPlaybackSessionTypes)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v7 = self->_supportedPlaybackSessionTypes;
    self->_supportedPlaybackSessionTypes = v6;

    id v4 = v8;
    supportedPlaybackSessionTypes = self->_supportedPlaybackSessionTypes;
  }
  [(NSMutableArray *)supportedPlaybackSessionTypes addObject:v4];
}

- (int)StringAsDisabledReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AdPlayback"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SkipLimitReached"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"InvalidAdRanges"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedDoubleClear();
  PBRepeatedFloatClear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)_MRCommandInfoProtobuf;
  [(_MRCommandInfoProtobuf *)&v3 dealloc];
}

- (int)command
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_command;
  }
  else {
    return 0;
  }
}

- (void)setCommand:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_command = a3;
}

- (void)setHasCommand:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCommand
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)commandAsString:(int)a3
{
  int v4 = @"Unknown";
  switch(a3)
  {
    case 0:
      goto LABEL_51;
    case 1:
      int v4 = @"Play";
      break;
    case 2:
      int v4 = @"Pause";
      break;
    case 3:
      int v4 = @"TogglePlayPause";
      break;
    case 4:
      int v4 = @"Stop";
      break;
    case 5:
      int v4 = @"NextTrack";
      break;
    case 6:
      int v4 = @"PreviousTrack";
      break;
    case 7:
      int v4 = @"AdvanceShuffleMode";
      break;
    case 8:
      int v4 = @"AdvanceRepeatMode";
      break;
    case 9:
      int v4 = @"BeginFastForward";
      break;
    case 10:
      int v4 = @"EndFastForward";
      break;
    case 11:
      int v4 = @"BeginRewind";
      break;
    case 12:
      int v4 = @"EndRewind";
      break;
    case 13:
      int v4 = @"Rewind15Seconds";
      break;
    case 14:
      int v4 = @"FastForward15Seconds";
      break;
    case 15:
      int v4 = @"Rewind30Seconds";
      break;
    case 16:
      int v4 = @"FastForward30Seconds";
      break;
    case 18:
      int v4 = @"SkipForward";
      break;
    case 19:
      int v4 = @"SkipBackward";
      break;
    case 20:
      int v4 = @"ChangePlaybackRate";
      break;
    case 21:
      int v4 = @"RateTrack";
      break;
    case 22:
      int v4 = @"LikeTrack";
      break;
    case 23:
      int v4 = @"DislikeTrack";
      break;
    case 24:
      int v4 = @"BookmarkTrack";
      break;
    case 25:
      int v4 = @"NextChapter";
      break;
    case 26:
      int v4 = @"PreviousChapter";
      break;
    case 27:
      int v4 = @"NextAlbum";
      break;
    case 28:
      int v4 = @"PreviousAlbum";
      break;
    case 29:
      int v4 = @"NextPlaylist";
      break;
    case 30:
      int v4 = @"PreviousPlaylist";
      break;
    case 31:
      int v4 = @"BanTrack";
      break;
    case 32:
      int v4 = @"AddTrackToWishList";
      break;
    case 33:
      int v4 = @"RemoveTrackFromWishList";
      break;
    case 34:
      int v4 = @"NextInContext";
      break;
    case 35:
      int v4 = @"PreviousInContext";
      break;
    case 41:
      int v4 = @"ResetPlaybackTimeout";
      break;
    case 45:
      int v4 = @"SeekToPlaybackPosition";
      break;
    case 46:
      int v4 = @"ChangeRepeatMode";
      break;
    case 47:
      int v4 = @"ChangeShuffleMode";
      break;
    case 48:
      int v4 = @"SetPlaybackQueue";
      break;
    case 49:
      int v4 = @"AddNowPlayingItemToLibrary";
      break;
    case 50:
      int v4 = @"CreateRadioStation";
      break;
    case 51:
      int v4 = @"AddItemToLibrary";
      break;
    case 52:
      int v4 = @"InsertIntoPlaybackQueue";
      break;
    case 53:
      int v4 = @"EnableLanguageOption";
      break;
    case 54:
      int v4 = @"DisableLanguageOption";
      break;
    case 55:
      int v4 = @"ReorderPlaybackQueue";
      break;
    case 56:
      int v4 = @"RemoveFromPlaybackQueue";
      break;
    case 57:
      int v4 = @"PlayItemInPlaybackQueue";
      break;
    case 58:
      int v4 = @"PrepareForSetQueue";
      break;
    case 59:
      int v4 = @"SetPlaybackSession";
      break;
    case 60:
      int v4 = @"PreloadPlaybackSession";
      break;
    case 61:
      int v4 = @"SetPriorityForPlaybackSession";
      break;
    case 62:
      int v4 = @"DiscardPlaybackSession";
      break;
    case 63:
      int v4 = @"Reshuffle";
      break;
    case 64:
      int v4 = @"LeaveSharedPlaybackSession";
      break;
    case 65:
      int v4 = @"PostEventNotice";
      break;
    case 124:
      int v4 = @"SetSleepTimer";
      break;
    case 135:
      int v4 = @"ChangeQueueEndAction";
      break;
    case 142:
      int v4 = @"VocalsControl";
      break;
    case 143:
      int v4 = @"PrepareVocalsControl";
      break;
    case 144:
      int v4 = @"ClearUpNextQueue";
      break;
    case 145:
      int v4 = @"PerformDialogAction";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_51:
      break;
  }
  return v4;
}

- (int)StringAsCommand:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Play"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Pause"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TogglePlayPause"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Stop"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NextTrack"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PreviousTrack"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AdvanceShuffleMode"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AdvanceRepeatMode"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BeginFastForward"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"EndFastForward"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BeginRewind"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"EndRewind"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"Rewind15Seconds"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"FastForward15Seconds"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"Rewind30Seconds"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"FastForward30Seconds"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SkipForward"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SkipBackward"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"ChangePlaybackRate"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"RateTrack"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"LikeTrack"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"DislikeTrack"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"BookmarkTrack"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"SeekToPlaybackPosition"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"ChangeRepeatMode"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"ChangeShuffleMode"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"EnableLanguageOption"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"DisableLanguageOption"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"NextChapter"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"PreviousChapter"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"NextAlbum"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"PreviousAlbum"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"NextPlaylist"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"PreviousPlaylist"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"BanTrack"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"AddTrackToWishList"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"RemoveTrackFromWishList"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"NextInContext"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"PreviousInContext"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"ResetPlaybackTimeout"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"SetPlaybackQueue"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"AddNowPlayingItemToLibrary"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"CreateRadioStation"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"AddItemToLibrary"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"InsertIntoPlaybackQueue"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"ReorderPlaybackQueue"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"RemoveFromPlaybackQueue"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"PlayItemInPlaybackQueue"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"PrepareForSetQueue"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"SetPlaybackSession"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"PreloadPlaybackSession"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"SetPriorityForPlaybackSession"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"DiscardPlaybackSession"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"Reshuffle"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"LeaveSharedPlaybackSession"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"PostEventNotice"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"SetSleepTimer"])
  {
    int v4 = 124;
  }
  else if ([v3 isEqualToString:@"ChangeQueueEndAction"])
  {
    int v4 = 135;
  }
  else if ([v3 isEqualToString:@"VocalsControl"])
  {
    int v4 = 142;
  }
  else if ([v3 isEqualToString:@"PrepareVocalsControl"])
  {
    int v4 = 143;
  }
  else if ([v3 isEqualToString:@"ClearUpNextQueue"])
  {
    int v4 = 144;
  }
  else if ([v3 isEqualToString:@"PerformDialogAction"])
  {
    int v4 = 145;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setActive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_active = a3;
}

- (void)setHasActive:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasActive
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (unint64_t)preferredIntervalsCount
{
  return self->_preferredIntervals.count;
}

- (double)preferredIntervals
{
  return self->_preferredIntervals.list;
}

- (void)clearPreferredIntervals
{
}

- (void)addPreferredInterval:(double)a3
{
}

- (double)preferredIntervalAtIndex:(unint64_t)a3
{
  p_preferredIntervals = &self->_preferredIntervals;
  unint64_t count = self->_preferredIntervals.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    double v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_preferredIntervals->list[a3];
}

- (void)setPreferredIntervals:(double *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasLocalizedTitle
{
  return self->_localizedTitle != 0;
}

- (BOOL)hasLocalizedShortTitle
{
  return self->_localizedShortTitle != 0;
}

- (void)setMinimumRating:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_minimumRating = a3;
}

- (void)setHasMinimumRating:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasMinimumRating
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setMaximumRating:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_maximumRating = a3;
}

- (void)setHasMaximumRating:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMaximumRating
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (unint64_t)supportedRatesCount
{
  return self->_supportedRates.count;
}

- (float)supportedRates
{
  return self->_supportedRates.list;
}

- (void)clearSupportedRates
{
}

- (void)addSupportedRate:(float)a3
{
}

- (float)supportedRateAtIndex:(unint64_t)a3
{
  p_supportedRates = &self->_supportedRates;
  unint64_t count = self->_supportedRates.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    double v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_supportedRates->list[a3];
}

- (void)setSupportedRates:(float *)a3 count:(unint64_t)a4
{
}

- (int)repeatMode
{
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    return self->_repeatMode;
  }
  else {
    return 0;
  }
}

- (void)setRepeatMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_uint64_t repeatMode = a3;
}

- (void)setHasRepeatMode:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRepeatMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)repeatModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E57D6628[a3];
  }

  return v3;
}

- (int)StringAsRepeatMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"One"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"All"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)shuffleMode
{
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    return self->_shuffleMode;
  }
  else {
    return 0;
  }
}

- (void)setShuffleMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_uint64_t shuffleMode = a3;
}

- (void)setHasShuffleMode:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasShuffleMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)shuffleModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E57D6648[a3];
  }

  return v3;
}

- (int)StringAsShuffleMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Off"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Albums"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Songs"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPresentationStyle:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_presentationStyle = a3;
}

- (void)setHasPresentationStyle:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPresentationStyle
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSkipInterval:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_skipInterval = a3;
}

- (void)setHasSkipInterval:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSkipInterval
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setNumAvailableSkips:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_numAvailableSkips = a3;
}

- (void)setHasNumAvailableSkips:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNumAvailableSkips
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setSkipFrequency:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_skipFrequency = a3;
}

- (void)setHasSkipFrequency:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSkipFrequency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCanScrub:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_canScrub = a3;
}

- (void)setHasCanScrub:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCanScrub
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)supportedPlaybackQueueTypes
{
  return self->_supportedPlaybackQueueTypes.list;
}

- (void)clearSupportedPlaybackQueueTypes
{
}

- (void)addSupportedPlaybackQueueTypes:(int)a3
{
}

- (void)setSupportedPlaybackQueueTypes:(int *)a3 count:(unint64_t)a4
{
}

- (void)clearSupportedCustomQueueIdentifiers
{
}

- (void)addSupportedCustomQueueIdentifier:(id)a3
{
  id v4 = a3;
  supportedCustomQueueIdentifiers = self->_supportedCustomQueueIdentifiers;
  id v8 = v4;
  if (!supportedCustomQueueIdentifiers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_supportedCustomQueueIdentifiers;
    self->_supportedCustomQueueIdentifiers = v6;

    id v4 = v8;
    supportedCustomQueueIdentifiers = self->_supportedCustomQueueIdentifiers;
  }
  [(NSMutableArray *)supportedCustomQueueIdentifiers addObject:v4];
}

- (unint64_t)supportedCustomQueueIdentifiersCount
{
  return [(NSMutableArray *)self->_supportedCustomQueueIdentifiers count];
}

- (id)supportedCustomQueueIdentifierAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_supportedCustomQueueIdentifiers objectAtIndex:a3];
}

+ (Class)supportedCustomQueueIdentifierType
{
  return (Class)objc_opt_class();
}

- (unint64_t)supportedInsertionPositionsCount
{
  return self->_supportedInsertionPositions.count;
}

- (int)supportedInsertionPositions
{
  return self->_supportedInsertionPositions.list;
}

- (void)clearSupportedInsertionPositions
{
}

- (void)addSupportedInsertionPositions:(int)a3
{
}

- (int)supportedInsertionPositionsAtIndex:(unint64_t)a3
{
  p_supportedInsertionPositions = &self->_supportedInsertionPositions;
  unint64_t count = self->_supportedInsertionPositions.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    double v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_supportedInsertionPositions->list[a3];
}

- (void)setSupportedInsertionPositions:(int *)a3 count:(unint64_t)a4
{
}

- (void)setUpNextItemCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_upNextItemCount = a3;
}

- (void)setHasUpNextItemCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasUpNextItemCount
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setPreferredPlaybackRate:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_preferredPlaybackRate = a3;
}

- (void)setHasPreferredPlaybackRate:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPreferredPlaybackRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)clearSupportedPlaybackSessionTypes
{
}

- (unint64_t)supportedPlaybackSessionTypesCount
{
  return [(NSMutableArray *)self->_supportedPlaybackSessionTypes count];
}

- (id)supportedPlaybackSessionTypesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_supportedPlaybackSessionTypes objectAtIndex:a3];
}

+ (Class)supportedPlaybackSessionTypesType
{
  return (Class)objc_opt_class();
}

- (void)clearCurrentPlaybackSessionTypes
{
}

- (unint64_t)currentPlaybackSessionTypesCount
{
  return [(NSMutableArray *)self->_currentPlaybackSessionTypes count];
}

- (id)currentPlaybackSessionTypesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_currentPlaybackSessionTypes objectAtIndex:a3];
}

+ (Class)currentPlaybackSessionTypesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPlaybackSessionIdentifier
{
  return self->_playbackSessionIdentifier != 0;
}

- (int)currentQueueEndAction
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_currentQueueEndAction;
  }
  else {
    return 0;
  }
}

- (void)setCurrentQueueEndAction:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_currentQueueEndActiouint64_t n = a3;
}

- (void)setHasCurrentQueueEndAction:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCurrentQueueEndAction
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)currentQueueEndActionAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E57D6668[a3];
  }

  return v3;
}

- (int)StringAsCurrentQueueEndAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Clear"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Reset"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AutoPlay"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)supportedQueueEndActionsCount
{
  return self->_supportedQueueEndActions.count;
}

- (int)supportedQueueEndActions
{
  return self->_supportedQueueEndActions.list;
}

- (void)clearSupportedQueueEndActions
{
}

- (void)addSupportedQueueEndActions:(int)a3
{
}

- (void)setSupportedQueueEndActions:(int *)a3 count:(unint64_t)a4
{
}

- (id)supportedQueueEndActionsAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E57D6668[a3];
  }

  return v3;
}

- (int)disabledReason
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_disabledReason;
  }
  else {
    return 0;
  }
}

- (void)setDisabledReason:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_disabledReasouint64_t n = a3;
}

- (void)setHasDisabledReason:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDisabledReason
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)disabledReasonAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E57D6688[a3];
  }

  return v3;
}

- (void)clearSupportedPlaybackSessionIdentifiers
{
}

- (void)addSupportedPlaybackSessionIdentifiers:(id)a3
{
  id v4 = a3;
  supportedPlaybackSessionIdentifiers = self->_supportedPlaybackSessionIdentifiers;
  id v8 = v4;
  if (!supportedPlaybackSessionIdentifiers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_supportedPlaybackSessionIdentifiers;
    self->_supportedPlaybackSessionIdentifiers = v6;

    id v4 = v8;
    supportedPlaybackSessionIdentifiers = self->_supportedPlaybackSessionIdentifiers;
  }
  [(NSMutableArray *)supportedPlaybackSessionIdentifiers addObject:v4];
}

- (unint64_t)supportedPlaybackSessionIdentifiersCount
{
  return [(NSMutableArray *)self->_supportedPlaybackSessionIdentifiers count];
}

- (id)supportedPlaybackSessionIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_supportedPlaybackSessionIdentifiers objectAtIndex:a3];
}

+ (Class)supportedPlaybackSessionIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasProactiveCommandOptions
{
  return self->_proactiveCommandOptions != 0;
}

- (void)setVocalsControlActive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_vocalsControlActive = a3;
}

- (void)setHasVocalsControlActive:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasVocalsControlActive
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setVocalsControlLevel:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_vocalsControlLevel = a3;
}

- (void)setHasVocalsControlLevel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasVocalsControlLevel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setVocalsControlMaxLevel:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_vocalsControlMaxLevel = a3;
}

- (void)setHasVocalsControlMaxLevel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasVocalsControlMaxLevel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setVocalsControlMinLevel:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_vocalsControlMinLevel = a3;
}

- (void)setHasVocalsControlMinLevel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasVocalsControlMinLevel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setVocalsControlContinuous:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_vocalsControlContinuous = a3;
}

- (void)setHasVocalsControlContinuous:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasVocalsControlContinuous
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setSleepTimerTime:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_sleepTimerTime = a3;
}

- (void)setHasSleepTimerTime:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasSleepTimerTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)sleepTimerStopMode
{
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    return self->_sleepTimerStopMode;
  }
  else {
    return 0;
  }
}

- (void)setSleepTimerStopMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_uint64_t sleepTimerStopMode = a3;
}

- (void)setHasSleepTimerStopMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSleepTimerStopMode
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)sleepTimerStopModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E57D66A8[a3];
  }

  return v3;
}

- (int)StringAsSleepTimerStopMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Off"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Time"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ChapterEnd"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ItemEnd"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSleepTimerFireDate:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_sleepTimerFireDate = a3;
}

- (void)setHasSleepTimerFireDate:(BOOL)a3
{
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasSleepTimerFireDate
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasDialogOptions
{
  return self->_dialogOptions != 0;
}

- (BOOL)hasLastSectionContentItemID
{
  return self->_lastSectionContentItemID != 0;
}

- (void)setSupportsReferencePosition:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_supportsReferencePositiouint64_t n = a3;
}

- (void)setHasSupportsReferencePosition:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF98D11BA0603040132F42F0933BF992 has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSupportsReferencePosition
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRCommandInfoProtobuf;
  int v4 = [(_MRCommandInfoProtobuf *)&v8 description];
  uint64_t v5 = [(_MRCommandInfoProtobuf *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return _MRCommandInfoProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  $AF98D11BA0603040132F42F0933BF992 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    $AF98D11BA0603040132F42F0933BF992 has = self->_has;
    if ((*(_DWORD *)&has & 0x200000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x200000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  if (self->_preferredIntervals.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v6;
    }
    while (v6 < self->_preferredIntervals.count);
  }
  if (self->_localizedTitle) {
    PBDataWriterWriteStringField();
  }
  $AF98D11BA0603040132F42F0933BF992 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x80) != 0)
  {
    PBDataWriterWriteFloatField();
    $AF98D11BA0603040132F42F0933BF992 v7 = self->_has;
  }
  if ((*(unsigned char *)&v7 & 0x40) != 0) {
    PBDataWriterWriteFloatField();
  }
  if (self->_supportedRates.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v8;
    }
    while (v8 < self->_supportedRates.count);
  }
  if (self->_localizedShortTitle) {
    PBDataWriterWriteStringField();
  }
  $AF98D11BA0603040132F42F0933BF992 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    $AF98D11BA0603040132F42F0933BF992 v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x1000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v9 & 0x400) == 0) {
        goto LABEL_22;
      }
      goto LABEL_97;
    }
  }
  else if ((*(_WORD *)&v9 & 0x1000) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt32Field();
  $AF98D11BA0603040132F42F0933BF992 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x400) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v9 & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteInt32Field();
  $AF98D11BA0603040132F42F0933BF992 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v9 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field();
  $AF98D11BA0603040132F42F0933BF992 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v9 & 0x2000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  $AF98D11BA0603040132F42F0933BF992 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v9 & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 4) != 0) {
LABEL_26:
  }
    PBDataWriterWriteInt32Field();
LABEL_27:
  if (self->_supportedPlaybackQueueTypes.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_supportedPlaybackQueueTypes.count);
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v11 = self->_supportedCustomQueueIdentifiers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v48;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v48 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v13);
  }

  if (self->_supportedInsertionPositions.count)
  {
    unint64_t v16 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v16;
    }
    while (v16 < self->_supportedInsertionPositions.count);
  }
  $AF98D11BA0603040132F42F0933BF992 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x10000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $AF98D11BA0603040132F42F0933BF992 v17 = self->_has;
  }
  if ((*(_WORD *)&v17 & 0x200) != 0) {
    PBDataWriterWriteFloatField();
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v18 = self->_supportedPlaybackSessionTypes;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v44;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteStringField();
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v20);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v23 = self->_currentPlaybackSessionTypes;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v40;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v23);
        }
        PBDataWriterWriteStringField();
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v25);
  }

  if (self->_playbackSessionIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_supportedQueueEndActions.count)
  {
    unint64_t v28 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v28;
    }
    while (v28 < self->_supportedQueueEndActions.count);
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v29 = self->_supportedPlaybackSessionIdentifiers;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v36;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(v29);
        }
        PBDataWriterWriteSubmessage();
        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v35 objects:v51 count:16];
    }
    while (v31);
  }

  if (self->_proactiveCommandOptions) {
    PBDataWriterWriteSubmessage();
  }
  $AF98D11BA0603040132F42F0933BF992 v34 = self->_has;
  if ((*(_DWORD *)&v34 & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $AF98D11BA0603040132F42F0933BF992 v34 = self->_has;
    if ((*(_DWORD *)&v34 & 0x20000) == 0)
    {
LABEL_78:
      if ((*(_DWORD *)&v34 & 0x40000) == 0) {
        goto LABEL_79;
      }
      goto LABEL_104;
    }
  }
  else if ((*(_DWORD *)&v34 & 0x20000) == 0)
  {
    goto LABEL_78;
  }
  PBDataWriterWriteFloatField();
  $AF98D11BA0603040132F42F0933BF992 v34 = self->_has;
  if ((*(_DWORD *)&v34 & 0x40000) == 0)
  {
LABEL_79:
    if ((*(_DWORD *)&v34 & 0x80000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteFloatField();
  $AF98D11BA0603040132F42F0933BF992 v34 = self->_has;
  if ((*(_DWORD *)&v34 & 0x80000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v34 & 0x1000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteFloatField();
  $AF98D11BA0603040132F42F0933BF992 v34 = self->_has;
  if ((*(_DWORD *)&v34 & 0x1000000) == 0)
  {
LABEL_81:
    if ((*(unsigned char *)&v34 & 2) == 0) {
      goto LABEL_82;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteBOOLField();
  $AF98D11BA0603040132F42F0933BF992 v34 = self->_has;
  if ((*(unsigned char *)&v34 & 2) == 0)
  {
LABEL_82:
    if ((*(_WORD *)&v34 & 0x8000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteDoubleField();
  $AF98D11BA0603040132F42F0933BF992 v34 = self->_has;
  if ((*(_WORD *)&v34 & 0x8000) == 0)
  {
LABEL_83:
    if ((*(unsigned char *)&v34 & 1) == 0) {
      goto LABEL_85;
    }
    goto LABEL_84;
  }
LABEL_108:
  PBDataWriterWriteInt32Field();
  if (*(_DWORD *)&self->_has) {
LABEL_84:
  }
    PBDataWriterWriteDoubleField();
LABEL_85:
  if (self->_dialogOptions) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lastSectionContentItemID) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_162;
  }
  $AF98D11BA0603040132F42F0933BF992 has = self->_has;
  int v6 = *((_DWORD *)v4 + 80);
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_command != *((_DWORD *)v4 + 37)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0) {
      goto LABEL_162;
    }
    if (self->_enabled)
    {
      if (!*((unsigned char *)v4 + 313)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)v4 + 313))
    {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0) {
      goto LABEL_162;
    }
    if (self->_active)
    {
      if (!*((unsigned char *)v4 + 312)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)v4 + 312))
    {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_162;
  }
  if (!PBRepeatedDoubleIsEqual()) {
    goto LABEL_162;
  }
  localizedTitle = self->_localizedTitle;
  if ((unint64_t)localizedTitle | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](localizedTitle, "isEqual:")) {
      goto LABEL_162;
    }
  }
  $AF98D11BA0603040132F42F0933BF992 v8 = self->_has;
  int v9 = *((_DWORD *)v4 + 80);
  if ((*(unsigned char *)&v8 & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_minimumRating != *((float *)v4 + 53)) {
      goto LABEL_162;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&v8 & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_maximumRating != *((float *)v4 + 52)) {
      goto LABEL_162;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_162;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_162;
  }
  localizedShortTitle = self->_localizedShortTitle;
  if ((unint64_t)localizedShortTitle | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](localizedShortTitle, "isEqual:")) {
      goto LABEL_162;
    }
  }
  $AF98D11BA0603040132F42F0933BF992 v11 = self->_has;
  int v12 = *((_DWORD *)v4 + 80);
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_repeatMode != *((_DWORD *)v4 + 62)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0 || self->_shuffleMode != *((_DWORD *)v4 + 63)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0 || self->_presentationStyle != *((_DWORD *)v4 + 59)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0 || self->_skipInterval != *((_DWORD *)v4 + 65)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0 || self->_numAvailableSkips != *((_DWORD *)v4 + 54)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0 || self->_skipFrequency != *((_DWORD *)v4 + 64)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_canScrub != *((_DWORD *)v4 + 36)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_162;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_162;
  }
  supportedCustomQueueIdentifiers = self->_supportedCustomQueueIdentifiers;
  if ((unint64_t)supportedCustomQueueIdentifiers | *((void *)v4 + 34))
  {
    if (!-[NSMutableArray isEqual:](supportedCustomQueueIdentifiers, "isEqual:")) {
      goto LABEL_162;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_162;
  }
  $AF98D11BA0603040132F42F0933BF992 v14 = self->_has;
  int v15 = *((_DWORD *)v4 + 80);
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
    if ((v15 & 0x10000) == 0 || self->_upNextItemCount != *((_DWORD *)v4 + 74)) {
      goto LABEL_162;
    }
  }
  else if ((v15 & 0x10000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    if ((v15 & 0x200) == 0 || self->_preferredPlaybackRate != *((float *)v4 + 58)) {
      goto LABEL_162;
    }
  }
  else if ((v15 & 0x200) != 0)
  {
    goto LABEL_162;
  }
  supportedPlaybackSessionTypes = self->_supportedPlaybackSessionTypes;
  if ((unint64_t)supportedPlaybackSessionTypes | *((void *)v4 + 36)
    && !-[NSMutableArray isEqual:](supportedPlaybackSessionTypes, "isEqual:"))
  {
    goto LABEL_162;
  }
  currentPlaybackSessionTypes = self->_currentPlaybackSessionTypes;
  if ((unint64_t)currentPlaybackSessionTypes | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](currentPlaybackSessionTypes, "isEqual:")) {
      goto LABEL_162;
    }
  }
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  if ((unint64_t)playbackSessionIdentifier | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](playbackSessionIdentifier, "isEqual:")) {
      goto LABEL_162;
    }
  }
  int v19 = *((_DWORD *)v4 + 80);
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v19 & 0x10) == 0 || self->_currentQueueEndAction != *((_DWORD *)v4 + 40)) {
      goto LABEL_162;
    }
  }
  else if ((v19 & 0x10) != 0)
  {
    goto LABEL_162;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_162:
    BOOL v28 = 0;
    goto LABEL_163;
  }
  int v20 = *((_DWORD *)v4 + 80);
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v20 & 0x20) == 0 || self->_disabledReason != *((_DWORD *)v4 + 44)) {
      goto LABEL_162;
    }
  }
  else if ((v20 & 0x20) != 0)
  {
    goto LABEL_162;
  }
  supportedPlaybackSessionIdentifiers = self->_supportedPlaybackSessionIdentifiers;
  if ((unint64_t)supportedPlaybackSessionIdentifiers | *((void *)v4 + 35)
    && !-[NSMutableArray isEqual:](supportedPlaybackSessionIdentifiers, "isEqual:"))
  {
    goto LABEL_162;
  }
  proactiveCommandOptions = self->_proactiveCommandOptions;
  if ((unint64_t)proactiveCommandOptions | *((void *)v4 + 30))
  {
    if (!-[_MRCommandOptionsProtobuf isEqual:](proactiveCommandOptions, "isEqual:")) {
      goto LABEL_162;
    }
  }
  $AF98D11BA0603040132F42F0933BF992 v23 = self->_has;
  int v24 = *((_DWORD *)v4 + 80);
  if ((*(_DWORD *)&v23 & 0x800000) != 0)
  {
    if ((v24 & 0x800000) == 0) {
      goto LABEL_162;
    }
    if (self->_vocalsControlActive)
    {
      if (!*((unsigned char *)v4 + 315)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)v4 + 315))
    {
      goto LABEL_162;
    }
  }
  else if ((v24 & 0x800000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v23 & 0x20000) != 0)
  {
    if ((v24 & 0x20000) == 0 || self->_vocalsControlLevel != *((float *)v4 + 75)) {
      goto LABEL_162;
    }
  }
  else if ((v24 & 0x20000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v23 & 0x40000) != 0)
  {
    if ((v24 & 0x40000) == 0 || self->_vocalsControlMaxLevel != *((float *)v4 + 76)) {
      goto LABEL_162;
    }
  }
  else if ((v24 & 0x40000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v23 & 0x80000) != 0)
  {
    if ((v24 & 0x80000) == 0 || self->_vocalsControlMinLevel != *((float *)v4 + 77)) {
      goto LABEL_162;
    }
  }
  else if ((v24 & 0x80000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v23 & 0x1000000) != 0)
  {
    if ((v24 & 0x1000000) == 0) {
      goto LABEL_162;
    }
    if (self->_vocalsControlContinuous)
    {
      if (!*((unsigned char *)v4 + 316)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)v4 + 316))
    {
      goto LABEL_162;
    }
  }
  else if ((v24 & 0x1000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&v23 & 2) != 0)
  {
    if ((v24 & 2) == 0 || self->_sleepTimerTime != *((double *)v4 + 17)) {
      goto LABEL_162;
    }
  }
  else if ((v24 & 2) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v23 & 0x8000) != 0)
  {
    if ((v24 & 0x8000) == 0 || self->_sleepTimerStopMode != *((_DWORD *)v4 + 66)) {
      goto LABEL_162;
    }
  }
  else if ((v24 & 0x8000) != 0)
  {
    goto LABEL_162;
  }
  if (*(unsigned char *)&v23)
  {
    if ((v24 & 1) == 0 || self->_sleepTimerFireDate != *((double *)v4 + 16)) {
      goto LABEL_162;
    }
  }
  else if (v24)
  {
    goto LABEL_162;
  }
  dialogOptions = self->_dialogOptions;
  if ((unint64_t)dialogOptions | *((void *)v4 + 21)
    && !-[_MRDictionaryProtobuf isEqual:](dialogOptions, "isEqual:"))
  {
    goto LABEL_162;
  }
  lastSectionContentItemID = self->_lastSectionContentItemID;
  if ((unint64_t)lastSectionContentItemID | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](lastSectionContentItemID, "isEqual:")) {
      goto LABEL_162;
    }
  }
  int v27 = *((_DWORD *)v4 + 80);
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    if ((v27 & 0x400000) != 0)
    {
      if (self->_supportsReferencePosition)
      {
        if (!*((unsigned char *)v4 + 314)) {
          goto LABEL_162;
        }
      }
      else if (*((unsigned char *)v4 + 314))
      {
        goto LABEL_162;
      }
      BOOL v28 = 1;
      goto LABEL_163;
    }
    goto LABEL_162;
  }
  BOOL v28 = (v27 & 0x400000) == 0;
LABEL_163:

  return v28;
}

- (unint64_t)hash
{
  $AF98D11BA0603040132F42F0933BF992 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
    uint64_t v90 = 0;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v89 = 0;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v90 = 2654435761 * self->_command;
  if ((*(_DWORD *)&has & 0x200000) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v89 = 2654435761 * self->_enabled;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_4:
    uint64_t v88 = 2654435761 * self->_active;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v88 = 0;
LABEL_8:
  uint64_t v87 = PBRepeatedDoubleHash();
  NSUInteger v86 = [(NSString *)self->_localizedTitle hash];
  $AF98D11BA0603040132F42F0933BF992 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 0x80) != 0)
  {
    float minimumRating = self->_minimumRating;
    float v14 = -minimumRating;
    if (minimumRating >= 0.0) {
      float v14 = self->_minimumRating;
    }
    float v15 = floorf(v14 + 0.5);
    float v16 = (float)(v14 - v15) * 1.8447e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmodf(v15, 1.8447e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v17 += (unint64_t)v16;
      }
    }
    else
    {
      v17 -= (unint64_t)fabsf(v16);
    }
    unint64_t v85 = v17;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_10;
    }
LABEL_24:
    unint64_t v84 = 0;
    goto LABEL_25;
  }
  unint64_t v85 = 0;
  if ((*(unsigned char *)&v4 & 0x40) == 0) {
    goto LABEL_24;
  }
LABEL_10:
  float maximumRating = self->_maximumRating;
  float v6 = -maximumRating;
  if (maximumRating >= 0.0) {
    float v6 = self->_maximumRating;
  }
  float v7 = floorf(v6 + 0.5);
  float v8 = (float)(v6 - v7) * 1.8447e19;
  float v9 = fmodf(v7, 1.8447e19);
  unint64_t v10 = 2654435761u * (unint64_t)v9;
  unint64_t v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0) {
    unint64_t v11 = 2654435761u * (unint64_t)v9;
  }
  unint64_t v12 = v10 - (unint64_t)fabsf(v8);
  if (v8 >= 0.0) {
    unint64_t v12 = v11;
  }
  unint64_t v84 = v12;
LABEL_25:
  uint64_t v83 = PBRepeatedFloatHash();
  NSUInteger v82 = [(NSString *)self->_localizedShortTitle hash];
  $AF98D11BA0603040132F42F0933BF992 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x800) != 0)
  {
    uint64_t v81 = 2654435761 * self->_repeatMode;
    if ((*(_WORD *)&v18 & 0x1000) != 0)
    {
LABEL_27:
      uint64_t v80 = 2654435761 * self->_shuffleMode;
      if ((*(_WORD *)&v18 & 0x400) != 0) {
        goto LABEL_28;
      }
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v81 = 0;
    if ((*(_WORD *)&v18 & 0x1000) != 0) {
      goto LABEL_27;
    }
  }
  uint64_t v80 = 0;
  if ((*(_WORD *)&v18 & 0x400) != 0)
  {
LABEL_28:
    uint64_t v79 = 2654435761 * self->_presentationStyle;
    if ((*(_WORD *)&v18 & 0x4000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v79 = 0;
  if ((*(_WORD *)&v18 & 0x4000) != 0)
  {
LABEL_29:
    uint64_t v78 = 2654435761 * self->_skipInterval;
    if ((*(_WORD *)&v18 & 0x100) != 0) {
      goto LABEL_30;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v78 = 0;
  if ((*(_WORD *)&v18 & 0x100) != 0)
  {
LABEL_30:
    uint64_t v77 = 2654435761 * self->_numAvailableSkips;
    if ((*(_WORD *)&v18 & 0x2000) != 0) {
      goto LABEL_31;
    }
LABEL_38:
    uint64_t v76 = 0;
    if ((*(unsigned char *)&v18 & 4) != 0) {
      goto LABEL_32;
    }
    goto LABEL_39;
  }
LABEL_37:
  uint64_t v77 = 0;
  if ((*(_WORD *)&v18 & 0x2000) == 0) {
    goto LABEL_38;
  }
LABEL_31:
  uint64_t v76 = 2654435761 * self->_skipFrequency;
  if ((*(unsigned char *)&v18 & 4) != 0)
  {
LABEL_32:
    uint64_t v75 = 2654435761 * self->_canScrub;
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v75 = 0;
LABEL_40:
  uint64_t v74 = PBRepeatedInt32Hash();
  uint64_t v73 = [(NSMutableArray *)self->_supportedCustomQueueIdentifiers hash];
  uint64_t v72 = PBRepeatedInt32Hash();
  $AF98D11BA0603040132F42F0933BF992 v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x10000) != 0)
  {
    uint64_t v71 = 2654435761 * self->_upNextItemCount;
    if ((*(_WORD *)&v19 & 0x200) != 0) {
      goto LABEL_42;
    }
LABEL_50:
    unint64_t v70 = 0;
    goto LABEL_51;
  }
  uint64_t v71 = 0;
  if ((*(_WORD *)&v19 & 0x200) == 0) {
    goto LABEL_50;
  }
LABEL_42:
  float preferredPlaybackRate = self->_preferredPlaybackRate;
  float v21 = -preferredPlaybackRate;
  if (preferredPlaybackRate >= 0.0) {
    float v21 = self->_preferredPlaybackRate;
  }
  float v22 = floorf(v21 + 0.5);
  float v23 = (float)(v21 - v22) * 1.8447e19;
  float v24 = fmodf(v22, 1.8447e19);
  unint64_t v25 = 2654435761u * (unint64_t)v24;
  unint64_t v26 = v25 + (unint64_t)v23;
  if (v23 <= 0.0) {
    unint64_t v26 = 2654435761u * (unint64_t)v24;
  }
  unint64_t v27 = v25 - (unint64_t)fabsf(v23);
  if (v23 >= 0.0) {
    unint64_t v27 = v26;
  }
  unint64_t v70 = v27;
LABEL_51:
  uint64_t v69 = [(NSMutableArray *)self->_supportedPlaybackSessionTypes hash];
  uint64_t v68 = [(NSMutableArray *)self->_currentPlaybackSessionTypes hash];
  NSUInteger v67 = [(NSString *)self->_playbackSessionIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v66 = 2654435761 * self->_currentQueueEndAction;
  }
  else {
    uint64_t v66 = 0;
  }
  uint64_t v65 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v64 = 2654435761 * self->_disabledReason;
  }
  else {
    uint64_t v64 = 0;
  }
  uint64_t v63 = [(NSMutableArray *)self->_supportedPlaybackSessionIdentifiers hash];
  unint64_t v62 = [(_MRCommandOptionsProtobuf *)self->_proactiveCommandOptions hash];
  $AF98D11BA0603040132F42F0933BF992 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x800000) != 0)
  {
    uint64_t v61 = 2654435761 * self->_vocalsControlActive;
    if ((*(_DWORD *)&v28 & 0x20000) != 0) {
      goto LABEL_59;
    }
LABEL_64:
    unint64_t v33 = 0;
    goto LABEL_67;
  }
  uint64_t v61 = 0;
  if ((*(_DWORD *)&v28 & 0x20000) == 0) {
    goto LABEL_64;
  }
LABEL_59:
  float vocalsControlLevel = self->_vocalsControlLevel;
  float v30 = -vocalsControlLevel;
  if (vocalsControlLevel >= 0.0) {
    float v30 = self->_vocalsControlLevel;
  }
  float v31 = floorf(v30 + 0.5);
  float v32 = (float)(v30 - v31) * 1.8447e19;
  unint64_t v33 = 2654435761u * (unint64_t)fmodf(v31, 1.8447e19);
  if (v32 >= 0.0)
  {
    if (v32 > 0.0) {
      v33 += (unint64_t)v32;
    }
  }
  else
  {
    v33 -= (unint64_t)fabsf(v32);
  }
LABEL_67:
  if ((*(_DWORD *)&v28 & 0x40000) != 0)
  {
    float vocalsControlMaxLevel = self->_vocalsControlMaxLevel;
    float v36 = -vocalsControlMaxLevel;
    if (vocalsControlMaxLevel >= 0.0) {
      float v36 = self->_vocalsControlMaxLevel;
    }
    float v37 = floorf(v36 + 0.5);
    float v38 = (float)(v36 - v37) * 1.8447e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((*(_DWORD *)&v28 & 0x80000) != 0)
  {
    float vocalsControlMinLevel = self->_vocalsControlMinLevel;
    float v41 = -vocalsControlMinLevel;
    if (vocalsControlMinLevel >= 0.0) {
      float v41 = self->_vocalsControlMinLevel;
    }
    float v42 = floorf(v41 + 0.5);
    float v43 = (float)(v41 - v42) * 1.8447e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmodf(v42, 1.8447e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabsf(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  if ((*(_DWORD *)&v28 & 0x1000000) != 0)
  {
    uint64_t v59 = 2654435761 * self->_vocalsControlContinuous;
    if ((*(unsigned char *)&v28 & 2) != 0) {
      goto LABEL_85;
    }
LABEL_90:
    unint64_t v48 = 0;
    goto LABEL_93;
  }
  uint64_t v59 = 0;
  if ((*(unsigned char *)&v28 & 2) == 0) {
    goto LABEL_90;
  }
LABEL_85:
  double sleepTimerTime = self->_sleepTimerTime;
  double v45 = -sleepTimerTime;
  if (sleepTimerTime >= 0.0) {
    double v45 = self->_sleepTimerTime;
  }
  long double v46 = floor(v45 + 0.5);
  double v47 = (v45 - v46) * 1.84467441e19;
  unint64_t v48 = 2654435761u * (unint64_t)fmod(v46, 1.84467441e19);
  if (v47 >= 0.0)
  {
    if (v47 > 0.0) {
      v48 += (unint64_t)v47;
    }
  }
  else
  {
    v48 -= (unint64_t)fabs(v47);
  }
LABEL_93:
  if ((*(_WORD *)&v28 & 0x8000) != 0)
  {
    uint64_t v49 = 2654435761 * self->_sleepTimerStopMode;
    if (*(unsigned char *)&v28) {
      goto LABEL_95;
    }
LABEL_100:
    unint64_t v54 = 0;
    goto LABEL_103;
  }
  uint64_t v49 = 0;
  if ((*(unsigned char *)&v28 & 1) == 0) {
    goto LABEL_100;
  }
LABEL_95:
  double sleepTimerFireDate = self->_sleepTimerFireDate;
  double v51 = -sleepTimerFireDate;
  if (sleepTimerFireDate >= 0.0) {
    double v51 = self->_sleepTimerFireDate;
  }
  long double v52 = floor(v51 + 0.5);
  double v53 = (v51 - v52) * 1.84467441e19;
  unint64_t v54 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
  if (v53 >= 0.0)
  {
    if (v53 > 0.0) {
      v54 += (unint64_t)v53;
    }
  }
  else
  {
    v54 -= (unint64_t)fabs(v53);
  }
LABEL_103:
  unint64_t v55 = [(_MRDictionaryProtobuf *)self->_dialogOptions hash];
  NSUInteger v56 = [(NSString *)self->_lastSectionContentItemID hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    uint64_t v57 = 2654435761 * self->_supportsReferencePosition;
  }
  else {
    uint64_t v57 = 0;
  }
  return v89 ^ v90 ^ v88 ^ v87 ^ v85 ^ v84 ^ v83 ^ v86 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v33 ^ v34 ^ v39 ^ v60 ^ v48 ^ v49 ^ v54 ^ v55 ^ v56 ^ v57;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  int v6 = *((_DWORD *)v4 + 80);
  if ((v6 & 8) != 0)
  {
    self->_command = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_has |= 8u;
    int v6 = *((_DWORD *)v4 + 80);
    if ((v6 & 0x200000) == 0)
    {
LABEL_3:
      if ((v6 & 0x100000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v6 & 0x200000) == 0)
  {
    goto LABEL_3;
  }
  self->_enabled = *((unsigned char *)v4 + 313);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((*((_DWORD *)v4 + 80) & 0x100000) != 0)
  {
LABEL_4:
    self->_active = *((unsigned char *)v4 + 312);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_5:
  uint64_t v7 = [v4 preferredIntervalsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      [v5 preferredIntervalAtIndex:i];
      -[_MRCommandInfoProtobuf addPreferredInterval:](self, "addPreferredInterval:");
    }
  }
  if (*((void *)v5 + 25)) {
    -[_MRCommandInfoProtobuf setLocalizedTitle:](self, "setLocalizedTitle:");
  }
  int v10 = *((_DWORD *)v5 + 80);
  if ((v10 & 0x80) != 0)
  {
    self->_float minimumRating = *((float *)v5 + 53);
    *(_DWORD *)&self->_has |= 0x80u;
    int v10 = *((_DWORD *)v5 + 80);
  }
  if ((v10 & 0x40) != 0)
  {
    self->_float maximumRating = *((float *)v5 + 52);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  uint64_t v11 = [v5 supportedRatesCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t j = 0; j != v12; ++j)
    {
      [v5 supportedRateAtIndex:j];
      -[_MRCommandInfoProtobuf addSupportedRate:](self, "addSupportedRate:");
    }
  }
  if (*((void *)v5 + 24)) {
    -[_MRCommandInfoProtobuf setLocalizedShortTitle:](self, "setLocalizedShortTitle:");
  }
  int v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x800) != 0)
  {
    self->_uint64_t repeatMode = *((_DWORD *)v5 + 62);
    *(_DWORD *)&self->_has |= 0x800u;
    int v14 = *((_DWORD *)v5 + 80);
    if ((v14 & 0x1000) == 0)
    {
LABEL_21:
      if ((v14 & 0x400) == 0) {
        goto LABEL_22;
      }
      goto LABEL_82;
    }
  }
  else if ((v14 & 0x1000) == 0)
  {
    goto LABEL_21;
  }
  self->_uint64_t shuffleMode = *((_DWORD *)v5 + 63);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x400) == 0)
  {
LABEL_22:
    if ((v14 & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_presentationStyle = *((_DWORD *)v5 + 59);
  *(_DWORD *)&self->_has |= 0x400u;
  int v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x4000) == 0)
  {
LABEL_23:
    if ((v14 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_skipInterval = *((_DWORD *)v5 + 65);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x100) == 0)
  {
LABEL_24:
    if ((v14 & 0x2000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_numAvailableSkips = *((_DWORD *)v5 + 54);
  *(_DWORD *)&self->_has |= 0x100u;
  int v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x2000) == 0)
  {
LABEL_25:
    if ((v14 & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_85:
  self->_skipFrequency = *((_DWORD *)v5 + 64);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v5 + 80) & 4) != 0)
  {
LABEL_26:
    self->_canScrub = *((_DWORD *)v5 + 36);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_27:
  uint64_t v15 = [v5 supportedPlaybackQueueTypesCount];
  if (v15)
  {
    uint64_t v16 = v15;
    for (uint64_t k = 0; k != v16; ++k)
      -[_MRCommandInfoProtobuf addSupportedPlaybackQueueTypes:](self, "addSupportedPlaybackQueueTypes:", [v5 supportedPlaybackQueueTypesAtIndex:k]);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v18 = *((id *)v5 + 34);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v63;
    do
    {
      for (uint64_t m = 0; m != v20; ++m)
      {
        if (*(void *)v63 != v21) {
          objc_enumerationMutation(v18);
        }
        [(_MRCommandInfoProtobuf *)self addSupportedCustomQueueIdentifier:*(void *)(*((void *)&v62 + 1) + 8 * m)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v20);
  }

  uint64_t v23 = [v5 supportedInsertionPositionsCount];
  if (v23)
  {
    uint64_t v24 = v23;
    for (uint64_t n = 0; n != v24; ++n)
      -[_MRCommandInfoProtobuf addSupportedInsertionPositions:](self, "addSupportedInsertionPositions:", [v5 supportedInsertionPositionsAtIndex:n]);
  }
  int v26 = *((_DWORD *)v5 + 80);
  if ((v26 & 0x10000) != 0)
  {
    self->_upNextItemCount = *((_DWORD *)v5 + 74);
    *(_DWORD *)&self->_has |= 0x10000u;
    int v26 = *((_DWORD *)v5 + 80);
  }
  if ((v26 & 0x200) != 0)
  {
    self->_float preferredPlaybackRate = *((float *)v5 + 58);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v27 = *((id *)v5 + 36);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v59;
    do
    {
      for (iuint64_t i = 0; ii != v29; ++ii)
      {
        if (*(void *)v59 != v30) {
          objc_enumerationMutation(v27);
        }
        [(_MRCommandInfoProtobuf *)self addSupportedPlaybackSessionTypes:*(void *)(*((void *)&v58 + 1) + 8 * ii)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v29);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v32 = *((id *)v5 + 19);
  uint64_t v33 = [v32 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v55;
    do
    {
      for (juint64_t j = 0; jj != v34; ++jj)
      {
        if (*(void *)v55 != v35) {
          objc_enumerationMutation(v32);
        }
        [(_MRCommandInfoProtobuf *)self addCurrentPlaybackSessionTypes:*(void *)(*((void *)&v54 + 1) + 8 * jj)];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v34);
  }

  if (*((void *)v5 + 28)) {
    -[_MRCommandInfoProtobuf setPlaybackSessionIdentifier:](self, "setPlaybackSessionIdentifier:");
  }
  if ((*((unsigned char *)v5 + 320) & 0x10) != 0)
  {
    self->_currentQueueEndActiouint64_t n = *((_DWORD *)v5 + 40);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  uint64_t v37 = [v5 supportedQueueEndActionsCount];
  if (v37)
  {
    uint64_t v38 = v37;
    for (kuint64_t k = 0; kk != v38; ++kk)
      -[_MRCommandInfoProtobuf addSupportedQueueEndActions:](self, "addSupportedQueueEndActions:", [v5 supportedQueueEndActionsAtIndex:kk]);
  }
  if ((*((unsigned char *)v5 + 320) & 0x20) != 0)
  {
    self->_disabledReasouint64_t n = *((_DWORD *)v5 + 44);
    *(_DWORD *)&self->_has |= 0x20u;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v40 = *((id *)v5 + 35);
  uint64_t v41 = [v40 countByEnumeratingWithState:&v50 objects:v66 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v51;
    do
    {
      for (muint64_t m = 0; mm != v42; ++mm)
      {
        if (*(void *)v51 != v43) {
          objc_enumerationMutation(v40);
        }
        -[_MRCommandInfoProtobuf addSupportedPlaybackSessionIdentifiers:](self, "addSupportedPlaybackSessionIdentifiers:", *(void *)(*((void *)&v50 + 1) + 8 * mm), (void)v50);
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v50 objects:v66 count:16];
    }
    while (v42);
  }

  proactiveCommandOptions = self->_proactiveCommandOptions;
  uint64_t v46 = *((void *)v5 + 30);
  if (proactiveCommandOptions)
  {
    if (v46) {
      -[_MRCommandOptionsProtobuf mergeFrom:](proactiveCommandOptions, "mergeFrom:");
    }
  }
  else if (v46)
  {
    -[_MRCommandInfoProtobuf setProactiveCommandOptions:](self, "setProactiveCommandOptions:");
  }
  int v47 = *((_DWORD *)v5 + 80);
  if ((v47 & 0x800000) != 0)
  {
    self->_vocalsControlActive = *((unsigned char *)v5 + 315);
    *(_DWORD *)&self->_has |= 0x800000u;
    int v47 = *((_DWORD *)v5 + 80);
    if ((v47 & 0x20000) == 0)
    {
LABEL_91:
      if ((v47 & 0x40000) == 0) {
        goto LABEL_92;
      }
      goto LABEL_103;
    }
  }
  else if ((v47 & 0x20000) == 0)
  {
    goto LABEL_91;
  }
  self->_float vocalsControlLevel = *((float *)v5 + 75);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v47 = *((_DWORD *)v5 + 80);
  if ((v47 & 0x40000) == 0)
  {
LABEL_92:
    if ((v47 & 0x80000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_float vocalsControlMaxLevel = *((float *)v5 + 76);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v47 = *((_DWORD *)v5 + 80);
  if ((v47 & 0x80000) == 0)
  {
LABEL_93:
    if ((v47 & 0x1000000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_float vocalsControlMinLevel = *((float *)v5 + 77);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v47 = *((_DWORD *)v5 + 80);
  if ((v47 & 0x1000000) == 0)
  {
LABEL_94:
    if ((v47 & 2) == 0) {
      goto LABEL_95;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_vocalsControlContinuous = *((unsigned char *)v5 + 316);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v47 = *((_DWORD *)v5 + 80);
  if ((v47 & 2) == 0)
  {
LABEL_95:
    if ((v47 & 0x8000) == 0) {
      goto LABEL_96;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_double sleepTimerTime = *((double *)v5 + 17);
  *(_DWORD *)&self->_has |= 2u;
  int v47 = *((_DWORD *)v5 + 80);
  if ((v47 & 0x8000) == 0)
  {
LABEL_96:
    if ((v47 & 1) == 0) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
LABEL_107:
  self->_uint64_t sleepTimerStopMode = *((_DWORD *)v5 + 66);
  *(_DWORD *)&self->_has |= 0x8000u;
  if (*((_DWORD *)v5 + 80))
  {
LABEL_97:
    self->_double sleepTimerFireDate = *((double *)v5 + 16);
    *(_DWORD *)&self->_has |= 1u;
  }
LABEL_98:
  dialogOptions = self->_dialogOptions;
  uint64_t v49 = *((void *)v5 + 21);
  if (dialogOptions)
  {
    if (v49) {
      -[_MRDictionaryProtobuf mergeFrom:](dialogOptions, "mergeFrom:");
    }
  }
  else if (v49)
  {
    -[_MRCommandInfoProtobuf setDialogOptions:](self, "setDialogOptions:");
  }
  if (*((void *)v5 + 23)) {
    -[_MRCommandInfoProtobuf setLastSectionContentItemID:](self, "setLastSectionContentItemID:");
  }
  if ((*((unsigned char *)v5 + 322) & 0x40) != 0)
  {
    self->_supportsReferencePositiouint64_t n = *((unsigned char *)v5 + 314);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)active
{
  return self->_active;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedShortTitle
{
  return self->_localizedShortTitle;
}

- (void)setLocalizedShortTitle:(id)a3
{
}

- (float)minimumRating
{
  return self->_minimumRating;
}

- (float)maximumRating
{
  return self->_maximumRating;
}

- (int)presentationStyle
{
  return self->_presentationStyle;
}

- (int)skipInterval
{
  return self->_skipInterval;
}

- (int)numAvailableSkips
{
  return self->_numAvailableSkips;
}

- (int)skipFrequency
{
  return self->_skipFrequency;
}

- (int)canScrub
{
  return self->_canScrub;
}

- (NSMutableArray)supportedCustomQueueIdentifiers
{
  return self->_supportedCustomQueueIdentifiers;
}

- (void)setSupportedCustomQueueIdentifiers:(id)a3
{
}

- (int)upNextItemCount
{
  return self->_upNextItemCount;
}

- (float)preferredPlaybackRate
{
  return self->_preferredPlaybackRate;
}

- (NSMutableArray)supportedPlaybackSessionTypes
{
  return self->_supportedPlaybackSessionTypes;
}

- (void)setSupportedPlaybackSessionTypes:(id)a3
{
}

- (NSMutableArray)currentPlaybackSessionTypes
{
  return self->_currentPlaybackSessionTypes;
}

- (void)setCurrentPlaybackSessionTypes:(id)a3
{
}

- (NSString)playbackSessionIdentifier
{
  return self->_playbackSessionIdentifier;
}

- (void)setPlaybackSessionIdentifier:(id)a3
{
}

- (NSMutableArray)supportedPlaybackSessionIdentifiers
{
  return self->_supportedPlaybackSessionIdentifiers;
}

- (void)setSupportedPlaybackSessionIdentifiers:(id)a3
{
}

- (_MRCommandOptionsProtobuf)proactiveCommandOptions
{
  return self->_proactiveCommandOptions;
}

- (void)setProactiveCommandOptions:(id)a3
{
}

- (BOOL)vocalsControlActive
{
  return self->_vocalsControlActive;
}

- (float)vocalsControlLevel
{
  return self->_vocalsControlLevel;
}

- (float)vocalsControlMaxLevel
{
  return self->_vocalsControlMaxLevel;
}

- (float)vocalsControlMinLevel
{
  return self->_vocalsControlMinLevel;
}

- (BOOL)vocalsControlContinuous
{
  return self->_vocalsControlContinuous;
}

- (double)sleepTimerTime
{
  return self->_sleepTimerTime;
}

- (double)sleepTimerFireDate
{
  return self->_sleepTimerFireDate;
}

- (_MRDictionaryProtobuf)dialogOptions
{
  return self->_dialogOptions;
}

- (void)setDialogOptions:(id)a3
{
}

- (NSString)lastSectionContentItemID
{
  return self->_lastSectionContentItemID;
}

- (void)setLastSectionContentItemID:(id)a3
{
}

- (BOOL)supportsReferencePosition
{
  return self->_supportsReferencePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPlaybackSessionTypes, 0);
  objc_storeStrong((id *)&self->_supportedPlaybackSessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedCustomQueueIdentifiers, 0);
  objc_storeStrong((id *)&self->_proactiveCommandOptions, 0);
  objc_storeStrong((id *)&self->_playbackSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedShortTitle, 0);
  objc_storeStrong((id *)&self->_lastSectionContentItemID, 0);
  objc_storeStrong((id *)&self->_dialogOptions, 0);

  objc_storeStrong((id *)&self->_currentPlaybackSessionTypes, 0);
}

@end