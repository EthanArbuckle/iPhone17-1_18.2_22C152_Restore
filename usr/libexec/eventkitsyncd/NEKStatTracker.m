@interface NEKStatTracker
- (BOOL)firstTimeEver;
- (BOOL)load;
- (NEKEnvironment)environment;
- (NEKStatTracker)initWithEnvironment:(id)a3 name:(id)a4 defaultMean:(double)a5 defaultStddev:(double)a6;
- (NSString)name;
- (double)_clip:(double)a3;
- (double)alpha;
- (double)failTimeout;
- (double)failureScaling;
- (double)maxTimeout;
- (double)mean;
- (double)minTimeout;
- (double)nextTimeout;
- (double)sigmaSpan;
- (double)stddev;
- (double)variance;
- (void)save;
- (void)setAlpha:(double)a3;
- (void)setEnvironment:(id)a3;
- (void)setFailTimeout:(double)a3;
- (void)setFailureScaling:(double)a3;
- (void)setFirstTimeEver:(BOOL)a3;
- (void)setMaxTimeout:(double)a3;
- (void)setMean:(double)a3;
- (void)setMinTimeout:(double)a3;
- (void)setName:(id)a3;
- (void)setSigmaSpan:(double)a3;
- (void)setStddev:(double)a3;
- (void)setVariance:(double)a3;
- (void)updateFailure;
- (void)updateSuccess:(double)a3;
@end

@implementation NEKStatTracker

- (NEKStatTracker)initWithEnvironment:(id)a3 name:(id)a4 defaultMean:(double)a5 defaultStddev:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NEKStatTracker;
  v12 = [(NEKStatTracker *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(NEKStatTracker *)v12 setName:v11];
    [(NEKStatTracker *)v13 setEnvironment:v10];
    [(NEKStatTracker *)v13 setMean:a5];
    [(NEKStatTracker *)v13 setStddev:a6];
    [(NEKStatTracker *)v13 setAlpha:0.4];
    [(NEKStatTracker *)v13 setFailureScaling:2.0];
    [(NEKStatTracker *)v13 setSigmaSpan:3.0];
    [(NEKStatTracker *)v13 setFailTimeout:0.0];
    [(NEKStatTracker *)v13 setMinTimeout:60.0];
    [(NEKStatTracker *)v13 setMaxTimeout:14400.0];
  }

  return v13;
}

- (NEKEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (NEKEnvironment *)WeakRetained;
}

- (BOOL)load
{
  v3 = [(NEKStatTracker *)self name];
  v4 = +[NSString stringWithFormat:@"%@.mean", v3];

  v5 = [(NEKStatTracker *)self name];
  v6 = +[NSString stringWithFormat:@"%@.variance", v5];

  v7 = [(NEKStatTracker *)self name];
  v8 = +[NSString stringWithFormat:@"%@.failureTimeout", v7];

  v9 = [(NEKStatTracker *)self environment];
  id v10 = [v9 tinyStore];

  [v10 getDoubleValueForKey:v4 default:-1.0];
  double v12 = v11;
  [v10 getDoubleValueForKey:v6 default:-1.0];
  double v14 = v13;
  double v15 = 0.0;
  [v10 getDoubleValueForKey:v8 default:0.0];
  BOOL v18 = v12 == -1.0 || v10 == 0;
  int v19 = v14 == -1.0 || v18;
  if (v19 == 1)
  {
    [(NEKStatTracker *)self setFirstTimeEver:1];
  }
  else
  {
    double v20 = v16;
    [(NEKStatTracker *)self setMean:v12];
    [(NEKStatTracker *)self setVariance:v14];
    double v15 = v20;
  }
  [(NEKStatTracker *)self setFailTimeout:v15];

  return v19 ^ 1;
}

- (void)save
{
  v3 = [(NEKStatTracker *)self name];
  id v10 = +[NSString stringWithFormat:@"%@.mean", v3];

  v4 = [(NEKStatTracker *)self name];
  v5 = +[NSString stringWithFormat:@"%@.variance", v4];

  v6 = [(NEKStatTracker *)self name];
  v7 = +[NSString stringWithFormat:@"%@.failureTimeout", v6];

  v8 = [(NEKStatTracker *)self environment];
  v9 = [v8 tinyStore];

  [(NEKStatTracker *)self mean];
  [v9 setDoubleValue:v10 forKey:@""];
  [(NEKStatTracker *)self variance];
  [v9 setDoubleValue:v5 forKey:@""];
  [(NEKStatTracker *)self failTimeout];
  [v9 setDoubleValue:v7 forKey:@""];
}

- (void)updateSuccess:(double)a3
{
  if ([(NEKStatTracker *)self firstTimeEver])
  {
    [(NEKStatTracker *)self setMean:a3];
    [(NEKStatTracker *)self setStddev:a3 * 0.15];
    [(NEKStatTracker *)self setFailTimeout:0.0];
    [(NEKStatTracker *)self setFirstTimeEver:0];
  }
  else
  {
    [(NEKStatTracker *)self mean];
    double v6 = v5;
    [(NEKStatTracker *)self mean];
    double v8 = a3 - v7;
    [(NEKStatTracker *)self alpha];
    double v10 = v6 + v8 * v9;
    [(NEKStatTracker *)self mean];
    double v12 = (a3 - v11) * (a3 - v10);
    [(NEKStatTracker *)self variance];
    double v14 = v13;
    [(NEKStatTracker *)self variance];
    double v16 = v12 - v15;
    [(NEKStatTracker *)self alpha];
    [(NEKStatTracker *)self setVariance:v14 + v16 * v17];
    [(NEKStatTracker *)self setMean:v10];
    [(NEKStatTracker *)self setFailTimeout:0.0];
  }
}

- (void)updateFailure
{
  [(NEKStatTracker *)self failTimeout];
  if (v3 == 0.0)
  {
    [(NEKStatTracker *)self failureScaling];
    double v5 = v7;
    [(NEKStatTracker *)self nextTimeout];
  }
  else
  {
    [(NEKStatTracker *)self failTimeout];
    double v5 = v4;
    [(NEKStatTracker *)self failureScaling];
  }
  [(NEKStatTracker *)self _clip:v5 * v6];

  [(NEKStatTracker *)self setFailTimeout:"setFailTimeout:"];
}

- (double)nextTimeout
{
  [(NEKStatTracker *)self failTimeout];
  if (v3 == 0.0)
  {
    [(NEKStatTracker *)self minTimeout];
    double v6 = v5;
    [(NEKStatTracker *)self mean];
    double v8 = v6 + v7;
    [(NEKStatTracker *)self sigmaSpan];
    double v10 = v9;
    [(NEKStatTracker *)self stddev];
    double v4 = v8 + v10 * v11;
  }
  else
  {
    [(NEKStatTracker *)self failTimeout];
  }

  [(NEKStatTracker *)self _clip:v4];
  return result;
}

- (double)stddev
{
  [(NEKStatTracker *)self variance];
  if (v3 < 0.0) {
    [(NEKStatTracker *)self setVariance:1.0];
  }
  [(NEKStatTracker *)self variance];
  return sqrt(v4);
}

- (void)setStddev:(double)a3
{
}

- (double)_clip:(double)a3
{
  [(NEKStatTracker *)self maxTimeout];
  if (v5 < a3)
  {
    [(NEKStatTracker *)self maxTimeout];
    a3 = v6;
  }
  [(NEKStatTracker *)self minTimeout];
  if (a3 >= v7) {
    return a3;
  }

  [(NEKStatTracker *)self minTimeout];
  return result;
}

- (double)mean
{
  return self->_mean;
}

- (void)setMean:(double)a3
{
  self->_mean = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (double)failureScaling
{
  return self->_failureScaling;
}

- (void)setFailureScaling:(double)a3
{
  self->_failureScaling = a3;
}

- (double)sigmaSpan
{
  return self->_sigmaSpan;
}

- (void)setSigmaSpan:(double)a3
{
  self->_sigmaSpan = a3;
}

- (double)minTimeout
{
  return self->_minTimeout;
}

- (void)setMinTimeout:(double)a3
{
  self->_minTimeout = a3;
}

- (double)maxTimeout
{
  return self->_maxTimeout;
}

- (void)setMaxTimeout:(double)a3
{
  self->_maxTimeout = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setEnvironment:(id)a3
{
}

- (BOOL)firstTimeEver
{
  return self->_firstTimeEver;
}

- (void)setFirstTimeEver:(BOOL)a3
{
  self->_firstTimeEver = a3;
}

- (double)variance
{
  return self->_variance;
}

- (void)setVariance:(double)a3
{
  self->_variance = a3;
}

- (double)failTimeout
{
  return self->_failTimeout;
}

- (void)setFailTimeout:(double)a3
{
  self->_failTimeout = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);

  objc_storeStrong((id *)&self->_name, 0);
}

@end