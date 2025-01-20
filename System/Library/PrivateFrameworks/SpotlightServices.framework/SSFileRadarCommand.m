@interface SSFileRadarCommand
+ (id)buildVersion;
+ (id)internalReleaseAgreement;
- (NSArray)attachmentPaths;
- (NSArray)extensionIdentifiers;
- (NSArray)sections;
- (NSString)classification;
- (NSString)componentName;
- (NSString)componentVersion;
- (NSString)problemDescription;
- (NSString)reproducibility;
- (NSString)title;
- (SPSearchQueryContext)queryContext;
- (SSFileRadarCommand)init;
- (SSFileRadarCommand)initWithQueryContext:(id)a3;
- (SSFileRadarCommand)initWithQueryString:(id)a3;
- (SSRankingManager)rankingManager;
- (unint64_t)componentID;
- (void)setAttachmentPaths:(id)a3;
- (void)setClassification:(id)a3;
- (void)setComponentID:(unint64_t)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentVersion:(id)a3;
- (void)setExtensionIdentifiers:(id)a3;
- (void)setProblemDescription:(id)a3;
- (void)setQueryContext:(id)a3;
- (void)setRankingManager:(id)a3;
- (void)setReproducibility:(id)a3;
- (void)setSections:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SSFileRadarCommand

+ (id)buildVersion
{
  if (buildVersion_onceToken != -1) {
    dispatch_once(&buildVersion_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)buildVersion_buildVersion;
  return v2;
}

void __34__SSFileRadarCommand_buildVersion__block_invoke()
{
  uint64_t v0 = [NSString stringWithFormat:@"<Build>"];
  v1 = (void *)buildVersion_buildVersion;
  buildVersion_buildVersion = v0;

  id v3 = (id)_CFCopySupplementalVersionDictionary();
  v2 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
  if (v2) {
    objc_storeStrong((id *)&buildVersion_buildVersion, v2);
  }
}

+ (id)internalReleaseAgreement
{
  return @"I agree that Apple and its strategic partners may use, adapt, modify, reproduce, and distribute internally in perpetuity, the images that I am providing with this bug report (“Images”), for the purpose of improving the machine vision capabilities of Apple products. Apple may not use the Images in any other fashion than as provided herein.  Please do not provide any images that contain third parties or for which you do not have sufficient rights.\n\nI represent that the Images are original to and/or owned by me and that I have the rights necessary to grant to Apple the rights provided herein.  I release Apple, its agents, employees, licensees and assigns from any and all claims I may have now or in the future for invasion of privacy, right of publicity, trademark infringement, copyright infringement, defamation or any other cause of action arising out of the use or reproduction of the Images.\n\nI have read and fully understand the foregoing and hereby acknowledge my agreement to its terms.";
}

- (SSFileRadarCommand)init
{
  return [(SSFileRadarCommand *)self initWithQueryString:0];
}

- (SSFileRadarCommand)initWithQueryString:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = [SPSearchQueryContext alloc];
  if (v4) {
    v6 = v4;
  }
  else {
    v6 = &stru_1F1824018;
  }
  v7 = [(SPSearchQueryContext *)v5 initWithSearchString:v6];

  v8 = [(SSFileRadarCommand *)self initWithQueryContext:v7];
  return v8;
}

- (SSFileRadarCommand)initWithQueryContext:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SSFileRadarCommand;
  v5 = [(SSFileRadarCommand *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 queryKind];
    v7 = [v4 searchEntities];
    v8 = [v7 firstObject];

    v9 = [v4 searchString];
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      uint64_t v12 = [v8 searchString];
      v13 = (void *)v12;
      if (v12) {
        v14 = (__CFString *)v12;
      }
      else {
        v14 = &stru_1F1824018;
      }
      v11 = v14;
    }
    uint64_t v15 = [v8 tokenText];
    v16 = (void *)v15;
    if (v15) {
      v17 = (__CFString *)v15;
    }
    else {
      v17 = &stru_1F1824018;
    }
    v18 = v17;

    v19 = (void *)MEMORY[0x1E4F28E78];
    v20 = [(id)objc_opt_class() internalReleaseAgreement];
    v21 = [v19 stringWithFormat:@"Problem Summary: \n\nSteps to Reproduce: \n\nRegression Information: \n\n*** Note: Debug info contains the titles of items in the UI. Please review for confidential information. \n\n%@ \n***\n\n===  DEBUG INFO  ===\n\n", v20];

    v22 = [(id)objc_opt_class() buildVersion];
    [v21 appendFormat:@"Build: %@\n\n", v22];

    [v21 appendFormat:@"Query: %@\n", v11];
    [v21 appendFormat:@"Token: %@\n", v18];

    objc_msgSend(v21, "appendFormat:", @"Committed search: %d\n", (unint64_t)(v6 - 5) < 4);
    objc_msgSend(v21, "appendFormat:", @"Query kind: %lu\n\n", v6);
    [(SSFileRadarCommand *)v5 setQueryContext:v4];
    [(SSFileRadarCommand *)v5 setComponentName:@"Spotlight (New Bugs)"];
    if (isMacOS()) {
      v23 = @"macOS";
    }
    else {
      v23 = @"iOS";
    }
    [(SSFileRadarCommand *)v5 setComponentVersion:v23];
    if (isMacOS()) {
      uint64_t v24 = 624062;
    }
    else {
      uint64_t v24 = 312963;
    }
    [(SSFileRadarCommand *)v5 setComponentID:v24];
    [(SSFileRadarCommand *)v5 setClassification:@"Other Bug"];
    [(SSFileRadarCommand *)v5 setReproducibility:@"I Didn't Try"];
    [(SSFileRadarCommand *)v5 setTitle:&stru_1F1824018];
    [(SSFileRadarCommand *)v5 setProblemDescription:v21];
    v25 = [(SSFileRadarCommand *)v5 sections];
    v26 = SSExtensionIdentifiersForSections(v25);
    [(SSFileRadarCommand *)v5 setExtensionIdentifiers:v26];
  }
  return v5;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
  id v5 = a3;
  SSExtensionIdentifiersForSections(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(SSFileRadarCommand *)self setExtensionIdentifiers:v6];
}

- (unint64_t)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(unint64_t)a3
{
  self->_componentID = a3;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
}

- (NSString)classification
{
  return self->_classification;
}

- (void)setClassification:(id)a3
{
}

- (NSString)reproducibility
{
  return self->_reproducibility;
}

- (void)setReproducibility:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)problemDescription
{
  return self->_problemDescription;
}

- (void)setProblemDescription:(id)a3
{
}

- (NSArray)extensionIdentifiers
{
  return self->_extensionIdentifiers;
}

- (void)setExtensionIdentifiers:(id)a3
{
}

- (NSArray)attachmentPaths
{
  return self->_attachmentPaths;
}

- (void)setAttachmentPaths:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (SSRankingManager)rankingManager
{
  return self->_rankingManager;
}

- (void)setRankingManager:(id)a3
{
}

- (SPSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- (void)setQueryContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_rankingManager, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_attachmentPaths, 0);
  objc_storeStrong((id *)&self->_extensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_problemDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_reproducibility, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
}

@end