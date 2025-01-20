@interface MusicStoreCuratorPlaylistsResponse
- (BOOL)hasAdditionalPlaylists;
- (MPChangeDetails)changeDetails;
- (NSArray)additionalPlaylistIdentifiers;
- (void)setAdditionalPlaylistIdentifiers:(id)a3;
- (void)setChangeDetails:(id)a3;
@end

@implementation MusicStoreCuratorPlaylistsResponse

- (BOOL)hasAdditionalPlaylists
{
  return [(NSArray *)self->_additionalPlaylistIdentifiers count] != 0;
}

- (MPChangeDetails)changeDetails
{
  return self->_changeDetails;
}

- (void)setChangeDetails:(id)a3
{
}

- (NSArray)additionalPlaylistIdentifiers
{
  return self->_additionalPlaylistIdentifiers;
}

- (void)setAdditionalPlaylistIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPlaylistIdentifiers, 0);

  objc_storeStrong((id *)&self->_changeDetails, 0);
}

@end