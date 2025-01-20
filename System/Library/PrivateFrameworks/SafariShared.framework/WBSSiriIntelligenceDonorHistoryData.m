@interface WBSSiriIntelligenceDonorHistoryData
- (NSArray)autocompleteTriggers;
- (NSDate)lastVisitedDate;
- (NSString)fullPageText;
- (NSString)pageTitle;
- (NSString)profileIdentifier;
- (NSString)readerText;
- (NSString)userVisibleURLString;
- (NSURL)pageURL;
- (WBSSiriIntelligenceDonorPersonalizationData)personalizationData;
- (void)setAutocompleteTriggers:(id)a3;
- (void)setFullPageText:(id)a3;
- (void)setLastVisitedDate:(id)a3;
- (void)setPageTitle:(id)a3;
- (void)setPageURL:(id)a3;
- (void)setPersonalizationData:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setReaderText:(id)a3;
- (void)setUserVisibleURLString:(id)a3;
@end

@implementation WBSSiriIntelligenceDonorHistoryData

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (void)setPageURL:(id)a3
{
}

- (NSString)userVisibleURLString
{
  return self->_userVisibleURLString;
}

- (void)setUserVisibleURLString:(id)a3
{
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (void)setPageTitle:(id)a3
{
}

- (NSString)fullPageText
{
  return self->_fullPageText;
}

- (void)setFullPageText:(id)a3
{
}

- (NSString)readerText
{
  return self->_readerText;
}

- (void)setReaderText:(id)a3
{
}

- (NSDate)lastVisitedDate
{
  return self->_lastVisitedDate;
}

- (void)setLastVisitedDate:(id)a3
{
}

- (NSArray)autocompleteTriggers
{
  return self->_autocompleteTriggers;
}

- (void)setAutocompleteTriggers:(id)a3
{
}

- (WBSSiriIntelligenceDonorPersonalizationData)personalizationData
{
  return self->_personalizationData;
}

- (void)setPersonalizationData:(id)a3
{
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_personalizationData, 0);
  objc_storeStrong((id *)&self->_autocompleteTriggers, 0);
  objc_storeStrong((id *)&self->_lastVisitedDate, 0);
  objc_storeStrong((id *)&self->_readerText, 0);
  objc_storeStrong((id *)&self->_fullPageText, 0);
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_userVisibleURLString, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
}

@end