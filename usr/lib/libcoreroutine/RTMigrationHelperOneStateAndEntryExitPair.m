@interface RTMigrationHelperOneStateAndEntryExitPair
- (BOOL)isEqual:(id)a3;
- (RTMigrationHelperOneStateAndEntryExitPair)initWithOneState:(id)a3 entryExit:(id)a4;
- (RTStateModelEntryExit)entryExit;
- (RTStateModelOneState)oneState;
- (unint64_t)hash;
- (void)setEntryExit:(id)a3;
- (void)setOneState:(id)a3;
@end

@implementation RTMigrationHelperOneStateAndEntryExitPair

- (RTMigrationHelperOneStateAndEntryExitPair)initWithOneState:(id)a3 entryExit:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTMigrationHelperOneStateAndEntryExitPair;
  v9 = [(RTMigrationHelperOneStateAndEntryExitPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_oneState, a3);
    objc_storeStrong((id *)&v10->_entryExit, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTMigrationHelperOneStateAndEntryExitPair *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v16 = 1;
    goto LABEL_20;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v16 = 0;
    goto LABEL_20;
  }
  v6 = v5;
  id v7 = [(RTMigrationHelperOneStateAndEntryExitPair *)self oneState];
  id v8 = [v7 uniqueId];
  if (!v8)
  {
    v9 = [(RTMigrationHelperOneStateAndEntryExitPair *)v6 oneState];
    uint64_t v10 = [v9 uniqueId];
    v33 = v9;
    if (!v10)
    {
      v32 = 0;
      char v15 = 1;
LABEL_12:

      goto LABEL_13;
    }
    uint64_t v31 = v10;
  }
  v11 = [(RTMigrationHelperOneStateAndEntryExitPair *)self oneState];
  objc_super v12 = [v11 uniqueId];
  v13 = [(RTMigrationHelperOneStateAndEntryExitPair *)v6 oneState];
  v14 = [v13 uniqueId];
  char v15 = [v12 isEqual:v14];

  if (!v8) {
    goto LABEL_12;
  }
LABEL_13:

  v17 = [(RTMigrationHelperOneStateAndEntryExitPair *)self entryExit];
  [v17 entry_s];
  double v19 = v18;
  v20 = [(RTMigrationHelperOneStateAndEntryExitPair *)v6 entryExit];
  [v20 entry_s];
  double v22 = v21;

  v23 = [(RTMigrationHelperOneStateAndEntryExitPair *)self entryExit];
  [v23 exit_s];
  double v25 = v24;
  v26 = [(RTMigrationHelperOneStateAndEntryExitPair *)v6 entryExit];
  [v26 exit_s];
  double v28 = v27;

  if (v19 == v22) {
    char v29 = v15;
  }
  else {
    char v29 = 0;
  }
  if (v25 == v28) {
    BOOL v16 = v29;
  }
  else {
    BOOL v16 = 0;
  }

LABEL_20:
  return v16;
}

- (unint64_t)hash
{
  v3 = [(RTStateModelOneState *)self->_oneState uniqueId];
  uint64_t v4 = [v3 hash];
  v5 = NSNumber;
  [(RTStateModelEntryExit *)self->_entryExit entry_s];
  v6 = [v5 numberWithDouble:];
  uint64_t v7 = [v6 hash] ^ v4;
  id v8 = NSNumber;
  [(RTStateModelEntryExit *)self->_entryExit exit_s];
  v9 = [v8 numberWithDouble:];
  unint64_t v10 = v7 ^ [v9 hash];

  return v10;
}

- (RTStateModelOneState)oneState
{
  return self->_oneState;
}

- (void)setOneState:(id)a3
{
}

- (RTStateModelEntryExit)entryExit
{
  return self->_entryExit;
}

- (void)setEntryExit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryExit, 0);

  objc_storeStrong((id *)&self->_oneState, 0);
}

@end