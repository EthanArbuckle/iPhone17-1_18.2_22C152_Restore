@interface PLQueryBuilder
+ (id)_combineFirstQuery:(id)a3 secondQuery:(id)a4 conjunction:(int)a5;
+ (id)andCombineFirstQuery:(id)a3 secondQuery:(id)a4;
+ (id)notQuery:(id)a3;
+ (id)orCombineFirstQuery:(id)a3 secondQuery:(id)a4;
+ (id)validComparatorsForQueryKey:(int)a3;
+ (id)validUnitValuesForQueryKey:(int)a3;
- (BOOL)_isValidCircularRegionComparator:(int)a3;
- (BOOL)_isValidDateKey:(int)a3;
- (BOOL)_isValidNumericComparator:(int)a3;
- (BOOL)_isValidStringComparator:(int)a3;
- (BOOL)_validIsEmptyQueryKey:(int)a3;
- (PLQueryBuilder)initWithConjunction:(int)a3;
- (id)query;
- (void)_addCircularRegionQueryKey:(int)a3 circularRegionValue:(id)a4 comparator:(int)a5;
- (void)_addDateUnitQueryForKey:(int)a3 withValue:(id)a4 withType:(int)a5 withUnit:(int)a6 exclude:(BOOL)a7;
- (void)_addQueryForKey:(int)a3 withValue:(id)a4 withType:(int)a5 withComparator:(int)a6;
- (void)_addQueryWithKey:(int)a3 firstValue:(id)a4 secondValue:(id)a5 valueType:(int)a6 unit:(int)a7 comparator:(int)a8;
- (void)_addRangeQueryForKey:(int)a3 withFirstValue:(id)a4 withSecondValue:(id)a5 withType:(int)a6;
- (void)_addStringQueryKey:(int)a3 stringValue:(id)a4 comparator:(int)a5;
- (void)addApertureQuery:(double)a3 comparator:(int)a4;
- (void)addApertureRangeQueryBetweenValue:(double)a3 andValue:(double)a4;
- (void)addAssetTypeQuery:(int)a3 exclude:(BOOL)a4;
- (void)addBitrateQuery:(double)a3 comparator:(int)a4;
- (void)addCameraMakeQuery:(id)a3 comparator:(int)a4;
- (void)addCameraModelQuery:(id)a3 comparator:(int)a4;
- (void)addCircularRegionQuery:(id)a3 comparator:(int)a4;
- (void)addCodecQuery:(id)a3 comparator:(int)a4;
- (void)addDateRangeQueryKey:(int)a3 between:(id)a4 and:(id)a5;
- (void)addDescriptionQuery:(id)a3 comparator:(int)a4;
- (void)addDoubleQueryKey:(int)a3 withValue:(double)a4 comparator:(int)a5;
- (void)addDurationQuery:(double)a3 comparator:(int)a4;
- (void)addExposureBiasQuery:(double)a3 comparator:(int)a4;
- (void)addFilenameQuery:(id)a3 comparator:(int)a4;
- (void)addFlashQuery:(BOOL)a3;
- (void)addFocalLengthQuery:(double)a3 comparator:(int)a4;
- (void)addFpsQuery:(double)a3 comparator:(int)a4;
- (void)addHasLocationQuery:(BOOL)a3;
- (void)addInTheLastDaysQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5;
- (void)addInTheLastMonthsQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5;
- (void)addInTheLastSecondsQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5;
- (void)addInTheLastWeeksQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5;
- (void)addInTheLastYearsQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5;
- (void)addIntegerQueryKey:(int)a3 withValue:(int64_t)a4 comparator:(int)a5;
- (void)addIsAdjustedQuery:(BOOL)a3;
- (void)addIsAfterDateQueryKey:(int)a3 withDate:(id)a4;
- (void)addIsBeforeDateQueryKey:(int)a3 withDate:(id)a4;
- (void)addIsDateQueryKey:(int)a3 withDate:(id)a4 exclude:(BOOL)a5;
- (void)addIsEmptyQueryForKey:(int)a3 isEmpty:(BOOL)a4;
- (void)addIsFavoriteQuery:(BOOL)a3;
- (void)addIsHiddenQuery:(BOOL)a3;
- (void)addIsInAlbumQuery:(id)a3;
- (void)addIsInAnyAlbumQuery;
- (void)addIsProResQuery:(BOOL)a3;
- (void)addIsRawQuery:(BOOL)a3;
- (void)addIsReferencedMediaQuery:(BOOL)a3;
- (void)addIsoQuery:(int64_t)a3 comparator:(int)a4;
- (void)addIsoRangeQueryBetweenValue:(int64_t)a3 andValue:(int64_t)a4;
- (void)addKeywordQuery:(id)a3 exclude:(BOOL)a4;
- (void)addLensModelQuery:(id)a3 comparator:(int)a4;
- (void)addMeteringModeQuery:(int64_t)a3 comparator:(int)a4;
- (void)addPersonQuery:(id)a3 comparator:(int)a4;
- (void)addPersonUUIDInMomentQuery:(id)a3 comparator:(int)a4;
- (void)addPersonUUIDQuery:(id)a3 comparator:(int)a4;
- (void)addSampleRateQuery:(int64_t)a3 comparator:(int)a4;
- (void)addShutterSpeedQuery:(double)a3 comparator:(int)a4;
- (void)addTextQuery:(id)a3 comparator:(int)a4;
- (void)addTitleQuery:(id)a3 comparator:(int)a4;
- (void)addTrackFormatQuery:(int64_t)a3 comparator:(int)a4;
- (void)addUnableToUploadQuery;
- (void)addWhiteBalanceQuery:(int64_t)a3 comparator:(int)a4;
@end

@implementation PLQueryBuilder

- (void).cxx_destruct
{
}

- (id)query
{
  return self->_query;
}

- (void)_addQueryForKey:(int)a3 withValue:(id)a4 withType:(int)a5 withComparator:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  if (a4)
  {
    uint64_t v10 = convertToData(a4);
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = (id)v10;
  [(PLQueryBuilder *)self _addQueryWithKey:v8 firstValue:v10 secondValue:0 valueType:v7 unit:0 comparator:v6];
}

- (void)addUnableToUploadQuery
{
}

- (void)addCircularRegionQuery:(id)a3 comparator:(int)a4
{
}

- (void)addPersonUUIDInMomentQuery:(id)a3 comparator:(int)a4
{
}

- (void)addPersonUUIDQuery:(id)a3 comparator:(int)a4
{
}

- (void)addPersonQuery:(id)a3 comparator:(int)a4
{
}

- (void)addKeywordQuery:(id)a3 exclude:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 23;
  }
  else {
    uint64_t v4 = 22;
  }
  [(PLQueryBuilder *)self _addStringQueryKey:500 stringValue:a3 comparator:v4];
}

- (void)addIntegerQueryKey:(int)a3 withValue:(int64_t)a4 comparator:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  if ([(PLQueryBuilder *)self _isValidNumericComparator:*(void *)&a5])
  {
    v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    convertToData(v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    [(PLQueryBuilder *)self _addQueryWithKey:v7 firstValue:v10 secondValue:0 valueType:1 unit:0 comparator:v5];
  }
}

- (void)addDoubleQueryKey:(int)a3 withValue:(double)a4 comparator:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  if ([(PLQueryBuilder *)self _isValidNumericComparator:*(void *)&a5])
  {
    v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:a4];
    convertToData(v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    [(PLQueryBuilder *)self _addQueryWithKey:v7 firstValue:v10 secondValue:0 valueType:2 unit:0 comparator:v5];
  }
}

- (void)addHasLocationQuery:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(PLQueryBuilder *)self _addQueryForKey:319 withValue:MEMORY[0x1E4F1CC38] withType:1 withComparator:v3];
}

- (void)addWhiteBalanceQuery:(int64_t)a3 comparator:(int)a4
{
}

- (void)addTrackFormatQuery:(int64_t)a3 comparator:(int)a4
{
}

- (void)addShutterSpeedQuery:(double)a3 comparator:(int)a4
{
}

- (void)addSampleRateQuery:(int64_t)a3 comparator:(int)a4
{
}

- (void)addMeteringModeQuery:(int64_t)a3 comparator:(int)a4
{
}

- (void)addLensModelQuery:(id)a3 comparator:(int)a4
{
}

- (void)addFpsQuery:(double)a3 comparator:(int)a4
{
}

- (void)addIsoQuery:(int64_t)a3 comparator:(int)a4
{
}

- (void)addFocalLengthQuery:(double)a3 comparator:(int)a4
{
}

- (void)addFlashQuery:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(PLQueryBuilder *)self _addQueryForKey:302 withValue:MEMORY[0x1E4F1CC38] withType:1 withComparator:v3];
}

- (void)addExposureBiasQuery:(double)a3 comparator:(int)a4
{
}

- (void)addDurationQuery:(double)a3 comparator:(int)a4
{
}

- (void)addCodecQuery:(id)a3 comparator:(int)a4
{
}

- (void)addCameraMakeQuery:(id)a3 comparator:(int)a4
{
}

- (void)addCameraModelQuery:(id)a3 comparator:(int)a4
{
}

- (void)addBitrateQuery:(double)a3 comparator:(int)a4
{
}

- (void)addApertureQuery:(double)a3 comparator:(int)a4
{
}

- (BOOL)_isValidNumericComparator:(int)a3
{
  return (a3 - 1) < 6;
}

- (void)addIsEmptyQueryForKey:(int)a3 isEmpty:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if (-[PLQueryBuilder _validIsEmptyQueryKey:](self, "_validIsEmptyQueryKey:"))
  {
    if (v4) {
      uint64_t v7 = 50;
    }
    else {
      uint64_t v7 = 51;
    }
    [(PLQueryBuilder *)self _addQueryWithKey:v5 firstValue:0 secondValue:0 valueType:0 unit:0 comparator:v7];
  }
}

- (BOOL)_validIsEmptyQueryKey:(int)a3
{
  return a3 == 6 || a3 == 403 || a3 == 401;
}

- (void)_addCircularRegionQueryKey:(int)a3 circularRegionValue:(id)a4 comparator:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if ([(PLQueryBuilder *)self _isValidCircularRegionComparator:v5]) {
    [(PLQueryBuilder *)self _addQueryForKey:v6 withValue:v8 withType:5 withComparator:v5];
  }
}

- (BOOL)_isValidCircularRegionComparator:(int)a3
{
  return (a3 - 31) < 2;
}

- (void)_addStringQueryKey:(int)a3 stringValue:(id)a4 comparator:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  if ([(PLQueryBuilder *)self _isValidStringComparator:v5])
  {
    id v8 = [v9 dataUsingEncoding:4];
    [(PLQueryBuilder *)self _addQueryWithKey:v6 firstValue:v8 secondValue:0 valueType:3 unit:0 comparator:v5];
  }
}

- (void)addTextQuery:(id)a3 comparator:(int)a4
{
}

- (void)addDescriptionQuery:(id)a3 comparator:(int)a4
{
}

- (void)addTitleQuery:(id)a3 comparator:(int)a4
{
}

- (void)addFilenameQuery:(id)a3 comparator:(int)a4
{
}

- (BOOL)_isValidStringComparator:(int)a3
{
  return (a3 < 0x34) & (0xC000003F00000uLL >> a3);
}

- (void)addDateRangeQueryKey:(int)a3 between:(id)a4 and:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  id v8 = a5;
  if ([(PLQueryBuilder *)self _isValidDateKey:v6]) {
    [(PLQueryBuilder *)self _addRangeQueryForKey:v6 withFirstValue:v9 withSecondValue:v8 withType:4];
  }
}

- (void)addIsoRangeQueryBetweenValue:(int64_t)a3 andValue:(int64_t)a4
{
  id v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
  [(PLQueryBuilder *)self _addRangeQueryForKey:304 withFirstValue:v7 withSecondValue:v6 withType:1];
}

- (void)addApertureRangeQueryBetweenValue:(double)a3 andValue:(double)a4
{
  id v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:a4];
  [(PLQueryBuilder *)self _addRangeQueryForKey:300 withFirstValue:v7 withSecondValue:v6 withType:2];
}

- (void)_addRangeQueryForKey:(int)a3 withFirstValue:(id)a4 withSecondValue:(id)a5 withType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  convertToData(a4);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = convertToData(v10);

  [(PLQueryBuilder *)self _addQueryWithKey:v8 firstValue:v12 secondValue:v11 valueType:v6 unit:0 comparator:30];
}

- (void)_addDateUnitQueryForKey:(int)a3 withValue:(id)a4 withType:(int)a5 withUnit:(int)a6 exclude:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a3;
  id v14 = a4;
  if ([(PLQueryBuilder *)self _isValidDateKey:v10])
  {
    id v12 = convertToData(v14);
    if (v7) {
      uint64_t v13 = 41;
    }
    else {
      uint64_t v13 = 40;
    }
    [(PLQueryBuilder *)self _addQueryWithKey:v10 firstValue:v12 secondValue:0 valueType:v9 unit:v8 comparator:v13];
  }
}

- (void)addInTheLastSecondsQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:"))
  {
    id v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    [(PLQueryBuilder *)self _addDateUnitQueryForKey:v7 withValue:v9 withType:1 withUnit:5 exclude:v5];
  }
}

- (void)addInTheLastYearsQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:"))
  {
    id v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    [(PLQueryBuilder *)self _addDateUnitQueryForKey:v7 withValue:v9 withType:1 withUnit:4 exclude:v5];
  }
}

- (void)addInTheLastMonthsQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:"))
  {
    id v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    [(PLQueryBuilder *)self _addDateUnitQueryForKey:v7 withValue:v9 withType:1 withUnit:3 exclude:v5];
  }
}

- (void)addInTheLastWeeksQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:"))
  {
    id v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    [(PLQueryBuilder *)self _addDateUnitQueryForKey:v7 withValue:v9 withType:1 withUnit:2 exclude:v5];
  }
}

- (void)addInTheLastDaysQueryKey:(int)a3 withCount:(int64_t)a4 exclude:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  if (-[PLQueryBuilder _isValidDateKey:](self, "_isValidDateKey:"))
  {
    id v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    [(PLQueryBuilder *)self _addDateUnitQueryForKey:v7 withValue:v9 withType:1 withUnit:1 exclude:v5];
  }
}

- (void)addIsBeforeDateQueryKey:(int)a3 withDate:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([(PLQueryBuilder *)self _isValidDateKey:v4]) {
    [(PLQueryBuilder *)self _addQueryForKey:v4 withValue:v6 withType:4 withComparator:4];
  }
}

- (void)addIsAfterDateQueryKey:(int)a3 withDate:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([(PLQueryBuilder *)self _isValidDateKey:v4]) {
    [(PLQueryBuilder *)self _addQueryForKey:v4 withValue:v6 withType:4 withComparator:5];
  }
}

- (void)addIsDateQueryKey:(int)a3 withDate:(id)a4 exclude:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  if ([(PLQueryBuilder *)self _isValidDateKey:v6])
  {
    if (v5) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    [(PLQueryBuilder *)self _addQueryForKey:v6 withValue:v9 withType:4 withComparator:v8];
  }
}

- (BOOL)_isValidDateKey:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 200;
}

- (void)addIsReferencedMediaQuery:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(PLQueryBuilder *)self _addQueryForKey:6 withValue:MEMORY[0x1E4F1CC38] withType:1 withComparator:v3];
}

- (void)addIsInAnyAlbumQuery
{
}

- (void)addIsInAlbumQuery:(id)a3
{
}

- (void)addAssetTypeQuery:(int)a3 exclude:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*(void *)&a3];
  [(PLQueryBuilder *)self _addQueryForKey:5 withValue:v6 withType:1 withComparator:v5];
}

- (void)addIsProResQuery:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(PLQueryBuilder *)self _addQueryForKey:9 withValue:MEMORY[0x1E4F1CC38] withType:1 withComparator:v3];
}

- (void)addIsRawQuery:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(PLQueryBuilder *)self _addQueryForKey:4 withValue:MEMORY[0x1E4F1CC38] withType:1 withComparator:v3];
}

- (void)addIsAdjustedQuery:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(PLQueryBuilder *)self _addQueryForKey:3 withValue:MEMORY[0x1E4F1CC38] withType:1 withComparator:v3];
}

- (void)addIsHiddenQuery:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(PLQueryBuilder *)self _addQueryForKey:2 withValue:MEMORY[0x1E4F1CC38] withType:1 withComparator:v3];
}

- (void)addIsFavoriteQuery:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(PLQueryBuilder *)self _addQueryForKey:1 withValue:MEMORY[0x1E4F1CC38] withType:1 withComparator:v3];
}

- (void)_addQueryWithKey:(int)a3 firstValue:(id)a4 secondValue:(id)a5 valueType:(int)a6 unit:(int)a7 comparator:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = *(void *)&a3;
  id v16 = a5;
  id v14 = a4;
  v15 = objc_alloc_init(PLSingleQuery);
  [(PLSingleQuery *)v15 setKey:v12];
  [(PLSingleQuery *)v15 setValueType:v10];
  [(PLSingleQuery *)v15 setFirstValue:v14];

  if (v16) {
    [(PLSingleQuery *)v15 setSecondValue:v16];
  }
  if (v8) {
    [(PLSingleQuery *)v15 setComparator:v8];
  }
  if (v9) {
    [(PLSingleQuery *)v15 setUnit:v9];
  }
  [(PLQuery *)self->_query addSingleQueries:v15];
}

- (PLQueryBuilder)initWithConjunction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)PLQueryBuilder;
  uint64_t v4 = [(PLQueryBuilder *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_alloc_init(PLQuery);
    query = v4->_query;
    v4->_query = v5;

    [(PLQuery *)v4->_query setConjunction:v3];
  }
  return v4;
}

+ (id)validUnitValuesForQueryKey:(int)a3
{
  if ((a3 & 0xFFFFFFFE) == 0xC8) {
    return &unk_1EEC14F68;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

+ (id)validComparatorsForQueryKey:(int)a3
{
  id result = &unk_1EEC14EA8;
  if (a3 <= 299)
  {
    if (a3 <= 9 && ((1 << a3) & 0x27E) != 0) {
      return result;
    }
    if ((a3 - 200) < 2) {
      return &unk_1EEC14F38;
    }
    if (a3 != 100) {
      return (id)MEMORY[0x1E4F1CBF0];
    }
    return &unk_1EEC14EC0;
  }
  if (a3 > 399)
  {
    if (a3 <= 549)
    {
      switch(a3)
      {
        case 400:
          return &unk_1EEC14ED8;
        case 401:
        case 403:
          return &unk_1EEC14EF0;
        case 402:
          id result = &unk_1EEC14F08;
          break;
        default:
          if (a3 == 500) {
            return &unk_1EEC14EC0;
          }
          return (id)MEMORY[0x1E4F1CBF0];
      }
      return result;
    }
    if (a3 <= 552)
    {
      if (a3 == 550) {
        return &unk_1EEC14ED8;
      }
      if (a3 != 551) {
        return (id)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      if (a3 == 1000) {
        return result;
      }
      if (a3 == 600) {
        return &unk_1EEC14F50;
      }
      if (a3 != 553) {
        return (id)MEMORY[0x1E4F1CBF0];
      }
    }
    return &unk_1EEC14EC0;
  }
  char v4 = a3 - 44;
  if ((a3 - 300) > 0x13) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  if (((1 << v4) & 0x59) != 0) {
    return &unk_1EEC14F20;
  }
  if (((1 << v4) & 0x22) != 0) {
    return &unk_1EEC14EF0;
  }
  if (a3 != 319) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  return result;
}

+ (id)_combineFirstQuery:(id)a3 secondQuery:(id)a4 conjunction:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_alloc_init(PLQuery);
  [(PLQuery *)v9 setFirst:v8];

  [(PLQuery *)v9 setSecond:v7];
  [(PLQuery *)v9 setConjunction:v5];
  return v9;
}

+ (id)notQuery:(id)a3
{
  id v3 = a3;
  char v4 = objc_alloc_init(PLQuery);
  [(PLQuery *)v4 setConjunction:2];
  [(PLQuery *)v4 setFirst:v3];

  return v4;
}

+ (id)orCombineFirstQuery:(id)a3 secondQuery:(id)a4
{
  return +[PLQueryBuilder _combineFirstQuery:a3 secondQuery:a4 conjunction:0];
}

+ (id)andCombineFirstQuery:(id)a3 secondQuery:(id)a4
{
  return +[PLQueryBuilder _combineFirstQuery:a3 secondQuery:a4 conjunction:1];
}

@end