@interface WBSPageTest
- (CGSize)viewportSize;
- (NSString)identifier;
- (NSURL)expectedResultsURL;
- (NSURL)pageURL;
- (WBSPageTest)initWithIdentifier:(id)a3 pageURL:(id)a4 expectedResultsURL:(id)a5 dictionary:(id)a6;
@end

@implementation WBSPageTest

- (WBSPageTest)initWithIdentifier:(id)a3 pageURL:(id)a4 expectedResultsURL:(id)a5 dictionary:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)WBSPageTest;
  v15 = [(WBSPageTest *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_pageURL, a4);
    objc_storeStrong((id *)&v16->_expectedResultsURL, a5);
    v17 = objc_msgSend(v14, "safari_numberForKey:", @"ViewportHeight");
    v16->_viewportSize.height = (double)(int)[v17 intValue];

    v18 = objc_msgSend(v14, "safari_numberForKey:", @"ViewportWidth");
    v16->_viewportSize.width = (double)(int)[v18 intValue];

    v19 = v16;
  }

  return v16;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (NSURL)expectedResultsURL
{
  return self->_expectedResultsURL;
}

- (CGSize)viewportSize
{
  double width = self->_viewportSize.width;
  double height = self->_viewportSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedResultsURL, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end