@interface _AnnounceHandlingTask
- (_AnnounceHandlingTask)initWithData:(id)a3 recordIdentifier:(id)a4;
- (void)performTask;
@end

@implementation _AnnounceHandlingTask

- (_AnnounceHandlingTask)initWithData:(id)a3 recordIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)GEOAnnouncement) initWithData:v6];
  if (v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)_AnnounceHandlingTask;
    v9 = [(NotificationHandlingTask *)&v14 initWithData:v6 recordIdentifier:v7];
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_announcement, v8);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = sub_1000A930C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "_AnnounceHandlingTask GEOAnnouncement nil with data", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  if (([(GEOAnnouncement *)self->_announcement displayDestinations] & 2) != 0)
  {
    v5 = [(GEOAnnouncement *)self->_announcement buttonOneAppURI];
    id v6 = +[NSScanner scannerWithString:v5];

    if ([v6 scanString:@"flyover:" intoString:0])
    {
      uint64_t v11 = 0;
      if (![v6 scanUnsignedLongLong:&v11])
      {
LABEL_10:
        [(NotificationHandlingTask *)self _clearBulletin];

        return;
      }
      id v7 = [PresentFlyoverAction alloc];
      id v8 = [(PresentFlyoverAction *)v7 initWithAnnouncement:self->_announcement muid:v11];
    }
    else
    {
      id v8 = [[PresentAnnouncementAction alloc] initWithAnnouncement:self->_announcement];
    }
    v9 = v8;
    v10 = [[RichMapsActivity alloc] initWithMapsAction:v8];
    [(RichMapsActivityCreatingTaskImpl *)self taskFinished:v10];

    goto LABEL_10;
  }
  v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    unsigned int v4 = [(GEOAnnouncement *)self->_announcement displayDestinations];
    LODWORD(v11) = 67109120;
    HIDWORD(v11) = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "_AnnounceHandlingTask performTask AnnouncementDestination %u not ANNOUNCEMENT_APPLICATION", (uint8_t *)&v11, 8u);
  }

  [(RichMapsActivityCreatingTaskImpl *)self taskFailed];
}

- (void).cxx_destruct
{
}

@end