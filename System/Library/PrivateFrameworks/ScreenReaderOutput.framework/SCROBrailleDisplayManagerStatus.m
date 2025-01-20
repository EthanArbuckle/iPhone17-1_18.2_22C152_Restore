@interface SCROBrailleDisplayManagerStatus
- (BOOL)anyUnreadAnnouncements;
- (BOOL)currentAnnouncementUnread;
- (NSData)aggregatedData;
- (int)virtualAlignment;
- (int64_t)masterStatusCellIndex;
- (void)setAggregatedData:(id)a3;
- (void)setAnyUnreadAnnouncements:(BOOL)a3;
- (void)setCurrentAnnouncementUnread:(BOOL)a3;
- (void)setMasterStatusCellIndex:(int64_t)a3;
- (void)setVirtualAlignment:(int)a3;
@end

@implementation SCROBrailleDisplayManagerStatus

- (NSData)aggregatedData
{
  return self->_aggregatedData;
}

- (void)setAggregatedData:(id)a3
{
}

- (int)virtualAlignment
{
  return self->_virtualAlignment;
}

- (void)setVirtualAlignment:(int)a3
{
  self->_virtualAlignment = a3;
}

- (int64_t)masterStatusCellIndex
{
  return self->_masterStatusCellIndex;
}

- (void)setMasterStatusCellIndex:(int64_t)a3
{
  self->_masterStatusCellIndex = a3;
}

- (BOOL)currentAnnouncementUnread
{
  return self->_currentAnnouncementUnread;
}

- (void)setCurrentAnnouncementUnread:(BOOL)a3
{
  self->_currentAnnouncementUnread = a3;
}

- (BOOL)anyUnreadAnnouncements
{
  return self->_anyUnreadAnnouncements;
}

- (void)setAnyUnreadAnnouncements:(BOOL)a3
{
  self->_anyUnreadAnnouncements = a3;
}

- (void).cxx_destruct
{
}

@end