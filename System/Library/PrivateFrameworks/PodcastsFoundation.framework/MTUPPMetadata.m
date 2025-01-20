@interface MTUPPMetadata
- (id)_playheadToString;
- (id)description;
@end

@implementation MTUPPMetadata

- (id)description
{
  v3 = NSString;
  v4 = [(MTUPPMetadata *)self metadataIdentifier];
  v5 = [(MTUPPMetadata *)self _playheadToString];
  if ([(MTUPPMetadata *)self hasBeenPlayed]) {
    v6 = @"Yes";
  }
  else {
    v6 = @"No";
  }
  uint64_t v7 = [(MTUPPMetadata *)self playCount];
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  [(MTUPPMetadata *)self timestamp];
  v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v10 = [v3 stringWithFormat:@"Identifier <%@> Playhead <%@> Has been played <%@> Play count <%lld> Timestamp <%@>", v4, v5, v6, v7, v9];

  return v10;
}

- (id)_playheadToString
{
  [(MTUPPMetadata *)self bookmarkTime];
  uint64_t v4 = (int)(v3 / 3600.0);
  [(MTUPPMetadata *)self bookmarkTime];
  double v5 = (double)(3600 * (int)v4);
  uint64_t v7 = (int)((v6 - v5) / 60.0);
  [(MTUPPMetadata *)self bookmarkTime];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%02d:%02d:%02d", v4, v7, (int)(v8 - v5 - (double)(60 * (int)v7)));
}

@end