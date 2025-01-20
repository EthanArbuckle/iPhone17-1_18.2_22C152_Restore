@interface SearchRAPReportingHistoryRecorder
- (MKMapServiceSearchTicket)ticket;
- (SearchRAPReportingHistoryRecorder)initWithTicket:(id)a3 auxiliaryControlsOrigin:(int64_t)a4;
- (int64_t)auxiliaryControlsOrigin;
- (void)recordItemInHistory;
- (void)setAuxiliaryControlsOrigin:(int64_t)a3;
- (void)setTicket:(id)a3;
@end

@implementation SearchRAPReportingHistoryRecorder

- (SearchRAPReportingHistoryRecorder)initWithTicket:(id)a3 auxiliaryControlsOrigin:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SearchRAPReportingHistoryRecorder;
  v8 = [(SearchRAPReportingHistoryRecorder *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_ticket, a3);
    v9->_auxiliaryControlsOrigin = a4;
  }

  return v9;
}

- (void)recordItemInHistory
{
  id v3 = objc_alloc((Class)MSPMutableHistoryEntrySearch);
  v4 = [(SearchRAPReportingHistoryRecorder *)self ticket];
  id v5 = [v3 initWithTicket:v4];

  [v5 setTracksRAPReportingOnly:1];
  +[HistoryEntryRecentsItem saveSearch:v5 completion:&stru_10131A2B0];
}

- (MKMapServiceSearchTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
}

- (int64_t)auxiliaryControlsOrigin
{
  return self->_auxiliaryControlsOrigin;
}

- (void)setAuxiliaryControlsOrigin:(int64_t)a3
{
  self->_auxiliaryControlsOrigin = a3;
}

- (void).cxx_destruct
{
}

@end