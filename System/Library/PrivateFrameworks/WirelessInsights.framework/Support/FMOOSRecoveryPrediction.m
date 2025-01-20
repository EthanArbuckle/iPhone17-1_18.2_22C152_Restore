@interface FMOOSRecoveryPrediction
- (NSArray)cells;
- (NSArray)durations;
- (id)description;
- (id)init:(id)a3 seenCount:(int)a4 cells:(id)a5;
- (int)seenCount;
@end

@implementation FMOOSRecoveryPrediction

- (id)init:(id)a3 seenCount:(int)a4 cells:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FMOOSRecoveryPrediction;
  v11 = [(FMOOSRecoveryPrediction *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_durations, a3);
    v12->_seenCount = a4;
    objc_storeStrong((id *)&v12->_cells, a5);
    v13 = v12;
  }

  return v12;
}

- (id)description
{
  v3 = [(FMOOSRecoveryPrediction *)self durations];
  uint64_t v4 = [(FMOOSRecoveryPrediction *)self seenCount];
  v5 = [(FMOOSRecoveryPrediction *)self cells];
  v6 = +[NSString stringWithFormat:@"durations %@, seenCount %d, cells %@", v3, v4, v5];

  return v6;
}

- (NSArray)durations
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (int)seenCount
{
  return self->_seenCount;
}

- (NSArray)cells
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cells, 0);

  objc_storeStrong((id *)&self->_durations, 0);
}

@end