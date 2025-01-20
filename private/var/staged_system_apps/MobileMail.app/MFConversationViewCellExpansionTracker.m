@interface MFConversationViewCellExpansionTracker
+ (BOOL)allowsCollapsing;
- (MFConversationViewCellExpansionTracker)initWithDelegate:(id)a3;
- (MFConversationViewCellExpansionTrackerDelegate)delegate;
- (NSDictionary)dictionaryRepresentation;
- (NSMutableDictionary)expansionRecord;
- (int64_t)expansionStatusForCellWithItemID:(id)a3;
- (void)_updateCollapsingAllowed;
- (void)resetRecord;
- (void)restoreDictionaryRepresentation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpansionRecord:(id)a3;
- (void)setMessageWithItemID:(id)a3 expansionStatus:(int64_t)a4;
@end

@implementation MFConversationViewCellExpansionTracker

- (MFConversationViewCellExpansionTracker)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFConversationViewCellExpansionTracker;
  v5 = [(MFConversationViewCellExpansionTracker *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(MFConversationViewCellExpansionTracker *)v5 setDelegate:v4];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"_updateCollapsingAllowed" name:MailApplicationDidChangeConversationViewCollapseReadMessagesNotification object:0];

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    expansionRecord = v6->_expansionRecord;
    v6->_expansionRecord = v8;
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (void)_updateCollapsingAllowed
{
  id v3 = [(MFConversationViewCellExpansionTracker *)self delegate];
  [v3 expansionTracker:self didChangeCollapsingAllowed:[objc_opt_class() allowsCollapsing]];
}

+ (BOOL)allowsCollapsing
{
  return sub_1002168B8(0);
}

- (int64_t)expansionStatusForCellWithItemID:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() allowsCollapsing])
  {
    v5 = [(MFConversationViewCellExpansionTracker *)self expansionRecord];
    v6 = [v5 objectForKeyedSubscript:v4];

    if (v6) {
      int64_t v7 = (int64_t)[v6 integerValue];
    }
    else {
      int64_t v7 = 0;
    }
  }
  else
  {
    int64_t v7 = 3;
  }

  return v7;
}

- (void)setMessageWithItemID:(id)a3 expansionStatus:(int64_t)a4
{
  id v8 = a3;
  v6 = +[NSNumber numberWithInteger:a4];
  int64_t v7 = [(MFConversationViewCellExpansionTracker *)self expansionRecord];
  [v7 setObject:v6 forKeyedSubscript:v8];
}

- (void)resetRecord
{
  id v2 = [(MFConversationViewCellExpansionTracker *)self expansionRecord];
  [v2 removeAllObjects];
}

- (NSDictionary)dictionaryRepresentation
{
  id v2 = [(MFConversationViewCellExpansionTracker *)self expansionRecord];
  id v3 = [v2 copy];

  return (NSDictionary *)v3;
}

- (void)restoreDictionaryRepresentation:(id)a3
{
  id v5 = a3;
  [(MFConversationViewCellExpansionTracker *)self resetRecord];
  id v4 = [(MFConversationViewCellExpansionTracker *)self expansionRecord];
  [v4 addEntriesFromDictionary:v5];
}

- (MFConversationViewCellExpansionTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFConversationViewCellExpansionTrackerDelegate *)WeakRetained;
}

- (NSMutableDictionary)expansionRecord
{
  return self->_expansionRecord;
}

- (void)setExpansionRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expansionRecord, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end