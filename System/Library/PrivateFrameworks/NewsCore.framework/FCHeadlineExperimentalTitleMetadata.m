@interface FCHeadlineExperimentalTitleMetadata
- (BOOL)isTitleExperimental;
- (FCHeadlineExperimentalTitleMetadata)initWithChosenTitle:(id)a3 isTitleExperimental:(BOOL)a4 arrayIndexUsedforTitle:(int64_t)a5 treatmentState:(int)a6;
- (NSString)chosenTitle;
- (int)treatmentState;
- (int64_t)arrayIndexUsedforTitle;
@end

@implementation FCHeadlineExperimentalTitleMetadata

- (FCHeadlineExperimentalTitleMetadata)initWithChosenTitle:(id)a3 isTitleExperimental:(BOOL)a4 arrayIndexUsedforTitle:(int64_t)a5 treatmentState:(int)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FCHeadlineExperimentalTitleMetadata;
  v12 = [(FCHeadlineExperimentalTitleMetadata *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_chosenTitle, a3);
    v13->_isTitleExperimental = a4;
    v13->_arrayIndexUsedforTitle = a5;
    v13->_treatmentState = a6;
  }

  return v13;
}

- (NSString)chosenTitle
{
  return self->_chosenTitle;
}

- (BOOL)isTitleExperimental
{
  return self->_isTitleExperimental;
}

- (int64_t)arrayIndexUsedforTitle
{
  return self->_arrayIndexUsedforTitle;
}

- (int)treatmentState
{
  return self->_treatmentState;
}

- (void).cxx_destruct
{
}

@end