@interface MapsUGCEnvironmentSectionController
- (BOOL)environmentIsSelectedWithBaseURL:(id)a3 submissionURL:(id)a4 lookupURL:(id)a5;
- (MapsUGCEnvironmentSectionController)initWithSubmissionURL:(unint64_t)a3 lookupURL:(unint64_t)a4;
- (NSDictionary)environmentURLs;
- (id)selectedEnvironmentURLWithSubmissionURL:(id)a3 lookupURL:(id)a4;
- (unint64_t)lookupURL;
- (unint64_t)submissionURL;
- (void)appendEnvironmentSectionToDebugController:(id)a3;
- (void)setEnvironmentURLs:(id)a3;
- (void)setLookupURL:(unint64_t)a3;
- (void)setSubmissionURL:(unint64_t)a3;
@end

@implementation MapsUGCEnvironmentSectionController

- (MapsUGCEnvironmentSectionController)initWithSubmissionURL:(unint64_t)a3 lookupURL:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MapsUGCEnvironmentSectionController;
  v6 = [(MapsUGCEnvironmentSectionController *)&v10 init];
  if (v6)
  {
    v11[0] = @"Staging";
    v11[1] = @"Prod";
    v12[0] = @"https://sundew-staging.geo.apple.com/";
    v12[1] = @"https://sundew.ls.apple.com/";
    v11[2] = @"Dev";
    v11[3] = @"QA1";
    v12[2] = @"https://sundew-dev.geo.apple.com/";
    v12[3] = @"https://sundew-qa1.geo.apple.com/";
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
    environmentURLs = v6->_environmentURLs;
    v6->_environmentURLs = (NSDictionary *)v7;

    [(MapsUGCEnvironmentSectionController *)v6 setSubmissionURL:a3];
    [(MapsUGCEnvironmentSectionController *)v6 setLookupURL:a4];
  }
  return v6;
}

- (void)appendEnvironmentSectionToDebugController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1005FE120;
  v6[3] = &unk_1012EE3E8;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  id v5 = [v4 addSectionWithTitle:@"Environments" content:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)selectedEnvironmentURLWithSubmissionURL:(id)a3 lookupURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [(MapsUGCEnvironmentSectionController *)self environmentURLs];
  v9 = [v8 allValues];

  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([(MapsUGCEnvironmentSectionController *)self environmentIsSelectedWithBaseURL:v14 submissionURL:v6 lookupURL:v7])
        {
          id v15 = v14;
          goto LABEL_11;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)environmentIsSelectedWithBaseURL:(id)a3 submissionURL:(id)a4 lookupURL:(id)a5
{
  id v6 = a4;
  id v7 = [a3 stringByAppendingString:@"v1/feedback/submission.arpc"];
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  return v8;
}

- (NSDictionary)environmentURLs
{
  return self->_environmentURLs;
}

- (void)setEnvironmentURLs:(id)a3
{
}

- (unint64_t)submissionURL
{
  return self->_submissionURL;
}

- (void)setSubmissionURL:(unint64_t)a3
{
  self->_submissionURL = a3;
}

- (unint64_t)lookupURL
{
  return self->_lookupURL;
}

- (void)setLookupURL:(unint64_t)a3
{
  self->_lookupURL = a3;
}

- (void).cxx_destruct
{
}

@end