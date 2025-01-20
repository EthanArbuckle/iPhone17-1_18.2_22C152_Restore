@interface MRNowPlayingInfoDictionaryKeyToProtobufKeyMapping
@end

@implementation MRNowPlayingInfoDictionaryKeyToProtobufKeyMapping

void ___MRNowPlayingInfoDictionaryKeyToProtobufKeyMapping_block_invoke()
{
  v21[18] = *MEMORY[0x1E4F143B8];
  v20[0] = @"kMRMediaRemoteNowPlayingInfoAlbum";
  v19 = NSStringFromSelector(sel_album);
  v21[0] = v19;
  v20[1] = @"kMRMediaRemoteNowPlayingInfoArtist";
  v18 = NSStringFromSelector(sel_artist);
  v21[1] = v18;
  v20[2] = @"kMRMediaRemoteNowPlayingInfoDuration";
  v17 = NSStringFromSelector(sel_duration);
  v21[2] = v17;
  v20[3] = @"kMRMediaRemoteNowPlayingInfoElapsedTime";
  v16 = NSStringFromSelector(sel_elapsedTime);
  v21[3] = v16;
  v20[4] = @"kMRMediaRemoteNowPlayingInfoIsExplicitTrack";
  v15 = NSStringFromSelector(sel_isExplicitTrack);
  v21[4] = v15;
  v20[5] = @"kMRMediaRemoteNowPlayingInfoPlaybackRate";
  v14 = NSStringFromSelector(sel_playbackRate);
  v21[5] = v14;
  v20[6] = @"kMRMediaRemoteNowPlayingInfoRepeatMode";
  v13 = NSStringFromSelector(sel_repeatMode);
  v21[6] = v13;
  v20[7] = @"kMRMediaRemoteNowPlayingInfoShuffleMode";
  v12 = NSStringFromSelector(sel_shuffleMode);
  v21[7] = v12;
  v20[8] = @"kMRMediaRemoteNowPlayingInfoTimestamp";
  v0 = NSStringFromSelector(sel_timestamp);
  v21[8] = v0;
  v20[9] = @"kMRMediaRemoteNowPlayingInfoTitle";
  v1 = NSStringFromSelector(sel_title);
  v21[9] = v1;
  v20[10] = @"kMRMediaRemoteNowPlayingInfoUniqueIdentifier";
  v2 = NSStringFromSelector(sel_uniqueIdentifier);
  v21[10] = v2;
  v20[11] = @"kMRMediaRemoteNowPlayingInfoIsMusicApp";
  v3 = NSStringFromSelector(sel_isMusicApp);
  v21[11] = v3;
  v20[12] = @"kMRMediaRemoteNowPlayingInfoIsAlwaysLive";
  v4 = NSStringFromSelector(sel_isAlwaysLive);
  v21[12] = v4;
  v20[13] = @"kMRMediaRemoteNowPlayingInfoIsInTransition";
  v5 = NSStringFromSelector(sel_isInTransition);
  v21[13] = v5;
  v20[14] = @"kMRMediaRemoteNowPlayingInfoRadioStationName";
  v6 = NSStringFromSelector(sel_radioStationName);
  v21[14] = v6;
  v20[15] = @"kMRMediaRemoteNowPlayingInfoRadioStationHash";
  v7 = NSStringFromSelector(sel_radioStationHash);
  v21[15] = v7;
  v20[16] = @"kMRMediaRemoteNowPlayingInfoRadioStationIdentifier";
  v8 = NSStringFromSelector(sel_radioStationIdentifier);
  v21[16] = v8;
  v20[17] = @"kMRMediaRemoteNowPlayingInfoIsAdvertisement";
  v9 = NSStringFromSelector(sel_isAdvertisement);
  v21[17] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:18];
  v11 = (void *)_MRNowPlayingInfoDictionaryKeyToProtobufKeyMapping___mapping;
  _MRNowPlayingInfoDictionaryKeyToProtobufKeyMapping___mapping = v10;
}

@end