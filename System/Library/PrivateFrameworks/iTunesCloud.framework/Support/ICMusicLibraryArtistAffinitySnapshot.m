@interface ICMusicLibraryArtistAffinitySnapshot
- (ICMusicLibraryArtistAffinitySnapshot)initWithContentItemSnapshot:(id)a3;
- (ICMusicLibraryContentMetadataDescriptor)artistMetadataDescriptor;
- (NSDate)lastPlayedDate;
- (NSMutableArray)uniqueAlbums;
- (NSMutableArray)uniqueSongs;
- (NSMutableSet)uniqueDatesWithAddedContent;
- (NSString)artistName;
- (double)averagePlaysPerItemAdded;
- (float)legacyScore;
- (id)debugDescription;
- (int64_t)artistAdamID;
- (int64_t)cumulativePlayCount;
- (int64_t)cumulativeSkipCount;
- (int64_t)daysSinceLastPlayedDate;
- (void)setArtistMetadataDescriptor:(id)a3;
- (void)setCumulativePlayCount:(int64_t)a3;
- (void)setCumulativeSkipCount:(int64_t)a3;
- (void)setLastPlayedDate:(id)a3;
- (void)setUniqueAlbums:(id)a3;
- (void)setUniqueDatesWithAddedContent:(id)a3;
- (void)setUniqueSongs:(id)a3;
@end

@implementation ICMusicLibraryArtistAffinitySnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artistMetadataDescriptor, 0);
  objc_storeStrong((id *)&self->_uniqueDatesWithAddedContent, 0);
  objc_storeStrong((id *)&self->_uniqueAlbums, 0);
  objc_storeStrong((id *)&self->_uniqueSongs, 0);

  objc_storeStrong((id *)&self->_lastPlayedDate, 0);
}

- (void)setArtistMetadataDescriptor:(id)a3
{
}

- (ICMusicLibraryContentMetadataDescriptor)artistMetadataDescriptor
{
  return self->_artistMetadataDescriptor;
}

- (void)setUniqueDatesWithAddedContent:(id)a3
{
}

- (NSMutableSet)uniqueDatesWithAddedContent
{
  return self->_uniqueDatesWithAddedContent;
}

- (void)setUniqueAlbums:(id)a3
{
}

- (NSMutableArray)uniqueAlbums
{
  return self->_uniqueAlbums;
}

- (void)setUniqueSongs:(id)a3
{
}

- (NSMutableArray)uniqueSongs
{
  return self->_uniqueSongs;
}

- (void)setCumulativeSkipCount:(int64_t)a3
{
  self->_cumulativeSkipCount = a3;
}

- (int64_t)cumulativeSkipCount
{
  return self->_cumulativeSkipCount;
}

- (void)setCumulativePlayCount:(int64_t)a3
{
  self->_cumulativePlayCount = a3;
}

- (int64_t)cumulativePlayCount
{
  return self->_cumulativePlayCount;
}

- (void)setLastPlayedDate:(id)a3
{
}

- (NSDate)lastPlayedDate
{
  return self->_lastPlayedDate;
}

- (id)debugDescription
{
  v3 = [(ICMusicLibraryArtistAffinitySnapshot *)self artistName];
  [(ICMusicLibraryArtistAffinitySnapshot *)self legacyScore];
  double v5 = v4;
  int64_t v17 = [(ICMusicLibraryArtistAffinitySnapshot *)self artistAdamID];
  int64_t v6 = [(ICMusicLibraryArtistAffinitySnapshot *)self cumulativePlayCount];
  int64_t v7 = [(ICMusicLibraryArtistAffinitySnapshot *)self cumulativeSkipCount];
  [(ICMusicLibraryArtistAffinitySnapshot *)self averagePlaysPerItemAdded];
  uint64_t v9 = v8;
  v10 = [(ICMusicLibraryArtistAffinitySnapshot *)self uniqueAlbums];
  id v11 = [v10 count];
  v12 = [(ICMusicLibraryArtistAffinitySnapshot *)self uniqueSongs];
  id v13 = [v12 count];
  v14 = [(ICMusicLibraryArtistAffinitySnapshot *)self uniqueDatesWithAddedContent];
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Artist: %@: Score: %f, artistID: %lld, cumulativePlayCount: %ld, cumulativeSkipCount: %ld, playsPerItem: %f, uniqueAlbums: %lu, uniqueSongs: %lu, daysWithAdds: %lu, daysSinceLastPlay: %ld", v3, *(void *)&v5, v17, v6, v7, v9, v11, v13, [v14 count], -[ICMusicLibraryArtistAffinitySnapshot daysSinceLastPlayedDate](self, "daysSinceLastPlayedDate"));

  return v15;
}

- (float)legacyScore
{
  id v3 = [(NSMutableArray *)self->_uniqueSongs count];
  id v4 = [(NSMutableArray *)self->_uniqueAlbums count];
  lastPlayedDate = self->_lastPlayedDate;
  if (lastPlayedDate)
  {
    [(NSDate *)lastPlayedDate timeIntervalSinceNow];
    *(float *)&double v6 = v6;
    float v7 = (float)((float)((float)((float)(*(float *)&v6 / 60.0) / 60.0) / 24.0) / 7.0) * 0.25;
  }
  else
  {
    float v7 = 0.0;
  }
  return roundf((float)((float)((float)((float)(unint64_t)v4 * 0.85) + (float)((float)(unint64_t)v3 * 0.55))+ (float)((float)((float)self->_cumulativePlayCount * -0.15)+ (float)((float)self->_cumulativePlayCount * 0.45)))+ (float)(v7 * -0.1));
}

- (int64_t)daysSinceLastPlayedDate
{
  lastPlayedDate = self->_lastPlayedDate;
  if (!lastPlayedDate) {
    return -1;
  }
  [(NSDate *)lastPlayedDate timeIntervalSinceNow];
  double v4 = v3 / 60.0 / 60.0 / 24.0;
  if ((uint64_t)v4 >= 0) {
    return (uint64_t)v4;
  }
  else {
    return -(uint64_t)v4;
  }
}

- (double)averagePlaysPerItemAdded
{
  double cumulativePlayCount = (double)self->_cumulativePlayCount;
  return cumulativePlayCount / (double)(unint64_t)[(NSMutableArray *)self->_uniqueSongs count];
}

- (int64_t)artistAdamID
{
  return [(ICMusicLibraryContentMetadataDescriptor *)self->_artistMetadataDescriptor storeAdamID];
}

- (NSString)artistName
{
  return [(ICMusicLibraryContentMetadataDescriptor *)self->_artistMetadataDescriptor title];
}

- (ICMusicLibraryArtistAffinitySnapshot)initWithContentItemSnapshot:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICMusicLibraryArtistAffinitySnapshot;
  double v5 = [(ICMusicLibraryArtistAffinitySnapshot *)&v18 init];
  if (v5)
  {
    double v6 = [v4 artistMetadataDescriptor];
    [(ICMusicLibraryArtistAffinitySnapshot *)v5 setArtistMetadataDescriptor:v6];

    id v7 = objc_alloc((Class)NSMutableArray);
    uint64_t v8 = [v4 songMetadataDescriptor];
    id v9 = objc_msgSend(v7, "initWithObjects:", v8, 0);
    [(ICMusicLibraryArtistAffinitySnapshot *)v5 setUniqueSongs:v9];

    id v10 = objc_alloc((Class)NSMutableArray);
    id v11 = [v4 albumMetadataDescriptor];
    id v12 = objc_msgSend(v10, "initWithObjects:", v11, 0);
    [(ICMusicLibraryArtistAffinitySnapshot *)v5 setUniqueAlbums:v12];

    id v13 = objc_alloc((Class)NSMutableSet);
    v14 = [v4 libraryAddedDate];
    id v15 = objc_msgSend(v13, "initWithObjects:", v14, 0);
    [(ICMusicLibraryArtistAffinitySnapshot *)v5 setUniqueDatesWithAddedContent:v15];

    v16 = [v4 lastPlayedDate];
    [(ICMusicLibraryArtistAffinitySnapshot *)v5 setLastPlayedDate:v16];

    -[ICMusicLibraryArtistAffinitySnapshot setCumulativePlayCount:](v5, "setCumulativePlayCount:", [v4 playCount]);
    -[ICMusicLibraryArtistAffinitySnapshot setCumulativeSkipCount:](v5, "setCumulativeSkipCount:", [v4 skipCount]);
  }

  return v5;
}

@end