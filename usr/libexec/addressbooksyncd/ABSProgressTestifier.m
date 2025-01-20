@interface ABSProgressTestifier
- (void)bearWitness:(double)a3;
@end

@implementation ABSProgressTestifier

- (void)bearWitness:(double)a3
{
  v5 = [(ABSProgressReporter *)self session];
  [v5 reportProgress:a3];

  double lastProgress = self->_lastProgress;
  if (lastProgress <= a3)
  {
    if (a3 - lastProgress >= 0.02)
    {
      v9 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134217984;
        double v11 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Progress: %.4f", (uint8_t *)&v10, 0xCu);
      }
      self->_double lastProgress = a3;
    }
  }
  else
  {
    v7 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = self->_lastProgress;
      int v10 = 134218240;
      double v11 = v8;
      __int16 v12 = 2048;
      double v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Progress went backwards (%.4f => %.4f). It's no big deal but I thought you might want to know.", (uint8_t *)&v10, 0x16u);
    }
  }
}

@end