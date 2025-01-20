@interface ProgressTracker
- (double)getProgress;
- (double)increaseCountForPhase:(int)a3;
- (double)phaseTracker;
@end

@implementation ProgressTracker

- (double)phaseTracker
{
  return self->_phaseTracker;
}

- (double)getProgress
{
  double v3 = *[(ProgressTracker *)self phaseTracker];
  double v4 = 0.0;
  double v5 = 0.0;
  if (v3 >= 1.0)
  {
    double v6 = [(ProgressTracker *)self phaseTracker][4];
    double v3 = v6 / *[(ProgressTracker *)self phaseTracker];
    double v5 = v3 * 25.0;
  }
  if ([(ProgressTracker *)self phaseTracker][1] >= 1.0)
  {
    double v7 = [(ProgressTracker *)self phaseTracker][5];
    double v4 = v7 / [(ProgressTracker *)self phaseTracker][1] * 25.0;
  }
  double v8 = 0.0;
  double v9 = 0.0;
  if ([(ProgressTracker *)self phaseTracker][2] >= 1.0)
  {
    double v10 = [(ProgressTracker *)self phaseTracker][6];
    double v9 = v10 / [(ProgressTracker *)self phaseTracker][2] * 25.0;
  }
  if ([(ProgressTracker *)self phaseTracker][3] >= 1.0)
  {
    double v11 = [(ProgressTracker *)self phaseTracker][7];
    double v8 = v11 / [(ProgressTracker *)self phaseTracker][3] * 25.0;
  }
  return v5 + v4 + v9 + v8;
}

- (double)increaseCountForPhase:(int)a3
{
  double v5 = [(ProgressTracker *)self phaseTracker];
  a3 += 4;
  v5[a3] = v5[a3] + 1.0;
  return [(ProgressTracker *)self phaseTracker][a3];
}

@end