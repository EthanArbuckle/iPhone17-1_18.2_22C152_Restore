@interface TUIStatsCell
+ (id)nib;
- (NSString)header;
- (TUIStatsEventReporting)eventProvider;
- (TUIStatsTiming)timingProvider;
- (UILabel)label;
- (void)setEventProvider:(id)a3;
- (void)setHeader:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTimingProvider:(id)a3;
- (void)updateContent;
@end

@implementation TUIStatsCell

+ (id)nib
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[UINib nibWithNibName:@"TUIStatsCell" bundle:v2];

  return v3;
}

- (void)updateContent
{
  v3 = objc_opt_new();
  id v8 = v3;
  if (self->_header)
  {
    [v3 appendString:];
    v3 = v8;
  }
  TUIStatsAppendTiming(v3, self->_timingProvider, @"\n");
  [v8 appendString:@"\n"];
  TUIStatsAppendEvents(v8, self->_eventProvider, @"\n");
  v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v5 = [v8 stringByTrimmingCharactersInSet:v4];
  v6 = [(TUIStatsCell *)self label];
  [v6 setText:v5];

  v7 = [(TUIStatsCell *)self label];
  [v7 sizeToFit];
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);

  return (UILabel *)WeakRetained;
}

- (void)setLabel:(id)a3
{
}

- (TUIStatsTiming)timingProvider
{
  return self->_timingProvider;
}

- (void)setTimingProvider:(id)a3
{
}

- (TUIStatsEventReporting)eventProvider
{
  return self->_eventProvider;
}

- (void)setEventProvider:(id)a3
{
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_eventProvider, 0);
  objc_storeStrong((id *)&self->_timingProvider, 0);

  objc_destroyWeak((id *)&self->_label);
}

@end