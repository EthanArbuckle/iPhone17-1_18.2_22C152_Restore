@interface PXExploreParsingState
- (BOOL)canIgnoreNextHeroSide;
- (BOOL)didMoveBestItemOutOfNextShortRow;
- (BOOL)didMoveBestItemOutOfPreviousShortRowIntoHeroRow;
- (double)buildingBlockAspectRatio;
- (int64_t)effectiveLargeHeroDensity;
- (int64_t)lastHeroRowTag;
- (int64_t)nextHeroSide;
- (int64_t)nextRowType;
- (int64_t)numberOfColumnsOverride;
- (int64_t)numberOfConsecutiveMediumHeroRows;
- (int64_t)parseLocation;
- (void)prepareWithMetrics:(id)a3;
- (void)setBuildingBlockAspectRatio:(double)a3;
- (void)setDidMoveBestItemOutOfNextShortRow:(BOOL)a3;
- (void)setDidMoveBestItemOutOfPreviousShortRowIntoHeroRow:(BOOL)a3;
- (void)setEffectiveLargeHeroDensity:(int64_t)a3;
- (void)setLastHeroRowTag:(int64_t)a3;
- (void)setNextHeroSide:(int64_t)a3;
- (void)setNextRowType:(int64_t)a3;
- (void)setNumberOfColumnsOverride:(int64_t)a3;
- (void)setNumberOfConsecutiveMediumHeroRows:(int64_t)a3;
- (void)setParseLocation:(int64_t)a3;
@end

@implementation PXExploreParsingState

- (void)setDidMoveBestItemOutOfPreviousShortRowIntoHeroRow:(BOOL)a3
{
  self->_didMoveBestItemOutOfPreviousShortRowIntoHeroRow = a3;
}

- (BOOL)didMoveBestItemOutOfPreviousShortRowIntoHeroRow
{
  return self->_didMoveBestItemOutOfPreviousShortRowIntoHeroRow;
}

- (void)setDidMoveBestItemOutOfNextShortRow:(BOOL)a3
{
  self->_didMoveBestItemOutOfNextShortRow = a3;
}

- (BOOL)didMoveBestItemOutOfNextShortRow
{
  return self->_didMoveBestItemOutOfNextShortRow;
}

- (void)setLastHeroRowTag:(int64_t)a3
{
  self->_lastHeroRowTag = a3;
}

- (int64_t)lastHeroRowTag
{
  return self->_lastHeroRowTag;
}

- (void)setNumberOfColumnsOverride:(int64_t)a3
{
  self->_numberOfColumnsOverride = a3;
}

- (int64_t)numberOfColumnsOverride
{
  return self->_numberOfColumnsOverride;
}

- (void)setEffectiveLargeHeroDensity:(int64_t)a3
{
  self->_effectiveLargeHeroDensity = a3;
}

- (int64_t)effectiveLargeHeroDensity
{
  return self->_effectiveLargeHeroDensity;
}

- (void)setNumberOfConsecutiveMediumHeroRows:(int64_t)a3
{
  self->_numberOfConsecutiveMediumHeroRows = a3;
}

- (int64_t)numberOfConsecutiveMediumHeroRows
{
  return self->_numberOfConsecutiveMediumHeroRows;
}

- (BOOL)canIgnoreNextHeroSide
{
  return self->_canIgnoreNextHeroSide;
}

- (int64_t)nextHeroSide
{
  return self->_nextHeroSide;
}

- (void)setNextRowType:(int64_t)a3
{
  self->_nextRowType = a3;
}

- (int64_t)nextRowType
{
  return self->_nextRowType;
}

- (void)setBuildingBlockAspectRatio:(double)a3
{
  self->_buildingBlockAspectRatio = a3;
}

- (double)buildingBlockAspectRatio
{
  return self->_buildingBlockAspectRatio;
}

- (void)setParseLocation:(int64_t)a3
{
  self->_parseLocation = a3;
}

- (int64_t)parseLocation
{
  return self->_parseLocation;
}

- (void)setNextHeroSide:(int64_t)a3
{
  self->_nextHeroSide = a3;
  self->_canIgnoreNextHeroSide = 0;
}

- (void)prepareWithMetrics:(id)a3
{
  id v11 = a3;
  if ([v11 allowHeaders]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = ([v11 layoutType] == 2
  }
       || [v11 layoutType] == 4
       || [v11 layoutType] == 5
       || [v11 layoutType] == 6)
      && [v11 layoutSubtype] != 3;
  [(PXExploreParsingState *)self setParseLocation:0];
  [v11 buildingBlockAspectRatio];
  double v6 = v5;
  double v7 = 1.0;
  if (v6 > 0.0) {
    objc_msgSend(v11, "buildingBlockAspectRatio", 1.0);
  }
  [(PXExploreParsingState *)self setBuildingBlockAspectRatio:v7];
  if ([v11 layoutSubtype] == 3)
  {
    uint64_t v8 = [v11 layoutType];
    uint64_t v9 = 1;
    if (v8 != 1) {
      uint64_t v9 = 2;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }
  if (v4) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }
  [(PXExploreParsingState *)self setNextRowType:v10];
  [(PXExploreParsingState *)self setNextHeroSide:0];
  self->_canIgnoreNextHeroSide = 1;
  [(PXExploreParsingState *)self setNumberOfConsecutiveMediumHeroRows:0];
  -[PXExploreParsingState setEffectiveLargeHeroDensity:](self, "setEffectiveLargeHeroDensity:", [v11 largeHeroDensity]);
  [(PXExploreParsingState *)self setNumberOfColumnsOverride:0];
  [(PXExploreParsingState *)self setLastHeroRowTag:0];
}

@end