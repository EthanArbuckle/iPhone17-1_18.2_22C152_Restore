@interface PXSurveyQuestionPersonGroupConfiguration
- (BOOL)isStale;
- (BOOL)needsQuestionInvalidationForChange:(id)a3;
- (CGRect)contentRectForOneUp;
- (NSArray)personGroup;
- (NSString)title;
- (PXSurveyQuestionConfigurationHandlers)handlers;
- (PXSurveyQuestionPersonGroupConfiguration)init;
- (PXSurveyQuestionPersonGroupConfiguration)initWithTitle:(id)a3 personGroup:(id)a4;
- (UIImage)contentImageForOneUp;
- (UIView)contentView;
- (id)contentViewForDisplayScale:(double)a3;
- (void)layoutContentViewInRect:(CGRect)a3;
- (void)setHandlers:(id)a3;
- (void)setIsStale:(BOOL)a3;
@end

@implementation PXSurveyQuestionPersonGroupConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personGroup, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_personGroupContentView, 0);
}

- (NSArray)personGroup
{
  return self->_personGroup;
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (void)setHandlers:(id)a3
{
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)needsQuestionInvalidationForChange:(id)a3
{
  if (![(NSArray *)self->_personGroup count]) {
    return 0;
  }
  v4 = [MEMORY[0x1E4F1CA48] array];
  personGroup = self->_personGroup;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PXSurveyQuestionPersonGroupConfiguration_needsQuestionInvalidationForChange___block_invoke;
  v14[3] = &unk_1E5DC1B48;
  id v15 = v4;
  id v6 = v4;
  [(NSArray *)personGroup enumerateObjectsUsingBlock:v14];
  v7 = [(NSArray *)self->_personGroup firstObject];
  v8 = [v7 photoLibrary];

  v9 = [v8 librarySpecificFetchOptions];
  [v9 setPersonContext:1];
  v10 = [MEMORY[0x1E4F391F0] fetchPersonsWithLocalIdentifiers:v6 options:v9];
  uint64_t v11 = [v10 count];
  BOOL v12 = v11 != [(NSArray *)self->_personGroup count];

  return v12;
}

void __79__PXSurveyQuestionPersonGroupConfiguration_needsQuestionInvalidationForChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  [v2 addObject:v3];
}

- (CGRect)contentRectForOneUp
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIImage)contentImageForOneUp
{
  return 0;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  double v4 = a3.size.height * 0.75;
  -[UIView setFrame:](self->_personGroupContentView, "setFrame:", (a3.size.width - a3.size.height * 0.75) * 0.5, (a3.size.height - a3.size.height * 0.75) * 0.75, a3.size.height * 0.75, a3.size.height * 0.75);
  personGroupContentView = self->_personGroupContentView;
  +[PXPeopleSocialGroupViewGenerator resizeThumbnailSizeForSocialGroupView:withSize:](PXPeopleSocialGroupViewGenerator, "resizeThumbnailSizeForSocialGroupView:withSize:", personGroupContentView, v4, v4);
}

- (id)contentViewForDisplayScale:(double)a3
{
  double v5 = [(PXSurveyQuestionPersonGroupConfiguration *)self personGroup];
  +[PXPeopleSocialGroupViewGenerator generateViewForSocialGroup:withSize:displayScale:](PXPeopleSocialGroupViewGenerator, "generateViewForSocialGroup:withSize:displayScale:", v5, 50.0, 50.0, a3);
  id v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  personGroupContentView = self->_personGroupContentView;
  self->_personGroupContentView = v6;

  v8 = self->_personGroupContentView;
  return v8;
}

- (UIView)contentView
{
  return self->_personGroupContentView;
}

- (PXSurveyQuestionPersonGroupConfiguration)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionPersonGroupConfiguration.m", 35, @"%s is not available as initializer", "-[PXSurveyQuestionPersonGroupConfiguration init]");

  abort();
}

- (PXSurveyQuestionPersonGroupConfiguration)initWithTitle:(id)a3 personGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSurveyQuestionPersonGroupConfiguration;
  v8 = [(PXSurveyQuestionPersonGroupConfiguration *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    objc_storeStrong((id *)&v8->_personGroup, a4);
    v8->_isStale = 0;
  }

  return v8;
}

@end