@interface SRDownsampleEntry
- (BOOL)shouldReportThisTime;
- (SRDownsampleEntry)initWithCap:(unint64_t)a3 downsampleRatio:(unint64_t)a4;
- (unint64_t)cap;
- (unint64_t)downsampleRatio;
- (unint64_t)eventsReported;
- (unint64_t)eventsSeen;
- (void)setEventsReported:(unint64_t)a3;
- (void)setEventsSeen:(unint64_t)a3;
@end

@implementation SRDownsampleEntry

- (SRDownsampleEntry)initWithCap:(unint64_t)a3 downsampleRatio:(unint64_t)a4
{
  v4 = self;
  if (a4)
  {
    v18.receiver = self;
    v18.super_class = (Class)SRDownsampleEntry;
    v7 = [(SRDownsampleEntry *)&v18 init];
    if (v7)
    {
      v7->_cap = a3;
      v7->_downsampleRatio = a4;
    }
    v4 = v7;
    v8 = v4;
  }
  else
  {
    v9 = sub_100002D74();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000095AC(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldReportThisTime
{
  [(SRDownsampleEntry *)self setEventsSeen:(char *)[(SRDownsampleEntry *)self eventsSeen] + 1];
  unint64_t v3 = [(SRDownsampleEntry *)self eventsReported];
  if (v3 >= [(SRDownsampleEntry *)self cap]) {
    return 0;
  }
  unint64_t v4 = [(SRDownsampleEntry *)self eventsSeen];
  if (v4 % [(SRDownsampleEntry *)self downsampleRatio]) {
    return 0;
  }
  [(SRDownsampleEntry *)self setEventsReported:(char *)[(SRDownsampleEntry *)self eventsReported] + 1];
  return 1;
}

- (unint64_t)cap
{
  return self->_cap;
}

- (unint64_t)downsampleRatio
{
  return self->_downsampleRatio;
}

- (unint64_t)eventsSeen
{
  return self->_eventsSeen;
}

- (void)setEventsSeen:(unint64_t)a3
{
  self->_eventsSeen = a3;
}

- (unint64_t)eventsReported
{
  return self->_eventsReported;
}

- (void)setEventsReported:(unint64_t)a3
{
  self->_eventsReported = a3;
}

@end