@interface tmd86fe6187ee41b8649354ac4ec3a992b
- (void)updateAllThermalLoad:(BOOL)a3;
@end

@implementation tmd86fe6187ee41b8649354ac4ec3a992b

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = qword_1000AACCC;
  int v5 = qword_1000AACD4;
  int v6 = qword_1000AACDC;
  id v7 = [(CommonProduct *)self findComponent:18];
  double v8 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  *(float *)&double v8 = v8;
  [v7 calculateControlEffort:v8];
  sub_100031714(31, (int)((double)v4 * 0.2304 + 473.4 + (double)v6 * 0.6023));
  sub_100031714(32, (int)((double)v4 * 0.689 + -214.0 + (double)v5 * 0.373));
  float v9 = (float)dword_1000AAD4C;
  id v10 = [(CommonProduct *)self findComponent:19];
  float v11 = v9 / 100.0;
  *(float *)&double v12 = v11;
  [v10 calculateControlEffort:v12];
  id v13 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v14 = v11;

  [v13 calculateControlEffort:v14];
}

@end