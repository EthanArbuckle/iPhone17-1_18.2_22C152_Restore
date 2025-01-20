@interface SFStartLocalSearchFeedback
+ (BOOL)supportsSecureCoding;
- (BOOL)isPhotosScopedSearch;
- (NSString)originatingApp;
- (SFIndexState)indexState;
- (SFPerformEntityQueryCommand)entityQueryCommand;
- (SFStartLocalSearchFeedback)initWithCoder:(id)a3;
- (SFStartLocalSearchFeedback)initWithEntityQueryCommand:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 indexType:(unint64_t)a6 queryId:(unint64_t)a7 originatingApp:(id)a8;
- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 indexType:(unint64_t)a5;
- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 indexType:(unint64_t)a5 queryId:(unint64_t)a6;
- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 indexType:(unint64_t)a6 queryId:(unint64_t)a7;
- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 indexType:(unint64_t)a6 queryId:(unint64_t)a7 originatingApp:(id)a8;
- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 indexType:(unint64_t)a6 queryId:(unint64_t)a7 originatingApp:(id)a8 coreSpotlightIndexTypeUsed:(int)a9;
- (int)coreSpotlightIndexTypeUsed;
- (unint64_t)indexType;
- (void)encodeWithCoder:(id)a3;
- (void)setCoreSpotlightIndexTypeUsed:(int)a3;
- (void)setEntityQueryCommand:(id)a3;
- (void)setIndexState:(id)a3;
- (void)setIndexType:(unint64_t)a3;
- (void)setIsPhotosScopedSearch:(BOOL)a3;
- (void)setOriginatingApp:(id)a3;
@end

@implementation SFStartLocalSearchFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexState, 0);
  objc_storeStrong((id *)&self->_entityQueryCommand, 0);
  objc_storeStrong((id *)&self->_originatingApp, 0);
}

- (void)setIsPhotosScopedSearch:(BOOL)a3
{
  self->_isPhotosScopedSearch = a3;
}

- (BOOL)isPhotosScopedSearch
{
  return self->_isPhotosScopedSearch;
}

- (void)setCoreSpotlightIndexTypeUsed:(int)a3
{
  self->_coreSpotlightIndexTypeUsed = a3;
}

- (int)coreSpotlightIndexTypeUsed
{
  return self->_coreSpotlightIndexTypeUsed;
}

- (void)setIndexState:(id)a3
{
}

- (SFIndexState)indexState
{
  return self->_indexState;
}

- (void)setEntityQueryCommand:(id)a3
{
}

- (SFPerformEntityQueryCommand)entityQueryCommand
{
  return self->_entityQueryCommand;
}

- (void)setOriginatingApp:(id)a3
{
}

- (NSString)originatingApp
{
  return self->_originatingApp;
}

- (void)setIndexType:(unint64_t)a3
{
  self->_indexType = a3;
}

- (unint64_t)indexType
{
  return self->_indexType;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFStartLocalSearchFeedback;
  id v4 = a3;
  [(SFStartSearchFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_indexType, @"_indexType", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_indexState forKey:@"_indexState"];
  [v4 encodeInt32:self->_coreSpotlightIndexTypeUsed forKey:@"_coreSpotlightIndexTypeUsed"];
}

- (SFStartLocalSearchFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFStartLocalSearchFeedback;
  objc_super v5 = [(SFStartSearchFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_indexType = [v4 decodeIntegerForKey:@"_indexType"];
    uint64_t v6 = [v4 decodeObjectForKey:@"_indexState"];
    indexState = v5->_indexState;
    v5->_indexState = (SFIndexState *)v6;

    v5->_coreSpotlightIndexTypeUsed = [v4 decodeInt32ForKey:@"_coreSpotlightIndexTypeUsed"];
  }

  return v5;
}

- (SFStartLocalSearchFeedback)initWithEntityQueryCommand:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 indexType:(unint64_t)a6 queryId:(unint64_t)a7 originatingApp:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  v16 = [v14 searchString];
  v17 = [(SFStartLocalSearchFeedback *)self initWithInput:v16 triggerEvent:a4 searchType:a5 indexType:a6 queryId:a7 originatingApp:v15];

  if (v17) {
    [(SFStartLocalSearchFeedback *)v17 setEntityQueryCommand:v14];
  }

  return v17;
}

- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 indexType:(unint64_t)a6 queryId:(unint64_t)a7 originatingApp:(id)a8 coreSpotlightIndexTypeUsed:(int)a9
{
  objc_super v9 = [(SFStartLocalSearchFeedback *)self initWithInput:a3 triggerEvent:a4 searchType:a5 indexType:a6 queryId:a7 originatingApp:a8];
  v10 = v9;
  if (v9) {
    [(SFStartLocalSearchFeedback *)v9 setCoreSpotlightIndexTypeUsed:a9];
  }
  return v10;
}

- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 indexType:(unint64_t)a6 queryId:(unint64_t)a7 originatingApp:(id)a8
{
  id v14 = a8;
  id v15 = [(SFStartLocalSearchFeedback *)self initWithInput:a3 triggerEvent:a4 searchType:a5 indexType:a6 queryId:a7];
  v16 = v15;
  if (v15) {
    [(SFStartLocalSearchFeedback *)v15 setOriginatingApp:v14];
  }

  return v16;
}

- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 indexType:(unint64_t)a6 queryId:(unint64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)SFStartLocalSearchFeedback;
  v10 = [(SFStartSearchFeedback *)&v13 initWithInput:a3 triggerEvent:a4];
  v11 = v10;
  if (v10)
  {
    [(SFStartSearchFeedback *)v10 setSearchType:a5];
    [(SFStartLocalSearchFeedback *)v11 setIndexType:a6];
    [(SFFeedback *)v11 setQueryId:a7];
  }
  return v11;
}

- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 indexType:(unint64_t)a5 queryId:(unint64_t)a6
{
  return [(SFStartLocalSearchFeedback *)self initWithInput:a3 triggerEvent:a4 searchType:0 indexType:a5 queryId:a6];
}

- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 indexType:(unint64_t)a5
{
  return [(SFStartLocalSearchFeedback *)self initWithInput:a3 triggerEvent:a4 searchType:0 indexType:a5 queryId:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end