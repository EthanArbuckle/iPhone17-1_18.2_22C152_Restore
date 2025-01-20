@interface _NMRCommandInfoProtobuf
- (BOOL)active;
- (BOOL)enabled;
- (BOOL)hasActive;
- (BOOL)hasCommand;
- (BOOL)hasCurrentQueueEndAction;
- (BOOL)hasEnabled;
- (BOOL)hasLocalizedShortTitle;
- (BOOL)hasLocalizedTitle;
- (BOOL)hasMaximumRating;
- (BOOL)hasMinimumRating;
- (BOOL)hasPreferredPlaybackRate;
- (BOOL)hasPresentationStyle;
- (BOOL)hasRepeatMode;
- (BOOL)hasShuffleMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)localizedShortTitle;
- (NSString)localizedTitle;
- (double)preferredIntervalAtIndex:(unint64_t)a3;
- (double)preferredIntervals;
- (float)maximumRating;
- (float)minimumRating;
- (float)preferredPlaybackRate;
- (float)supportedPlaybackRateAtIndex:(unint64_t)a3;
- (float)supportedPlaybackRates;
- (id)commandAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentQueueEndActionAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)repeatModeAsString:(int)a3;
- (id)shuffleModeAsString:(int)a3;
- (id)supportedQueueEndActionsAsString:(int)a3;
- (int)StringAsCommand:(id)a3;
- (int)StringAsCurrentQueueEndAction:(id)a3;
- (int)StringAsRepeatMode:(id)a3;
- (int)StringAsShuffleMode:(id)a3;
- (int)StringAsSupportedQueueEndActions:(id)a3;
- (int)command;
- (int)currentQueueEndAction;
- (int)presentationStyle;
- (int)repeatMode;
- (int)shuffleMode;
- (int)supportedQueueEndActionAtIndex:(unint64_t)a3;
- (int)supportedQueueEndActions;
- (unint64_t)hash;
- (unint64_t)preferredIntervalsCount;
- (unint64_t)supportedPlaybackRatesCount;
- (unint64_t)supportedQueueEndActionsCount;
- (void)addPreferredInterval:(double)a3;
- (void)addSupportedPlaybackRate:(float)a3;
- (void)addSupportedQueueEndAction:(int)a3;
- (void)clearPreferredIntervals;
- (void)clearSupportedPlaybackRates;
- (void)clearSupportedQueueEndActions;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setCommand:(int)a3;
- (void)setCurrentQueueEndAction:(int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHasActive:(BOOL)a3;
- (void)setHasCommand:(BOOL)a3;
- (void)setHasCurrentQueueEndAction:(BOOL)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)setHasMaximumRating:(BOOL)a3;
- (void)setHasMinimumRating:(BOOL)a3;
- (void)setHasPreferredPlaybackRate:(BOOL)a3;
- (void)setHasPresentationStyle:(BOOL)a3;
- (void)setHasRepeatMode:(BOOL)a3;
- (void)setHasShuffleMode:(BOOL)a3;
- (void)setLocalizedShortTitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setMaximumRating:(float)a3;
- (void)setMinimumRating:(float)a3;
- (void)setPreferredIntervals:(double *)a3 count:(unint64_t)a4;
- (void)setPreferredPlaybackRate:(float)a3;
- (void)setPresentationStyle:(int)a3;
- (void)setRepeatMode:(int)a3;
- (void)setShuffleMode:(int)a3;
- (void)setSupportedPlaybackRates:(float *)a3 count:(unint64_t)a4;
- (void)setSupportedQueueEndActions:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation _NMRCommandInfoProtobuf

- (void)dealloc
{
  PBRepeatedDoubleClear();
  PBRepeatedFloatClear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)_NMRCommandInfoProtobuf;
  [(_NMRCommandInfoProtobuf *)&v3 dealloc];
}

- (int)command
{
  if (*(_WORD *)&self->_has) {
    return self->_command;
  }
  else {
    return 0;
  }
}

- (void)setCommand:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_command = a3;
}

- (void)setHasCommand:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCommand
{
  return *(_WORD *)&self->_has & 1;
}

- (id)commandAsString:(int)a3
{
  v4 = @"Unknown";
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v4 = @"Play";
      return v4;
    case 2:
      v4 = @"Pause";
      return v4;
    case 3:
      v4 = @"TogglePlayPause";
      return v4;
    case 4:
      v4 = @"Stop";
      return v4;
    case 5:
      v4 = @"NextTrack";
      return v4;
    case 6:
      v4 = @"PreviousTrack";
      return v4;
    case 7:
      v4 = @"AdvanceShuffleMode";
      return v4;
    case 8:
      v4 = @"AdvanceRepeatMode";
      return v4;
    case 9:
      v4 = @"BeginFastForward";
      return v4;
    case 10:
      v4 = @"EndFastForward";
      return v4;
    case 11:
      v4 = @"BeginRewind";
      return v4;
    case 12:
      v4 = @"EndRewind";
      return v4;
    case 13:
      v4 = @"Rewind15Seconds";
      return v4;
    case 14:
      v4 = @"FastForward15Seconds";
      return v4;
    case 15:
      v4 = @"Rewind30Seconds";
      return v4;
    case 16:
      v4 = @"FastForward30Seconds";
      return v4;
    case 17:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 42:
    case 43:
    case 44:
      goto LABEL_9;
    case 18:
      v4 = @"SkipForward";
      return v4;
    case 19:
      v4 = @"SkipBackward";
      return v4;
    case 20:
      v4 = @"ChangePlaybackRate";
      return v4;
    case 21:
      v4 = @"RateTrack";
      return v4;
    case 22:
      v4 = @"LikeTrack";
      return v4;
    case 23:
      v4 = @"DislikeTrack";
      return v4;
    case 24:
      v4 = @"BookmarkTrack";
      return v4;
    case 25:
      v4 = @"NextChapter";
      return v4;
    case 26:
      v4 = @"PreviousChapter";
      return v4;
    case 27:
      v4 = @"NextAlbum";
      return v4;
    case 28:
      v4 = @"PreviousAlbum";
      return v4;
    case 29:
      v4 = @"NextPlaylist";
      return v4;
    case 30:
      v4 = @"PreviousPlaylist";
      return v4;
    case 31:
      v4 = @"BanTrack";
      return v4;
    case 32:
      v4 = @"AddTrackToWishList";
      return v4;
    case 33:
      v4 = @"RemoveTrackFromWishList";
      return v4;
    case 34:
      v4 = @"NextInContext";
      return v4;
    case 35:
      v4 = @"PreviousInContext";
      return v4;
    case 41:
      v4 = @"ResetPlaybackTimeout";
      return v4;
    case 45:
      v4 = @"SeekToPlaybackPosition";
      return v4;
    case 46:
      v4 = @"ChangeRepeatMode";
      return v4;
    case 47:
      v4 = @"ChangeShuffleMode";
      return v4;
    case 48:
      v4 = @"SetPlaybackQueue";
      return v4;
    case 49:
      v4 = @"AddNowPlayingItemToLibrary";
      return v4;
    case 50:
      v4 = @"CreateRadioStation";
      return v4;
    case 51:
      v4 = @"AddItemToLibrary";
      return v4;
    case 52:
      v4 = @"InsertIntoPlaybackQueue";
      return v4;
    case 53:
      v4 = @"PlayItemInPlaybackQueue";
      return v4;
    default:
      if (a3 == 135)
      {
        v4 = @"ChangeQueueEndAction";
      }
      else
      {
LABEL_9:
        v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_10:
      }
      return v4;
  }
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
  else if ([v3 isEqualToString:@"PlayItemInPlaybackQueue"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"ChangeQueueEndAction"])
  {
    int v4 = 135;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasEnabled
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setActive:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_active = a3;
}

- (void)setHasActive:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasActive
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
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
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
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
  *(_WORD *)&self->_has |= 8u;
  self->_minimumRating = a3;
}

- (void)setHasMinimumRating:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMinimumRating
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setMaximumRating:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_maximumRating = a3;
}

- (void)setHasMaximumRating:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMaximumRating
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (unint64_t)supportedPlaybackRatesCount
{
  return self->_supportedPlaybackRates.count;
}

- (float)supportedPlaybackRates
{
  return self->_supportedPlaybackRates.list;
}

- (void)clearSupportedPlaybackRates
{
}

- (void)addSupportedPlaybackRate:(float)a3
{
}

- (float)supportedPlaybackRateAtIndex:(unint64_t)a3
{
  p_supportedPlaybackRates = &self->_supportedPlaybackRates;
  unint64_t count = self->_supportedPlaybackRates.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_supportedPlaybackRates->list[a3];
}

- (void)setSupportedPlaybackRates:(float *)a3 count:(unint64_t)a4
{
}

- (int)repeatMode
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_repeatMode;
  }
  else {
    return 0;
  }
}

- (void)setRepeatMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_repeatMode = a3;
}

- (void)setHasRepeatMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRepeatMode
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)repeatModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = off_1000453A8[a3];
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
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_shuffleMode;
  }
  else {
    return 0;
  }
}

- (void)setShuffleMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_shuffleMode = a3;
}

- (void)setHasShuffleMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasShuffleMode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)shuffleModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = off_1000453C8[a3];
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
  *(_WORD *)&self->_has |= 0x20u;
  self->_presentationStyle = a3;
}

- (void)setHasPresentationStyle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPresentationStyle
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPreferredPlaybackRate:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_preferredPlaybackRate = a3;
}

- (void)setHasPreferredPlaybackRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPreferredPlaybackRate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (int)currentQueueEndAction
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_currentQueueEndAction;
  }
  else {
    return 0;
  }
}

- (void)setCurrentQueueEndAction:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_currentQueueEndAction = a3;
}

- (void)setHasCurrentQueueEndAction:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCurrentQueueEndAction
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)currentQueueEndActionAsString:(int)a3
{
  if (a3 >= 5)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = off_1000453E8[a3];
  }

  return v3;
}

- (int)StringAsCurrentQueueEndAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Clear"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Reset"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AutoPlay"])
  {
    int v4 = 4;
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

- (void)addSupportedQueueEndAction:(int)a3
{
}

- (int)supportedQueueEndActionAtIndex:(unint64_t)a3
{
  p_supportedQueueEndActions = &self->_supportedQueueEndActions;
  unint64_t count = self->_supportedQueueEndActions.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_supportedQueueEndActions->list[a3];
}

- (void)setSupportedQueueEndActions:(int *)a3 count:(unint64_t)a4
{
}

- (id)supportedQueueEndActionsAsString:(int)a3
{
  if (a3 >= 5)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = off_1000453E8[a3];
  }

  return v3;
}

- (int)StringAsSupportedQueueEndActions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Clear"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Reset"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AutoPlay"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRCommandInfoProtobuf;
  id v3 = [(_NMRCommandInfoProtobuf *)&v7 description];
  int v4 = [(_NMRCommandInfoProtobuf *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    int command = self->_command;
    v6 = @"Unknown";
    switch(command)
    {
      case 0:
        break;
      case 1:
        v6 = @"Play";
        break;
      case 2:
        v6 = @"Pause";
        break;
      case 3:
        v6 = @"TogglePlayPause";
        break;
      case 4:
        v6 = @"Stop";
        break;
      case 5:
        v6 = @"NextTrack";
        break;
      case 6:
        v6 = @"PreviousTrack";
        break;
      case 7:
        v6 = @"AdvanceShuffleMode";
        break;
      case 8:
        v6 = @"AdvanceRepeatMode";
        break;
      case 9:
        v6 = @"BeginFastForward";
        break;
      case 10:
        v6 = @"EndFastForward";
        break;
      case 11:
        v6 = @"BeginRewind";
        break;
      case 12:
        v6 = @"EndRewind";
        break;
      case 13:
        v6 = @"Rewind15Seconds";
        break;
      case 14:
        v6 = @"FastForward15Seconds";
        break;
      case 15:
        v6 = @"Rewind30Seconds";
        break;
      case 16:
        v6 = @"FastForward30Seconds";
        break;
      case 17:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 42:
      case 43:
      case 44:
        goto LABEL_6;
      case 18:
        v6 = @"SkipForward";
        break;
      case 19:
        v6 = @"SkipBackward";
        break;
      case 20:
        v6 = @"ChangePlaybackRate";
        break;
      case 21:
        v6 = @"RateTrack";
        break;
      case 22:
        v6 = @"LikeTrack";
        break;
      case 23:
        v6 = @"DislikeTrack";
        break;
      case 24:
        v6 = @"BookmarkTrack";
        break;
      case 25:
        v6 = @"NextChapter";
        break;
      case 26:
        v6 = @"PreviousChapter";
        break;
      case 27:
        v6 = @"NextAlbum";
        break;
      case 28:
        v6 = @"PreviousAlbum";
        break;
      case 29:
        v6 = @"NextPlaylist";
        break;
      case 30:
        v6 = @"PreviousPlaylist";
        break;
      case 31:
        v6 = @"BanTrack";
        break;
      case 32:
        v6 = @"AddTrackToWishList";
        break;
      case 33:
        v6 = @"RemoveTrackFromWishList";
        break;
      case 34:
        v6 = @"NextInContext";
        break;
      case 35:
        v6 = @"PreviousInContext";
        break;
      case 41:
        v6 = @"ResetPlaybackTimeout";
        break;
      case 45:
        v6 = @"SeekToPlaybackPosition";
        break;
      case 46:
        v6 = @"ChangeRepeatMode";
        break;
      case 47:
        v6 = @"ChangeShuffleMode";
        break;
      case 48:
        v6 = @"SetPlaybackQueue";
        break;
      case 49:
        v6 = @"AddNowPlayingItemToLibrary";
        break;
      case 50:
        v6 = @"CreateRadioStation";
        break;
      case 51:
        v6 = @"AddItemToLibrary";
        break;
      case 52:
        v6 = @"InsertIntoPlaybackQueue";
        break;
      case 53:
        v6 = @"PlayItemInPlaybackQueue";
        break;
      default:
        if (command == 135)
        {
          v6 = @"ChangeQueueEndAction";
        }
        else
        {
LABEL_6:
          v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_command];
        }
        break;
    }
    [v3 setObject:v6 forKey:@"command"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_enabled];
    [v3 setObject:v7 forKey:@"enabled"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_active];
    [v3 setObject:v8 forKey:@"active"];
  }
  v9 = PBRepeatedDoubleNSArray();
  [v3 setObject:v9 forKey:@"preferredInterval"];

  localizedTitle = self->_localizedTitle;
  if (localizedTitle) {
    [v3 setObject:localizedTitle forKey:@"localizedTitle"];
  }
  localizedShortTitle = self->_localizedShortTitle;
  if (localizedShortTitle) {
    [v3 setObject:localizedShortTitle forKey:@"localizedShortTitle"];
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 8) != 0)
  {
    *(float *)&double v10 = self->_minimumRating;
    v14 = +[NSNumber numberWithFloat:v10];
    [v3 setObject:v14 forKey:@"minimumRating"];

    __int16 v13 = (__int16)self->_has;
  }
  if ((v13 & 4) != 0)
  {
    *(float *)&double v10 = self->_maximumRating;
    v15 = +[NSNumber numberWithFloat:v10];
    [v3 setObject:v15 forKey:@"maximumRating"];
  }
  v16 = PBRepeatedFloatNSArray();
  [v3 setObject:v16 forKey:@"supportedPlaybackRate"];

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x40) != 0)
  {
    uint64_t repeatMode = self->_repeatMode;
    if (repeatMode >= 4)
    {
      v20 = +[NSString stringWithFormat:@"(unknown: %i)", self->_repeatMode];
    }
    else
    {
      v20 = off_1000453A8[repeatMode];
    }
    [v3 setObject:v20 forKey:@"repeatMode"];

    __int16 v18 = (__int16)self->_has;
    if ((v18 & 0x80) == 0)
    {
LABEL_65:
      if ((v18 & 0x20) == 0) {
        goto LABEL_66;
      }
      goto LABEL_77;
    }
  }
  else if ((v18 & 0x80) == 0)
  {
    goto LABEL_65;
  }
  uint64_t shuffleMode = self->_shuffleMode;
  if (shuffleMode >= 4)
  {
    v22 = +[NSString stringWithFormat:@"(unknown: %i)", self->_shuffleMode];
  }
  else
  {
    v22 = off_1000453C8[shuffleMode];
  }
  [v3 setObject:v22 forKey:@"shuffleMode"];

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x20) == 0)
  {
LABEL_66:
    if ((v18 & 0x10) == 0) {
      goto LABEL_67;
    }
    goto LABEL_78;
  }
LABEL_77:
  v23 = +[NSNumber numberWithInt:self->_presentationStyle];
  [v3 setObject:v23 forKey:@"presentationStyle"];

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x10) == 0)
  {
LABEL_67:
    if ((v18 & 2) == 0) {
      goto LABEL_83;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(float *)&double v17 = self->_preferredPlaybackRate;
  v24 = +[NSNumber numberWithFloat:v17];
  [v3 setObject:v24 forKey:@"preferredPlaybackRate"];

  if ((*(_WORD *)&self->_has & 2) == 0) {
    goto LABEL_83;
  }
LABEL_79:
  uint64_t currentQueueEndAction = self->_currentQueueEndAction;
  if (currentQueueEndAction >= 5)
  {
    v26 = +[NSString stringWithFormat:@"(unknown: %i)", self->_currentQueueEndAction];
  }
  else
  {
    v26 = off_1000453E8[currentQueueEndAction];
  }
  [v3 setObject:v26 forKey:@"currentQueueEndAction"];

LABEL_83:
  p_supportedQueueEndActions = &self->_supportedQueueEndActions;
  if (self->_supportedQueueEndActions.count)
  {
    v28 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    if (p_supportedQueueEndActions->count)
    {
      unint64_t v29 = 0;
      do
      {
        uint64_t v30 = p_supportedQueueEndActions->list[v29];
        if (v30 >= 5)
        {
          v31 = +[NSString stringWithFormat:@"(unknown: %i)", p_supportedQueueEndActions->list[v29]];
        }
        else
        {
          v31 = off_1000453E8[v30];
        }
        [v28 addObject:v31];

        ++v29;
      }
      while (v29 < p_supportedQueueEndActions->count);
    }
    [v3 setObject:v28 forKey:@"supportedQueueEndAction"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100025A64((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  id v12 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v12;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v12;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v12;
  }
LABEL_5:
  if (self->_preferredIntervals.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      id v4 = v12;
      ++v6;
    }
    while (v6 < self->_preferredIntervals.count);
  }
  if (self->_localizedTitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v12;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v12;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v12;
  }
  if (self->_supportedPlaybackRates.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v12;
      ++v8;
    }
    while (v8 < self->_supportedPlaybackRates.count);
  }
  if (self->_localizedShortTitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v12;
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v12;
    __int16 v9 = (__int16)self->_has;
    if ((v9 & 0x80) == 0)
    {
LABEL_21:
      if ((v9 & 0x20) == 0) {
        goto LABEL_22;
      }
      goto LABEL_36;
    }
  }
  else if ((v9 & 0x80) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v12;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x20) == 0)
  {
LABEL_22:
    if ((v9 & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  id v4 = v12;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x10) == 0)
  {
LABEL_23:
    if ((v9 & 2) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_37:
  PBDataWriterWriteFloatField();
  id v4 = v12;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_24:
    PBDataWriterWriteInt32Field();
    id v4 = v12;
  }
LABEL_25:
  p_supportedQueueEndActions = &self->_supportedQueueEndActions;
  if (p_supportedQueueEndActions->count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v12;
      ++v11;
    }
    while (v11 < p_supportedQueueEndActions->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      goto LABEL_3;
    }
LABEL_35:
    v4[129] = self->_enabled;
    *((_WORD *)v4 + 66) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 20) = self->_command;
  *((_WORD *)v4 + 66) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_35;
  }
LABEL_3:
  if ((has & 0x100) != 0)
  {
LABEL_4:
    v4[128] = self->_active;
    *((_WORD *)v4 + 66) |= 0x100u;
  }
LABEL_5:
  id v17 = v4;
  if ([(_NMRCommandInfoProtobuf *)self preferredIntervalsCount])
  {
    [v17 clearPreferredIntervals];
    unint64_t v6 = [(_NMRCommandInfoProtobuf *)self preferredIntervalsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        [(_NMRCommandInfoProtobuf *)self preferredIntervalAtIndex:i];
        [v17 addPreferredInterval:];
      }
    }
  }
  if (self->_localizedTitle) {
    [v17 setLocalizedTitle:];
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 8) != 0)
  {
    *((_DWORD *)v17 + 27) = LODWORD(self->_minimumRating);
    *((_WORD *)v17 + 66) |= 8u;
    __int16 v9 = (__int16)self->_has;
  }
  if ((v9 & 4) != 0)
  {
    *((_DWORD *)v17 + 26) = LODWORD(self->_maximumRating);
    *((_WORD *)v17 + 66) |= 4u;
  }
  if ([(_NMRCommandInfoProtobuf *)self supportedPlaybackRatesCount])
  {
    [v17 clearSupportedPlaybackRates];
    unint64_t v10 = [(_NMRCommandInfoProtobuf *)self supportedPlaybackRatesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        [(_NMRCommandInfoProtobuf *)self supportedPlaybackRateAtIndex:j];
        [v17 addSupportedPlaybackRate:];
      }
    }
  }
  if (self->_localizedShortTitle) {
    [v17 setLocalizedShortTitle:];
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x40) != 0)
  {
    *((_DWORD *)v17 + 30) = self->_repeatMode;
    *((_WORD *)v17 + 66) |= 0x40u;
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 0x80) == 0)
    {
LABEL_23:
      if ((v13 & 0x20) == 0) {
        goto LABEL_24;
      }
      goto LABEL_39;
    }
  }
  else if ((v13 & 0x80) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)v17 + 31) = self->_shuffleMode;
  *((_WORD *)v17 + 66) |= 0x80u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x20) == 0)
  {
LABEL_24:
    if ((v13 & 0x10) == 0) {
      goto LABEL_25;
    }
LABEL_40:
    *((_DWORD *)v17 + 28) = LODWORD(self->_preferredPlaybackRate);
    *((_WORD *)v17 + 66) |= 0x10u;
    if ((*(_WORD *)&self->_has & 2) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_39:
  *((_DWORD *)v17 + 29) = self->_presentationStyle;
  *((_WORD *)v17 + 66) |= 0x20u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0) {
    goto LABEL_40;
  }
LABEL_25:
  if ((v13 & 2) != 0)
  {
LABEL_26:
    *((_DWORD *)v17 + 21) = self->_currentQueueEndAction;
    *((_WORD *)v17 + 66) |= 2u;
  }
LABEL_27:
  if ([(_NMRCommandInfoProtobuf *)self supportedQueueEndActionsCount])
  {
    [v17 clearSupportedQueueEndActions];
    unint64_t v14 = [(_NMRCommandInfoProtobuf *)self supportedQueueEndActionsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
        [v17 addSupportedQueueEndAction:-[_NMRCommandInfoProtobuf supportedQueueEndActionAtIndex:](self, "supportedQueueEndActionAtIndex:", k)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  unint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[20] = self->_command;
    *((_WORD *)v5 + 66) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 129) = self->_enabled;
  *((_WORD *)v5 + 66) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    *((unsigned char *)v5 + 128) = self->_active;
    *((_WORD *)v5 + 66) |= 0x100u;
  }
LABEL_5:
  PBRepeatedDoubleCopy();
  id v8 = [(NSString *)self->_localizedTitle copyWithZone:a3];
  __int16 v9 = (void *)v6[12];
  v6[12] = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    *((_DWORD *)v6 + 27) = LODWORD(self->_minimumRating);
    *((_WORD *)v6 + 66) |= 8u;
    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 4) != 0)
  {
    *((_DWORD *)v6 + 26) = LODWORD(self->_maximumRating);
    *((_WORD *)v6 + 66) |= 4u;
  }
  PBRepeatedFloatCopy();
  id v11 = [(NSString *)self->_localizedShortTitle copyWithZone:a3];
  id v12 = (void *)v6[11];
  v6[11] = v11;

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x40) != 0)
  {
    *((_DWORD *)v6 + 30) = self->_repeatMode;
    *((_WORD *)v6 + 66) |= 0x40u;
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 0x80) == 0)
    {
LABEL_11:
      if ((v13 & 0x20) == 0) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  else if ((v13 & 0x80) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v6 + 31) = self->_shuffleMode;
  *((_WORD *)v6 + 66) |= 0x80u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x20) == 0)
  {
LABEL_12:
    if ((v13 & 0x10) == 0) {
      goto LABEL_13;
    }
LABEL_22:
    *((_DWORD *)v6 + 28) = LODWORD(self->_preferredPlaybackRate);
    *((_WORD *)v6 + 66) |= 0x10u;
    if ((*(_WORD *)&self->_has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_21:
  *((_DWORD *)v6 + 29) = self->_presentationStyle;
  *((_WORD *)v6 + 66) |= 0x20u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0) {
    goto LABEL_22;
  }
LABEL_13:
  if ((v13 & 2) != 0)
  {
LABEL_14:
    *((_DWORD *)v6 + 21) = self->_currentQueueEndAction;
    *((_WORD *)v6 + 66) |= 2u;
  }
LABEL_15:
  PBRepeatedInt32Copy();
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_65;
  }
  __int16 v5 = *((_WORD *)v4 + 66);
  if (*(_WORD *)&self->_has)
  {
    if ((v5 & 1) == 0 || self->_command != *((_DWORD *)v4 + 20)) {
      goto LABEL_65;
    }
  }
  else if (v5)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x200) == 0) {
      goto LABEL_65;
    }
    if (self->_enabled)
    {
      if (!*((unsigned char *)v4 + 129)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)v4 + 129))
    {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x200) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x100) != 0)
    {
      if (self->_active)
      {
        if (!*((unsigned char *)v4 + 128)) {
          goto LABEL_65;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 128)) {
        goto LABEL_23;
      }
    }
LABEL_65:
    char IsEqual = 0;
    goto LABEL_66;
  }
  if ((*((_WORD *)v4 + 66) & 0x100) != 0) {
    goto LABEL_65;
  }
LABEL_23:
  if (!PBRepeatedDoubleIsEqual()) {
    goto LABEL_65;
  }
  localizedTitle = self->_localizedTitle;
  if ((unint64_t)localizedTitle | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](localizedTitle, "isEqual:")) {
      goto LABEL_65;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 66);
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_minimumRating != *((float *)v4 + 27)) {
      goto LABEL_65;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_maximumRating != *((float *)v4 + 26)) {
      goto LABEL_65;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_65;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_65;
  }
  localizedShortTitle = self->_localizedShortTitle;
  if ((unint64_t)localizedShortTitle | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](localizedShortTitle, "isEqual:")) {
      goto LABEL_65;
    }
  }
  __int16 v10 = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 66);
  if ((v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_repeatMode != *((_DWORD *)v4 + 30)) {
      goto LABEL_65;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_shuffleMode != *((_DWORD *)v4 + 31)) {
      goto LABEL_65;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_65;
  }
  if ((v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_presentationStyle != *((_DWORD *)v4 + 29)) {
      goto LABEL_65;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_preferredPlaybackRate != *((float *)v4 + 28)) {
      goto LABEL_65;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  if ((v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_currentQueueEndAction != *((_DWORD *)v4 + 21)) {
      goto LABEL_65;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_65;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_66:

  return IsEqual;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 1) == 0)
  {
    uint64_t v31 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v30 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v31 = 2654435761 * self->_command;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v30 = 2654435761 * self->_enabled;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v29 = 2654435761 * self->_active;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v29 = 0;
LABEL_8:
  uint64_t v28 = PBRepeatedDoubleHash();
  NSUInteger v27 = [(NSString *)self->_localizedTitle hash];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    float minimumRating = self->_minimumRating;
    float v6 = -minimumRating;
    if (minimumRating >= 0.0) {
      float v6 = self->_minimumRating;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 4) != 0)
  {
    float maximumRating = self->_maximumRating;
    float v11 = -maximumRating;
    if (maximumRating >= 0.0) {
      float v11 = self->_maximumRating;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  uint64_t v14 = PBRepeatedFloatHash();
  NSUInteger v15 = [(NSString *)self->_localizedShortTitle hash];
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x40) != 0)
  {
    uint64_t v17 = 2654435761 * self->_repeatMode;
    if ((v16 & 0x80) != 0)
    {
LABEL_26:
      uint64_t v18 = 2654435761 * self->_shuffleMode;
      if ((v16 & 0x20) != 0) {
        goto LABEL_27;
      }
LABEL_34:
      uint64_t v19 = 0;
      if ((v16 & 0x10) != 0) {
        goto LABEL_28;
      }
LABEL_35:
      unint64_t v24 = 0;
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if ((v16 & 0x80) != 0) {
      goto LABEL_26;
    }
  }
  uint64_t v18 = 0;
  if ((v16 & 0x20) == 0) {
    goto LABEL_34;
  }
LABEL_27:
  uint64_t v19 = 2654435761 * self->_presentationStyle;
  if ((v16 & 0x10) == 0) {
    goto LABEL_35;
  }
LABEL_28:
  float preferredPlaybackRate = self->_preferredPlaybackRate;
  float v21 = -preferredPlaybackRate;
  if (preferredPlaybackRate >= 0.0) {
    float v21 = self->_preferredPlaybackRate;
  }
  float v22 = floorf(v21 + 0.5);
  float v23 = (float)(v21 - v22) * 1.8447e19;
  unint64_t v24 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0) {
      v24 += (unint64_t)v23;
    }
  }
  else
  {
    v24 -= (unint64_t)fabsf(v23);
  }
LABEL_38:
  if ((v16 & 2) != 0) {
    uint64_t v25 = 2654435761 * self->_currentQueueEndAction;
  }
  else {
    uint64_t v25 = 0;
  }
  return v30 ^ v31 ^ v29 ^ v28 ^ v4 ^ v9 ^ v14 ^ v27 ^ v15 ^ v17 ^ v18 ^ v19 ^ v24 ^ v25 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 66);
  if (v5)
  {
    self->_int command = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 66);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_enabled = *((unsigned char *)v4 + 129);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 66) & 0x100) != 0)
  {
LABEL_4:
    self->_active = *((unsigned char *)v4 + 128);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_5:
  uint64_t v19 = v4;
  float v6 = (char *)[v4 preferredIntervalsCount];
  if (v6)
  {
    float v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      [v19 preferredIntervalAtIndex:i];
      -[_NMRCommandInfoProtobuf addPreferredInterval:](self, "addPreferredInterval:");
    }
  }
  unint64_t v9 = v19;
  if (v19[12])
  {
    -[_NMRCommandInfoProtobuf setLocalizedTitle:](self, "setLocalizedTitle:");
    unint64_t v9 = v19;
  }
  __int16 v10 = *((_WORD *)v9 + 66);
  if ((v10 & 8) != 0)
  {
    self->_float minimumRating = *((float *)v9 + 27);
    *(_WORD *)&self->_has |= 8u;
    __int16 v10 = *((_WORD *)v9 + 66);
  }
  if ((v10 & 4) != 0)
  {
    self->_float maximumRating = *((float *)v9 + 26);
    *(_WORD *)&self->_has |= 4u;
  }
  float v11 = (char *)[v9 supportedPlaybackRatesCount];
  if (v11)
  {
    float v12 = v11;
    for (uint64_t j = 0; j != v12; ++j)
    {
      [v19 supportedPlaybackRateAtIndex:j];
      -[_NMRCommandInfoProtobuf addSupportedPlaybackRate:](self, "addSupportedPlaybackRate:");
    }
  }
  uint64_t v14 = v19;
  if (v19[11])
  {
    -[_NMRCommandInfoProtobuf setLocalizedShortTitle:](self, "setLocalizedShortTitle:");
    uint64_t v14 = v19;
  }
  __int16 v15 = *((_WORD *)v14 + 66);
  if ((v15 & 0x40) != 0)
  {
    self->_uint64_t repeatMode = *((_DWORD *)v14 + 30);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v15 = *((_WORD *)v14 + 66);
    if ((v15 & 0x80) == 0)
    {
LABEL_21:
      if ((v15 & 0x20) == 0) {
        goto LABEL_22;
      }
      goto LABEL_36;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_21;
  }
  self->_uint64_t shuffleMode = *((_DWORD *)v14 + 31);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v15 = *((_WORD *)v14 + 66);
  if ((v15 & 0x20) == 0)
  {
LABEL_22:
    if ((v15 & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_presentationStyle = *((_DWORD *)v14 + 29);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v15 = *((_WORD *)v14 + 66);
  if ((v15 & 0x10) == 0)
  {
LABEL_23:
    if ((v15 & 2) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_37:
  self->_float preferredPlaybackRate = *((float *)v14 + 28);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v14 + 66) & 2) != 0)
  {
LABEL_24:
    self->_uint64_t currentQueueEndAction = *((_DWORD *)v14 + 21);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_25:
  __int16 v16 = (char *)[v14 supportedQueueEndActionsCount];
  if (v16)
  {
    uint64_t v17 = v16;
    for (uint64_t k = 0; k != v17; ++k)
      -[_NMRCommandInfoProtobuf addSupportedQueueEndAction:](self, "addSupportedQueueEndAction:", [v19 supportedQueueEndActionAtIndex:k]);
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

- (float)preferredPlaybackRate
{
  return self->_preferredPlaybackRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);

  objc_storeStrong((id *)&self->_localizedShortTitle, 0);
}

@end