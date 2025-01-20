@interface WBSSiriIntelligenceDonorBookmarkData
- (BOOL)isReadingListItem;
- (NSString)bookmarkTitle;
- (NSString)bookmarkURLString;
- (NSString)coreSpotlightID;
- (NSString)uuidString;
- (void)setBookmarkTitle:(id)a3;
- (void)setBookmarkURLString:(id)a3;
- (void)setCoreSpotlightID:(id)a3;
- (void)setIsReadingListItem:(BOOL)a3;
- (void)setUuidString:(id)a3;
@end

@implementation WBSSiriIntelligenceDonorBookmarkData

- (NSString)coreSpotlightID
{
  return self->_coreSpotlightID;
}

- (void)setCoreSpotlightID:(id)a3
{
}

- (NSString)bookmarkURLString
{
  return self->_bookmarkURLString;
}

- (NSString)bookmarkTitle
{
  return self->_bookmarkTitle;
}

- (void)setUuidString:(id)a3
{
}

- (void)setIsReadingListItem:(BOOL)a3
{
  self->_isReadingListItem = a3;
}

- (void)setBookmarkURLString:(id)a3
{
}

- (void)setBookmarkTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_bookmarkTitle, 0);
  objc_storeStrong((id *)&self->_bookmarkURLString, 0);
  objc_storeStrong((id *)&self->_coreSpotlightID, 0);
}

- (BOOL)isReadingListItem
{
  return self->_isReadingListItem;
}

- (NSString)uuidString
{
  return self->_uuidString;
}

@end