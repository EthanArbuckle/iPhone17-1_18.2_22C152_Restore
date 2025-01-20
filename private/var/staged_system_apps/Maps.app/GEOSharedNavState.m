@interface GEOSharedNavState
- (BOOL)_disallowDetailsForAnyReason;
- (BOOL)_willArriveSoon:(double)a3;
- (BOOL)disallowDetailsForChina;
- (BOOL)disallowDetailsForProtocolVersion;
- (BOOL)disallowDetailsForTransportType;
- (id)_arrivingAroundStringWithETATimeString:(id)a3;
- (id)_lastUpdatedStringWithElapsedTime:(id)a3;
- (id)_transportTypeString;
- (id)_transportTypeStringForAnalytics;
- (id)alertMessageForChinaError;
- (id)alertMessageForClosedTrip;
- (id)alertMessageForTransportOrProtocolError;
- (id)alertTitleForDisallowedDetails;
- (id)arrivalMessage;
- (id)arrivalNotificationBody;
- (id)arrivalNotificationSubtitle;
- (id)carPlayListCellSubtitle;
- (id)chargingStopMessage;
- (id)chargingStopNotificationBody;
- (id)chargingStopNotificationSubtitle;
- (id)homeCellSubtitle;
- (id)homeCellTitle;
- (id)initialMessage;
- (id)initialNotificationBody;
- (id)initialNotificationSubtitle;
- (id)intermediateArrivalMessage;
- (id)intermediateArrivalNotificationBody;
- (id)intermediateArrivalNotificationSubtitle;
- (id)senderNameIncludingHandleIfNecessary;
- (id)updateMessage;
- (id)updateNotificationBody;
- (id)updateNotificationSubtitle;
- (id)waypointResumeMessage;
- (id)waypointResumeNotificationBody;
- (id)waypointResumeNotificationSubtitle;
- (void)updateModel:(id)a3;
@end

@implementation GEOSharedNavState

- (id)senderNameIncludingHandleIfNecessary
{
  v3 = [(GEOSharedNavState *)self senderInfo];
  unsigned int v4 = [v3 hasLocalContactIdentifier];

  [(GEOSharedNavState *)self senderName];
  if (v4) {
    v5 = {;
  }
  }
  else {
    v6 = {;
  }
    v7 = [(GEOSharedNavState *)self senderInfo];
    v8 = [v7 fromIdentifier];
    v5 = +[NSString stringWithFormat:@"%@ (%@)", v6, v8];
  }

  return v5;
}

- (id)initialNotificationSubtitle
{
  v3 = MSPBundle();
  unsigned int v4 = [v3 localizedStringForKey:@"[Shared Trip] Notification's subtitle when sharing" value:@"%@ is sharing ETA" table:0];

  v5 = [(GEOSharedNavState *)self senderName];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)initialNotificationBody
{
  v3 = [(GEOSharedNavState *)self finalETAInfo];
  [v3 etaTimestamp];
  unsigned int v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = +[NSTimeZone localTimeZone];
  v6 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v4 inTimeZone:v5 canIncludeDate:0];

  id v7 = [(GEOSharedNavState *)self numberOfIntermediateStopsRemaining];
  v8 = [(GEOSharedNavState *)self destinationName];
  v9 = MSPBundle();
  v10 = v9;
  if (v8)
  {
    v11 = [v9 localizedStringForKey:@"[Shared Trip] Notification's body when sharing (with destination name)" value:@"localized string not found" table:0];
    v12 = [(GEOSharedNavState *)self senderNameIncludingHandleIfNecessary];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v7, v12, v8, v6);
  }
  else
  {
    v11 = [v9 localizedStringForKey:@"[Shared Trip] Notification's body when sharing (no destination name)" value:@"localized string not found" table:0];
    v12 = [(GEOSharedNavState *)self senderNameIncludingHandleIfNecessary];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v7, v12, v6, v15);
  v13 = };

  return v13;
}

- (id)initialMessage
{
  v3 = [(GEOSharedNavState *)self finalETAInfo];
  [v3 etaTimestamp];
  unsigned int v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = +[NSTimeZone localTimeZone];
  v6 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v4 inTimeZone:v5 canIncludeDate:0];

  id v7 = [(GEOSharedNavState *)self numberOfIntermediateStopsRemaining];
  v8 = [(GEOSharedNavState *)self destinationName];
  v9 = MSPBundle();
  v10 = v9;
  if (v8)
  {
    v11 = [v9 localizedStringForKey:@"[Shared Trip] text message body (with destination name)" value:@"localized string not found" table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v7, v8, v6);
  }
  else
  {
    v11 = [v9 localizedStringForKey:@"[Shared Trip] text message body (no destination name)" value:@"localized string not found" table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v7, v6, v14);
  v12 = };

  return v12;
}

- (id)updateNotificationSubtitle
{
  v3 = MSPBundle();
  unsigned int v4 = [v3 localizedStringForKey:@"[Shared Trip] update Notification's subtitle when sharing" value:@"%@’s ETA has changed" table:0];
  v5 = [(GEOSharedNavState *)self senderName];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)updateNotificationBody
{
  v3 = [(GEOSharedNavState *)self etaInfo];
  [v3 etaTimestamp];
  unsigned int v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = +[NSTimeZone localTimeZone];
  v6 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v4 inTimeZone:v5 canIncludeDate:0];

  id v7 = [(GEOSharedNavState *)self nextWaypointInfo];
  v8 = [v7 name];

  v9 = MSPBundle();
  v10 = v9;
  if (v8)
  {
    v11 = [v9 localizedStringForKey:@"[Shared Trip] update Notification's body when sharing (with destination)" value:@"%1$@ will now arrive at %2$@ around %3$@" table:0];
    v12 = [(GEOSharedNavState *)self senderNameIncludingHandleIfNecessary];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12, v8, v6);
  }
  else
  {
    v11 = [v9 localizedStringForKey:@"[Shared Trip] update Notification's body when sharing (without destination)" value:@"%1$@ will now arrive around %2$@" table:0];
    v12 = [(GEOSharedNavState *)self senderNameIncludingHandleIfNecessary];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12, v6, v15);
  v13 = };

  return v13;
}

- (id)updateMessage
{
  v3 = [(GEOSharedNavState *)self etaInfo];
  [v3 etaTimestamp];
  unsigned int v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = +[NSTimeZone localTimeZone];
  v6 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v4 inTimeZone:v5 canIncludeDate:0];

  id v7 = [(GEOSharedNavState *)self nextWaypointInfo];
  v8 = [v7 name];

  v9 = MSPBundle();
  v10 = v9;
  if (v8)
  {
    v11 = [v9 localizedStringForKey:@"[Shared Trip] update text message body (with destination)" value:@"My updated arrival time to %1$@ is now around %2$@." table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v8, v6);
  }
  else
  {
    v11 = [v9 localizedStringForKey:@"[Shared Trip] update text message body (without destination)" value:@"My updated arrival time is now around %@." table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v6, v14);
  v12 = };

  return v12;
}

- (id)chargingStopNotificationSubtitle
{
  v3 = MSPBundle();
  unsigned int v4 = [v3 localizedStringForKey:@"[Shared Trip] Notification's subtitle when stopping at a charger" value:@"%@ is making a stop" table:0];

  v5 = [(GEOSharedNavState *)self senderName];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)chargingStopNotificationBody
{
  v3 = [(GEOSharedNavState *)self nextWaypointInfo];
  unsigned int v4 = [v3 name];

  v5 = MSPBundle();
  v6 = [v5 localizedStringForKey:@"[Shared Trip] Notification's body when stopping at a charger" value:@"%@ has stopped at a charging station in %@." table:0];
  id v7 = [(GEOSharedNavState *)self senderNameIncludingHandleIfNecessary];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7, v4);

  return v8;
}

- (id)chargingStopMessage
{
  v2 = [(GEOSharedNavState *)self nextWaypointInfo];
  v3 = [v2 name];

  unsigned int v4 = MSPBundle();
  v5 = [v4 localizedStringForKey:@"[Shared Trip] text message body when stopping at a charger" value:@"I have stopped at a charging station in %@." table:0];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);

  return v6;
}

- (id)intermediateArrivalNotificationSubtitle
{
  v3 = MSPBundle();
  unsigned int v4 = [v3 localizedStringForKey:@"[Shared Trip] Notification's subtitle when stopping at an intermediate waypoint" value:@"%@ is making a stop" table:0];

  v5 = [(GEOSharedNavState *)self senderName];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)intermediateArrivalNotificationBody
{
  v3 = [(GEOSharedNavState *)self nextWaypointInfo];
  unsigned int v4 = [v3 name];

  v5 = [(GEOSharedNavState *)self destinationName];
  v6 = MSPBundle();
  id v7 = v6;
  if (v5)
  {
    v8 = [v6 localizedStringForKey:@"[Shared Trip] Notification's body when stopping at an intermediate waypoint" value:@"%@ is stopping at %@ before continuing to %@." table:0];
    v9 = [(GEOSharedNavState *)self senderNameIncludingHandleIfNecessary];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9, v4, v5);
  }
  else
  {
    v8 = [v6 localizedStringForKey:@"[Shared Trip] Notification's body when stopping at an intermediate waypoint, generic", @"%@ is stopping at %@ before continuing to their destination.", 0 value table];
    v9 = [(GEOSharedNavState *)self senderNameIncludingHandleIfNecessary];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9, v4, v12);
  v10 = };

  return v10;
}

- (id)intermediateArrivalMessage
{
  v3 = [(GEOSharedNavState *)self nextWaypointInfo];
  unsigned int v4 = [v3 name];

  v5 = [(GEOSharedNavState *)self destinationName];
  v6 = MSPBundle();
  id v7 = v6;
  if (v5)
  {
    v8 = [v6 localizedStringForKey:@"[Shared Trip] text message body when stopping at an intermediate waypoint" value:@"I’m making a stop at %@ before continuing to %@." table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4, v5);
  }
  else
  {
    v8 = [v6 localizedStringForKey:@"[Shared Trip] text message body when stopping at an intermediate waypoint, generic", @"I’m making a stop at %@ before continuing to my destination.", 0 value table];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4, v11);
  v9 = };

  return v9;
}

- (id)waypointResumeNotificationSubtitle
{
  v3 = MSPBundle();
  unsigned int v4 = [v3 localizedStringForKey:@"[Shared Trip] Notification's subtitle when resuming sharing" value:@"%@ has resumed the route" table:0];

  v5 = [(GEOSharedNavState *)self senderName];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)waypointResumeNotificationBody
{
  v3 = [(GEOSharedNavState *)self finalETAInfo];
  [v3 etaTimestamp];
  unsigned int v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = +[NSTimeZone localTimeZone];
  v6 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v4 inTimeZone:v5 canIncludeDate:0];

  id v7 = [(GEOSharedNavState *)self destinationName];
  v8 = MSPBundle();
  v9 = v8;
  if (v7)
  {
    v10 = [v8 localizedStringForKey:@"[Shared Trip] Notification's body when resuming sharing" value:@"%@ will arrive at %@ around %@. Follow along in Maps." table:0];
    uint64_t v11 = [(GEOSharedNavState *)self senderNameIncludingHandleIfNecessary];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11, v7, v6);
  }
  else
  {
    v10 = [v8 localizedStringForKey:@"[Shared Trip] Notification's body when resuming sharing, generic", @"%@ will arrive at their destination around %@. Follow along in Maps.", 0 value table];
    uint64_t v11 = [(GEOSharedNavState *)self senderNameIncludingHandleIfNecessary];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11, v6, v14);
  uint64_t v12 = };

  return v12;
}

- (id)waypointResumeMessage
{
  v3 = [(GEOSharedNavState *)self finalETAInfo];
  [v3 etaTimestamp];
  unsigned int v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = +[NSTimeZone localTimeZone];
  v6 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v4 inTimeZone:v5 canIncludeDate:0];

  id v7 = [(GEOSharedNavState *)self destinationName];
  v8 = MSPBundle();
  v9 = v8;
  if (v7)
  {
    v10 = [v8 localizedStringForKey:@"[Shared Trip] Text message body when resuming sharing" value:@"I will arrive at %@ around %@. I’ll let you know if I’m running late." table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v7, v6);
  }
  else
  {
    v10 = [v8 localizedStringForKey:@"[Shared Trip] Text message body when resuming sharing, generic", @"I will arrive at my destination around %@. I’ll let you know if I’m running late.", 0 value table];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v6, v13);
  uint64_t v11 = };

  return v11;
}

- (id)arrivalNotificationSubtitle
{
  v3 = MSPBundle();
  unsigned int v4 = [v3 localizedStringForKey:@"[Shared Trip] arrival notification subtitle" value:@"%@ is arriving" table:0];
  v5 = [(GEOSharedNavState *)self senderName];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)arrivalNotificationBody
{
  v3 = [(GEOSharedNavState *)self nextWaypointInfo];
  unsigned int v4 = [v3 name];

  v5 = MSPBundle();
  v6 = v5;
  if (v4)
  {
    id v7 = [v5 localizedStringForKey:@"[Shared Trip] arrival notification body" value:@"%@ is arriving at %@." table:0];
    v8 = [(GEOSharedNavState *)self senderNameIncludingHandleIfNecessary];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8, v4);
  }
  else
  {
    id v7 = [v5 localizedStringForKey:@"[Shared Trip] arrival notification body, generic", @"%@ is arriving at their destination.", 0 value table];
    v8 = [(GEOSharedNavState *)self senderNameIncludingHandleIfNecessary];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8, v11);
  v9 = };

  return v9;
}

- (id)arrivalMessage
{
  v2 = [(GEOSharedNavState *)self nextWaypointInfo];
  v3 = [v2 name];

  unsigned int v4 = MSPBundle();
  v5 = v4;
  if (v3)
  {
    v6 = [v4 localizedStringForKey:@"[Shared Trip] arrival text message body" value:@"I’m arriving at %@ soon." table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3);
  }
  else
  {
    v6 = [v4 localizedStringForKey:@"[Shared Trip] arrival text message body, generic", @"I’m arriving at my destination soon.", 0 value table];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v9);
  id v7 = };

  return v7;
}

- (void)updateModel:(id)a3
{
  id v4 = a3;
  v5 = [(GEOSharedNavState *)self homeCellTitle];
  [v4 setFirstLine:v5];

  id v6 = [(GEOSharedNavState *)self homeCellSubtitle];
  [v4 setSecondLine:v6];
}

- (id)_transportTypeStringForAnalytics
{
  if ([(GEOSharedNavState *)self hasTransportType])
  {
    id v3 = [(GEOSharedNavState *)self transportType];
    if (v3 >= 7)
    {
      id v4 = +[NSString stringWithFormat:@"(unknown: %i)", v3];
    }
    else
    {
      id v4 = *(&off_101312688 + (int)v3);
    }
  }
  else
  {
    id v4 = @"UNKNOWN_TRANSPORT_TYPE";
  }

  return v4;
}

- (BOOL)disallowDetailsForChina
{
  return [(GEOSharedNavState *)self referenceFrame] == 2
      && !+[GEOLocationShifter isLocationShiftEnabled];
}

- (BOOL)disallowDetailsForTransportType
{
  if (![(GEOSharedNavState *)self hasTransportType]) {
    return 1;
  }
  [(GEOSharedNavState *)self transportType];
  return MSPSharedTripReceiverDetailViewSupportedForTransportType() ^ 1;
}

- (BOOL)disallowDetailsForProtocolVersion
{
  unsigned int v3 = [(GEOSharedNavState *)self hasProtocolVersion];
  if (v3)
  {
    unsigned int v4 = [(GEOSharedNavState *)self protocolVersion];
    LOBYTE(v3) = GEOConfigGetUInteger() < (unint64_t)v4;
  }
  return v3;
}

- (BOOL)_disallowDetailsForAnyReason
{
  if ([(GEOSharedNavState *)self disallowDetailsForChina]
    || [(GEOSharedNavState *)self disallowDetailsForTransportType])
  {
    return 1;
  }

  return [(GEOSharedNavState *)self disallowDetailsForProtocolVersion];
}

- (id)alertTitleForDisallowedDetails
{
  v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"Route Not Viewable [Share ETA]" value:@"localized string not found" table:0];

  return v3;
}

- (id)alertMessageForChinaError
{
  unsigned int v3 = [(GEOSharedNavState *)self etaInfo];
  [v3 etaTimestamp];
  unsigned int v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = +[NSTimeZone localTimeZone];
  id v6 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v4 inTimeZone:v5 canIncludeDate:0];

  id v7 = [(GEOSharedNavState *)self destinationName];

  v8 = +[NSBundle mainBundle];
  uint64_t v9 = v8;
  if (v7)
  {
    v10 = [v8 localizedStringForKey:@"China outside-in error [Share ETA]" value:@"localized string not found" table:0];

    uint64_t v11 = [(GEOSharedNavState *)self senderNameOrHandle];
    uint64_t v12 = [(GEOSharedNavState *)self destinationName];
    uint64_t v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v11, v12, v6);
  }
  else
  {
    v10 = [v8 localizedStringForKey:@"China outside-in error, generic [Share ETA]", @"localized string not found", 0 value table];

    uint64_t v11 = [(GEOSharedNavState *)self senderNameOrHandle];
    uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11, v6);
  }

  return v13;
}

- (id)alertMessageForTransportOrProtocolError
{
  unsigned int v3 = [(GEOSharedNavState *)self etaInfo];
  [v3 etaTimestamp];
  unsigned int v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = +[NSTimeZone localTimeZone];
  id v6 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v4 inTimeZone:v5 canIncludeDate:0];

  id v7 = [(GEOSharedNavState *)self destinationName];

  v8 = +[UIDevice currentDevice];
  id v9 = [v8 userInterfaceIdiom];
  if (v7)
  {
    if (v9 == (id)1)
    {
    }
    else
    {
      v10 = +[UIDevice currentDevice];
      id v11 = [v10 userInterfaceIdiom];

      if (v11 != (id)5)
      {
        uint64_t v12 = +[NSBundle mainBundle];
        uint64_t v13 = v12;
        CFStringRef v14 = @"Transport error (iOS) [Share ETA]";
        goto LABEL_13;
      }
    }
    uint64_t v12 = +[NSBundle mainBundle];
    uint64_t v13 = v12;
    CFStringRef v14 = @"Transport error (iPad) [Share ETA]";
LABEL_13:
    v20 = [v12 localizedStringForKey:v14 value:@"localized string not found" table:0];

    v21 = [(GEOSharedNavState *)self senderNameOrHandle];
    v22 = [(GEOSharedNavState *)self destinationName];
    v23 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v21, v22, v6);

    goto LABEL_16;
  }
  if (v9 == (id)1)
  {
  }
  else
  {
    uint64_t v15 = +[UIDevice currentDevice];
    id v16 = [v15 userInterfaceIdiom];

    if (v16 != (id)5)
    {
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"Transport error, generic (iOS) [Share ETA]";
      goto LABEL_15;
    }
  }
  v17 = +[NSBundle mainBundle];
  v18 = v17;
  CFStringRef v19 = @"Transport error, generic (iPad) [Share ETA]";
LABEL_15:
  v20 = [v17 localizedStringForKey:v19 value:@"localized string not found" table:0];

  v21 = [(GEOSharedNavState *)self senderNameOrHandle];
  v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21, v6);
LABEL_16:

  return v23;
}

- (id)alertMessageForClosedTrip
{
  unsigned int v3 = [(GEOSharedNavState *)self senderNameOrHandle];

  unsigned int v4 = +[NSBundle mainBundle];
  v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 localizedStringForKey:@"Route not available anymore [Share ETA]" value:@"localized string not found" table:0];

    id v7 = [(GEOSharedNavState *)self senderNameOrHandle];
    v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v7);

    v5 = (void *)v6;
  }
  else
  {
    v8 = [v4 localizedStringForKey:@"Route not available [Share ETA]" value:@"localized string not found" table:0];
  }

  return v8;
}

- (id)homeCellTitle
{
  unsigned int v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    v5 = +[NSBundle mainBundle];
    uint64_t v6 = v5;
    CFStringRef v7 = @"[Shared Trip] Home cell title (Mac)";
LABEL_3:
    v8 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

    uint64_t v9 = [(GEOSharedNavState *)self senderNameOrHandle];
LABEL_4:
    v10 = (void *)v9;
    id v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v9);
    goto LABEL_18;
  }
  if (([(GEOSharedNavState *)self hasArrived] & 1) == 0
    && ([(GEOSharedNavState *)self hasClosed] & 1) == 0
    && ![(GEOSharedNavState *)self _disallowDetailsForAnyReason])
  {
    v20 = [(GEOSharedNavState *)self destinationName];

    v21 = [(GEOSharedNavState *)self senderName];

    uint64_t v6 = +[NSBundle mainBundle];
    if (v20)
    {
      if (v21)
      {
        CFStringRef v14 = @"[Shared Trip] Home cell title (destination, contact card, can see details)";
        goto LABEL_11;
      }
      CFStringRef v17 = @"[Shared Trip] Home cell title (destination, no contact card, can see details)";
LABEL_16:
      v8 = [v6 localizedStringForKey:v17 value:@"localized string not found" table:0];

      uint64_t v15 = [(GEOSharedNavState *)self senderNameOrHandle];
      goto LABEL_17;
    }
    if (v21)
    {
      CFStringRef v16 = @"[Shared Trip] Home cell title (no destination, contact card, can see details)";
      goto LABEL_14;
    }
    CFStringRef v7 = @"[Shared Trip] Home cell title (no destination, no contact card, can see details)";
LABEL_25:
    v5 = v6;
    goto LABEL_3;
  }
  uint64_t v12 = [(GEOSharedNavState *)self destinationName];

  uint64_t v13 = [(GEOSharedNavState *)self senderName];

  uint64_t v6 = +[NSBundle mainBundle];
  if (!v12)
  {
    if (v13)
    {
      CFStringRef v16 = @"[Shared Trip] Home cell title (no destination, contact card, cannot see details)";
LABEL_14:
      v8 = [v6 localizedStringForKey:v16 value:@"localized string not found" table:0];

      uint64_t v9 = [(GEOSharedNavState *)self senderName];
      goto LABEL_4;
    }
    CFStringRef v7 = @"[Shared Trip] Home cell title (no destination, no contact card, cannot see details)";
    goto LABEL_25;
  }
  if (!v13)
  {
    CFStringRef v17 = @"[Shared Trip] Home cell title (destination, no contact card, cannot see details)";
    goto LABEL_16;
  }
  CFStringRef v14 = @"[Shared Trip] Home cell title (destination, contact card, cannot see details)";
LABEL_11:
  v8 = [v6 localizedStringForKey:v14 value:@"localized string not found" table:0];

  uint64_t v15 = [(GEOSharedNavState *)self senderName];
LABEL_17:
  v10 = (void *)v15;
  v18 = [(GEOSharedNavState *)self destinationName];
  id v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10, v18);

LABEL_18:

  return v11;
}

- (id)homeCellSubtitle
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  if ([(GEOSharedNavState *)self hasClosed]
    && ([(GEOSharedNavState *)self closed] & 1) != 0)
  {
    id v4 = 0;
    int v5 = 1;
  }
  else
  {
    id v4 = [(GEOSharedNavState *)self _transportTypeString];
    int v5 = 0;
  }
  if ([v4 length]) {
    [v3 addObject:v4];
  }
  uint64_t v6 = [(GEOSharedNavState *)self finalETAInfo];
  if ([v6 hasEtaTimestamp])
  {
    [v6 etaTimestamp];
    CFStringRef v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    CFStringRef v7 = 0;
  }
  if ([(GEOSharedNavState *)self hasArrived]
    && [(GEOSharedNavState *)self arrived])
  {
    if ([(GEOSharedNavState *)self hasArrivedTimestamp]) {
      [(GEOSharedNavState *)self arrivedTimestamp];
    }
    else {
      [(GEOSharedNavState *)self updatedTimestamp];
    }
    double v21 = v8;
    if (v8 <= 0.0)
    {
      v32 = sub_1005762E4();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = +[NSString stringWithFormat:@"Both arrived and updated timestamps are missing for this trip"];
        *(_DWORD *)buf = 136316162;
        v37 = "-[GEOSharedNavState(Maps) homeCellSubtitle]";
        __int16 v38 = 2080;
        v39 = "GEOSharedNavState+Maps.m";
        __int16 v40 = 1024;
        int v41 = 195;
        __int16 v42 = 2080;
        v43 = "timestamp > 0";
        __int16 v44 = 2112;
        v45 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
      }
      if (sub_100BB36BC())
      {
        v34 = sub_1005762E4();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v37 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v21];
    v22 = +[NSTimeZone localTimeZone];
    uint64_t v15 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v12 inTimeZone:v22 canIncludeDate:0];

    unsigned int v23 = [(GEOSharedNavState *)self isNavigatingToIntermediateStop];
    v24 = +[NSBundle mainBundle];
    v25 = v24;
    if (v23) {
      CFStringRef v26 = @"Arrived at a stop at (time) [shared eta]";
    }
    else {
      CFStringRef v26 = @"Arrived at (time) [shared eta]";
    }
    v27 = [v24 localizedStringForKey:v26 value:@"localized string not found" table:0];
    CFStringRef v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v15);

    [v3 addObject:v16];
    goto LABEL_26;
  }
  if (v7)
  {
    [v7 timeIntervalSinceNow];
    unsigned int v9 = -[GEOSharedNavState _willArriveSoon:](self, "_willArriveSoon:");
    v10 = +[NSTimeZone localTimeZone];
    char v11 = v9 ^ 1;
    uint64_t v12 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v7 inTimeZone:v10 canIncludeDate:v9 ^ 1];

    if ((v11 & 1) == 0)
    {
      uint64_t v13 = +[NSBundle mainBundle];
      CFStringRef v14 = [v13 localizedStringForKey:@"Arriving soon around (time) [shared eta]" value:@"localized string not found" table:0];
      uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v12);

      [v3 addObject:v15];
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v15 = [(GEOSharedNavState *)self _arrivingAroundStringWithETATimeString:v12];
    [v3 addObject:v15];
    [(GEOSharedNavState *)self updatedTimestamp];
    CFStringRef v16 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v16 timeIntervalSinceNow];
    double v18 = v17;
    if ([(GEOSharedNavState *)self hasUpdatedTimestamp] && v18 <= -60.0)
    {
      CFStringRef v19 = +[NSDateComponentsFormatter _mapkit_descriptionForTimeSinceDate:v16];
      uint64_t v20 = [(GEOSharedNavState *)self _lastUpdatedStringWithElapsedTime:v19];

      [v3 addObject:v20];
      uint64_t v15 = (void *)v20;
    }
LABEL_26:

    goto LABEL_27;
  }
LABEL_28:
  if (v5 && ![v3 count])
  {
    v28 = +[NSBundle mainBundle];
    v29 = [v28 localizedStringForKey:@"[Shared Trip] ETA no longer available" value:@"localized string not found" table:0];
    [v3 addObject:v29];
  }
  v30 = [v3 componentsJoinedByString:@"・"];

  return v30;
}

- (id)_transportTypeString
{
  if ([(GEOSharedNavState *)self hasTransportType])
  {
    switch([(GEOSharedNavState *)self transportType])
    {
      case 0u:
        id v3 = +[NSBundle mainBundle];
        id v4 = v3;
        CFStringRef v5 = @"Shared Trip Cell Transport Type: Driving";
        break;
      case 1u:
        id v3 = +[NSBundle mainBundle];
        id v4 = v3;
        CFStringRef v5 = @"Shared Trip Cell Transport Type: Transit";
        break;
      case 2u:
        id v3 = +[NSBundle mainBundle];
        id v4 = v3;
        CFStringRef v5 = @"Shared Trip Cell Transport Type: Walking";
        break;
      case 3u:
        id v3 = +[NSBundle mainBundle];
        id v4 = v3;
        CFStringRef v5 = @"Shared Trip Cell Transport Type: Cycling";
        break;
      default:
        uint64_t v6 = sub_100576A9C();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v9[0] = 67109120;
          v9[1] = [(GEOSharedNavState *)self transportType];
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "No transport type string for %d", (uint8_t *)v9, 8u);
        }

        goto LABEL_7;
    }
    CFStringRef v7 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];
  }
  else
  {
LABEL_7:
    CFStringRef v7 = 0;
  }

  return v7;
}

- (id)_arrivingAroundStringWithETATimeString:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOSharedNavState *)self numberOfIntermediateStopsRemaining];
  uint64_t v6 = +[NSBundle mainBundle];
  CFStringRef v7 = [v6 localizedStringForKey:@"(time) ETA [shared eta]" value:@"localized string not found" table:0];

  double v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v5, v4);

  return v8;
}

- (id)_lastUpdatedStringWithElapsedTime:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"Last updated (time ago) [shared eta]" value:@"localized string not found" table:0];

  uint64_t v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);

  return v6;
}

- (BOOL)_willArriveSoon:(double)a3
{
  if (a3 < 0.0) {
    return 0;
  }
  GEOConfigGetDouble();
  if (v6 <= a3) {
    return 0;
  }
  if ([(GEOSharedNavState *)self hasClosed]) {
    return [(GEOSharedNavState *)self closed] ^ 1;
  }
  return 1;
}

- (id)carPlayListCellSubtitle
{
  id v3 = [(GEOSharedNavState *)self etaInfo];
  [v3 etaTimestamp];
  id v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

  if ([(GEOSharedNavState *)self hasArrived]
    && [(GEOSharedNavState *)self arrived])
  {
    id v5 = +[NSBundle mainBundle];
    double v6 = v5;
    CFStringRef v7 = @"Arrived [Shared ETA, List, CarPlay]";
  }
  else
  {
    if ([(GEOSharedNavState *)self hasClosed]
      && ([(GEOSharedNavState *)self closed] & 1) != 0)
    {
      double v8 = 0;
      goto LABEL_12;
    }
    [v4 timeIntervalSinceNow];
    if (!-[GEOSharedNavState _willArriveSoon:](self, "_willArriveSoon:"))
    {
      unsigned int v9 = +[NSTimeZone localTimeZone];
      double v6 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v4 inTimeZone:v9 canIncludeDate:0];

      v10 = +[NSBundle mainBundle];
      char v11 = [v10 localizedStringForKey:@"00:00 ETA [CarPlay, Shared Trip]", @"localized string not found", 0 value table];
      double v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v6);

      goto LABEL_11;
    }
    id v5 = +[NSBundle mainBundle];
    double v6 = v5;
    CFStringRef v7 = @"Arriving soon [Shared ETA, List, CarPlay]";
  }
  double v8 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];
LABEL_11:

LABEL_12:

  return v8;
}

@end