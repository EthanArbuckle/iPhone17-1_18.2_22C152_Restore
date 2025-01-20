@interface NTPBVideoGroupsConfig
- (BOOL)hasMoreFromPublisherBarEnabled;
- (BOOL)hasMoreFromPublisherBarTime;
- (BOOL)hasMoreVideosGroupFilterOption;
- (BOOL)hasMoreVideosGroupMaxNumberOfVideos;
- (BOOL)hasMoreVideosGroupMinNumberOfVideos;
- (BOOL)hasMoreVideosGroupSortOption;
- (BOOL)hasNowPlayingBarTime;
- (BOOL)hasPlaysMutedByDefault;
- (BOOL)hasUpNextBarTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)moreFromPublisherBarEnabled;
- (BOOL)playsMutedByDefault;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)moreVideosGroupFilterOption;
- (int)moreVideosGroupSortOption;
- (int64_t)moreFromPublisherBarTime;
- (int64_t)moreVideosGroupMaxNumberOfVideos;
- (int64_t)moreVideosGroupMinNumberOfVideos;
- (int64_t)nowPlayingBarTime;
- (int64_t)upNextBarTime;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasMoreFromPublisherBarEnabled:(BOOL)a3;
- (void)setHasMoreFromPublisherBarTime:(BOOL)a3;
- (void)setHasMoreVideosGroupFilterOption:(BOOL)a3;
- (void)setHasMoreVideosGroupMaxNumberOfVideos:(BOOL)a3;
- (void)setHasMoreVideosGroupMinNumberOfVideos:(BOOL)a3;
- (void)setHasMoreVideosGroupSortOption:(BOOL)a3;
- (void)setHasNowPlayingBarTime:(BOOL)a3;
- (void)setHasPlaysMutedByDefault:(BOOL)a3;
- (void)setHasUpNextBarTime:(BOOL)a3;
- (void)setMoreFromPublisherBarEnabled:(BOOL)a3;
- (void)setMoreFromPublisherBarTime:(int64_t)a3;
- (void)setMoreVideosGroupFilterOption:(int)a3;
- (void)setMoreVideosGroupMaxNumberOfVideos:(int64_t)a3;
- (void)setMoreVideosGroupMinNumberOfVideos:(int64_t)a3;
- (void)setMoreVideosGroupSortOption:(int)a3;
- (void)setNowPlayingBarTime:(int64_t)a3;
- (void)setPlaysMutedByDefault:(BOOL)a3;
- (void)setUpNextBarTime:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBVideoGroupsConfig

- (void)setPlaysMutedByDefault:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_playsMutedByDefault = a3;
}

- (void)setHasPlaysMutedByDefault:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPlaysMutedByDefault
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNowPlayingBarTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_nowPlayingBarTime = a3;
}

- (void)setHasNowPlayingBarTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNowPlayingBarTime
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setUpNextBarTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_upNextBarTime = a3;
}

- (void)setHasUpNextBarTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasUpNextBarTime
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setMoreFromPublisherBarTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_moreFromPublisherBarTime = a3;
}

- (void)setHasMoreFromPublisherBarTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasMoreFromPublisherBarTime
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setMoreFromPublisherBarEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_moreFromPublisherBarEnabled = a3;
}

- (void)setHasMoreFromPublisherBarEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMoreFromPublisherBarEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (int)moreVideosGroupSortOption
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_moreVideosGroupSortOption;
  }
  else {
    return 0;
  }
}

- (void)setMoreVideosGroupSortOption:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_moreVideosGroupSortOption = a3;
}

- (void)setHasMoreVideosGroupSortOption:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMoreVideosGroupSortOption
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (int)moreVideosGroupFilterOption
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_moreVideosGroupFilterOption;
  }
  else {
    return 0;
  }
}

- (void)setMoreVideosGroupFilterOption:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_moreVideosGroupFilterOption = a3;
}

- (void)setHasMoreVideosGroupFilterOption:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMoreVideosGroupFilterOption
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMoreVideosGroupMinNumberOfVideos:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_moreVideosGroupMinNumberOfVideos = a3;
}

- (void)setHasMoreVideosGroupMinNumberOfVideos:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMoreVideosGroupMinNumberOfVideos
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMoreVideosGroupMaxNumberOfVideos:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_moreVideosGroupMaxNumberOfVideos = a3;
}

- (void)setHasMoreVideosGroupMaxNumberOfVideos:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMoreVideosGroupMaxNumberOfVideos
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBVideoGroupsConfig;
  v4 = [(NTPBVideoGroupsConfig *)&v8 description];
  v5 = [(NTPBVideoGroupsConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_playsMutedByDefault];
    [v3 setObject:v7 forKey:@"plays_muted_by_default"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithLongLong:self->_nowPlayingBarTime];
  [v3 setObject:v8 forKey:@"now_playing_bar_time"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v9 = [NSNumber numberWithLongLong:self->_upNextBarTime];
  [v3 setObject:v9 forKey:@"up_next_bar_time"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = [NSNumber numberWithLongLong:self->_moreFromPublisherBarTime];
  [v3 setObject:v10 forKey:@"more_from_publisher_bar_time"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = [NSNumber numberWithBool:self->_moreFromPublisherBarEnabled];
  [v3 setObject:v11 forKey:@"more_from_publisher_bar_enabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = [NSNumber numberWithInt:self->_moreVideosGroupSortOption];
  [v3 setObject:v12 forKey:@"more_videos_group_sort_option"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = [NSNumber numberWithInt:self->_moreVideosGroupFilterOption];
  [v3 setObject:v13 forKey:@"more_videos_group_filter_option"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v14 = [NSNumber numberWithLongLong:self->_moreVideosGroupMinNumberOfVideos];
  [v3 setObject:v14 forKey:@"more_videos_group_min_number_of_videos"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_10:
    v5 = [NSNumber numberWithLongLong:self->_moreVideosGroupMaxNumberOfVideos];
    [v3 setObject:v5 forKey:@"more_videos_group_max_number_of_videos"];
  }
LABEL_11:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBVideoGroupsConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 2) != 0) {
LABEL_10:
  }
    PBDataWriterWriteInt64Field();
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((unsigned char *)result + 57) = self->_playsMutedByDefault;
    *((_WORD *)result + 30) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = self->_nowPlayingBarTime;
  *((_WORD *)result + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 5) = self->_upNextBarTime;
  *((_WORD *)result + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 1) = self->_moreFromPublisherBarTime;
  *((_WORD *)result + 30) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((unsigned char *)result + 56) = self->_moreFromPublisherBarEnabled;
  *((_WORD *)result + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 13) = self->_moreVideosGroupSortOption;
  *((_WORD *)result + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 12) = self->_moreVideosGroupFilterOption;
  *((_WORD *)result + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((void *)result + 3) = self->_moreVideosGroupMinNumberOfVideos;
  *((_WORD *)result + 30) |= 4u;
  if ((*(_WORD *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_10:
  *((void *)result + 2) = self->_moreVideosGroupMaxNumberOfVideos;
  *((_WORD *)result + 30) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_53;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 30);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0) {
      goto LABEL_53;
    }
    if (self->_playsMutedByDefault)
    {
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_53;
      }
    }
    else if (*((unsigned char *)v4 + 57))
    {
      goto LABEL_53;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_nowPlayingBarTime != *((void *)v4 + 4)) {
      goto LABEL_53;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_upNextBarTime != *((void *)v4 + 5)) {
      goto LABEL_53;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_53;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_moreFromPublisherBarTime != *((void *)v4 + 1)) {
      goto LABEL_53;
    }
  }
  else if (v6)
  {
    goto LABEL_53;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) != 0)
    {
      if (self->_moreFromPublisherBarEnabled)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_53;
        }
        goto LABEL_33;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_33;
      }
    }
LABEL_53:
    BOOL v7 = 0;
    goto LABEL_54;
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_53;
  }
LABEL_33:
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_moreVideosGroupSortOption != *((_DWORD *)v4 + 13)) {
      goto LABEL_53;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_moreVideosGroupFilterOption != *((_DWORD *)v4 + 12)) {
      goto LABEL_53;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_moreVideosGroupMinNumberOfVideos != *((void *)v4 + 3)) {
      goto LABEL_53;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_moreVideosGroupMaxNumberOfVideos != *((void *)v4 + 2)) {
      goto LABEL_53;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 2) == 0;
  }
LABEL_54:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v3 = 2654435761 * self->_playsMutedByDefault;
    if ((has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_nowPlayingBarTime;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_upNextBarTime;
    if (has) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if (has)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_moreFromPublisherBarTime;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_moreFromPublisherBarEnabled;
    if ((has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_moreVideosGroupSortOption;
    if ((has & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_moreVideosGroupFilterOption;
    if ((has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if ((has & 2) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 4) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_moreVideosGroupMinNumberOfVideos;
  if ((has & 2) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_moreVideosGroupMaxNumberOfVideos;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x100) != 0)
  {
    self->_playsMutedByDefault = *((unsigned char *)v4 + 57);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v5 = *((_WORD *)v4 + 30);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_nowPlayingBarTime = *((void *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_upNextBarTime = *((void *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_moreFromPublisherBarTime = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_moreFromPublisherBarEnabled = *((unsigned char *)v4 + 56);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_moreVideosGroupSortOption = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_moreVideosGroupFilterOption = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  self->_moreVideosGroupMinNumberOfVideos = *((void *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 30) & 2) != 0)
  {
LABEL_10:
    self->_moreVideosGroupMaxNumberOfVideos = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_11:
}

- (BOOL)playsMutedByDefault
{
  return self->_playsMutedByDefault;
}

- (int64_t)nowPlayingBarTime
{
  return self->_nowPlayingBarTime;
}

- (int64_t)upNextBarTime
{
  return self->_upNextBarTime;
}

- (int64_t)moreFromPublisherBarTime
{
  return self->_moreFromPublisherBarTime;
}

- (BOOL)moreFromPublisherBarEnabled
{
  return self->_moreFromPublisherBarEnabled;
}

- (int64_t)moreVideosGroupMinNumberOfVideos
{
  return self->_moreVideosGroupMinNumberOfVideos;
}

- (int64_t)moreVideosGroupMaxNumberOfVideos
{
  return self->_moreVideosGroupMaxNumberOfVideos;
}

@end