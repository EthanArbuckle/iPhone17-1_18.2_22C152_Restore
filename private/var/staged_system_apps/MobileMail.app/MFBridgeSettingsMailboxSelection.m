@interface MFBridgeSettingsMailboxSelection
- (NSSet)selectedMailboxes;
- (id)description;
- (unint64_t)inboxesFilterTypes;
- (void)setInboxesFilterTypes:(unint64_t)a3;
- (void)setSelectedMailboxes:(id)a3;
@end

@implementation MFBridgeSettingsMailboxSelection

- (id)description
{
  v3 = +[NSMutableString stringWithString:@"Mailbox Selection: \n"];
  [v3 appendFormat:@"Selected mailboxes id: %@\n", self->_selectedMailboxes];
  unint64_t inboxesFilterTypes = self->_inboxesFilterTypes;
  if (inboxesFilterTypes)
  {
    [v3 appendString:@"Unified mailbox selected \n"];
    unint64_t inboxesFilterTypes = self->_inboxesFilterTypes;
  }
  if ((inboxesFilterTypes & 2) != 0)
  {
    [v3 appendString:@"VIP mailbox selected \n"];
    unint64_t inboxesFilterTypes = self->_inboxesFilterTypes;
  }
  if ((inboxesFilterTypes & 8) != 0)
  {
    [v3 appendString:@"Unread mailbox selected \n"];
    unint64_t inboxesFilterTypes = self->_inboxesFilterTypes;
  }
  if ((inboxesFilterTypes & 4) != 0)
  {
    [v3 appendString:@"Flagged mailbox selected \n"];
    unint64_t inboxesFilterTypes = self->_inboxesFilterTypes;
  }
  if ((inboxesFilterTypes & 0x10) != 0)
  {
    [v3 appendString:@"ToOrCC mailbox selected \n"];
    unint64_t inboxesFilterTypes = self->_inboxesFilterTypes;
  }
  if ((inboxesFilterTypes & 0x20) != 0)
  {
    [v3 appendString:@"Important Threads mailbox selected \n"];
    unint64_t inboxesFilterTypes = self->_inboxesFilterTypes;
  }
  if ((inboxesFilterTypes & 0x40) != 0) {
    [v3 appendString:@"Today mailbox selected \n"];
  }

  return v3;
}

- (unint64_t)inboxesFilterTypes
{
  return self->_inboxesFilterTypes;
}

- (void)setInboxesFilterTypes:(unint64_t)a3
{
  self->_unint64_t inboxesFilterTypes = a3;
}

- (NSSet)selectedMailboxes
{
  return self->_selectedMailboxes;
}

- (void)setSelectedMailboxes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end