@interface PHRecentsPhoneHeaderView
- (id)newSummaryViewForRecentCall:(id)a3 occurrenceDate:(id)a4 status:(unsigned int)a5 duration:(double)a6 type:(unsigned int)a7 dataUsage:(int64_t)a8;
@end

@implementation PHRecentsPhoneHeaderView

- (id)newSummaryViewForRecentCall:(id)a3 occurrenceDate:(id)a4 status:(unsigned int)a5 duration:(double)a6 type:(unsigned int)a7 dataUsage:(int64_t)a8
{
  uint64_t v8 = *(void *)&a7;
  uint64_t v10 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  if ((kCHCallTypeTelephony & v8) != 0)
  {
    v16 = -[PHRecentsPhoneHeaderSummaryView initWithFrame:recentCall:occurrenceDate:status:duration:type:]([PHRecentsPhoneHeaderSummaryView alloc], "initWithFrame:recentCall:occurrenceDate:status:duration:type:", v14, v15, v10, v8, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, a6);
  }
  else
  {
    v17 = +[NSString stringWithFormat:@"PHRecentsPersonPhoneHeaderView only handles telephony calls"];
    NSLog(@"** TUAssertion failure: %@", v17);

    if (_TUAssertShouldCrashApplication())
    {
      v18 = +[NSAssertionHandler currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"PHRecentsPhoneHeaderView.m" lineNumber:43 description:@"PHRecentsPersonPhoneHeaderView only handles telephony calls"];
    }
    v16 = 0;
  }

  return v16;
}

@end