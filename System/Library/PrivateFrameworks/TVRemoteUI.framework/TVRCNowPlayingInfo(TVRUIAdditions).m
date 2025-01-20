@interface TVRCNowPlayingInfo(TVRUIAdditions)
- (BOOL)tvrui_hasArtworkImage;
- (BOOL)tvrui_hasMetadata;
- (BOOL)tvrui_mediaIsIsPlaying;
- (BOOL)tvrui_mediaIsStopped;
- (id)tvrui_artworkImage;
- (id)tvrui_effectiveCanonicalID;
- (uint64_t)tvrui_hasActivePlayer;
- (uint64_t)tvrui_hasCanonicalID;
- (uint64_t)tvrui_hasUnknownCanonicalID;
- (uint64_t)tvrui_isSimpleCaptionStateUpdate;
- (uint64_t)tvrui_isSimplePlaybackRateUpdate;
- (uint64_t)tvrui_isSimplePlaybackStateUpdate;
@end

@implementation TVRCNowPlayingInfo(TVRUIAdditions)

- (BOOL)tvrui_hasMetadata
{
  v1 = [a1 metadata];
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)tvrui_hasArtworkImage
{
  v1 = [a1 imageData];
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)tvrui_artworkImage
{
  v1 = [a1 imageData];
  if (v1)
  {
    BOOL v2 = [MEMORY[0x263F827E8] imageWithData:v1];
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (uint64_t)tvrui_hasActivePlayer
{
  BOOL v2 = [a1 playerIdentifier];

  v3 = [a1 playerIdentifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F7CA60]];

  if (v2) {
    return v4 ^ 1u;
  }
  else {
    return 0;
  }
}

- (uint64_t)tvrui_isSimpleCaptionStateUpdate
{
  int v2 = objc_msgSend(a1, "tvrui_hasArtworkImage");
  int v3 = objc_msgSend(a1, "tvrui_hasMetadata");
  int v4 = [a1 captionsEnabled];

  v5 = [a1 hasValidCaptionOptions];

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 0;
  }
  else {
    return (v2 | v3) ^ 1u;
  }
}

- (uint64_t)tvrui_isSimplePlaybackRateUpdate
{
  int v2 = objc_msgSend(a1, "tvrui_hasArtworkImage");
  int v3 = objc_msgSend(a1, "tvrui_hasMetadata");
  int v4 = [a1 playbackRate];

  if (v4) {
    return (v2 | v3) ^ 1u;
  }
  else {
    return 0;
  }
}

- (uint64_t)tvrui_isSimplePlaybackStateUpdate
{
  int v2 = objc_msgSend(a1, "tvrui_hasArtworkImage");
  int v3 = objc_msgSend(a1, "tvrui_hasMetadata");
  int v4 = [a1 playbackState];

  if (v4) {
    return (v2 | v3) ^ 1u;
  }
  else {
    return 0;
  }
}

- (BOOL)tvrui_mediaIsStopped
{
  v1 = [a1 playbackState];
  BOOL v2 = [v1 integerValue] == 3;

  return v2;
}

- (BOOL)tvrui_mediaIsIsPlaying
{
  v1 = [a1 playbackState];
  BOOL v2 = [v1 integerValue] == 1;

  return v2;
}

- (uint64_t)tvrui_hasCanonicalID
{
  BOOL v2 = [a1 metadata];
  int v3 = [v2 canonicalID];

  if ([v3 length]) {
    uint64_t v4 = objc_msgSend(a1, "tvrui_hasUnknownCanonicalID") ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)tvrui_hasUnknownCanonicalID
{
  v1 = [a1 metadata];
  BOOL v2 = [v1 canonicalID];

  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F7CA68]];
  return v3;
}

- (id)tvrui_effectiveCanonicalID
{
  if (objc_msgSend(a1, "tvrui_hasUnknownCanonicalID"))
  {
    BOOL v2 = 0;
  }
  else
  {
    uint64_t v3 = [a1 metadata];
    BOOL v2 = [v3 canonicalID];
  }
  return v2;
}

@end