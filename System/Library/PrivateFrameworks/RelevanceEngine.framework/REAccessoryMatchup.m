@interface REAccessoryMatchup
+ (BOOL)supportsSecureCoding;
- (NSDate)matchupDateFetched;
- (NSDate)matchupStartDate;
- (NSString)awayTeamDetail;
- (NSString)awayTeamName;
- (NSString)homeTeamDetail;
- (NSString)homeTeamName;
- (NSString)matchupProgress;
- (REAccessoryMatchup)initWithCoder:(id)a3;
- (REAccessoryMatchup)initWithHomeTeamImage:(id)a3 homeTeamName:(id)a4 homeTeamDetail:(id)a5 awayTeamImage:(id)a6 awayTeamName:(id)a7 awayTeamDetail:(id)a8 progress:(id)a9 startDate:(id)a10 status:(unint64_t)a11 dateFetched:(id)a12;
- (REImage)awayTeamImage;
- (REImage)homeTeamImage;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REAccessoryMatchup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REAccessoryMatchup)initWithHomeTeamImage:(id)a3 homeTeamName:(id)a4 homeTeamDetail:(id)a5 awayTeamImage:(id)a6 awayTeamName:(id)a7 awayTeamDetail:(id)a8 progress:(id)a9 startDate:(id)a10 status:(unint64_t)a11 dateFetched:(id)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a12;
  v47.receiver = self;
  v47.super_class = (Class)REAccessoryMatchup;
  v27 = [(REAccessoryMatchup *)&v47 init];
  if (v27)
  {
    uint64_t v28 = [v18 copy];
    homeTeamImage = v27->_homeTeamImage;
    v27->_homeTeamImage = (REImage *)v28;

    uint64_t v30 = [v19 copy];
    homeTeamName = v27->_homeTeamName;
    v27->_homeTeamName = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    homeTeamDetail = v27->_homeTeamDetail;
    v27->_homeTeamDetail = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    awayTeamImage = v27->_awayTeamImage;
    v27->_awayTeamImage = (REImage *)v34;

    uint64_t v36 = [v22 copy];
    awayTeamName = v27->_awayTeamName;
    v27->_awayTeamName = (NSString *)v36;

    uint64_t v38 = [v23 copy];
    awayTeamDetail = v27->_awayTeamDetail;
    v27->_awayTeamDetail = (NSString *)v38;

    uint64_t v40 = [v24 copy];
    matchupProgress = v27->_matchupProgress;
    v27->_matchupProgress = (NSString *)v40;

    uint64_t v42 = [v25 copy];
    matchupStartDate = v27->_matchupStartDate;
    v27->_matchupStartDate = (NSDate *)v42;

    v27->_status = a11;
    uint64_t v44 = [v26 copy];
    matchupDateFetched = v27->_matchupDateFetched;
    v27->_matchupDateFetched = (NSDate *)v44;
  }
  return v27;
}

- (REAccessoryMatchup)initWithCoder:(id)a3
{
  id v3 = a3;
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"REAccessoryMatchupCodingHomeImageKey"];
  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"REAccessoryMatchupCodingHomeNameKey"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"REAccessoryMatchupCodingHomeDetailKey"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"REAccessoryMatchupCodingAwayImageKey"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"REAccessoryMatchupCodingAwayNameKey"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"REAccessoryMatchupCodingAwayDetailKey"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"REAccessoryMatchupCodingMatchupProgressKey"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"REAccessoryMatchupCodingStartDateKey"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"REAccessoryMatchupCodingStatusKey"];
  uint64_t v11 = [v10 unsignedIntegerValue];

  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"REAccessoryMatchupCodingDateFetchedKey"];

  v13 = [(REAccessoryMatchup *)self initWithHomeTeamImage:v16 homeTeamName:v15 homeTeamDetail:v4 awayTeamImage:v5 awayTeamName:v6 awayTeamDetail:v7 progress:v8 startDate:v9 status:v11 dateFetched:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  homeTeamImage = self->_homeTeamImage;
  id v6 = a3;
  [v6 encodeObject:homeTeamImage forKey:@"REAccessoryMatchupCodingHomeImageKey"];
  [v6 encodeObject:self->_homeTeamName forKey:@"REAccessoryMatchupCodingHomeNameKey"];
  [v6 encodeObject:self->_homeTeamDetail forKey:@"REAccessoryMatchupCodingHomeDetailKey"];
  [v6 encodeObject:self->_awayTeamImage forKey:@"REAccessoryMatchupCodingAwayImageKey"];
  [v6 encodeObject:self->_awayTeamName forKey:@"REAccessoryMatchupCodingAwayNameKey"];
  [v6 encodeObject:self->_awayTeamDetail forKey:@"REAccessoryMatchupCodingAwayDetailKey"];
  [v6 encodeObject:self->_matchupStartDate forKey:@"REAccessoryMatchupCodingStartDateKey"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_status];
  [v6 encodeObject:v5 forKey:@"REAccessoryMatchupCodingStatusKey"];

  [v6 encodeObject:self->_matchupDateFetched forKey:@"REAccessoryMatchupCodingDateFetchedKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v17 = [REAccessoryMatchup alloc];
  id v16 = [(REImage *)self->_homeTeamImage copyWithZone:a3];
  v5 = (void *)[(NSString *)self->_homeTeamName copyWithZone:a3];
  id v6 = (void *)[(NSString *)self->_homeTeamDetail copyWithZone:a3];
  id v7 = [(REImage *)self->_awayTeamImage copyWithZone:a3];
  v8 = (void *)[(NSString *)self->_awayTeamName copyWithZone:a3];
  v9 = (void *)[(NSString *)self->_awayTeamDetail copyWithZone:a3];
  v10 = (void *)[(NSString *)self->_matchupProgress copyWithZone:a3];
  uint64_t v11 = (void *)[(NSDate *)self->_matchupStartDate copyWithZone:a3];
  unint64_t status = self->_status;
  v13 = (void *)[(NSDate *)self->_matchupDateFetched copyWithZone:a3];
  v14 = [(REAccessoryMatchup *)v17 initWithHomeTeamImage:v16 homeTeamName:v5 homeTeamDetail:v6 awayTeamImage:v7 awayTeamName:v8 awayTeamDetail:v9 progress:v10 startDate:v11 status:status dateFetched:v13];

  return v14;
}

- (REImage)homeTeamImage
{
  return self->_homeTeamImage;
}

- (NSString)homeTeamName
{
  return self->_homeTeamName;
}

- (NSString)homeTeamDetail
{
  return self->_homeTeamDetail;
}

- (REImage)awayTeamImage
{
  return self->_awayTeamImage;
}

- (NSString)awayTeamName
{
  return self->_awayTeamName;
}

- (NSString)awayTeamDetail
{
  return self->_awayTeamDetail;
}

- (NSString)matchupProgress
{
  return self->_matchupProgress;
}

- (unint64_t)status
{
  return self->_status;
}

- (NSDate)matchupStartDate
{
  return self->_matchupStartDate;
}

- (NSDate)matchupDateFetched
{
  return self->_matchupDateFetched;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchupDateFetched, 0);
  objc_storeStrong((id *)&self->_matchupStartDate, 0);
  objc_storeStrong((id *)&self->_matchupProgress, 0);
  objc_storeStrong((id *)&self->_awayTeamDetail, 0);
  objc_storeStrong((id *)&self->_awayTeamName, 0);
  objc_storeStrong((id *)&self->_awayTeamImage, 0);
  objc_storeStrong((id *)&self->_homeTeamDetail, 0);
  objc_storeStrong((id *)&self->_homeTeamName, 0);
  objc_storeStrong((id *)&self->_homeTeamImage, 0);
}

@end