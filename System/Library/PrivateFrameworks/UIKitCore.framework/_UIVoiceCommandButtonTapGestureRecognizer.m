@interface _UIVoiceCommandButtonTapGestureRecognizer
- (double)pressEventBeginTimestamp;
- (double)pressEventEndTimestamp;
- (id)voiceCommandButtonTapDuration;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)reset;
- (void)setPressEventBeginTimestamp:(double)a3;
- (void)setPressEventEndTimestamp:(double)a3;
@end

@implementation _UIVoiceCommandButtonTapGestureRecognizer

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)_UIVoiceCommandButtonTapGestureRecognizer;
  [(UIGestureRecognizer *)&v3 reset];
  self->_pressEventBeginTimestamp = 0.0;
  self->_pressEventEndTimestamp = 0.0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIVoiceCommandButtonTapGestureRecognizer;
  id v6 = a4;
  [(UITapGestureRecognizer *)&v9 pressesBegan:a3 withEvent:v6];
  objc_msgSend(v6, "timestamp", v9.receiver, v9.super_class);
  double v8 = v7;

  self->_pressEventBeginTimestamp = v8;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIVoiceCommandButtonTapGestureRecognizer;
  id v6 = a4;
  [(UITapGestureRecognizer *)&v9 pressesEnded:a3 withEvent:v6];
  objc_msgSend(v6, "timestamp", v9.receiver, v9.super_class);
  double v8 = v7;

  self->_pressEventEndTimestamp = v8;
}

- (id)voiceCommandButtonTapDuration
{
  double pressEventEndTimestamp = self->_pressEventEndTimestamp;
  if (pressEventEndTimestamp <= 0.0
    || (double pressEventBeginTimestamp = self->_pressEventBeginTimestamp, pressEventBeginTimestamp <= 0.0))
  {
    v4 = 0;
  }
  else
  {
    v4 = [NSNumber numberWithDouble:pressEventEndTimestamp - pressEventBeginTimestamp];
  }
  return v4;
}

- (double)pressEventBeginTimestamp
{
  return self->_pressEventBeginTimestamp;
}

- (void)setPressEventBeginTimestamp:(double)a3
{
  self->_double pressEventBeginTimestamp = a3;
}

- (double)pressEventEndTimestamp
{
  return self->_pressEventEndTimestamp;
}

- (void)setPressEventEndTimestamp:(double)a3
{
  self->_double pressEventEndTimestamp = a3;
}

@end