@interface MTUIDigitalClockLabel
- (BOOL)setHour:(int64_t)a3 minute:(int64_t)a4;
- (MTUIDigitalClockLabel)initWithFrame:(CGRect)a3;
- (void)forceSetHour:(int64_t)a3 minute:(int64_t)a4;
- (void)refreshUI;
- (void)resetFontSizes;
- (void)setTimeLabelText:(id)a3;
- (void)significantTimeChange:(id)a3;
@end

@implementation MTUIDigitalClockLabel

- (MTUIDigitalClockLabel)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MTUIDigitalClockLabel;
  v3 = -[MTUIDateLabel initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263EFF8F0]);
    uint64_t v5 = [v4 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    calendar = v3->_calendar;
    v3->_calendar = (NSCalendar *)v5;

    v7 = v3->_calendar;
    v8 = [MEMORY[0x263EFFA18] systemTimeZone];
    [(NSCalendar *)v7 setTimeZone:v8];

    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:0.0];
    baseDate = v3->_baseDate;
    v3->_baseDate = (NSDate *)v9;

    v3->_hour = -1;
    v3->_minute = -1;
    [(MTUIDigitalClockLabel *)v3 resetFontSizes];
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v3 selector:sel_significantTimeChange_ name:*MEMORY[0x263F1D0A0] object:0];

    v12 = v3;
  }

  return v3;
}

- (BOOL)setHour:(int64_t)a3 minute:(int64_t)a4
{
  if (self->_hour == a3 && self->_minute == a4) {
    return 0;
  }
  -[MTUIDigitalClockLabel forceSetHour:minute:](self, "forceSetHour:minute:");
  return 1;
}

- (void)forceSetHour:(int64_t)a3 minute:(int64_t)a4
{
  self->_hour = a3;
  self->_minute = a4;
  id v8 = [(NSCalendar *)self->_calendar components:1644 fromDate:self->_baseDate];
  [v8 setHour:a3];
  [v8 setMinute:a4];
  v7 = [(NSCalendar *)self->_calendar dateFromComponents:v8];
  [(MTUIDateLabel *)self setDateLabelText:0];
  [(MTUIDateLabel *)self setDate:v7];
}

- (void)resetFontSizes
{
  v3 = [MEMORY[0x263F1C658] boldSystemFontOfSize:25.0];
  [(MTUIDateLabel *)self setFont:v3];

  id v4 = [MEMORY[0x263F1C658] systemFontOfSize:14.0];
  [(MTUIDateLabel *)self setTimeDesignatorFont:v4];
}

- (void)significantTimeChange:(id)a3
{
  objc_msgSend(MEMORY[0x263EFFA18], "resetSystemTimeZone", a3);
  calendar = self->_calendar;
  uint64_t v5 = [MEMORY[0x263EFFA18] systemTimeZone];
  [(NSCalendar *)calendar setTimeZone:v5];

  [(MTUIDigitalClockLabel *)self refreshUI];
}

- (void)refreshUI
{
  if (self->_hour != -1 && self->_minute != -1) {
    -[MTUIDigitalClockLabel forceSetHour:minute:](self, "forceSetHour:minute:");
  }
}

- (void)setTimeLabelText:(id)a3
{
  self->_hour = -1;
  self->_minute = -1;
  id v4 = a3;
  [(MTUIDateLabel *)self setDate:0];
  [(MTUIDateLabel *)self setDateLabelText:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseDate, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end