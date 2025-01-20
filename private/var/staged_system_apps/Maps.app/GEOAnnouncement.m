@interface GEOAnnouncement
- (BOOL)showAnnouncementIfFlyoverWithHandler:(id)a3;
@end

@implementation GEOAnnouncement

- (BOOL)showAnnouncementIfFlyoverWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(GEOAnnouncement *)self buttonOneAppURI];
    v6 = +[NSScanner scannerWithString:v5];

    unsigned int v7 = [v6 scanString:@"flyover:" intoString:0];
    if (v7)
    {
      uint64_t v17 = 0;
      if ([v6 scanUnsignedLongLong:&v17])
      {
        id v8 = objc_alloc((Class)MKMapItemIdentifier);
        id v9 = [v8 initWithMUID:v17 resultProviderID:0 coordinate:MKCoordinateInvalid[0], MKCoordinateInvalid[1]];
        if (v9)
        {
          v10 = +[MKMapService sharedService];
          id v18 = v9;
          v11 = +[NSArray arrayWithObjects:&v18 count:1];
          v12 = [v10 ticketForIdentifiers:v11 traits:0];

          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100D8DE48;
          v14[3] = &unk_101314028;
          v14[4] = self;
          id v15 = v4;
          uint64_t v16 = v17;
          [v12 submitWithHandler:v14 networkActivity:0];
        }
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

@end