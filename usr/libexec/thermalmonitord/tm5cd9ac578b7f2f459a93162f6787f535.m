@interface tm5cd9ac578b7f2f459a93162f6787f535
- (void)updateAllThermalLoad:(BOOL)a3;
@end

@implementation tm5cd9ac578b7f2f459a93162f6787f535

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = qword_1000AACCC;
  int v5 = qword_1000AACDC;
  int v6 = dword_1000AACE4;
  v13.receiver = self;
  v13.super_class = (Class)tm5cd9ac578b7f2f459a93162f6787f535;
  [(tmd86fe6187ee41b8649354ac4ec3a992b *)&v13 updateAllThermalLoad:a3];
  sub_100031714(33, (int)((double)v4 * 0.325 + 23.0 + (double)v5 * 0.311 + (double)v6 * 0.356));
  float v7 = (float)dword_1000AAD50;
  id v8 = [(CommonProduct *)self findComponent:21];
  float v9 = v7 / 100.0;
  *(float *)&double v10 = v9;
  [v8 calculateControlEffort:v10];
  id v11 = [(CommonProduct *)self findComponent:22];
  *(float *)&double v12 = v9;
  [v11 calculateControlEffort:v12];
}

@end