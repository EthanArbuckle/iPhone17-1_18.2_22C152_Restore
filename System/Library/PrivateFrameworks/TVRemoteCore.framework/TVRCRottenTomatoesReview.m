@interface TVRCRottenTomatoesReview
+ (BOOL)supportsSecureCoding;
+ (TVRCRottenTomatoesReview)rottenTomatoesReviewWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRottenTomatoesReview:(id)a3;
- (NSNumber)audienceScore;
- (NSNumber)averageRating;
- (NSNumber)numberOfFreshReviews;
- (NSNumber)numberOfRottenReviews;
- (NSNumber)percentage;
- (NSString)consensus;
- (NSString)freshness;
- (TVRCRottenTomatoesReview)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)freshnessLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setAudienceScore:(id)a3;
- (void)setAverageRating:(id)a3;
- (void)setConsensus:(id)a3;
- (void)setFreshness:(id)a3;
- (void)setNumberOfFreshReviews:(id)a3;
- (void)setNumberOfRottenReviews:(id)a3;
- (void)setPercentage:(id)a3;
@end

@implementation TVRCRottenTomatoesReview

+ (TVRCRottenTomatoesReview)rottenTomatoesReviewWithDictionary:(id)a3
{
  id v3 = a3;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __63__TVRCRottenTomatoesReview_rottenTomatoesReviewWithDictionary___block_invoke;
  v22[3] = &unk_2647AE768;
  id v4 = v3;
  id v23 = v4;
  v5 = (void (**)(void, void))MEMORY[0x22A6592D0](v22);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __63__TVRCRottenTomatoesReview_rottenTomatoesReviewWithDictionary___block_invoke_2;
  v20 = &unk_2647AE790;
  id v21 = v4;
  id v6 = v4;
  v7 = (void (**)(void, void))MEMORY[0x22A6592D0](&v17);
  v8 = objc_alloc_init(TVRCRottenTomatoesReview);
  v9 = ((void (**)(void, __CFString *))v7)[2](v7, @"tomatometerPercentage");
  -[TVRCRottenTomatoesReview setPercentage:](v8, "setPercentage:", v9, v17, v18, v19, v20);

  v10 = ((void (**)(void, __CFString *))v7)[2](v7, @"audienceScore");
  [(TVRCRottenTomatoesReview *)v8 setAudienceScore:v10];

  v11 = ((void (**)(void, __CFString *))v7)[2](v7, @"averageRating");
  [(TVRCRottenTomatoesReview *)v8 setAverageRating:v11];

  v12 = ((void (**)(void, __CFString *))v5)[2](v5, @"consensus");
  [(TVRCRottenTomatoesReview *)v8 setConsensus:v12];

  v13 = ((void (**)(void, __CFString *))v7)[2](v7, @"numFreshReviews");
  [(TVRCRottenTomatoesReview *)v8 setNumberOfFreshReviews:v13];

  v14 = ((void (**)(void, __CFString *))v7)[2](v7, @"numRottenReviews");
  [(TVRCRottenTomatoesReview *)v8 setNumberOfRottenReviews:v14];

  v15 = ((void (**)(void, __CFString *))v5)[2](v5, @"tomatometerFreshness");
  [(TVRCRottenTomatoesReview *)v8 setFreshness:v15];

  return v8;
}

id __63__TVRCRottenTomatoesReview_rottenTomatoesReviewWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v2;
LABEL_6:
      id v4 = v3;
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = [v2 stringValue];
      goto LABEL_6;
    }
  }
  id v4 = 0;
LABEL_8:

  return v4;
}

id __63__TVRCRottenTomatoesReview_rottenTomatoesReviewWithDictionary___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v2;
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [MEMORY[0x263F08B08] scannerWithString:v2];
      double v6 = 0.0;
      if ([v4 scanDouble:&v6])
      {
        id v3 = [NSNumber numberWithDouble:v6];

        goto LABEL_9;
      }
    }
  }
  id v3 = 0;
LABEL_9:

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(TVRCRottenTomatoesReview *)self isEqualToRottenTomatoesReview:v4];

  return v5;
}

- (BOOL)isEqualToRottenTomatoesReview:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TVRCRottenTomatoesReview *)self percentage];
  double v6 = [v4 percentage];
  char v7 = (v5 == 0) ^ (v6 == 0);

  if (v7) {
    goto LABEL_22;
  }
  v8 = [(TVRCRottenTomatoesReview *)self audienceScore];
  v9 = [v4 audienceScore];
  char v10 = (v8 == 0) ^ (v9 == 0);

  if (v10) {
    goto LABEL_22;
  }
  v11 = [(TVRCRottenTomatoesReview *)self averageRating];
  v12 = [v4 averageRating];
  char v13 = (v11 == 0) ^ (v12 == 0);

  if (v13) {
    goto LABEL_22;
  }
  v14 = [(TVRCRottenTomatoesReview *)self consensus];
  v15 = [v4 consensus];
  char v16 = (v14 == 0) ^ (v15 == 0);

  if (v16) {
    goto LABEL_22;
  }
  uint64_t v17 = [(TVRCRottenTomatoesReview *)self numberOfFreshReviews];
  uint64_t v18 = [v4 numberOfFreshReviews];
  char v19 = (v17 == 0) ^ (v18 == 0);

  if (v19) {
    goto LABEL_22;
  }
  v20 = [(TVRCRottenTomatoesReview *)self numberOfRottenReviews];
  id v21 = [v4 numberOfRottenReviews];
  char v22 = (v20 == 0) ^ (v21 == 0);

  if (v22) {
    goto LABEL_22;
  }
  id v23 = [(TVRCRottenTomatoesReview *)self freshness];
  v24 = [v4 freshness];
  char v25 = (v23 == 0) ^ (v24 == 0);

  if (v25) {
    goto LABEL_22;
  }
  uint64_t v26 = [(TVRCRottenTomatoesReview *)self percentage];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(TVRCRottenTomatoesReview *)self percentage];
    v29 = [v4 percentage];
    int v30 = [v28 isEqualToNumber:v29];

    if (!v30) {
      goto LABEL_22;
    }
  }
  uint64_t v31 = [(TVRCRottenTomatoesReview *)self audienceScore];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(TVRCRottenTomatoesReview *)self audienceScore];
    v34 = [v4 audienceScore];
    int v35 = [v33 isEqualToNumber:v34];

    if (!v35) {
      goto LABEL_22;
    }
  }
  uint64_t v36 = [(TVRCRottenTomatoesReview *)self averageRating];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(TVRCRottenTomatoesReview *)self averageRating];
    v39 = [v4 averageRating];
    int v40 = [v38 isEqualToNumber:v39];

    if (!v40) {
      goto LABEL_22;
    }
  }
  uint64_t v41 = [(TVRCRottenTomatoesReview *)self consensus];
  if (v41)
  {
    v42 = (void *)v41;
    v43 = [(TVRCRottenTomatoesReview *)self consensus];
    v44 = [v4 consensus];
    int v45 = [v43 isEqualToString:v44];

    if (!v45) {
      goto LABEL_22;
    }
  }
  uint64_t v46 = [(TVRCRottenTomatoesReview *)self numberOfFreshReviews];
  if (v46)
  {
    v47 = (void *)v46;
    v48 = [(TVRCRottenTomatoesReview *)self numberOfFreshReviews];
    v49 = [v4 numberOfFreshReviews];
    int v50 = [v48 isEqualToNumber:v49];

    if (!v50) {
      goto LABEL_22;
    }
  }
  uint64_t v51 = [(TVRCRottenTomatoesReview *)self numberOfRottenReviews];
  if (!v51) {
    goto LABEL_20;
  }
  v52 = (void *)v51;
  v53 = [(TVRCRottenTomatoesReview *)self numberOfRottenReviews];
  v54 = [v4 numberOfRottenReviews];
  int v55 = [v53 isEqualToNumber:v54];

  if (!v55)
  {
LABEL_22:
    char v60 = 0;
  }
  else
  {
LABEL_20:
    uint64_t v56 = [(TVRCRottenTomatoesReview *)self freshness];
    if (v56)
    {
      v57 = (void *)v56;
      v58 = [(TVRCRottenTomatoesReview *)self freshness];
      v59 = [v4 freshness];
      char v60 = [v58 isEqualToString:v59];
    }
    else
    {
      char v60 = 1;
    }
  }

  return v60;
}

- (unint64_t)freshnessLevel
{
  id v3 = [(TVRCRottenTomatoesReview *)self freshness];
  char v4 = [v3 isEqualToString:@"CertifiedFresh"];

  if (v4) {
    return 1;
  }
  double v6 = [(TVRCRottenTomatoesReview *)self freshness];
  int v7 = [v6 isEqualToString:@"Rotten"];

  if (v7) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v4 = objc_alloc_init(TVRCRottenTomatoesReview);
  BOOL v5 = [(TVRCRottenTomatoesReview *)self percentage];
  [(TVRCRottenTomatoesReview *)v4 setPercentage:v5];

  double v6 = [(TVRCRottenTomatoesReview *)self audienceScore];
  [(TVRCRottenTomatoesReview *)v4 setAudienceScore:v6];

  int v7 = [(TVRCRottenTomatoesReview *)self averageRating];
  [(TVRCRottenTomatoesReview *)v4 setAverageRating:v7];

  v8 = [(TVRCRottenTomatoesReview *)self consensus];
  [(TVRCRottenTomatoesReview *)v4 setConsensus:v8];

  v9 = [(TVRCRottenTomatoesReview *)self numberOfFreshReviews];
  [(TVRCRottenTomatoesReview *)v4 setNumberOfFreshReviews:v9];

  char v10 = [(TVRCRottenTomatoesReview *)self numberOfRottenReviews];
  [(TVRCRottenTomatoesReview *)v4 setNumberOfRottenReviews:v10];

  v11 = [(TVRCRottenTomatoesReview *)self freshness];
  [(TVRCRottenTomatoesReview *)v4 setFreshness:v11];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCRottenTomatoesReview)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TVRCRottenTomatoesReview;
  BOOL v5 = [(TVRCRottenTomatoesReview *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"percentage"];
    percentage = v5->_percentage;
    v5->_percentage = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audienceScore"];
    audienceScore = v5->_audienceScore;
    v5->_audienceScore = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"averageRating"];
    averageRating = v5->_averageRating;
    v5->_averageRating = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"consensus"];
    consensus = v5->_consensus;
    v5->_consensus = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfFreshReviews"];
    numberOfFreshReviews = v5->_numberOfFreshReviews;
    v5->_numberOfFreshReviews = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfRottenReviews"];
    numberOfRottenReviews = v5->_numberOfRottenReviews;
    v5->_numberOfRottenReviews = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"freshness"];
    freshness = v5->_freshness;
    v5->_freshness = (NSString *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  percentage = self->_percentage;
  id v5 = a3;
  [v5 encodeObject:percentage forKey:@"percentage"];
  [v5 encodeObject:self->_audienceScore forKey:@"audienceScore"];
  [v5 encodeObject:self->_averageRating forKey:@"averageRating"];
  [v5 encodeObject:self->_consensus forKey:@"consensus"];
  [v5 encodeObject:self->_numberOfFreshReviews forKey:@"numberOfFreshReviews"];
  [v5 encodeObject:self->_numberOfRottenReviews forKey:@"numberOfRottenReviews"];
  [v5 encodeObject:self->_freshness forKey:@"freshness"];
}

- (NSNumber)percentage
{
  return self->_percentage;
}

- (void)setPercentage:(id)a3
{
}

- (NSNumber)audienceScore
{
  return self->_audienceScore;
}

- (void)setAudienceScore:(id)a3
{
}

- (NSNumber)averageRating
{
  return self->_averageRating;
}

- (void)setAverageRating:(id)a3
{
}

- (NSString)consensus
{
  return self->_consensus;
}

- (void)setConsensus:(id)a3
{
}

- (NSNumber)numberOfFreshReviews
{
  return self->_numberOfFreshReviews;
}

- (void)setNumberOfFreshReviews:(id)a3
{
}

- (NSNumber)numberOfRottenReviews
{
  return self->_numberOfRottenReviews;
}

- (void)setNumberOfRottenReviews:(id)a3
{
}

- (NSString)freshness
{
  return self->_freshness;
}

- (void)setFreshness:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freshness, 0);
  objc_storeStrong((id *)&self->_numberOfRottenReviews, 0);
  objc_storeStrong((id *)&self->_numberOfFreshReviews, 0);
  objc_storeStrong((id *)&self->_consensus, 0);
  objc_storeStrong((id *)&self->_averageRating, 0);
  objc_storeStrong((id *)&self->_audienceScore, 0);

  objc_storeStrong((id *)&self->_percentage, 0);
}

@end