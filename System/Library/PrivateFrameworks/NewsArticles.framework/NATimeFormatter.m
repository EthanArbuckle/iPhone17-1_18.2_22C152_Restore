@interface NATimeFormatter
- (AVTimeFormatter)elapsedDurationFormatter;
- (AVTimeFormatter)remainingDurationFormatter;
- (NATimeFormatter)init;
- (id)formatElapsedDuration:(double)a3;
- (id)formatRemainingDuration:(double)a3;
- (void)setElapsedDurationFormatter:(id)a3;
- (void)setRemainingDurationFormatter:(id)a3;
@end

@implementation NATimeFormatter

- (NATimeFormatter)init
{
  v8.receiver = self;
  v8.super_class = (Class)NATimeFormatter;
  v2 = [(NATimeFormatter *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F166B8]);
    [(NATimeFormatter *)v2 setElapsedDurationFormatter:v3];

    v4 = [(NATimeFormatter *)v2 elapsedDurationFormatter];
    [v4 setStyle:1];

    id v5 = objc_alloc_init(MEMORY[0x1E4F166B8]);
    [(NATimeFormatter *)v2 setRemainingDurationFormatter:v5];

    v6 = [(NATimeFormatter *)v2 remainingDurationFormatter];
    [v6 setStyle:2];
  }
  return v2;
}

- (id)formatElapsedDuration:(double)a3
{
  v4 = [(NATimeFormatter *)self elapsedDurationFormatter];
  id v5 = [v4 stringFromSeconds:a3];

  return v5;
}

- (id)formatRemainingDuration:(double)a3
{
  v4 = [(NATimeFormatter *)self remainingDurationFormatter];
  id v5 = [v4 stringFromSeconds:a3];

  return v5;
}

- (AVTimeFormatter)elapsedDurationFormatter
{
  return self->_elapsedDurationFormatter;
}

- (void)setElapsedDurationFormatter:(id)a3
{
}

- (AVTimeFormatter)remainingDurationFormatter
{
  return self->_remainingDurationFormatter;
}

- (void)setRemainingDurationFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingDurationFormatter, 0);
  objc_storeStrong((id *)&self->_elapsedDurationFormatter, 0);
}

@end