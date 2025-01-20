@interface _PHAWallpaperSuggestionCount
- (NSNumber)count;
- (NSString)personLocalIdentifer;
- (_PHAWallpaperSuggestionCount)initWithPersonLocalIdentifier:(id)a3 count:(id)a4;
- (void)setCount:(id)a3;
- (void)setPersonLocalIdentifer:(id)a3;
@end

@implementation _PHAWallpaperSuggestionCount

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);

  objc_storeStrong((id *)&self->_personLocalIdentifer, 0);
}

- (void)setCount:(id)a3
{
}

- (NSNumber)count
{
  return self->_count;
}

- (void)setPersonLocalIdentifer:(id)a3
{
}

- (NSString)personLocalIdentifer
{
  return self->_personLocalIdentifer;
}

- (_PHAWallpaperSuggestionCount)initWithPersonLocalIdentifier:(id)a3 count:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PHAWallpaperSuggestionCount;
  v9 = [(_PHAWallpaperSuggestionCount *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personLocalIdentifer, a3);
    objc_storeStrong((id *)&v10->_count, a4);
  }

  return v10;
}

@end