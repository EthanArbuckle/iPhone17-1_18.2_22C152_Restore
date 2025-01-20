@interface PUTopPeopleWallpaperSuggestionsScoringContext
- (PUTopPeopleWallpaperSuggestionsScoringContext)init;
- (double)aestheticFactor;
- (double)atHomeOrWorkFactor;
- (double)croppingFactor;
- (double)favoriteFactor;
- (double)interactionFactor;
- (double)maximumSizeAllowedForFaces;
- (double)meaningFactor;
- (double)peopleFactor;
- (double)wallpaperFactor;
- (id)dictionaryRepresentation;
- (void)setAestheticFactor:(double)a3;
- (void)setAtHomeOrWorkFactor:(double)a3;
- (void)setCroppingFactor:(double)a3;
- (void)setFavoriteFactor:(double)a3;
- (void)setInteractionFactor:(double)a3;
- (void)setMaximumSizeAllowedForFaces:(double)a3;
- (void)setMeaningFactor:(double)a3;
- (void)setPeopleFactor:(double)a3;
- (void)setWallpaperFactor:(double)a3;
@end

@implementation PUTopPeopleWallpaperSuggestionsScoringContext

- (void)setMaximumSizeAllowedForFaces:(double)a3
{
  self->_maximumSizeAllowedForFaces = a3;
}

- (double)maximumSizeAllowedForFaces
{
  return self->_maximumSizeAllowedForFaces;
}

- (void)setCroppingFactor:(double)a3
{
  self->_croppingFactor = a3;
}

- (double)croppingFactor
{
  return self->_croppingFactor;
}

- (void)setWallpaperFactor:(double)a3
{
  self->_wallpaperFactor = a3;
}

- (double)wallpaperFactor
{
  return self->_wallpaperFactor;
}

- (void)setAtHomeOrWorkFactor:(double)a3
{
  self->_atHomeOrWorkFactor = a3;
}

- (double)atHomeOrWorkFactor
{
  return self->_atHomeOrWorkFactor;
}

- (void)setMeaningFactor:(double)a3
{
  self->_meaningFactor = a3;
}

- (double)meaningFactor
{
  return self->_meaningFactor;
}

- (void)setInteractionFactor:(double)a3
{
  self->_interactionFactor = a3;
}

- (double)interactionFactor
{
  return self->_interactionFactor;
}

- (void)setPeopleFactor:(double)a3
{
  self->_peopleFactor = a3;
}

- (double)peopleFactor
{
  return self->_peopleFactor;
}

- (void)setAestheticFactor:(double)a3
{
  self->_aestheticFactor = a3;
}

- (double)aestheticFactor
{
  return self->_aestheticFactor;
}

- (void)setFavoriteFactor:(double)a3
{
  self->_favoriteFactor = a3;
}

- (double)favoriteFactor
{
  return self->_favoriteFactor;
}

- (id)dictionaryRepresentation
{
  v15[9] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithDouble:", self->_favoriteFactor, @"favoriteFactor");
  v15[0] = v3;
  v14[1] = @"aestheticFactor";
  v4 = [NSNumber numberWithDouble:self->_aestheticFactor];
  v15[1] = v4;
  v14[2] = @"peopleFactor";
  v5 = [NSNumber numberWithDouble:self->_peopleFactor];
  v15[2] = v5;
  v14[3] = @"interactionFactor";
  v6 = [NSNumber numberWithDouble:self->_interactionFactor];
  v15[3] = v6;
  v14[4] = @"meaningFactor";
  v7 = [NSNumber numberWithDouble:self->_meaningFactor];
  v15[4] = v7;
  v14[5] = @"atHomeOrWorkFactor";
  v8 = [NSNumber numberWithDouble:self->_atHomeOrWorkFactor];
  v15[5] = v8;
  v14[6] = @"wallpaperFactor";
  v9 = [NSNumber numberWithDouble:self->_wallpaperFactor];
  v15[6] = v9;
  v14[7] = @"croppingFactor";
  v10 = [NSNumber numberWithDouble:self->_croppingFactor];
  v15[7] = v10;
  v14[8] = @"maximumSizeAllowedForFaces";
  v11 = [NSNumber numberWithDouble:self->_maximumSizeAllowedForFaces];
  v15[8] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:9];

  return v12;
}

- (PUTopPeopleWallpaperSuggestionsScoringContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)PUTopPeopleWallpaperSuggestionsScoringContext;
  result = [(PUTopPeopleWallpaperSuggestionsScoringContext *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_favoriteFactor = xmmword_1AEFF7CE0;
    *(_OWORD *)&result->_peopleFactor = xmmword_1AEFF7CA0;
    *(_OWORD *)&result->_meaningFactor = xmmword_1AEFF7CF0;
    *(_OWORD *)&result->_wallpaperFactor = xmmword_1AEFF7D00;
    result->_maximumSizeAllowedForFaces = 0.35;
  }
  return result;
}

@end