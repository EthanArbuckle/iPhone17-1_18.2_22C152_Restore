@interface PGMusicCurationSpecificationOptions
+ (unint64_t)PHMemoryMoodFromNumber:(id)a3;
- (BOOL)isQUEmpty;
- (BOOL)isTrip;
- (BOOL)shouldDownloadKeyFlexSong;
- (NSArray)artists;
- (NSArray)genres;
- (NSArray)moods;
- (NSArray)titles;
- (NSNumber)length;
- (PGMusicCurationSpecificationOptions)init;
- (PGMusicCurationSpecificationOptions)initWithOptionsDictionary:(id)a3;
@end

@implementation PGMusicCurationSpecificationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moods, 0);
  objc_storeStrong((id *)&self->_length, 0);
  objc_storeStrong((id *)&self->_genres, 0);
  objc_storeStrong((id *)&self->_artists, 0);
  objc_storeStrong((id *)&self->_titles, 0);
}

- (BOOL)shouldDownloadKeyFlexSong
{
  return self->_shouldDownloadKeyFlexSong;
}

- (BOOL)isTrip
{
  return self->_isTrip;
}

- (NSArray)moods
{
  return self->_moods;
}

- (NSNumber)length
{
  return self->_length;
}

- (NSArray)genres
{
  return self->_genres;
}

- (NSArray)artists
{
  return self->_artists;
}

- (NSArray)titles
{
  return self->_titles;
}

- (BOOL)isQUEmpty
{
  NSUInteger v3 = [(NSArray *)self->_titles count];
  NSUInteger v4 = v3 | [(NSArray *)self->_artists count];
  NSUInteger v5 = [(NSArray *)self->_genres count];
  NSUInteger v6 = [(NSArray *)self->_moods count];
  return !v4 && (v5 | v6) == 0;
}

- (PGMusicCurationSpecificationOptions)initWithOptionsDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PGMusicCurationSpecificationOptions;
  NSUInteger v5 = [(PGMusicCurationSpecificationOptions *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AF48]];
    v7 = (void *)v6;
    v8 = (void *)MEMORY[0x1E4F1CBF0];
    if (v6) {
      v9 = (void *)v6;
    }
    else {
      v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_titles, v9);

    uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AF10]];
    v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = v8;
    }
    objc_storeStrong((id *)&v5->_artists, v12);

    uint64_t v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AF18]];
    v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = v8;
    }
    objc_storeStrong((id *)&v5->_genres, v15);

    uint64_t v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AF38]];
    v17 = (void *)v16;
    if (v16) {
      v18 = (void *)v16;
    }
    else {
      v18 = v8;
    }
    objc_storeStrong((id *)&v5->_moods, v18);

    uint64_t v19 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AF28]];
    length = v5->_length;
    v5->_length = (NSNumber *)v19;

    uint64_t v21 = *MEMORY[0x1E4F8AF20];
    v22 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AF20]];
    if (v22)
    {
      v23 = [v4 objectForKeyedSubscript:v21];
      v5->_isTrip = [v23 BOOLValue];
    }
    else
    {
      v5->_isTrip = 0;
    }

    uint64_t v24 = *MEMORY[0x1E4F8AF40];
    v25 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AF40]];
    if (v25)
    {
      v26 = [v4 objectForKeyedSubscript:v24];
      v5->_shouldDownloadKeyFlexSong = [v26 BOOLValue];
    }
    else
    {
      v5->_shouldDownloadKeyFlexSong = 0;
    }

    v27 = v5;
  }

  return v5;
}

- (PGMusicCurationSpecificationOptions)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  id v4 = [(PGMusicCurationSpecificationOptions *)self initWithOptionsDictionary:v3];

  return v4;
}

+ (unint64_t)PHMemoryMoodFromNumber:(id)a3
{
  return _moodFromMoodAsNumber(a3);
}

@end